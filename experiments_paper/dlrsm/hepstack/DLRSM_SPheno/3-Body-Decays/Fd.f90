! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.15.3 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 14:13 on 18.6.2025   
! ----------------------------------------------------------------------  
 
 
Module Fd3Decays_DLRSM 
 
Use Control 
Use Settings 
Use CouplingsForDecays_DLRSM 
Use ThreeBodyPhaseSpace 
 
Contains 
 
Subroutine FdThreeBodyDecay(n_in,MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,             & 
& MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,           & 
& TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,            & 
& ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,k1,vR,             & 
& gTAh,gThh,gTHpm,gTVWLm,gTVWRm,gTVZ,gTVZR,gFdFdcFdFd,gFdFdcFeFe,gFdFdcFuFu,             & 
& gFdFdFvFv,gFdFuFvFe,epsI,deltaM,CheckRealStates,gT,gPartial,BR)

Implicit None 
 
Real(dp),Intent(in) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,               & 
& MVZR2,PhiW,TW,UC(4,4),UP(4,4),ZH(4,4),ZZ(3,3)

Complex(dp),Intent(in) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZM(9,9),ZW(4,4)

Complex(dp) :: cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),          & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplcFdFuHpmL(3,3,4),& 
& cplcFdFuHpmR(3,3,4),cplcFdFuVWLmL(3,3),cplcFdFuVWLmR(3,3),cplcFdFuVWRmL(3,3),          & 
& cplcFdFuVWRmR(3,3),cplcFeFeAhL(3,3,4),cplcFeFeAhR(3,3,4),cplcFeFehhL(3,3,4),           & 
& cplcFeFehhR(3,3,4),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),& 
& cplcFuFdcHpmL(3,3,4),cplcFuFdcHpmR(3,3,4),cplcFuFdcVWLmL(3,3),cplcFuFdcVWLmR(3,3),     & 
& cplcFuFdcVWRmL(3,3),cplcFuFdcVWRmR(3,3),cplcFuFuAhL(3,3,4),cplcFuFuAhR(3,3,4),         & 
& cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),               & 
& cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),cplFvFecHpmL(9,3,4),cplFvFecHpmR(9,3,4),           & 
& cplFvFecVWLmL(9,3),cplFvFecVWLmR(9,3),cplFvFecVWRmL(9,3),cplFvFecVWRmR(9,3),           & 
& cplFvFvAhL(9,9,4),cplFvFvAhR(9,9,4),cplFvFvhhL(9,9,4),cplFvFvhhR(9,9,4),               & 
& cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplFvFvVZRL(9,9),cplFvFvVZRR(9,9)

Real(dp),Intent(in) :: gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,MU12,MU22,k1,vR

Complex(dp),Intent(in) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3),YL(3,3),YR(3,3),Mux(3,3)

Real(dp),Intent(inout) :: gFdFdcFdFd(3,3,3,3),gFdFdcFeFe(3,3,3,3),gFdFdcFuFu(3,3,3,3),gFdFdFvFv(3,3,9,9),       & 
& gFdFuFvFe(3,3,9,3)

Real(dp),Intent(in) :: gTAh(4),gThh(4),gTHpm(4),gTVWLm,gTVWRm,gTVZ,gTVZR

Real(dp) :: gFdFdcFdFdi(3,3,3),gFdFdcFeFei(3,3,3),gFdFdcFuFui(3,3,3),gFdFdFvFvi(3,9,9),           & 
& gFdFuFvFei(3,9,3)

Real(dp) :: gTAhtemp(4),gThhtemp(4),gTHpmtemp(4),gTVWLmtemp,gTVWRmtemp,gTVZtemp,gTVZRtemp
Integer :: NVs,NVst,NSs,NVVst,NVVss,NVSss,NVSst,NSSss,NSSst
Complex(dp), Allocatable :: IntegralVVst(:,:),IntegralVSss(:,:),IntegralVSst(:,:),IntegralSSss(:,:)               & 
& ,IntegralSSst(:,:)
Real(dp), Allocatable :: IntegralVs(:,:),IntegralVst(:,:),IntegralSs(:,:),IntegralVVss(:,:)
Real(dp), Intent(inout), Optional :: BR(:,:), gPartial(:,:) 
Real(dp), Intent(inout) :: gT(:) 
Integer, Intent(in) :: n_in 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Intent(in) ::  CheckRealStates 
Integer :: i_start, i_end, i_run, n_out, n_length, gt1, gt2, gt3, i1 
Logical :: check 
Iname = Iname +1 
NameOfUnit(Iname) = 'FdThreeBodyDecay' 
 
Allocate( IntegralVs(25000,9) ) 
Allocate( IntegralVst(25000,12) ) 
Allocate( IntegralSs(500000,10) ) 
Allocate( IntegralVVst(25000,12) ) 
Allocate( IntegralVVss(500000,12) ) 
Allocate( IntegralVSss(500000,12) ) 
Allocate( IntegralVSst(500000,16) ) 
Allocate( IntegralSSss(500000,12) ) 
Allocate( IntegralSSst(500000,16) ) 

 
If (CheckRealStates) Then 
gTAhtemp = 0._dp 
gThhtemp = 0._dp 
gTHpmtemp = 0._dp 
gTVWLmtemp = 0._dp 
gTVWRmtemp = 0._dp 
gTVZtemp = 0._dp 
gTVZRtemp = 0._dp 
Else 
gTAhtemp = gTAh 
gThhtemp = gThh 
gTHpmtemp = gTHpm 
gTVWLmtemp = gTVWLm 
gTVWRmtemp = gTVWRm 
gTVZtemp = gTVZ 
gTVZRtemp = gTVZR 
End If 
 
check=CheckRealStates 

 
If (n_in.Lt.0) Then 
 i_start = 1 
 i_end = 3 
 Else If ( (n_in.Ge.1).And.(n_in.Le. 3) ) Then 
 i_start = n_in 
 i_end = n_in 
Else 
 If (ErrorLevel.Ge.-1) Then 
   Write (ErrCan, *) 'Problem in subroutine'//NameOfUnit(Iname) 
   Write (ErrCan, *) 'Value of n_in out of range, (n_in,3) = ',n_in,3 
 End If 
 
 If (ErrorLevel.Gt.0) Call TerminateProgram 
 
 If (Present(BR)) BR = 0._dp 
 Iname = Iname - 1 
 Return 
End If 
 
Do i_run = i_start, i_end 
 
Call CouplingsFor_Fd_decays_3B(MFd(i_run),i_run,MAh,MAh2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,              & 
& MVZR,MVZR2,PhiW,TW,UC,ZDR,ZER,UP,ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,gBL,g2,g3,LAM2,           & 
& LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,              & 
& MU12,MU22,k1,vR,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,           & 
& cplcFdFdVZR,cplcFdFdVZRL,cplcFdFdVZRR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWLmL,         & 
& cplcFdFuVWLmR,cplcFdFuVWRmL,cplcFdFuVWRmR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,         & 
& cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZRL,cplcFeFeVZRR,cplcFuFdcHpmL,           & 
& cplcFuFdcHpmR,cplcFuFdcVWLmL,cplcFuFdcVWLmR,cplcFuFdcVWRmL,cplcFuFdcVWRmR,             & 
& cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,               & 
& cplcFuFuVZRL,cplcFuFuVZRR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWLmL,cplFvFecVWLmR,       & 
& cplFvFecVWRmL,cplFvFecVWRmR,cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,               & 
& cplFvFvVZL,cplFvFvVZR,cplFvFvVZRL,cplFvFvVZRR,deltaM)

IntegralVs = 0._dp 
NVs = 0  
IntegralVst = 0._dp 
NVst = 0  
IntegralSs = 0._dp 
NSs = 0  
IntegralVVst = 0._dp 
NVVst = 0  
IntegralVVss = 0._dp 
NVVss = 0  
IntegralVSss = 0._dp 
NVSss = 0  
IntegralVSst = 0._dp 
NVSst = 0  
IntegralSSss = 0._dp 
NSSss = 0  
IntegralSSst = 0._dp 
NSSst = 0  

 
gFdFdcFdFdi = 0._dp 
Call FdToFdcFdFd(i_run,MFd,MVZ,MVZR,MAh,Mhh,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,      & 
& cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZRL,cplcFdFdVZRR,IntegralSs,              & 
& IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,IntegralVVss,           & 
& IntegralVVst,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,NVVst,gTVZtemp,gTVZRtemp,           & 
& gTAhtemp,gThhtemp,deltaM,epsI,check,gFdFdcFdFdi)

gFdFdcFdFd(i_run,:,:,:) = gFdFdcFdFdi 
gT(i_run) = gT(i_run) + Sum(gFdFdcFdFdi) 
 
gFdFdcFeFei = 0._dp 
Call FdToFdcFeFe(i_run,MFd,MFe,MVZ,MVZR,MAh,Mhh,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZRL,cplcFdFdVZRR,             & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFeVZRL,cplcFeFeVZRR,IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,             & 
& IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,gTVZtemp,gTVZRtemp,gTAhtemp,gThhtemp,           & 
& deltaM,epsI,check,gFdFdcFeFei)

gFdFdcFeFe(i_run,:,:,:) = gFdFdcFeFei 
gT(i_run) = gT(i_run) + Sum(gFdFdcFeFei) 
 
gFdFdcFuFui = 0._dp 
Call FdToFdcFuFu(i_run,MFd,MFu,MVZ,MVZR,MVWLm,MVWRm,MHpm,MAh,Mhh,cplcFdFdAhL,         & 
& cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZRL,              & 
& cplcFdFdVZRR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWLmL,cplcFdFuVWLmR,cplcFdFuVWRmL,      & 
& cplcFdFuVWRmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWLmL,cplcFuFdcVWLmR,               & 
& cplcFuFdcVWRmL,cplcFuFdcVWRmR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,         & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZRL,cplcFuFuVZRR,IntegralSs,IntegralSSss,             & 
& IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,IntegralVVss,IntegralVVst,           & 
& NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,NVVst,gTVZtemp,gTVZRtemp,gTVWLmtemp,             & 
& gTVWRmtemp,gTHpmtemp,gTAhtemp,gThhtemp,deltaM,epsI,check,gFdFdcFuFui)

gFdFdcFuFu(i_run,:,:,:) = gFdFdcFuFui 
gT(i_run) = gT(i_run) + Sum(gFdFdcFuFui) 
 
