!> @file
!> Module 'channels'.
!! Handles the selection of and tests against experimental search channels.
module channels
!******************************************************************
    implicit none
    type listanalyses
        integer :: ttype
        integer :: tlist
        integer :: particle_x1, particle_x2
        integer :: req
        logical :: in_first_set
    end type
    type(listanalyses), allocatable :: l_analyses(:)

contains
    !**********************************************************
    subroutine setup_channels
        !**********************************************************
        ! puts together a list of processes to be checked by HiggsBounds
        ! sets number of processes to be checked (= ntot)
        !**********************************************************
        use usefulbits, only: np, debug, whichanalyses, & !input
                              ntot, pr, analysislist, using_likelihood
        use S95tables, only: S95_t1, S95_t2, WhichColliderString
        use likelihoods, only: llhdata, nllhs !CMS_llhdata
        implicit none
        !-----------------------------------internal
        integer :: n_analyses
        integer :: i, n, j, k, req, n_perm, id
        character(LEN=3) :: expt
        logical :: pub
        integer :: llh
        double precision :: energy
        !-------------------------------------------
        n_analyses = size(S95_t1) + size(S95_t2) + nllhs

        allocate (l_analyses(n_analyses))
        n = 0

        do i = 1, n_analyses
            req = 1

            if (i .le. size(S95_t1)) then ! table type 1
                l_analyses(i)%tlist = i
                l_analyses(i)%ttype = 1
                expt = S95_t1(i)%expt
                energy = S95_t1(i)%energy
                pub = is_S95_t1x_published(i)
                id = S95_t1(i)%id
                llh = S95_t1(i)%llh
                l_analyses(i)%particle_x1 = S95_t1(i)%particle_x
                l_analyses(i)%particle_x2 = S95_t1(i)%particle_x !shouldn't actually be used
                n_perm = np(l_analyses(i)%particle_x1)
            elseif (i .le. (size(S95_t1) + size(S95_t2))) then ! table type 2
                j = i - size(S95_t1)
                l_analyses(i)%tlist = j
                l_analyses(i)%ttype = 2
                expt = S95_t2(j)%expt
                energy = S95_t2(j)%energy
                id = S95_t2(j)%id
                llh = 0
                pub = .True.
                l_analyses(i)%particle_x1 = S95_t2(j)%particle_x1
                l_analyses(i)%particle_x2 = S95_t2(j)%particle_x2
                n_perm = np(l_analyses(i)%particle_x1)*np(l_analyses(i)%particle_x2)
            else
                ! CMS tau tau likelihood
                j = i - size(S95_t1) - size(S95_t2)
                l_analyses(i)%tlist = j
                l_analyses(i)%ttype = 9  ! for likelihoods
                expt = llhdata(j)%D2llhdata(1)%expt
                energy = llhdata(j)%D2llhdata(1)%energy
                id = llhdata(j)%D2llhdata(1)%analysisID
                pub = llhdata(j)%D2llhdata(1)%pub
                llh = 1
                l_analyses(i)%particle_x1 = llhdata(j)%D2llhdata(1)%particle_x
                l_analyses(i)%particle_x2 = llhdata(j)%D2llhdata(1)%particle_x !shouldn't actually be used
                n_perm = np(l_analyses(i)%particle_x1)
            endif

            select case (whichanalyses)
            case ('onlyL')
                select case (WhichColliderString(expt, energy))
                case ('LEP')
                    req = 1*req
                case ('TEV', 'LHC7', 'LHC8', 'LHC13')
                    req = 0*req
                case default
                    stop 'error in error in setup_channels (1)'
                end select
            case ('onlyH')
                select case (WhichColliderString(expt, energy))
                case ('TEV', 'LHC7', 'LHC8', 'LHC13')
                    req = 1*req
                case ('LEP')
                    req = 0*req
                case default
                    stop 'error in error in setup_channels (2)'
                end select
            case ('LandH')
                select case (WhichColliderString(expt, energy))
                case ('LEP', 'TEV', 'LHC7', 'LHC8', 'LHC13')
                    req = 1*req
                case default
                    stop 'error in error in setup_channels (3)'
                end select
            case ('onlyP')
                if (pub) then
                    req = 1*req
                else
                    req = 0*req
                endif
            case ('list')
                do k = 1, size(analysislist)!n_analyses
                    if (analysislist(k) .eq. id) then