gFdFdFvFvi = 0._dp 
Call FdToFdFvFv(i_run,MFd,MFv,MVZ,MVZR,MAh,Mhh,cplcFdFdAhL,cplcFdFdAhR,               & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZRL,cplcFdFdVZRR,             & 
& cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZRL,         & 
& cplFvFvVZRR,IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,IntegralVVss,              & 
& NSs,NSSss,NVs,NVSss,NVVss,gTVZtemp,gTVZRtemp,gTAhtemp,gThhtemp,deltaM,epsI,            & 
& check,gFdFdFvFvi)

gFdFdFvFv(i_run,:,:,:) = gFdFdFvFvi 
gT(i_run) = gT(i_run) + Sum(gFdFdFvFvi) 
 
gFdFuFvFei = 0._dp 
Call FdToFuFvFe(i_run,MFu,MFv,MFe,MVWLm,MVWRm,MHpm,MFd,cplcFdFuHpmL,cplcFdFuHpmR,     & 
& cplcFdFuVWLmL,cplcFdFuVWLmR,cplcFdFuVWRmL,cplcFdFuVWRmR,cplFvFecHpmL,cplFvFecHpmR,     & 
& cplFvFecVWLmL,cplFvFecVWLmR,cplFvFecVWRmL,cplFvFecVWRmR,IntegralSs,IntegralSSss,       & 
& IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,gTVWLmtemp,             & 
& gTVWRmtemp,gTHpmtemp,deltaM,epsI,check,gFdFuFvFei)

gFdFuFvFe(i_run,:,:,:) = gFdFuFvFei 
gT(i_run) = gT(i_run) + Sum(gFdFuFvFei) 
 
End Do 
 

If (Present(gPartial)) Then
Do i1 = i_start, i_end 
 
n_length=1
Do gt1=1,3
  Do gt2=1,3
    Do gt3=gt1,3
gPartial(i1,n_length)= gFdFdcFdFd(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gFdFdcFeFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,3
    Do gt3=1,3
gPartial(i1,n_length)= gFdFdcFuFu(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,9
    Do gt3=gt2,9
gPartial(i1,n_length)= gFdFdFvFv(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
Do gt1=1,3
  Do gt2=1,9
    Do gt3=1,3
gPartial(i1,n_length)= gFdFuFvFe(i1,gt1,gt2,gt3)
n_length=n_length+1
     End Do 
  End Do 
End Do 
If (Present(BR).And.(gT(i1).Gt.0._dp)) Then 
BR(i1,:)=gPartial(i1,:)/gT(i1)
Else If (Present(BR)) Then
BR(i1,:)=0._dp
End If
 
End Do 
End if 
Deallocate( IntegralVs ) 
Deallocate( IntegralVst ) 
Deallocate( IntegralSs ) 
Deallocate( IntegralVVst ) 
Deallocate( IntegralVVss ) 
Deallocate( IntegralVSss ) 
Deallocate( IntegralVSst ) 
Deallocate( IntegralSSss ) 
Deallocate( IntegralSSst ) 
Iname = Iname - 1 
 
End Subroutine FdThreeBodyDecay
 
 
Subroutine FdToFdcFdFd(iIN,MFd,MVZ,MVZR,MAh,Mhh,cplcFdFdAhL,cplcFdFdAhR,              & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZRL,cplcFdFdVZRR,             & 
& IntegralSs,IntegralSSss,IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,             & 
& IntegralVVss,IntegralVVst,NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,NVVst,gTVZ,            & 
& gTVZR,gTAh,gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFd(3),MVZ,MVZR,MAh(4),Mhh(4)

Complex(dp),Intent(in) :: cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),          & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16),IntegralVSss(500000,12),              & 
& IntegralVSst(500000,16),IntegralVVst(25000,12)

Real(dp),Intent(inout) :: gTVZ,gTVZR,gTAh(4),gThh(4)

Integer, Intent(inout) :: NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,NVVst
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MFd(iIN) 
 
Isum = 100 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=gt1, iIN-1
Isum = 0 
 
If(Abs(MFd(iIN)).gt.(Abs(MFd(gt3))+Abs(MFd(gt2))+Abs(MFd(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFd(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcFdFdVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFdVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFdFdVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFdFdVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt1) 
 
coup(2) = Conjg(cplcFdFdVZL(iIN,gt3)) 
coup(1) = Conjg(cplcFdFdVZR(iIN,gt3)) 
coup(4) = Conjg(cplcFdFdVZL(gt2,gt1)) 
coup(3) = Conjg(cplcFdFdVZR(gt2,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFd(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdVZL(iIN,gt3) 
coup2(2) = cplcFdFdVZR(iIN,gt3) 
coup2(3) = Conjg(cplcFdFdVZL(gt1,iIN)) 
coup2(4) = Conjg(cplcFdFdVZR(gt1,iIN))  
coup2(5) = cplcFdFdVZL(gt2,gt1) 
coup2(6) = cplcFdFdVZR(gt2,gt1) 
coup2(7) = Conjg(cplcFdFdVZL(gt3,gt2)) 
coup2(8) = Conjg(cplcFdFdVZR(gt3,gt2)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFd Fd Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  VZR 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZR 
Boson2(2) =gTVZR 
 
Boson4(1) = MVZR 
Boson4(2) =gTVZR 
Boson4(3) = MVZR 
Boson4(4) =gTVZR 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFd(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcFdFdVZRL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFdVZRR(iIN,gt1)) 
coup(4) = Conjg(cplcFdFdVZRL(gt2,gt3)) 
coup(3) = Conjg(cplcFdFdVZRR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt1) 
 
coup(2) = Conjg(cplcFdFdVZRL(iIN,gt3)) 
coup(1) = Conjg(cplcFdFdVZRR(iIN,gt3)) 
coup(4) = Conjg(cplcFdFdVZRL(gt2,gt1)) 
coup(3) = Conjg(cplcFdFdVZRR(gt2,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFd(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt3) 
coup2(2) = cplcFdFdVZRR(iIN,gt3) 
coup2(3) = Conjg(cplcFdFdVZRL(gt1,iIN)) 
coup2(4) = Conjg(cplcFdFdVZRR(gt1,iIN))  
coup2(5) = cplcFdFdVZRL(gt2,gt1) 
coup2(6) = cplcFdFdVZRR(gt2,gt1) 
coup2(7) = Conjg(cplcFdFdVZRL(gt3,gt2)) 
coup2(8) = Conjg(cplcFdFdVZRR(gt3,gt2)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFd Fd Propagator: VZR" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZR'



!-------------- 
!  Ah 
!-------------- 
Do i1=1,4
Isum = Isum + 1 
Boson2(1) = MAh(i1) 
Boson2(2) =gTAh(i1) 
 
Boson4(1) = MAh(i1) 
Boson4(2) =gTAh(i1) 
Boson4(3) = MAh(i1) 
Boson4(4) =gTAh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFd(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcFdFdAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFdFdAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFdFdAhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFdFdAhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt1) 
 
coup(2) = Conjg(cplcFdFdAhL(iIN,gt3,i1)) 
coup(1) = Conjg(cplcFdFdAhR(iIN,gt3,i1)) 
coup(4) = Conjg(cplcFdFdAhL(gt2,gt1,i1)) 
coup(3) = Conjg(cplcFdFdAhR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFd(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdAhL(iIN,gt3,i1) 
coup2(2) = cplcFdFdAhR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcFdFdAhL(gt1,iIN,i1)) 
coup2(3) = Conjg(cplcFdFdAhR(gt1,iIN,i1))  
coup2(5) = cplcFdFdAhL(gt2,gt1,i1) 
coup2(6) = cplcFdFdAhR(gt2,gt1,i1) 
coup2(8) = Conjg(cplcFdFdAhL(gt3,gt2,i1)) 
coup2(7) = Conjg(cplcFdFdAhR(gt3,gt2,i1)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFd Fd Propagator: Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah'
      End Do 



!-------------- 
!  hh 
!-------------- 
Do i1=1,4
Isum = Isum + 1 
Boson2(1) = Mhh(i1) 
Boson2(2) =gThh(i1) 
 
Boson4(1) = Mhh(i1) 
Boson4(2) =gThh(i1) 
Boson4(3) = Mhh(i1) 
Boson4(4) =gThh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFd(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup(2) = Conjg(cplcFdFdhhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFdFdhhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFdFdhhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFdFdhhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt1) 
 
coup(2) = Conjg(cplcFdFdhhL(iIN,gt3,i1)) 
coup(1) = Conjg(cplcFdFdhhR(iIN,gt3,i1)) 
coup(4) = Conjg(cplcFdFdhhL(gt2,gt1,i1)) 
coup(3) = Conjg(cplcFdFdhhR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt1.Eq.gt3) Then 
resR=resR/2._dp 
End If
resR= 3*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFd(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdhhL(iIN,gt3,i1) 
coup2(2) = cplcFdFdhhR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcFdFdhhL(gt1,iIN,i1)) 
coup2(3) = Conjg(cplcFdFdhhR(gt1,iIN,i1))  
coup2(5) = cplcFdFdhhL(gt2,gt1,i1) 
coup2(6) = cplcFdFdhhR(gt2,gt1,i1) 
coup2(8) = Conjg(cplcFdFdhhL(gt3,gt2,i1)) 
coup2(7) = Conjg(cplcFdFdhhR(gt3,gt2,i1)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFd Fd Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  VZ, VZR 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVZR 
Boson4(4) = gTVZR 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdVZRL(gt1,iIN)) 
coup2(4) = Conjg(cplcFdFdVZRR(gt1,iIN))  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFdFdVZRL(gt3,gt2)) 
coup2(8) = Conjg(cplcFdFdVZRR(gt3,gt2)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdVZL(iIN,gt3) 
coup2(2) = cplcFdFdVZR(iIN,gt3) 
coup2(3) = Conjg(cplcFdFdVZRL(gt1,iIN)) 
coup2(4) = Conjg(cplcFdFdVZRR(gt1,iIN))  
coup2(5) = cplcFdFdVZL(gt2,gt1) 
coup2(6) = cplcFdFdVZR(gt2,gt1) 
coup2(7) = Conjg(cplcFdFdVZRL(gt3,gt2)) 
coup2(8) = Conjg(cplcFdFdVZRR(gt3,gt2)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt1) 
 
coup2(1) = cplcFdFdVZL(iIN,gt3) 
coup2(2) = cplcFdFdVZR(iIN,gt3) 
coup2(3) = Conjg(cplcFdFdVZRL(gt3,iIN)) 
coup2(4) = Conjg(cplcFdFdVZRR(gt3,iIN))  
coup2(5) = cplcFdFdVZL(gt2,gt1) 
coup2(6) = cplcFdFdVZR(gt2,gt1) 
coup2(7) = Conjg(cplcFdFdVZRL(gt1,gt2)) 
coup2(8) = Conjg(cplcFdFdVZRR(gt1,gt2)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt3) 
mass(4) = MFd(gt1) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdVZRL(gt3,iIN)) 
coup2(4) = Conjg(cplcFdFdVZRR(gt3,iIN))  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFdFdVZRL(gt1,gt2)) 
coup2(8) = Conjg(cplcFdFdVZRR(gt1,gt2)) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFd Fd Propagator: VZ,VZR" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZR'



!-------------- 
!  VZ, Ah 
!-------------- 
  Do i2=1,4
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFdAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdAhR(gt1,iIN,i2))  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFdFdAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdAhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdVZL(iIN,gt3) 
coup2(2) = cplcFdFdVZR(iIN,gt3) 
coup2(4) = Conjg(cplcFdFdAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdAhR(gt1,iIN,i2))  
coup2(5) = cplcFdFdVZL(gt2,gt1) 
coup2(6) = cplcFdFdVZR(gt2,gt1) 
coup2(8) = Conjg(cplcFdFdAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdAhR(gt3,gt2,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt1) 
 
coup2(1) = cplcFdFdVZL(iIN,gt3) 
coup2(2) = cplcFdFdVZR(iIN,gt3) 
coup2(4) = Conjg(cplcFdFdAhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdAhR(gt3,iIN,i2))  
coup2(5) = cplcFdFdVZL(gt2,gt1) 
coup2(6) = cplcFdFdVZR(gt2,gt1) 
coup2(8) = Conjg(cplcFdFdAhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdAhR(gt1,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt3) 
mass(4) = MFd(gt1) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFdAhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdAhR(gt3,iIN,i2))  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFdFdAhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdAhR(gt1,gt2,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFd Fd Propagator: VZ,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Ah'
      End Do 



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,4
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFdhhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdhhR(gt1,iIN,i2))  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFdFdhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdhhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdVZL(iIN,gt3) 
coup2(2) = cplcFdFdVZR(iIN,gt3) 
coup2(4) = Conjg(cplcFdFdhhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdhhR(gt1,iIN,i2))  
coup2(5) = cplcFdFdVZL(gt2,gt1) 
coup2(6) = cplcFdFdVZR(gt2,gt1) 
coup2(8) = Conjg(cplcFdFdhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdhhR(gt3,gt2,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt1) 
 
coup2(1) = cplcFdFdVZL(iIN,gt3) 
coup2(2) = cplcFdFdVZR(iIN,gt3) 
coup2(4) = Conjg(cplcFdFdhhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdhhR(gt3,iIN,i2))  
coup2(5) = cplcFdFdVZL(gt2,gt1) 
coup2(6) = cplcFdFdVZR(gt2,gt1) 
coup2(8) = Conjg(cplcFdFdhhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdhhR(gt1,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt3) 
mass(4) = MFd(gt1) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFdhhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdhhR(gt3,iIN,i2))  
coup2(5) = cplcFdFdVZL(gt2,gt3) 
coup2(6) = cplcFdFdVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFdFdhhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdhhR(gt1,gt2,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFd Fd Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  VZR, Ah 
!-------------- 
  Do i2=1,4
Boson4(1) = MVZR 
Boson4(2) = gTVZR 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt1) 
coup2(2) = cplcFdFdVZRR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFdAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdAhR(gt1,iIN,i2))  
coup2(5) = cplcFdFdVZRL(gt2,gt3) 
coup2(6) = cplcFdFdVZRR(gt2,gt3) 
coup2(8) = Conjg(cplcFdFdAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdAhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt3) 
coup2(2) = cplcFdFdVZRR(iIN,gt3) 
coup2(4) = Conjg(cplcFdFdAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdAhR(gt1,iIN,i2))  
coup2(5) = cplcFdFdVZRL(gt2,gt1) 
coup2(6) = cplcFdFdVZRR(gt2,gt1) 
coup2(8) = Conjg(cplcFdFdAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdAhR(gt3,gt2,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt1) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt3) 
coup2(2) = cplcFdFdVZRR(iIN,gt3) 
coup2(4) = Conjg(cplcFdFdAhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdAhR(gt3,iIN,i2))  
coup2(5) = cplcFdFdVZRL(gt2,gt1) 
coup2(6) = cplcFdFdVZRR(gt2,gt1) 
coup2(8) = Conjg(cplcFdFdAhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdAhR(gt1,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt3) 
mass(4) = MFd(gt1) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt1) 
coup2(2) = cplcFdFdVZRR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFdAhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdAhR(gt3,iIN,i2))  
coup2(5) = cplcFdFdVZRL(gt2,gt3) 
coup2(6) = cplcFdFdVZRR(gt2,gt3) 
coup2(8) = Conjg(cplcFdFdAhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdAhR(gt1,gt2,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFd Fd Propagator: VZR,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZR,Ah'
      End Do 



!-------------- 
!  VZR, hh 
!-------------- 
  Do i2=1,4
Boson4(1) = MVZR 
Boson4(2) = gTVZR 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt1) 
coup2(2) = cplcFdFdVZRR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFdhhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdhhR(gt1,iIN,i2))  
coup2(5) = cplcFdFdVZRL(gt2,gt3) 
coup2(6) = cplcFdFdVZRR(gt2,gt3) 
coup2(8) = Conjg(cplcFdFdhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdhhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt3) 
coup2(2) = cplcFdFdVZRR(iIN,gt3) 
coup2(4) = Conjg(cplcFdFdhhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdhhR(gt1,iIN,i2))  
coup2(5) = cplcFdFdVZRL(gt2,gt1) 
coup2(6) = cplcFdFdVZRR(gt2,gt1) 
coup2(8) = Conjg(cplcFdFdhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdhhR(gt3,gt2,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt1) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt3) 
coup2(2) = cplcFdFdVZRR(iIN,gt3) 
coup2(4) = Conjg(cplcFdFdhhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdhhR(gt3,iIN,i2))  
coup2(5) = cplcFdFdVZRL(gt2,gt1) 
coup2(6) = cplcFdFdVZRR(gt2,gt1) 
coup2(8) = Conjg(cplcFdFdhhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdhhR(gt1,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt3) 
mass(4) = MFd(gt1) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt1) 
coup2(2) = cplcFdFdVZRR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFdhhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdhhR(gt3,iIN,i2))  
coup2(5) = cplcFdFdVZRL(gt2,gt3) 
coup2(6) = cplcFdFdVZRR(gt2,gt3) 
coup2(8) = Conjg(cplcFdFdhhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdhhR(gt1,gt2,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFd Fd Propagator: VZR,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZR,hh'
      End Do 



!-------------- 
!  Ah, Ah 
!-------------- 
Do i1=1,3
  Do i2=i1+1,4
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFdFdAhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcFdFdAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdAhR(gt1,iIN,i2))  
coup2(5) = cplcFdFdAhL(gt2,gt3,i1) 
coup2(6) = cplcFdFdAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcFdFdAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdAhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdAhL(iIN,gt3,i1) 
coup2(2) = cplcFdFdAhR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcFdFdAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdAhR(gt1,iIN,i2))  
coup2(5) = cplcFdFdAhL(gt2,gt1,i1) 
coup2(6) = cplcFdFdAhR(gt2,gt1,i1) 
coup2(8) = Conjg(cplcFdFdAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdAhR(gt3,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt1) 
 
coup2(1) = cplcFdFdAhL(iIN,gt3,i1) 
coup2(2) = cplcFdFdAhR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcFdFdAhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdAhR(gt3,iIN,i2))  
coup2(5) = cplcFdFdAhL(gt2,gt1,i1) 
coup2(6) = cplcFdFdAhR(gt2,gt1,i1) 
coup2(8) = Conjg(cplcFdFdAhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdAhR(gt1,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt3) 
mass(4) = MFd(gt1) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdAhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcFdFdAhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdAhR(gt3,iIN,i2))  
coup2(5) = cplcFdFdAhL(gt2,gt3,i1) 
coup2(6) = cplcFdFdAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcFdFdAhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdAhR(gt1,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFd Fd Propagator: Ah,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Ah'
        End Do 
      End Do 



!-------------- 
!  Ah, hh 
!-------------- 
Do i1=1,4
  Do i2=1,4
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFdFdAhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcFdFdhhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdhhR(gt1,iIN,i2))  
coup2(5) = cplcFdFdAhL(gt2,gt3,i1) 
coup2(6) = cplcFdFdAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcFdFdhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdhhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdAhL(iIN,gt3,i1) 
coup2(2) = cplcFdFdAhR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcFdFdhhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdhhR(gt1,iIN,i2))  
coup2(5) = cplcFdFdAhL(gt2,gt1,i1) 
coup2(6) = cplcFdFdAhR(gt2,gt1,i1) 
coup2(8) = Conjg(cplcFdFdhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdhhR(gt3,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt1) 
 
coup2(1) = cplcFdFdAhL(iIN,gt3,i1) 
coup2(2) = cplcFdFdAhR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcFdFdhhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdhhR(gt3,iIN,i2))  
coup2(5) = cplcFdFdAhL(gt2,gt1,i1) 
coup2(6) = cplcFdFdAhR(gt2,gt1,i1) 
coup2(8) = Conjg(cplcFdFdhhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdhhR(gt1,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt3) 
mass(4) = MFd(gt1) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdAhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcFdFdhhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdhhR(gt3,iIN,i2))  
coup2(5) = cplcFdFdAhL(gt2,gt3,i1) 
coup2(6) = cplcFdFdAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcFdFdhhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdhhR(gt1,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFd Fd Propagator: Ah,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,hh'
        End Do 
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,3
  Do i2=i1+1,4
Boson4(1) = Mhh(i1) 
Boson4(2) = gThh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt3) 
 
coup2(1) = cplcFdFdhhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdhhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcFdFdhhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdhhR(gt1,iIN,i2))  
coup2(5) = cplcFdFdhhL(gt2,gt3,i1) 
coup2(6) = cplcFdFdhhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcFdFdhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdhhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt1) 
mass(4) = MFd(gt3) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdhhL(iIN,gt3,i1) 
coup2(2) = cplcFdFdhhR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcFdFdhhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdhhR(gt1,iIN,i2))  
coup2(5) = cplcFdFdhhL(gt2,gt1,i1) 
coup2(6) = cplcFdFdhhR(gt2,gt1,i1) 
coup2(8) = Conjg(cplcFdFdhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdhhR(gt3,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt3) 
mass(3) = -MFd(gt2) 
mass(4) = MFd(gt1) 
 
coup2(1) = cplcFdFdhhL(iIN,gt3,i1) 
coup2(2) = cplcFdFdhhR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcFdFdhhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdhhR(gt3,iIN,i2))  
coup2(5) = cplcFdFdhhL(gt2,gt1,i1) 
coup2(6) = cplcFdFdhhR(gt2,gt1,i1) 
coup2(8) = Conjg(cplcFdFdhhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdhhR(gt1,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
mass(2) = MFd(gt3) 
mass(4) = MFd(gt1) 
mass(3) = -MFd(gt2) 
 
coup2(1) = cplcFdFdhhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdhhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcFdFdhhL(gt3,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdhhR(gt3,iIN,i2))  
coup2(5) = cplcFdFdhhL(gt2,gt3,i1) 
coup2(6) = cplcFdFdhhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcFdFdhhL(gt1,gt2,i2)) 
coup2(7) = Conjg(cplcFdFdhhR(gt1,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 3*resC ! color factor 
If (gt1.Eq.gt3) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFd Fd Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=gt1, iIN-1
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:100))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFd(iIN))**3*g
End Subroutine FdToFdcFdFd 
 
 
Subroutine FdToFdcFeFe(iIN,MFd,MFe,MVZ,MVZR,MAh,Mhh,cplcFdFdAhL,cplcFdFdAhR,          & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZRL,cplcFdFdVZRR,             & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,               & 
& cplcFeFeVZRL,cplcFeFeVZRR,IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,             & 
& IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,gTVZ,gTVZR,gTAh,gThh,deltaM,epsI,               & 
& check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFd(3),MFe(3),MVZ,MVZR,MAh(4),Mhh(4)

Complex(dp),Intent(in) :: cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),          & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplcFeFeAhL(3,3,4),& 
& cplcFeFeAhR(3,3,4),cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),cplcFeFeVZL(3,3),             & 
& cplcFeFeVZR(3,3),cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralVSss(500000,12)

Real(dp),Intent(inout) :: gTVZ,gTVZR,gTAh(4),gThh(4)

Integer, Intent(inout) :: NSs,NSSss,NVs,NVSss,NVVss
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MFd(iIN) 
 
Isum = 100 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MFd(iIN)).gt.(Abs(MFe(gt3))+Abs(MFe(gt2))+Abs(MFd(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFd(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFdFdVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFdVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFeFeVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFeFeVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFe Fe Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  VZR 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZR 
Boson2(2) =gTVZR 
 
Boson4(1) = MVZR 
Boson4(2) =gTVZR 
Boson4(3) = MVZR 
Boson4(4) =gTVZR 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFd(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFdFdVZRL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFdVZRR(iIN,gt1)) 
coup(4) = Conjg(cplcFeFeVZRL(gt2,gt3)) 
coup(3) = Conjg(cplcFeFeVZRR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFe Fe Propagator: VZR" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZR'



!-------------- 
!  Ah 
!-------------- 
Do i1=1,4
Isum = Isum + 1 
Boson2(1) = MAh(i1) 
Boson2(2) =gTAh(i1) 
 
Boson4(1) = MAh(i1) 
Boson4(2) =gTAh(i1) 
Boson4(3) = MAh(i1) 
Boson4(4) =gTAh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFd(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFdFdAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFdFdAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFeFeAhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFeFeAhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFe Fe Propagator: Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah'
      End Do 



!-------------- 
!  hh 
!-------------- 
Do i1=1,4
Isum = Isum + 1 
Boson2(1) = Mhh(i1) 
Boson2(2) =gThh(i1) 
 
Boson4(1) = Mhh(i1) 
Boson4(2) =gThh(i1) 
Boson4(3) = Mhh(i1) 
Boson4(4) =gThh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFd(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFdFdhhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFdFdhhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFeFehhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFeFehhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFe Fe Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  VZ, VZR 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVZR 
Boson4(4) = gTVZR 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdVZRL(gt1,iIN)) 
coup2(4) = Conjg(cplcFdFdVZRR(gt1,iIN))  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFeFeVZRL(gt3,gt2)) 
coup2(8) = Conjg(cplcFeFeVZRR(gt3,gt2)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFe Fe Propagator: VZ,VZR" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZR'



!-------------- 
!  VZ, Ah 
!-------------- 
  Do i2=1,4
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFdAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdAhR(gt1,iIN,i2))  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFeFeAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFeFeAhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFe Fe Propagator: VZ,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Ah'
      End Do 



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,4
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFdhhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdhhR(gt1,iIN,i2))  
coup2(5) = cplcFeFeVZL(gt2,gt3) 
coup2(6) = cplcFeFeVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFeFehhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFeFehhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFe Fe Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  VZR, Ah 
!-------------- 
  Do i2=1,4
Boson4(1) = MVZR 
Boson4(2) = gTVZR 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt1) 
coup2(2) = cplcFdFdVZRR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFdAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdAhR(gt1,iIN,i2))  
coup2(5) = cplcFeFeVZRL(gt2,gt3) 
coup2(6) = cplcFeFeVZRR(gt2,gt3) 
coup2(8) = Conjg(cplcFeFeAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFeFeAhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFe Fe Propagator: VZR,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZR,Ah'
      End Do 



!-------------- 
!  VZR, hh 
!-------------- 
  Do i2=1,4
Boson4(1) = MVZR 
Boson4(2) = gTVZR 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt1) 
coup2(2) = cplcFdFdVZRR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFdhhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdhhR(gt1,iIN,i2))  
coup2(5) = cplcFeFeVZRL(gt2,gt3) 
coup2(6) = cplcFeFeVZRR(gt2,gt3) 
coup2(8) = Conjg(cplcFeFehhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFeFehhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFe Fe Propagator: VZR,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZR,hh'
      End Do 



!-------------- 
!  Ah, Ah 
!-------------- 
Do i1=1,3
  Do i2=i1+1,4
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFdFdAhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcFdFdAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdAhR(gt1,iIN,i2))  
coup2(5) = cplcFeFeAhL(gt2,gt3,i1) 
coup2(6) = cplcFeFeAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcFeFeAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFeFeAhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFe Fe Propagator: Ah,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Ah'
        End Do 
      End Do 



!-------------- 
!  Ah, hh 
!-------------- 
Do i1=1,4
  Do i2=1,4
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFdFdAhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcFdFdhhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdhhR(gt1,iIN,i2))  
coup2(5) = cplcFeFeAhL(gt2,gt3,i1) 
coup2(6) = cplcFeFeAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcFeFehhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFeFehhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFe Fe Propagator: Ah,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,hh'
        End Do 
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,3
  Do i2=i1+1,4
Boson4(1) = Mhh(i1) 
Boson4(2) = gThh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFe(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFdFdhhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdhhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcFdFdhhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdhhR(gt1,iIN,i2))  
coup2(5) = cplcFeFehhL(gt2,gt3,i1) 
coup2(6) = cplcFeFehhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcFeFehhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFeFehhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFe Fe Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:100))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFd(iIN))**3*g
End Subroutine FdToFdcFeFe 
 
 
Subroutine FdToFdcFuFu(iIN,MFd,MFu,MVZ,MVZR,MVWLm,MVWRm,MHpm,MAh,Mhh,cplcFdFdAhL,     & 
& cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZRL,              & 
& cplcFdFdVZRR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWLmL,cplcFdFuVWLmR,cplcFdFuVWRmL,      & 
& cplcFdFuVWRmR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWLmL,cplcFuFdcVWLmR,               & 
& cplcFuFdcVWRmL,cplcFuFdcVWRmR,cplcFuFuAhL,cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,         & 
& cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZRL,cplcFuFuVZRR,IntegralSs,IntegralSSss,             & 
& IntegralSSst,IntegralVs,IntegralVSss,IntegralVSst,IntegralVVss,IntegralVVst,           & 
& NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,NVVst,gTVZ,gTVZR,gTVWLm,gTVWRm,gTHpm,            & 
& gTAh,gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFd(3),MFu(3),MVZ,MVZR,MVWLm,MVWRm,MHpm(4),MAh(4),Mhh(4)

Complex(dp),Intent(in) :: cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),          & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplcFdFuHpmL(3,3,4),& 
& cplcFdFuHpmR(3,3,4),cplcFdFuVWLmL(3,3),cplcFdFuVWLmR(3,3),cplcFdFuVWRmL(3,3),          & 
& cplcFdFuVWRmR(3,3),cplcFuFdcHpmL(3,3,4),cplcFuFdcHpmR(3,3,4),cplcFuFdcVWLmL(3,3),      & 
& cplcFuFdcVWLmR(3,3),cplcFuFdcVWRmL(3,3),cplcFuFdcVWRmR(3,3),cplcFuFuAhL(3,3,4),        & 
& cplcFuFuAhR(3,3,4),cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),cplcFuFuVZL(3,3),             & 
& cplcFuFuVZR(3,3),cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralSSst(500000,16),IntegralVSss(500000,12),              & 
& IntegralVSst(500000,16),IntegralVVst(25000,12)

Real(dp),Intent(inout) :: gTVZ,gTVZR,gTVWLm,gTVWRm,gTHpm(4),gTAh(4),gThh(4)

Integer, Intent(inout) :: NSs,NSSss,NSSst,NVs,NVSss,NVSst,NVVss,NVVst
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MFd(iIN) 
 
Isum = 256 
Allocate( gSum(3,3,3, Isum) ) 
Allocate( Contribution(3,3,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
Isum = 0 
 
If(Abs(MFd(iIN)).gt.(Abs(MFu(gt3))+Abs(MFu(gt2))+Abs(MFd(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFd(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcFdFdVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFdVZR(iIN,gt1)) 
coup(4) = Conjg(cplcFuFuVZL(gt2,gt3)) 
coup(3) = Conjg(cplcFuFuVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  VZR 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZR 
Boson2(2) =gTVZR 
 
Boson4(1) = MVZR 
Boson4(2) =gTVZR 
Boson4(3) = MVZR 
Boson4(4) =gTVZR 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFd(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcFdFdVZRL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFdVZRR(iIN,gt1)) 
coup(4) = Conjg(cplcFuFuVZRL(gt2,gt3)) 
coup(3) = Conjg(cplcFuFuVZRR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: VZR" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZR'



!-------------- 
!  VWLm 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVWLm 
Boson2(2) =gTVWLm 
 
Boson4(1) = MVWLm 
Boson4(2) =gTVWLm 
Boson4(3) = MVWLm 
Boson4(4) =gTVWLm 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFd(gt1) 
 
coup(2) = Conjg(cplcFdFuVWLmL(iIN,gt3)) 
coup(1) = Conjg(cplcFdFuVWLmR(iIN,gt3)) 
coup(4) = Conjg(cplcFuFdcVWLmL(gt2,gt1)) 
coup(3) = Conjg(cplcFuFdcVWLmR(gt2,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: VWLm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VWLm'



!-------------- 
!  VWRm 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVWRm 
Boson2(2) =gTVWRm 
 
Boson4(1) = MVWRm 
Boson4(2) =gTVWRm 
Boson4(3) = MVWRm 
Boson4(4) =gTVWRm 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFd(gt1) 
 
coup(2) = Conjg(cplcFdFuVWRmL(iIN,gt3)) 
coup(1) = Conjg(cplcFdFuVWRmR(iIN,gt3)) 
coup(4) = Conjg(cplcFuFdcVWRmL(gt2,gt1)) 
coup(3) = Conjg(cplcFuFdcVWRmR(gt2,gt1))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: VWRm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VWRm'



!-------------- 
!  Hpm 
!-------------- 
Do i1=1,4
Isum = Isum + 1 
Boson2(1) = MHpm(i1) 
Boson2(2) =gTHpm(i1) 
 
Boson4(1) = MHpm(i1) 
Boson4(2) =gTHpm(i1) 
Boson4(3) = MHpm(i1) 
Boson4(4) =gTHpm(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFd(gt1) 
 
coup(2) = Conjg(cplcFdFuHpmL(iIN,gt3,i1)) 
coup(1) = Conjg(cplcFdFuHpmR(iIN,gt3,i1)) 
coup(4) = Conjg(cplcFuFdcHpmL(gt2,gt1,i1)) 
coup(3) = Conjg(cplcFuFdcHpmR(gt2,gt1,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm'
      End Do 



!-------------- 
!  Ah 
!-------------- 
Do i1=1,4
Isum = Isum + 1 
Boson2(1) = MAh(i1) 
Boson2(2) =gTAh(i1) 
 
Boson4(1) = MAh(i1) 
Boson4(2) =gTAh(i1) 
Boson4(3) = MAh(i1) 
Boson4(4) =gTAh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFd(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcFdFdAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFdFdAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFuFuAhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFuFuAhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah'
      End Do 



!-------------- 
!  hh 
!-------------- 
Do i1=1,4
Isum = Isum + 1 
Boson2(1) = Mhh(i1) 
Boson2(2) =gThh(i1) 
 
Boson4(1) = Mhh(i1) 
Boson4(2) =gThh(i1) 
Boson4(3) = Mhh(i1) 
Boson4(4) =gThh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFd(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup(2) = Conjg(cplcFdFdhhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFdFdhhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplcFuFuhhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplcFuFuhhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 3*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  VZ, VZR 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVZR 
Boson4(4) = gTVZR 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdVZRL(gt1,iIN)) 
coup2(4) = Conjg(cplcFdFdVZRR(gt1,iIN))  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(7) = Conjg(cplcFuFuVZRL(gt3,gt2)) 
coup2(8) = Conjg(cplcFuFuVZRR(gt3,gt2)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: VZ,VZR" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZR'



!-------------- 
!  VZ, VWLm 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVWLm 
Boson4(4) = gTVWLm 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt3) 
mass(4) = MFd(gt1) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(4) = cplcFdFuVWLmL(iIN,gt3) 
coup2(3) = cplcFdFuVWLmR(iIN,gt3)  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(8) = cplcFuFdcVWLmL(gt2,gt1) 
coup2(7) = cplcFuFdcVWLmR(gt2,gt1) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: VZ,VWLm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VWLm'



!-------------- 
!  VZ, VWRm 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVWRm 
Boson4(4) = gTVWRm 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt3) 
mass(4) = MFd(gt1) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(4) = cplcFdFuVWRmL(iIN,gt3) 
coup2(3) = cplcFdFuVWRmR(iIN,gt3)  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(8) = cplcFuFdcVWRmL(gt2,gt1) 
coup2(7) = cplcFuFdcVWRmR(gt2,gt1) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: VZ,VWRm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VWRm'



!-------------- 
!  VZ, Hpm 
!-------------- 
  Do i2=1,4
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt3) 
mass(4) = MFd(gt1) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(4) = cplcFdFuHpmL(iIN,gt3,i2) 
coup2(3) = cplcFdFuHpmR(iIN,gt3,i2)  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(8) = cplcFuFdcHpmL(gt2,gt1,i2) 
coup2(7) = cplcFuFdcHpmR(gt2,gt1,i2) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: VZ,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Hpm'
      End Do 



!-------------- 
!  VZ, Ah 
!-------------- 
  Do i2=1,4
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFdAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdAhR(gt1,iIN,i2))  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFuFuAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFuFuAhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: VZ,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Ah'
      End Do 



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,4
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFdhhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdhhR(gt1,iIN,i2))  
coup2(5) = cplcFuFuVZL(gt2,gt3) 
coup2(6) = cplcFuFuVZR(gt2,gt3) 
coup2(8) = Conjg(cplcFuFuhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFuFuhhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  VZR, VWLm 
!-------------- 
Boson4(1) = MVZR 
Boson4(2) = gTVZR 
Boson4(3) = MVWLm 
Boson4(4) = gTVWLm 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt3) 
mass(4) = MFd(gt1) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt1) 
coup2(2) = cplcFdFdVZRR(iIN,gt1) 
coup2(4) = cplcFdFuVWLmL(iIN,gt3) 
coup2(3) = cplcFdFuVWLmR(iIN,gt3)  
coup2(5) = cplcFuFuVZRL(gt2,gt3) 
coup2(6) = cplcFuFuVZRR(gt2,gt3) 
coup2(8) = cplcFuFdcVWLmL(gt2,gt1) 
coup2(7) = cplcFuFdcVWLmR(gt2,gt1) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: VZR,VWLm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZR,VWLm'



!-------------- 
!  VZR, VWRm 
!-------------- 
Boson4(1) = MVZR 
Boson4(2) = gTVZR 
Boson4(3) = MVWRm 
Boson4(4) = gTVWRm 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt3) 
mass(4) = MFd(gt1) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt1) 
coup2(2) = cplcFdFdVZRR(iIN,gt1) 
coup2(4) = cplcFdFuVWRmL(iIN,gt3) 
coup2(3) = cplcFdFuVWRmR(iIN,gt3)  
coup2(5) = cplcFuFuVZRL(gt2,gt3) 
coup2(6) = cplcFuFuVZRR(gt2,gt3) 
coup2(8) = cplcFuFdcVWRmL(gt2,gt1) 
coup2(7) = cplcFuFdcVWRmR(gt2,gt1) 
Call IntegrateGaugeST(Boson4, mass, coup2, deltaM, epsI,IntegralVVst,NVVst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: VZR,VWRm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZR,VWRm'



!-------------- 
!  VZR, Hpm 
!-------------- 
  Do i2=1,4
Boson4(1) = MVZR 
Boson4(2) = gTVZR 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt3) 
mass(4) = MFd(gt1) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt1) 
coup2(2) = cplcFdFdVZRR(iIN,gt1) 
coup2(4) = cplcFdFuHpmL(iIN,gt3,i2) 
coup2(3) = cplcFdFuHpmR(iIN,gt3,i2)  
coup2(5) = cplcFuFuVZRL(gt2,gt3) 
coup2(6) = cplcFuFuVZRR(gt2,gt3) 
coup2(8) = cplcFuFdcHpmL(gt2,gt1,i2) 
coup2(7) = cplcFuFdcHpmR(gt2,gt1,i2) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: VZR,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZR,Hpm'
      End Do 



!-------------- 
!  VZR, Ah 
!-------------- 
  Do i2=1,4
Boson4(1) = MVZR 
Boson4(2) = gTVZR 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt1) 
coup2(2) = cplcFdFdVZRR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFdAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdAhR(gt1,iIN,i2))  
coup2(5) = cplcFuFuVZRL(gt2,gt3) 
coup2(6) = cplcFuFuVZRR(gt2,gt3) 
coup2(8) = Conjg(cplcFuFuAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFuFuAhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: VZR,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZR,Ah'
      End Do 



!-------------- 
!  VZR, hh 
!-------------- 
  Do i2=1,4
Boson4(1) = MVZR 
Boson4(2) = gTVZR 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt1) 
coup2(2) = cplcFdFdVZRR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFdhhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdhhR(gt1,iIN,i2))  
coup2(5) = cplcFuFuVZRL(gt2,gt3) 
coup2(6) = cplcFuFuVZRR(gt2,gt3) 
coup2(8) = Conjg(cplcFuFuhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFuFuhhR(gt3,gt2,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: VZR,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZR,hh'
      End Do 



!-------------- 
!  VWLm, VWRm 
!-------------- 
Boson4(1) = MVWLm 
Boson4(2) = gTVWLm 
Boson4(3) = MVWRm 
Boson4(4) = gTVWRm 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFd(gt1) 
 
coup2(1) = cplcFdFuVWLmL(iIN,gt3) 
coup2(2) = cplcFdFuVWLmR(iIN,gt3) 
coup2(4) = cplcFdFuVWRmL(iIN,gt3) 
coup2(3) = cplcFdFuVWRmR(iIN,gt3)  
coup2(5) = cplcFuFdcVWLmL(gt2,gt1) 
coup2(6) = cplcFuFdcVWLmR(gt2,gt1) 
coup2(8) = cplcFuFdcVWRmL(gt2,gt1) 
coup2(7) = cplcFuFdcVWRmR(gt2,gt1) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: VWLm,VWRm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWLm,VWRm'



!-------------- 
!  VWLm, Hpm 
!-------------- 
  Do i2=1,4
Boson4(1) = MVWLm 
Boson4(2) = gTVWLm 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFd(gt1) 
 
coup2(1) = cplcFdFuVWLmL(iIN,gt3) 
coup2(2) = cplcFdFuVWLmR(iIN,gt3) 
coup2(4) = cplcFdFuHpmL(iIN,gt3,i2) 
coup2(3) = cplcFdFuHpmR(iIN,gt3,i2)  
coup2(5) = cplcFuFdcVWLmL(gt2,gt1) 
coup2(6) = cplcFuFdcVWLmR(gt2,gt1) 
coup2(8) = cplcFuFdcHpmL(gt2,gt1,i2) 
coup2(7) = cplcFuFdcHpmR(gt2,gt1,i2) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: VWLm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWLm,Hpm'
      End Do 



!-------------- 
!  VWLm, Ah 
!-------------- 
  Do i2=1,4
Boson4(1) = MVWLm 
Boson4(2) = gTVWLm 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(4) = MFu(gt3) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFdFuVWLmL(iIN,gt3) 
coup2(2) = cplcFdFuVWLmR(iIN,gt3) 
coup2(4) = Conjg(cplcFdFdAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdAhR(gt1,iIN,i2))  
coup2(5) = cplcFuFdcVWLmL(gt2,gt1) 
coup2(6) = cplcFuFdcVWLmR(gt2,gt1) 
coup2(8) = Conjg(cplcFuFuAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFuFuAhR(gt3,gt2,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: VWLm,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWLm,Ah'
      End Do 



!-------------- 
!  VWLm, hh 
!-------------- 
  Do i2=1,4
Boson4(1) = MVWLm 
Boson4(2) = gTVWLm 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(4) = MFu(gt3) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFdFuVWLmL(iIN,gt3) 
coup2(2) = cplcFdFuVWLmR(iIN,gt3) 
coup2(4) = Conjg(cplcFdFdhhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdhhR(gt1,iIN,i2))  
coup2(5) = cplcFuFdcVWLmL(gt2,gt1) 
coup2(6) = cplcFuFdcVWLmR(gt2,gt1) 
coup2(8) = Conjg(cplcFuFuhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFuFuhhR(gt3,gt2,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: VWLm,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWLm,hh'
      End Do 



!-------------- 
!  VWRm, Hpm 
!-------------- 
  Do i2=1,4
Boson4(1) = MVWRm 
Boson4(2) = gTVWRm 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFd(gt1) 
 
coup2(1) = cplcFdFuVWRmL(iIN,gt3) 
coup2(2) = cplcFdFuVWRmR(iIN,gt3) 
coup2(4) = cplcFdFuHpmL(iIN,gt3,i2) 
coup2(3) = cplcFdFuHpmR(iIN,gt3,i2)  
coup2(5) = cplcFuFdcVWRmL(gt2,gt1) 
coup2(6) = cplcFuFdcVWRmR(gt2,gt1) 
coup2(8) = cplcFuFdcHpmL(gt2,gt1,i2) 
coup2(7) = cplcFuFdcHpmR(gt2,gt1,i2) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: VWRm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWRm,Hpm'
      End Do 



!-------------- 
!  VWRm, Ah 
!-------------- 
  Do i2=1,4
Boson4(1) = MVWRm 
Boson4(2) = gTVWRm 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(4) = MFu(gt3) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFdFuVWRmL(iIN,gt3) 
coup2(2) = cplcFdFuVWRmR(iIN,gt3) 
coup2(4) = Conjg(cplcFdFdAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdAhR(gt1,iIN,i2))  
coup2(5) = cplcFuFdcVWRmL(gt2,gt1) 
coup2(6) = cplcFuFdcVWRmR(gt2,gt1) 
coup2(8) = Conjg(cplcFuFuAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFuFuAhR(gt3,gt2,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: VWRm,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWRm,Ah'
      End Do 



!-------------- 
!  VWRm, hh 
!-------------- 
  Do i2=1,4
Boson4(1) = MVWRm 
Boson4(2) = gTVWRm 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(4) = MFu(gt3) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFdFuVWRmL(iIN,gt3) 
coup2(2) = cplcFdFuVWRmR(iIN,gt3) 
coup2(4) = Conjg(cplcFdFdhhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdhhR(gt1,iIN,i2))  
coup2(5) = cplcFuFdcVWRmL(gt2,gt1) 
coup2(6) = cplcFuFdcVWRmR(gt2,gt1) 
coup2(8) = Conjg(cplcFuFuhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFuFuhhR(gt3,gt2,i2)) 
coupT = coup2(7) 
coup2(7) = coup2(8) 
coup2(8) = coupT 
Call IntegrateGaugeSscalarT(Boson4, mass, coup2, deltaM, epsI,IntegralVSst,NVSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: VWRm,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWRm,hh'
      End Do 



!-------------- 
!  Hpm, Hpm 
!-------------- 
Do i1=1,3
  Do i2=i1+1,4
Boson4(1) = MHpm(i1) 
Boson4(2) = gTHpm(i1) 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt3) 
mass(3) = -MFu(gt2) 
mass(4) = MFd(gt1) 
 
coup2(1) = cplcFdFuHpmL(iIN,gt3,i1) 
coup2(2) = cplcFdFuHpmR(iIN,gt3,i1) 
coup2(4) = cplcFdFuHpmL(iIN,gt3,i2) 
coup2(3) = cplcFdFuHpmR(iIN,gt3,i2)  
coup2(5) = cplcFuFdcHpmL(gt2,gt1,i1) 
coup2(6) = cplcFuFdcHpmR(gt2,gt1,i1) 
coup2(8) = cplcFuFdcHpmL(gt2,gt1,i2) 
coup2(7) = cplcFuFdcHpmR(gt2,gt1,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: Hpm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Hpm'
        End Do 
      End Do 



!-------------- 
!  Hpm, Ah 
!-------------- 
Do i1=1,4
  Do i2=1,4
Boson4(1) = MHpm(i1) 
Boson4(2) = gTHpm(i1) 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(4) = MFu(gt3) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFdFuHpmL(iIN,gt3,i1) 
coup2(2) = cplcFdFuHpmR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcFdFdAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdAhR(gt1,iIN,i2))  
coup2(5) = cplcFuFdcHpmL(gt2,gt1,i1) 
coup2(6) = cplcFuFdcHpmR(gt2,gt1,i1) 
coup2(8) = Conjg(cplcFuFuAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFuFuAhR(gt3,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: Hpm,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Ah'
        End Do 
      End Do 



!-------------- 
!  Hpm, hh 
!-------------- 
Do i1=1,4
  Do i2=1,4
Boson4(1) = MHpm(i1) 
Boson4(2) = gTHpm(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(4) = MFu(gt3) 
mass(3) = -MFu(gt2) 
 
coup2(1) = cplcFdFuHpmL(iIN,gt3,i1) 
coup2(2) = cplcFdFuHpmR(iIN,gt3,i1) 
coup2(4) = Conjg(cplcFdFdhhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdhhR(gt1,iIN,i2))  
coup2(5) = cplcFuFdcHpmL(gt2,gt1,i1) 
coup2(6) = cplcFuFdcHpmR(gt2,gt1,i1) 
coup2(8) = Conjg(cplcFuFuhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFuFuhhR(gt3,gt2,i2)) 
Call IntegrateScalarST(Boson4, mass, coup2, deltaM, epsI,IntegralSSst,NSSst, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: Hpm,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,hh'
        End Do 
      End Do 



!-------------- 
!  Ah, Ah 
!-------------- 
Do i1=1,3
  Do i2=i1+1,4
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFdFdAhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcFdFdAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdAhR(gt1,iIN,i2))  
coup2(5) = cplcFuFuAhL(gt2,gt3,i1) 
coup2(6) = cplcFuFuAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcFuFuAhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFuFuAhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: Ah,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Ah'
        End Do 
      End Do 



!-------------- 
!  Ah, hh 
!-------------- 
Do i1=1,4
  Do i2=1,4
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFdFdAhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcFdFdhhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdhhR(gt1,iIN,i2))  
coup2(5) = cplcFuFuAhL(gt2,gt3,i1) 
coup2(6) = cplcFuFuAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcFuFuhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFuFuhhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: Ah,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,hh'
        End Do 
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,3
  Do i2=i1+1,4
Boson4(1) = Mhh(i1) 
Boson4(2) = gThh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFu(gt2) 
mass(4) = MFu(gt3) 
 
coup2(1) = cplcFdFdhhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdhhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcFdFdhhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdhhR(gt1,iIN,i2))  
coup2(5) = cplcFuFuhhL(gt2,gt3,i1) 
coup2(6) = cplcFuFuhhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplcFuFuhhL(gt3,gt2,i2)) 
coup2(7) = Conjg(cplcFuFuhhR(gt3,gt2,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 3*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd cFu Fu Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,3
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:256))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFd(iIN))**3*g
End Subroutine FdToFdcFuFu 
 
 
Subroutine FdToFdFvFv(iIN,MFd,MFv,MVZ,MVZR,MAh,Mhh,cplcFdFdAhL,cplcFdFdAhR,           & 
& cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,cplcFdFdVZRL,cplcFdFdVZRR,             & 
& cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZRL,         & 
& cplFvFvVZRR,IntegralSs,IntegralSSss,IntegralVs,IntegralVSss,IntegralVVss,              & 
& NSs,NSSss,NVs,NVSss,NVVss,gTVZ,gTVZR,gTAh,gThh,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFd(3),MFv(9),MVZ,MVZR,MAh(4),Mhh(4)

Complex(dp),Intent(in) :: cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),          & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplFvFvAhL(9,9,4),& 
& cplFvFvAhR(9,9,4),cplFvFvhhL(9,9,4),cplFvFvhhR(9,9,4),cplFvFvVZL(9,9),cplFvFvVZR(9,9), & 
& cplFvFvVZRL(9,9),cplFvFvVZRR(9,9)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralVSss(500000,12)

Real(dp),Intent(inout) :: gTVZ,gTVZR,gTAh(4),gThh(4)

Integer, Intent(inout) :: NSs,NSSss,NVs,NVSss,NVVss
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MFd(iIN) 
 
Isum = 100 
Allocate( gSum(3,9,9, Isum) ) 
Allocate( Contribution(3,9,9, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1, iIN-1
      Do gt2=1,9
        Do gt3=gt2,9
Isum = 0 
 
If(Abs(MFd(iIN)).gt.(Abs(MFv(gt3))+Abs(MFv(gt2))+Abs(MFd(gt1)))) Then 
!-------------- 
!  VZ 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZ 
Boson2(2) =gTVZ 
 
Boson4(1) = MVZ 
Boson4(2) =gTVZ 
Boson4(3) = MVZ 
Boson4(4) =gTVZ 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFd(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcFdFdVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFdVZR(iIN,gt1)) 
coup(4) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup(3) = Conjg(cplFvFvVZR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFd(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup(2) = Conjg(cplcFdFdVZL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFdVZR(iIN,gt1)) 
coup(4) = Conjg(cplFvFvVZL(gt3,gt2)) 
coup(3) = Conjg(cplFvFvVZR(gt3,gt2))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFd(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdVZL(gt1,iIN)) 
coup2(4) = Conjg(cplcFdFdVZR(gt1,iIN))  
coup2(5) = cplFvFvVZL(gt3,gt2) 
coup2(6) = cplFvFvVZR(gt3,gt2) 
coup2(7) = Conjg(cplFvFvVZL(gt2,gt3)) 
coup2(8) = Conjg(cplFvFvVZR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = -2._dp*resR 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd Fv Fv Propagator: VZ" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ'



!-------------- 
!  VZR 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVZR 
Boson2(2) =gTVZR 
 
Boson4(1) = MVZR 
Boson4(2) =gTVZR 
Boson4(3) = MVZR 
Boson4(4) =gTVZR 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFd(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcFdFdVZRL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFdVZRR(iIN,gt1)) 
coup(4) = Conjg(cplFvFvVZRL(gt2,gt3)) 
coup(3) = Conjg(cplFvFvVZRR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFd(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup(2) = Conjg(cplcFdFdVZRL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFdVZRR(iIN,gt1)) 
coup(4) = Conjg(cplFvFvVZRL(gt3,gt2)) 
coup(3) = Conjg(cplFvFvVZRR(gt3,gt2))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFd(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt1) 
coup2(2) = cplcFdFdVZRR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdVZRL(gt1,iIN)) 
coup2(4) = Conjg(cplcFdFdVZRR(gt1,iIN))  
coup2(5) = cplFvFvVZRL(gt3,gt2) 
coup2(6) = cplFvFvVZRR(gt3,gt2) 
coup2(7) = Conjg(cplFvFvVZRL(gt2,gt3)) 
coup2(8) = Conjg(cplFvFvVZRR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = -2._dp*resR 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd Fv Fv Propagator: VZR" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VZR'



!-------------- 
!  Ah 
!-------------- 
Do i1=1,4
Isum = Isum + 1 
Boson2(1) = MAh(i1) 
Boson2(2) =gTAh(i1) 
 
Boson4(1) = MAh(i1) 
Boson4(2) =gTAh(i1) 
Boson4(3) = MAh(i1) 
Boson4(4) =gTAh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFd(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcFdFdAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFdFdAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplFvFvAhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplFvFvAhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFd(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup(2) = Conjg(cplcFdFdAhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFdFdAhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplFvFvAhL(gt3,gt2,i1)) 
coup(3) = Conjg(cplFvFvAhR(gt3,gt2,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFd(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup2(1) = cplcFdFdAhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcFdFdAhL(gt1,iIN,i1)) 
coup2(3) = Conjg(cplcFdFdAhR(gt1,iIN,i1))  
coup2(5) = cplFvFvAhL(gt3,gt2,i1) 
coup2(6) = cplFvFvAhR(gt3,gt2,i1) 
coup2(8) = Conjg(cplFvFvAhL(gt2,gt3,i1)) 
coup2(7) = Conjg(cplFvFvAhR(gt2,gt3,i1)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd Fv Fv Propagator: Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah'
      End Do 



!-------------- 
!  hh 
!-------------- 
Do i1=1,4
Isum = Isum + 1 
Boson2(1) = Mhh(i1) 
Boson2(2) =gThh(i1) 
 
Boson4(1) = Mhh(i1) 
Boson4(2) =gThh(i1) 
Boson4(3) = Mhh(i1) 
Boson4(4) =gThh(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFd(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup(2) = Conjg(cplcFdFdhhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFdFdhhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplFvFvhhL(gt2,gt3,i1)) 
coup(3) = Conjg(cplFvFvhhR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFd(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup(2) = Conjg(cplcFdFdhhL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFdFdhhR(iIN,gt1,i1)) 
coup(4) = Conjg(cplFvFvhhL(gt3,gt2,i1)) 
coup(3) = Conjg(cplFvFvhhR(gt3,gt2,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
If (gt3.Eq.gt2) Then 
resR=resR/2._dp 
End If
resR= 1*resR ! color factor 
resS = resS + resR 
 
 mass(2) = MFd(gt1) 
mass(3) = -MFv(gt3) 
mass(4) = MFv(gt2) 
 
coup2(1) = cplcFdFdhhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdhhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcFdFdhhL(gt1,iIN,i1)) 
coup2(3) = Conjg(cplcFdFdhhR(gt1,iIN,i1))  
coup2(5) = cplFvFvhhL(gt3,gt2,i1) 
coup2(6) = cplFvFvhhR(gt3,gt2,i1) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt3,i1)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt3,i1)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = -2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd Fv Fv Propagator: hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='hh'
      End Do 



!-------------- 
!  VZ, VZR 
!-------------- 
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MVZR 
Boson4(4) = gTVZR 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(3) = Conjg(cplcFdFdVZRL(gt1,iIN)) 
coup2(4) = Conjg(cplcFdFdVZRR(gt1,iIN))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(7) = Conjg(cplFvFvVZRL(gt2,gt3)) 
coup2(8) = Conjg(cplFvFvVZRR(gt2,gt3)) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd Fv Fv Propagator: VZ,VZR" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,VZR'



!-------------- 
!  VZ, Ah 
!-------------- 
  Do i2=1,4
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFdAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdAhR(gt1,iIN,i2))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(8) = Conjg(cplFvFvAhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvAhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd Fv Fv Propagator: VZ,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,Ah'
      End Do 



!-------------- 
!  VZ, hh 
!-------------- 
  Do i2=1,4
Boson4(1) = MVZ 
Boson4(2) = gTVZ 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFdFdVZL(iIN,gt1) 
coup2(2) = cplcFdFdVZR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFdhhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdhhR(gt1,iIN,i2))  
coup2(5) = cplFvFvVZL(gt2,gt3) 
coup2(6) = cplFvFvVZR(gt2,gt3) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd Fv Fv Propagator: VZ,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZ,hh'
      End Do 



!-------------- 
!  VZR, Ah 
!-------------- 
  Do i2=1,4
Boson4(1) = MVZR 
Boson4(2) = gTVZR 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt1) 
coup2(2) = cplcFdFdVZRR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFdAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdAhR(gt1,iIN,i2))  
coup2(5) = cplFvFvVZRL(gt2,gt3) 
coup2(6) = cplFvFvVZRR(gt2,gt3) 
coup2(8) = Conjg(cplFvFvAhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvAhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd Fv Fv Propagator: VZR,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZR,Ah'
      End Do 



!-------------- 
!  VZR, hh 
!-------------- 
  Do i2=1,4
Boson4(1) = MVZR 
Boson4(2) = gTVZR 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFdFdVZRL(iIN,gt1) 
coup2(2) = cplcFdFdVZRR(iIN,gt1) 
coup2(4) = Conjg(cplcFdFdhhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdhhR(gt1,iIN,i2))  
coup2(5) = cplFvFvVZRL(gt2,gt3) 
coup2(6) = cplFvFvVZRR(gt2,gt3) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd Fv Fv Propagator: VZR,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VZR,hh'
      End Do 



!-------------- 
!  Ah, Ah 
!-------------- 
Do i1=1,3
  Do i2=i1+1,4
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = MAh(i2) 
Boson4(4) = gTAh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFdFdAhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcFdFdAhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdAhR(gt1,iIN,i2))  
coup2(5) = cplFvFvAhL(gt2,gt3,i1) 
coup2(6) = cplFvFvAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplFvFvAhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvAhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd Fv Fv Propagator: Ah,Ah" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,Ah'
        End Do 
      End Do 



!-------------- 
!  Ah, hh 
!-------------- 
Do i1=1,4
  Do i2=1,4
Boson4(1) = MAh(i1) 
Boson4(2) = gTAh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFdFdAhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdAhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcFdFdhhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdhhR(gt1,iIN,i2))  
coup2(5) = cplFvFvAhL(gt2,gt3,i1) 
coup2(6) = cplFvFvAhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd Fv Fv Propagator: Ah,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Ah,hh'
        End Do 
      End Do 



!-------------- 
!  hh, hh 
!-------------- 
Do i1=1,3
  Do i2=i1+1,4
Boson4(1) = Mhh(i1) 
Boson4(2) = gThh(i1) 
Boson4(3) = Mhh(i2) 
Boson4(4) = gThh(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFd(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFv(gt3) 
 
coup2(1) = cplcFdFdhhL(iIN,gt1,i1) 
coup2(2) = cplcFdFdhhR(iIN,gt1,i1) 
coup2(4) = Conjg(cplcFdFdhhL(gt1,iIN,i2)) 
coup2(3) = Conjg(cplcFdFdhhR(gt1,iIN,i2))  
coup2(5) = cplFvFvhhL(gt2,gt3,i1) 
coup2(6) = cplFvFvhhR(gt2,gt3,i1) 
coup2(8) = Conjg(cplFvFvhhL(gt2,gt3,i2)) 
coup2(7) = Conjg(cplFvFvhhR(gt2,gt3,i2)) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
If (gt3.Eq.gt2) Then 
resC=resC/2._dp 
End If
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fd Fv Fv Propagator: hh,hh" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='hh,hh'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1, iIN-1
      Do gt2=1,9
        Do gt3=gt2,9
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:100))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFd(iIN))**3*g
End Subroutine FdToFdFvFv 
 
 
Subroutine FdToFuFvFe(iIN,MFu,MFv,MFe,MVWLm,MVWRm,MHpm,MFd,cplcFdFuHpmL,              & 
& cplcFdFuHpmR,cplcFdFuVWLmL,cplcFdFuVWLmR,cplcFdFuVWRmL,cplcFdFuVWRmR,cplFvFecHpmL,     & 
& cplFvFecHpmR,cplFvFecVWLmL,cplFvFecVWLmR,cplFvFecVWRmL,cplFvFecVWRmR,IntegralSs,       & 
& IntegralSSss,IntegralVs,IntegralVSss,IntegralVVss,NSs,NSSss,NVs,NVSss,NVVss,           & 
& gTVWLm,gTVWRm,gTHpm,deltaM,epsI,check,g,WriteContributions)

Implicit None 
 
Real(dp),Intent(in) :: MFu(3),MFv(9),MFe(3),MVWLm,MVWRm,MHpm(4),MFd(3)

Complex(dp),Intent(in) :: cplcFdFuHpmL(3,3,4),cplcFdFuHpmR(3,3,4),cplcFdFuVWLmL(3,3),cplcFdFuVWLmR(3,3),        & 
& cplcFdFuVWRmL(3,3),cplcFdFuVWRmR(3,3),cplFvFecHpmL(9,3,4),cplFvFecHpmR(9,3,4),         & 
& cplFvFecVWLmL(9,3),cplFvFecVWLmR(9,3),cplFvFecVWRmL(9,3),cplFvFecVWRmR(9,3)

Real(dp),Intent(inout) :: IntegralSs(500000,10),IntegralVs(25000,9),IntegralVVss(500000,12)

Complex(dp),Intent(inout) :: IntegralSSss(500000,12),IntegralVSss(500000,12)

Real(dp),Intent(inout) :: gTVWLm,gTVWRm,gTHpm(4)

Integer, Intent(inout) :: NSs,NSSss,NVs,NVSss,NVVss
Real(dp),Intent(inout)::g(:,:,:) 
Logical, Intent(in) :: check 
Integer, Intent(in) :: iIN 
Real(dp), Intent(in) :: epsI, deltaM 
Logical, Optional :: WriteContributions 
Integer :: i1,i2,gt1,gt2,gt3, Isum 
Real(dp) :: resR,  res1, res2, resD, m_in 
Complex(dp) :: resC, resS 
Real(dp), Allocatable :: gSum(:,:,:,:) 
Character(len=20), Allocatable :: Contribution(:,:,:,:) 
Real(dp) :: Boson2(2), mass(4),  Boson4(4) 
Complex(dp) :: coup(4), coup2(8),coupT 
mass(1) = MFd(iIN) 
 
Isum = 36 
Allocate( gSum(3,9,3, Isum) ) 
Allocate( Contribution(3,9,3, Isum) ) 
gSum = 0._dp  
Contribution = ' ' 
 
Isum = 0 
 
    Do gt1=1,3
      Do gt2=1,9
        Do gt3=1,3
Isum = 0 
 
If(Abs(MFd(iIN)).gt.(Abs(MFe(gt3))+Abs(MFv(gt2))+Abs(MFu(gt1)))) Then 
!-------------- 
!  VWLm 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVWLm 
Boson2(2) =gTVWLm 
 
Boson4(1) = MVWLm 
Boson4(2) =gTVWLm 
Boson4(3) = MVWLm 
Boson4(4) =gTVWLm 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFu(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFdFuVWLmL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFuVWLmR(iIN,gt1)) 
coup(4) = Conjg(cplFvFecVWLmL(gt2,gt3)) 
coup(3) = Conjg(cplFvFecVWLmR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fu Fv Fe Propagator: VWLm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VWLm'



!-------------- 
!  VWRm 
!-------------- 
Isum = Isum + 1 
Boson2(1) = MVWRm 
Boson2(2) =gTVWRm 
 
Boson4(1) = MVWRm 
Boson4(2) =gTVWRm 
Boson4(3) = MVWRm 
Boson4(4) =gTVWRm 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFu(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFdFuVWRmL(iIN,gt1)) 
coup(1) = Conjg(cplcFdFuVWRmR(iIN,gt1)) 
coup(4) = Conjg(cplFvFecVWRmL(gt2,gt3)) 
coup(3) = Conjg(cplFvFecVWRmR(gt2,gt3))
Call IntegrateGaugeSS(Boson2,mass,coup,deltaM,epsI,IntegralVs,NVs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fu Fv Fe Propagator: VWRm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='VWRm'



!-------------- 
!  Hpm 
!-------------- 
Do i1=1,4
Isum = Isum + 1 
Boson2(1) = MHpm(i1) 
Boson2(2) =gTHpm(i1) 
 
Boson4(1) = MHpm(i1) 
Boson4(2) =gTHpm(i1) 
Boson4(3) = MHpm(i1) 
Boson4(4) =gTHpm(i1) 
 
resS=0._dp 
resD=0._dp 
 
mass(2) = MFu(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFe(gt3) 
 
coup(2) = Conjg(cplcFdFuHpmL(iIN,gt1,i1)) 
coup(1) = Conjg(cplcFdFuHpmR(iIN,gt1,i1)) 
coup(4) = Conjg(cplFvFecHpmL(gt2,gt3,i1)) 
coup(3) = Conjg(cplFvFecHpmR(gt2,gt3,i1))
Call IntegrateScalarSS(Boson2,mass,coup,deltaM,epsI,IntegralSs,NSs,resR, check) 
resR= 1*resR ! color factor 
resS = resS + resR 
 
 resD = resD + resS 
If (resD.ne.resD) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fu Fv Fe Propagator: Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp
Else 
gSum(gt1,gt2,gt3,Isum)=resD
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm'
      End Do 



!-------------- 
!  VWLm, VWRm 
!-------------- 
Boson4(1) = MVWLm 
Boson4(2) = gTVWLm 
Boson4(3) = MVWRm 
Boson4(4) = gTVWRm 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFdFuVWLmL(iIN,gt1) 
coup2(2) = cplcFdFuVWLmR(iIN,gt1) 
coup2(4) = cplcFdFuVWRmL(iIN,gt1) 
coup2(3) = cplcFdFuVWRmR(iIN,gt1)  
coup2(5) = cplFvFecVWLmL(gt2,gt3) 
coup2(6) = cplFvFecVWLmR(gt2,gt3) 
coup2(8) = cplFvFecVWRmL(gt2,gt3) 
coup2(7) = cplFvFecVWRmR(gt2,gt3) 
Call IntegrateGaugeSS(Boson4, mass, coup2, deltaM, epsI,IntegralVVss,NVVss, resR, check) 
If (resR.ne.resR) resR = 0._dp
resC = 2._dp*resR 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fu Fv Fe Propagator: VWLm,VWRm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWLm,VWRm'



!-------------- 
!  VWLm, Hpm 
!-------------- 
  Do i2=1,4
Boson4(1) = MVWLm 
Boson4(2) = gTVWLm 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFdFuVWLmL(iIN,gt1) 
coup2(2) = cplcFdFuVWLmR(iIN,gt1) 
coup2(4) = cplcFdFuHpmL(iIN,gt1,i2) 
coup2(3) = cplcFdFuHpmR(iIN,gt1,i2)  
coup2(5) = cplFvFecVWLmL(gt2,gt3) 
coup2(6) = cplFvFecVWLmR(gt2,gt3) 
coup2(8) = cplFvFecHpmL(gt2,gt3,i2) 
coup2(7) = cplFvFecHpmR(gt2,gt3,i2) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fu Fv Fe Propagator: VWLm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWLm,Hpm'
      End Do 



!-------------- 
!  VWRm, Hpm 
!-------------- 
  Do i2=1,4
Boson4(1) = MVWRm 
Boson4(2) = gTVWRm 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFdFuVWRmL(iIN,gt1) 
coup2(2) = cplcFdFuVWRmR(iIN,gt1) 
coup2(4) = cplcFdFuHpmL(iIN,gt1,i2) 
coup2(3) = cplcFdFuHpmR(iIN,gt1,i2)  
coup2(5) = cplFvFecVWRmL(gt2,gt3) 
coup2(6) = cplFvFecVWRmR(gt2,gt3) 
coup2(8) = cplFvFecHpmL(gt2,gt3,i2) 
coup2(7) = cplFvFecHpmR(gt2,gt3,i2) 
Call IntegrateGaugeSscalarS(Boson4, mass, coup2, deltaM, epsI,IntegralVSss,NVSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fu Fv Fe Propagator: VWRm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='VWRm,Hpm'
      End Do 



!-------------- 
!  Hpm, Hpm 
!-------------- 
Do i1=1,3
  Do i2=i1+1,4
Boson4(1) = MHpm(i1) 
Boson4(2) = gTHpm(i1) 
Boson4(3) = MHpm(i2) 
Boson4(4) = gTHpm(i2) 
Isum = Isum + 1 
 
resS = 0._dp 
mass(2) = MFu(gt1) 
mass(3) = -MFv(gt2) 
mass(4) = MFe(gt3) 
 
coup2(1) = cplcFdFuHpmL(iIN,gt1,i1) 
coup2(2) = cplcFdFuHpmR(iIN,gt1,i1) 
coup2(4) = cplcFdFuHpmL(iIN,gt1,i2) 
coup2(3) = cplcFdFuHpmR(iIN,gt1,i2)  
coup2(5) = cplFvFecHpmL(gt2,gt3,i1) 
coup2(6) = cplFvFecHpmR(gt2,gt3,i1) 
coup2(8) = cplFvFecHpmL(gt2,gt3,i2) 
coup2(7) = cplFvFecHpmR(gt2,gt3,i2) 
Call IntegrateScalarS1S2(Boson4, mass, coup2, deltaM, epsI,IntegralSSss,NSSss, resC, check) 
If (resC.ne.resC) resC = 0._dp
resC = 2._dp*resC 
resC= 1*resC ! color factor 
resS = resS + resC 
If (resS.ne.resS) Then 
Write(*,*) "NaN appearing in the following diagrams: " 
Write(*,*) "Fd->Fu Fv Fe Propagator: Hpm,Hpm" 
Write(*,*)  "M_in: ",m_in 
Write(*,*)  "mass: ",mass 
Write(*,*)  "coup: ",coup 
gSum(gt1,gt2,gt3,Isum)= 0._dp  
Else 
gSum(gt1,gt2,gt3,Isum)= resS  
End If 
Contribution(gt1,gt2,gt3,Isum)='Hpm,Hpm'
        End Do 
      End Do 



Else 
gSum(gt1,gt2,gt3,:)= 0._dp  
End If 
       End Do 
     End Do 
   End Do 
!---------- 
!Summing 
!---------- 
g=0._dp 
    Do gt1=1,3
      Do gt2=1,9
        Do gt3=1,3
g(gt1,gt2,gt3)=Sum(gSum(gt1,gt2,gt3,1:36))
If (g(gt1,gt2,gt3).Lt.0._dp) Then
  Write (ErrCan,*)'Error in Subroutine'//NameOfUnit(Iname)
  g(gt1,gt2,gt3)=0._dp
End If
       End Do 
     End Do 
   End Do 
  g = oo512pi3 / Abs(MFd(iIN))**3*g
End Subroutine FdToFuFvFe 
 
 
End Module Fd3Decays_DLRSM 
 