!        write(*,*) "case(list): k, n_analyses, analysislist(k), id = ",k, n_analyses, analysislist(k), id
                        req = 1*req
                        exit
                    endif
                    if (k == size(analysislist) .and. analysislist(k) .ne. id) then
!       if (analysislist(k).le.0) then
                        req = 0*req
                        exit
                    endif
                enddo
            case default
                stop 'error in setup_channels (A)'
            end select

            ! Remove analyses which have corresponding likelihood
            ! This is performed using a bitmask on the llh variable
            if (iand(llh, using_likelihood) .GT. 0) req = 0*req

            !   print *, i, id, llh, using_likelihood, iand(llh, using_likelihood), req

            l_analyses(i)%req = req
            n = n + req*n_perm

            !LEP analyses should be at the top of the list, to
            !make the order the same as in Oliver's code
            select case (WhichColliderString(expt, energy))
            case ('LEP')
                l_analyses(i)%in_first_set = .True.
            case ('TEV', 'LHC7', 'LHC8', 'LHC13')
                l_analyses(i)%in_first_set = .False.
            case default
                stop 'error in error in setup_channels (a)'
            end select

        enddo

        ! number of processes to test (nb won't all be valid)
        ntot = n

        call fill_pr

        deallocate (l_analyses)

        if (debug) then
            write (*, *) 'ntot=', ntot
            call print_init_stuff_for_debugging
        endif

    contains

        !******************************************
        subroutine print_init_stuff_for_debugging
            !******************************************
            use usefulbits, only: Hneut, Hplus, file_id_debug1
            logical :: templogical
            integer :: n1, fileid
            ! This section is just to assist with debugging
            ! It prints information about the channels to file 21
            fileid = file_id_debug1
            write (fileid, *) whichanalyses, np(Hneut), np(Hplus)

            do n1 = 1, ntot

                if (pr(n1)%ttype .eq. 1) then
                    templogical = .False.
                elseif (.not. S95_t2(pr(n1)%tlist)%needs_M2_gt_2M1) then
                    templogical = .True.
                else
                    templogical = .False.
                endif

                write (fileid, '(5I6,1L4)') n1, pr(n1)%tlist, pr(n1)%ttype, &
                    pr(n1)%findj, pr(n1)%findi, &
                    templogical
            enddo
        end subroutine print_init_stuff_for_debugging

    end subroutine setup_channels

    !******************************************************************
    subroutine check_channels(t, r, h)
        !******************************************************************
        !Checks each process against predicted experimental bounds
        !For some of the processes with high stat. sensitivity, then
        !compares to the measured experimental bounds
        !******************************************************************
        use usefulbits, only: ntot, debug, prsep, & !input
                              dataset, results, Hneut, Hplus, np
        use S95tables
        use likelihoods, only: calcpredratio_llh, check_against_bound_llh, llhdata
        implicit none
        !--------------------------------------input
        type(dataset) :: t
        integer, intent(in) :: h
        !-------------------------------------output
        type(results) :: r
        !-----------------------------------internal
        double precision, allocatable :: predratio(:), fact(:), predratio_saved(:)
        integer, allocatable :: ncomb(:)
        integer :: ii, n
        integer :: rep
        integer :: mlratio, count_clsb
        double precision, allocatable :: axis_i(:), axis_j(:)
        !-------------------------------------------

        allocate (predratio(ntot), fact(ntot), ncomb(ntot))
        allocate (predratio_saved(ntot))
        allocate (axis_i(ntot), axis_j(ntot))

        predratio = 0.0D0
        fact = 0.0D0

        rep = size(r%obsratio)
        !if((size(r%chan).ne.rep).or.(size(r%allowed95).ne.rep))then
        ! write(*,*)'wrong input to subroutine check_channels in module channels'
        ! stop
        !endif

        if (h .GT. (np(Hneut) + np(Hplus))) then
            stop "Illegal number for Higgs in check_channels"
        endif

        if (t%gooddataset) then ! labels a physical parameter point
            do n = 1, ntot
                select case (prsep(h, n)%ttype)
                case (1, 2)
                    ! write(*,*) " prsep(h, n)%ttype, prsep(h, n)%tlist = ", prsep(h, n)%ttype, prsep(h, n)%tlist, h, n
                    call calcfact(prsep(h, n), t, fact(n), axis_i(n), axis_j(n), ncomb(n))! calculates the theoretical factor that will be compared to the expt result

                    !For LEP tables, fact is S_theo (see HB paper for full definition)
                    call check_against_bound(prsep(h, n), fact(n), axis_i(n), axis_j(n), predratio(n), 2) !checks each process against
                    !predicted experimental bounds
! For debugging:
                    if (debug) then
                        if (prsep(h, n)%ttype == 2) then
                            print *, h, n, S95_t2(prsep(h, n)%tlist)%id, predratio(n)
                        endif
                    endif

                case (9) ! likelihoods
                    call calcpredratio_llh(prsep(h, n)%tlist, prsep(h, n)%findj, t, axis_i(n), fact(n), ncomb(n), predratio(n))
!     write(*,*) 'after calcpredratio_llh:', prsep(h,n)%tlist,prsep(h,n)%findj,axis_i(n),fact(n),ncomb(n),predratio(n)
                    ! n.b.: In case of likelihoods, we have two fact numbers (for ggH and bbH). Here, fact is the sum of these two.
                    axis_j(n) = axis_i(n)
                end select

!    print *, h, n, predratio(n)

!--Test for deactivated analysis (TS 20/11/2014)
                select case (prsep(h, n)%ttype)
                case (1)
                    if (is_analysis_deactivated(S95_t1(prsep(h, n)%tlist)%id)) predratio(n) = -1.0D0
                case (2)
                    if (is_analysis_deactivated(S95_t2(prsep(h, n)%tlist)%id)) predratio(n) = -1.0D0
                case (9)
                    if (is_analysis_deactivated(llhdata(prsep(h, n)%tlist)%D2llhdata(1)%analysisID)) predratio(n) = -1.0D0
                end select

            enddo

            predratio_saved = predratio

            if (debug) call print_stuff_for_debugging

            ! i=1 uses channel with highest stat. sensitivity
            ! compare with fact(mlratio) with experimental S95 value
            count_clsb = 0
            do ii = 1, rep
                if (count_clsb .gt. 0) stop 'should not occur. To generalise, use a pointer.' ! should also not use 'full' after a 'clsb'
                select case (r%channelselection(ii))
                case ('full')
                    ! do nothing
                case ('clsb') !don't want to pick any channels we don't have clsb tables for
                    predratio = predratio_saved ! we need to use the original predratio, because at least one the predratio(mlratio)
                    ! could have been set to -1 if the full case was done first
                    do n = 1, ntot
                        if (prsep(h, n)%corresponding_clsb_table_element .le. 0) then
                            predratio(n) = -1.0D0
                        endif
                    enddo
                    count_clsb = count_clsb + 1
                case default
                    stop 'problem in subroutine check_channels'
                end select

66              mlratio = maxloc(predratio, dim=1)

                if (predratio(mlratio) .gt. 0.0D0) then
                    ! setting the channel with the highest stat. sens. to -1 so that
                    ! the next highest is selected next time round
                    ! write (*, *) "Most sensitive analysis: ", h, mlratio, prsep(h, mlratio)%ttype, predratio(mlratio)
                    ! predratio(mlratio) = -1.0D0

                    select case (prsep(h, mlratio)%ttype)
                    case (1, 2)
                        call check_against_bound(prsep(h, mlratio), fact(mlratio), &
                                                 axis_i(mlratio), axis_j(mlratio), r%obsratio(ii), 1)
                    case (9)
                        call check_against_bound_llh(prsep(h, mlratio)%tlist, prsep(h, mlratio)%findj, t, &
                                                     axis_i(mlratio), ncomb(mlratio), r%obsratio(ii))
                    end select
                    !use this instead if you're only interested in the predicted exclusions, not the observed ones
                    !call check_against_bound(pr(mlratio),fact(mlratio),axis_i(mlratio),axis_j(mlratio),r%obsratio(ii),2)
                    !write(*,*)'hello WARNING PREDICTED RESULT USED TO OBTAIN EXCLUSION, NOT OBSERVED RESULT!'

                    r%sfactor(ii) = fact(mlratio)
                    r%axis_i(ii) = axis_i(mlratio)
                    r%axis_j(ii) = axis_j(mlratio)
                    r%chan(ii) = mlratio
                    r%ncombined(ii) = ncomb(mlratio)
                    r%predratio(ii) = predratio(mlratio)

                    predratio(mlratio) = -1.0D0

                else ! none of the processes apply: label with zero
                    r%chan(ii) = 0
                    r%obsratio(ii) = 0.0D0
                    r%predratio(ii) = 0.0D0
                    r%axis_i(ii) = 0.0D0
                    r%axis_j(ii) = 0.0D0
                    r%sfactor(ii) = 0.0D0
                    r%ncombined(ii) = 0
                endif

                if ((r%chan(ii) .gt. 0) .and. (r%obsratio(ii) .ge. 1.0D0)) then
                    r%allowed95(ii) = 0 !excluded
                elseif (r%obsratio(ii) .lt. 0.0D0) then
!     There is something wrong with this channel, no observed value
                    r%obsratio(ii) = 0.0D0
                    r%predratio(ii) = 0.0D0
                    r%axis_i(ii) = 0.0D0
                    r%axis_j(ii) = 0.0D0
                    r%sfactor(ii) = 0.0D0
                    r%ncombined(ii) = 0
                    r%chan(ii) = 0
                    r%allowed95(ii) = -1
                    goto 66
                else
                    r%allowed95(ii) = 1
                endif

                !if(r%obsratio(ii).lt.0.0D0)write(*,*)'hello A',r%obsratio(ii),r%chan(ii)

            enddo
        else ! gooddataset=False
            r%obsratio = 0.0D0
            r%predratio = 0.0D0
            r%axis_i = 0.0D0
            r%axis_j = 0.0D0
            r%sfactor = 0.0D0
            r%ncombined = 0
            r%chan = 0
            r%allowed95 = -1
        endif

        deallocate (axis_i)
        deallocate (axis_j)
        deallocate (predratio)
        deallocate (predratio_saved)
        deallocate (fact)
        deallocate (ncomb)

    contains

        !******************************************
        subroutine print_stuff_for_debugging
            !******************************************
            use usefulbits, only: Hneut, Hplus, np, file_id_debug2
            !  integer :: x,y
            integer :: n1, fileid
            ! This section is just to assist with debugging

            ! x=3
            ! if(x.gt.ubound(t%particle(Hneut)%M,dim=1))stop 'error in subroutine print_stuff_for_debugging a'
            ! if(x.gt.ubound(t%particle(Hplus)%M,dim=1))stop 'error in subroutine print_stuff_for_debugging b'
            ! write(*,*)'hello subroutine print_stuff_for_debugging'

            fileid = file_id_debug2
            write (fileid, *) '********************'
            if (np(Hneut) .ge. 1) then
                write (fileid, '(" * Mh:",1E16.7)') t%particle(Hneut)%M(1)
            elseif (np(Hneut) .ge. 1) then
                write (n, '(" * Mhplus:",1E16.7)') t%particle(Hplus)%M(1)
            else
                !stop 'error in subroutine print_stuff_for_debugging B'
            endif

            ! write(n,*)'********************'
            ! write(n,*)'x',x
            ! BE CAREFUL ABOUT PRINTING THESE OUT: check option of whichanalyses
            ! write(n,*)'********************'
            ! write(n,*)'t%particle(Hneut)%M(x):',t%particle(Hneut)%M(x)
            ! write(n,*)'********************'
            ! write(n,*)'t%CP_value(x):',         t%CP_value(x)
            ! write(n,*)'********************'
            ! write(n,*)'t%BR_hjbb(x):',          t%BR_hjbb(x)
            ! write(n,*)'t%BR_hjWW(x):',          t%BR_hjWW(x)
            ! write(n,*)'t%BR_hjtautau(x):',      t%BR_hjtautau(x)
            ! write(n,*)'t%BR_hjgaga(x):',        t%BR_hjgaga(x)
            ! write(n,*)'********************'
            ! write(n,*)'t%lep%XS_hjZ_ratio:',    t%lep%XS_hjZ_ratio
            ! write(n,*)'t%lep%XS_hjhi_ratio:',   t%lep%XS_hjhi_ratio(x,x)
            ! write(n,*)'********************'
            ! write(n,*)'t%tev%XS_hjW_ratio(x):',t%tev%XS_hjW_ratio(x)
            ! write(n,*)'t%tev%XS_hjZ_ratio(x):',t%tev%XS_hjZ_ratio(x)
            ! write(n,*)'t%tev%XS_hj_ratio(x):', t%tev%XS_hj_ratio(x)
            ! write(n,*)'t%tev%XS_vbf_ratio(x):',t%tev%XS_vbf_ratio(x)
            ! write(n,*)'t%tev%XS_tthj_ratio(x)',t%tev%XS_tthj_ratio(x)
            ! write(n,*)'t%tev%XS_hjb_ratio(x)', t%tev%XS_hjb_ratio(x)
            ! write(n,*)'********************'
            ! write(n,*)'t%tev%XS_HW_SM(x)',      t%tev%XS_HW_SM(x)
            ! write(n,*)'t%tev%XS_HZ_SM(x)',      t%tev%XS_HZ_SM(x)
            ! write(n,*)'t%tev%XS_H_SM(x)',       t%tev%XS_H_SM(x)
            ! write(n,*)'t%tev%XS_vbf_SM(x)',     t%tev%XS_vbf_SM(x)
            ! write(n,*)'t%tev%XS_Hb_SM(x)',      t%tev%XS_Hb_SM(x)
            ! write(n,*)'t%tev%XS_Hb_c3_SM(x)',   t%tev%XS_Hb_c3_SM(x)
            ! write(n,*)'t%tev%XS_ttH_SM(x)',     t%tev%XS_ttH_SM(x)
            ! write(n,*)'********************'
            ! write(n,*)'BR_HWW_SM(x):',         t%BR_HWW_SM(x)
            ! write(n,*)'BR_Hgaga_SM(x):',       t%BR_Hgaga_SM(x)
            ! write(n,*)'BR_Htautau_SM(x):',     t%BR_Htautau_SM(x)
            ! write(n,*)'BR_Hbb_SM(x):',         t%BR_Hbb_SM(x)
            ! write(n,*)'BR_Hjets_SM(x):',       t%BR_Hjets_SM(x)
            ! write(n,*)'********************'
            ! write(n,*)'BR_tHpjb(x):',t%BR_tHpjb(x)
            ! write(n,*)'BR_Hpjcs(x):',t%BR_Hpjcs(x)
            ! write(n,*)'BR_Hpjcb(x):',t%BR_Hpjcb(x)
            write (fileid, *) '********************'
            write (fileid, *) '*    h     n     predratio(n)  '
            do n1 = 1, ntot
                write (fileid, '(1I6,1I6,1E16.7)') h, n1, predratio(n1)
            enddo

            !write(n,*)'********************'
            !y=93
            !write(n,*)'y=',y
            !write(n,*)'fact(y),predratio(y)',fact(y),predratio(y)
            !write(n,*)'********************'

            !write(*,*)'********************'
            !write(*,'(1I6,2E12.3)')maxloc(predratio,dim=1),maxval(predratio,dim=1),r%obsratio(1)
            !write(*,*)'********************'

            !stop 'just debugging at the moment'

        end subroutine print_stuff_for_debugging
        !******************************************

    end subroutine check_channels

    !******************************************************************
    subroutine fill_pr
        !******************************************************************
        !fills the components of pr (which will keep track of the
        !characteristics of each process)
        !******************************************************************
        use usefulbits, only: np, ntot, & !input
                              pr, prsep, &!allocates, fills
                              Hneut, Hplus, allocate_if_stats_required
        use S95tables, only: S95_t1_or_S95_t2_idfromelementnumber
        use S95tables_type3, only: clsb_t3elementnumber_from_S95table
        implicit none
        !-----------------------------------internal
        integer :: n, x, i, j, np1, np2, set, id, jj
        logical :: add_this_analysis_now
        !-------------------------------------------

        allocate (pr(0:ntot))
        allocate (prsep(0:(np(Hneut) + np(Hplus)), 0:ntot))

        !use this for debugging:
        !call check_tables

!  open(100,file="prlist.0",action="write")
!  open(101,file="prlist.1",action="write")
!  open(102,file="prlist.2",action="write")
!  open(103,file="prlist.3",action="write")
!  open(104,file="prlist.4",action="write")

        do n = 0, ntot
            pr(n)%tlist = 0
            pr(n)%ttype = 0
            pr(n)%findi = 0
            pr(n)%findj = 0
        enddo

        do i = 0, np(Hneut) + np(Hplus)
            do n = 0, ntot
                prsep(i, n)%tlist = 0
                prsep(i, n)%ttype = 0
                prsep(i, n)%findi = 0
                prsep(i, n)%findj = 0
            enddo
        enddo

        n = 0

        do set = 1, 2
            do x = 1, size(l_analyses)
                select case (set)
                case (1)
                    add_this_analysis_now = l_analyses(x)%in_first_set
                case (2)
                    add_this_analysis_now = .not. l_analyses(x)%in_first_set
                case default
                    stop 'error in subroutine fill_pr (a)'
                end select

                if (add_this_analysis_now) then
                    np1 = np(l_analyses(x)%particle_x1)
                    np2 = np(l_analyses(x)%particle_x2)

                    select case (l_analyses(x)%req)
                    case (1)

                        select case (l_analyses(x)%ttype)
                        case (1, 9) ! Do this for tables type 1 and likelihoods
                            do i = 1, np1
                                n = n + 1
                                pr(n)%tlist = l_analyses(x)%tlist   !tlist is the table number i.e. which component of
                                !S95_t1 or S95_t1 to use
                                pr(n)%ttype = l_analyses(x)%ttype   !ttype is the table type
                                pr(n)%findi = i   !findi gives the i in h_i for this process
                                pr(n)%findj = i   !findj gives the j in h_j for this process

                                prsep(0, n)%tlist = l_analyses(x)%tlist   !tlist is the table number i.e. which component of
                                !S95_t1 or S95_t1 to use
                                prsep(0, n)%ttype = l_analyses(x)%ttype   !ttype is the table type
                                prsep(0, n)%findi = i   !findi gives the i in h_i for this process
                                prsep(0, n)%findj = i   !findj gives the j in h_j for this process

                                IF (l_analyses(x)%particle_x1 .EQ. Hneut) THEN
                                    prsep(i, n)%tlist = l_analyses(x)%tlist   !tlist is the table number i.e. which component of
                                    !S95_t1 or S95_t1 to use
                                    prsep(i, n)%ttype = l_analyses(x)%ttype   !ttype is the table type
                                    prsep(i, n)%findi = i   !findi gives the i in h_i for this process
                                    prsep(i, n)%findj = i   !findj gives the j in h_j for this process
                                ELSEIF (l_analyses(x)%particle_x1 .eq. Hplus) then
                                    prsep(np(Hneut) + i, n)%tlist = l_analyses(x)%tlist   !tlist is the table number i.e. which component of
                                    !S95_t1 or S95_t1 to use
                                    prsep(np(Hneut) + i, n)%ttype = l_analyses(x)%ttype   !ttype is the table type
                                    prsep(np(Hneut) + i, n)%findi = i   !findi gives the i in h_i for this process
                                    prsep(np(Hneut) + i, n)%findj = i   !findj gives the j in h_j for this process
                                ENDIF

                            enddo

! TS: Needs to be adjusted to "not-a-particle" and charged Higgs particles (?!)
                        case (2)
                            do j = 1, np2
                                do i = 1, np1
                                    n = n + 1
                                    pr(n)%tlist = l_analyses(x)%tlist
                                    pr(n)%ttype = l_analyses(x)%ttype
                                    pr(n)%findi = i
                                    pr(n)%findj = j

                                    prsep(0, n)%tlist = l_analyses(x)%tlist
                                    prsep(0, n)%ttype = l_analyses(x)%ttype
                                    prsep(0, n)%findi = i
                                    prsep(0, n)%findj = j

!           prsep(i,n)%tlist=l_analyses(x)%tlist   !tlist is the table number i.e. which component of
!                     !S95_t1 or S95_t1 to use
!           prsep(i,n)%ttype=l_analyses(x)%ttype   !ttype is the table type
!           prsep(i,n)%findi=i   !findi gives the i in h_i for this process
!           prsep(i,n)%findj=j   !findj gives the j in h_j for this process

! HB5 (TS 20/03/2017):
                                    if (l_analyses(x)%particle_x2 .eq. Hplus) then
                                        jj = j + np(Hneut)
                                    else
                                        jj = j
                                    endif
                                    prsep(jj, n)%tlist = l_analyses(x)%tlist   !tlist is the table number i.e. which component of
                                    !S95_t1 or S95_t1 to use
                                    prsep(jj, n)%ttype = l_analyses(x)%ttype   !ttype is the table type
                                    prsep(jj, n)%findi = i   !findi gives the i in h_i for this process
                                    prsep(jj, n)%findj = j   !findj gives the j in h_j for this process

                                enddo
                            enddo
                        case default
                            stop 'error in subroutine fill_pr (3)'
                        end select

                    case (0)
                        !leave analyses out
                    case default
                        stop 'error in subroutine fill_pr (1)'
                    end select
                endif
            enddo
        enddo

        if (n .ne. ntot) stop 'error in subroutine fill_pr (2)'

        if (allocated(allocate_if_stats_required)) then
            do n = 1, ntot
                id = S95_t1_or_S95_t2_idfromelementnumber(pr(n)%ttype, pr(n)%tlist)
                pr(n)%corresponding_clsb_table_element = clsb_t3elementnumber_from_S95table(pr(n)%ttype, id)
                prsep(0, n)%corresponding_clsb_table_element = clsb_t3elementnumber_from_S95table(pr(n)%ttype, id)

                do i = 1, size(prsep, dim=1) - 1
                    if (prsep(i, n)%ttype .ne. 0 .and. prsep(i, n)%tlist .ne. 0) then
                        id = S95_t1_or_S95_t2_idfromelementnumber(prsep(i, n)%ttype, prsep(i, n)%tlist)
                        prsep(i, n)%corresponding_clsb_table_element = clsb_t3elementnumber_from_S95table(prsep(i, n)%ttype, id)
                    else
                        prsep(i, n)%corresponding_clsb_table_element = -1
                    endif
                enddo
            enddo
        else
            do n = 1, ntot
                pr(n)%corresponding_clsb_table_element = -1
                prsep(0, n)%corresponding_clsb_table_element = -1
                do i = 1, size(prsep, dim=1) - 1
                    prsep(i, n)%corresponding_clsb_table_element = -1
                enddo
            enddo
        endif

! ### OS ###
!
!   do n=1,ntot
!    write(100,*) n,prsep(0,n)%tlist, prsep(0,n)%ttype,prsep(0,n)%findi,prsep(0,n)%findj
!   enddo
!
!   do n=1,ntot
!    write(101,*) n,prsep(1,n)%tlist, prsep(1,n)%ttype,prsep(1,n)%findi,  prsep(1,n)%findj
!   enddo
!
!   do n=1,ntot
!    write(102,*) n,prsep(2,n)%tlist, prsep(2,n)%ttype,prsep(2,n)%findi,  prsep(2,n)%findj
!   enddo
!
!   do n=1,ntot
!    write(103,*) n,prsep(3,n)%tlist, prsep(3,n)%ttype,prsep(3,n)%findi,  prsep(3,n)%findj
!   enddo
!
!   do n=1,ntot
!    write(104,*) n,prsep(4,n)%tlist, prsep(4,n)%ttype,prsep(4,n)%findi,  prsep(4,n)%findj
!   enddo
!
!
!   close(100)
!   close(101)
!   close(102)
!   close(103)
!   close(104)
!
    end subroutine fill_pr
!************************************************************
!> Deactivates experimental analyses.
!! Deactivates all experimental analyses specified by analysesID from the
!! standard HiggsBounds run. This can be undone by #higgsbounds_activate_all_analyses().
!! @param analysesID allocatable array that holds the analysis ID's of the experimental searches (to be deactivated).
    subroutine HiggsBounds_deactivate_analyses(analysesID)
        use usefulbits, only: analysis_exclude_list, pr
        use S95tables
        use likelihoods, only: llhdata
        implicit none

        integer, dimension(:), intent(in) :: analysesID
        integer :: N1, N2, i, j
        integer, allocatable :: analysis_exclude_list_copy(:)
        logical :: found
        character(LEN=45) :: label

        N2 = size(analysesID)

        write (*, *) "Deactivating the following analyses:"
        do i = lbound(analysesID, dim=1), ubound(analysesID, dim=1)
            found = .False.
            do j = lbound(pr, dim=1), ubound(pr, dim=1)
                select case (pr(j)%ttype)
                case (1)
                    if ((S95_t1(pr(j)%tlist)%id) .eq. analysesID(i)) then
                        found = .True.
                        label = adjustl(S95_t1(pr(j)%tlist)%label)
                        exit
                    endif
                case (2)
                    if ((S95_t2(pr(j)%tlist)%id) .eq. analysesID(i)) then
                        label = adjustl(S95_t2(pr(j)%tlist)%label)
                        found = .True.
                        exit
                    endif
                case (9)
                    if (llhdata(pr(j)%tlist)%D2llhdata(1)%analysisID .eq. analysesID(i)) then
                        label = adjustl(llhdata(pr(j)%tlist)%D2llhdata(1)%label)
                        found = .True.
                        exit
                    endif
                end select
            enddo
            if (found) then
                write (*, *) 'ID ', analysesID(i), ' , ', label
            else
                write (*, *) 'ID ', analysesID(i), ' unknown analysis ID! Please check again!'
            endif
        enddo

        if (allocated(analysis_exclude_list)) then
            N1 = size(analysis_exclude_list)
            allocate (analysis_exclude_list_copy(N1))
            analysis_exclude_list_copy = analysis_exclude_list
            deallocate (analysis_exclude_list)

            allocate (analysis_exclude_list(N1 + N2))
            analysis_exclude_list(1:N1) = analysis_exclude_list_copy
            analysis_exclude_list(N1 + 1:N1 + N2) = analysesID
        else
            allocate (analysis_exclude_list(N2))
            analysis_exclude_list = analysesID
        endif

    end subroutine HiggsBounds_deactivate_analyses
    !************************************************************
!> Activates all experimental analyses.
!! Activates all experimental analyses that were previously deactivated,
!! e.g. by #higgsbounds_deactivate_analyses().
    subroutine HiggsBounds_activate_all_analyses
        use usefulbits, only: analysis_exclude_list
        implicit none

        if (allocated(analysis_exclude_list)) then
            deallocate (analysis_exclude_list)
        endif

    end subroutine HiggsBounds_activate_all_analyses
    !************************************************************
    function is_S95_t1x_published(x)
        !************************************************************
        use S95tables, only: S95_t1
        implicit none
        !--------------------------------------input
        integer, intent(in) :: x
        !-----------------------------------function
        logical :: is_S95_t1x_published
        !-------------------------------------------

        if ((index(S95_t1(x)%label, 'hep') .gt. 0) &
            .or. (index(S95_t1(x)%label, 'HEP') .gt. 0) &
            .or. (index(S95_t1(x)%label, 'arx') .gt. 0) &
            .or. (index(S95_t1(x)%label, 'arX') .gt. 0) &
            .or. (index(S95_t1(x)%label, 'ARX') .gt. 0)) then
            is_S95_t1x_published = .True.
            !elseif(S95_t1(x)%expt.eq.'LEP')then
            ! is_S95_t1x_published=.True.
        else
            is_S95_t1x_published = .False.
        endif

    end function is_S95_t1x_published
    !************************************************************
    subroutine check_tables
        !************************************************************
        ! prints out all the Tevatron data to a file 'debugging_tables.txt'
        ! in a format which can be easily compared to the data in OB's code's tables
        use usefulbits, only: file_id_common
        use S95tables, only: S95_t1
        implicit none
        !-----------------------------------internal
        integer :: x, y, i, p, n
        double precision :: Mhi
        !-------------------------------------------
        n = file_id_common

        open (n, file='debugging_tables_tevtype1.txt')
        do p = 2, 1, -1
            do x = 1, size(l_analyses)
                if (l_analyses(x)%ttype .eq. 1) then
                    y = l_analyses(x)%tlist
                    if (S95_t1(y)%expt .ne. 'LEP') then
                        write (n, *) " id of table:", y, S95_t1(y)%id
                        do i = lbound(S95_t1(y)%dat, dim=1), ubound(S95_t1(y)%dat, dim=1)
                            Mhi = S95_t1(y)%xmin + dble(i - 1)*S95_t1(y)%sep
                            write (n, '(2E17.10)') Mhi, S95_t1(y)%dat(i, p)
                        enddo
                    endif
                endif
            enddo
        enddo
        close (n)

        open (n, file='debugging_tables_leptype1.txt')
        do p = 2, 1, -1
            do x = 1, size(l_analyses)
                if (l_analyses(x)%ttype .eq. 1) then
                    y = l_analyses(x)%tlist
                    if (S95_t1(y)%expt .eq. 'LEP') then
                        write (n, *) " id of table:", y, S95_t1(y)%id
                        do i = lbound(S95_t1(y)%dat, dim=1), ubound(S95_t1(y)%dat, dim=1)
                            Mhi = S95_t1(y)%xmin + dble(i - 1)*S95_t1(y)%sep
                            write (n, '(2E17.10)') Mhi, S95_t1(y)%dat(i, p)
                        enddo
                    endif
                endif
            enddo
        enddo
        close (n)

        stop 'subroutine check_tables should only be used when debugging'

    end subroutine check_tables
    !************************************************************
    function is_analysis_deactivated(analysis_id)
        !************************************************************
        use usefulbits, only: analysis_exclude_list

        integer, intent(in) :: analysis_id
        integer :: i
        logical :: is_analysis_deactivated

        is_analysis_deactivated = .False.

        if (allocated(analysis_exclude_list)) then
            do i = 1, size(analysis_exclude_list)
                if (analysis_id .eq. analysis_exclude_list(i)) then
                    is_analysis_deactivated = .True.
                endif
            enddo
        endif

    end function is_analysis_deactivated

end module channels
!******************************************************************
