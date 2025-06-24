! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.15.3 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 14:12 on 18.6.2025   
! ----------------------------------------------------------------------  
 
 
Module LoopCouplings_DLRSM 
 
Use Control 
Use Settings 
Use Couplings_DLRSM 
Use Mathematics 
Use LoopFunctions 
Use StandardModel 
 
 Contains 
 
Real(dp) Function Alpha_MSbar(Q,mW,mt) 
Implicit None 
Real(dp),Intent(in)::Q,mW 
Real(dp),Intent(in),Optional::mt 
Real(dp)::DeltaAlpha 
If (MZ_input) Then 
Alpha_MSbar=Alpha_mZ_MS 
If (Present(mt)) Then 
DeltaAlpha=-8._dp*Log(Q/mt)/(9._dp*Pi) 
Alpha_MSbar=Alpha_MSbar/(1._dp+DeltaAlpha*alpha) 
End If 
Else 
DeltaAlpha=3.5_dp*Log(Q/mW)/Pi+0.5_dp*oo3pi 
If (Present(mt)) DeltaAlpha=DeltaAlpha-8._dp*Log(Q/mt)/(9._dp*Pi) 
Alpha_MSbar=Alpha/(1._dp-Delta_Alpha_Lepton-Delta_Alpha_Hadron& 
&+DeltaAlpha*alpha) 
Alpha_MZ_MS=Alpha_MSbar 
End If 
End Function Alpha_MSbar
 
 
Real(dp) Function AlphaEwDR(Q,MVWLm,MVWRm,MHpm,MFd,MFu,MFe) 
 
Real(dp),Intent(in)::Q,MVWLm,MVWRm,MHpm(4),MFd(3),MFu(3),MFe(3)
Integer::i1 
Real(dp)::DeltaAlpha 
If (MZ_input) then 
DeltaAlpha=1._dp-Alpha/Alpha_MZ_MS! MSbar value^=mW+light fermions 
DeltaAlpha=DeltaAlpha+alpha/(6._dp*Pi)*(1._dp-rMS)! conversion to DRbar if necessary 
If (MVWLm.gt.Q) Then 
DeltaAlpha=DeltaAlpha-1._dp/3._dp*Log(MVWLm/ Q)*Alpha/(2._dp*pi) 
End if 
If (MVWRm.gt.Q) Then 
DeltaAlpha=DeltaAlpha-1._dp/3._dp*Log(MVWRm/ Q)*Alpha/(2._dp*pi) 
End if 
Do i1=3,4
If (MHpm(i1).gt.Q) Then 
DeltaAlpha=DeltaAlpha-1._dp/3._dp*Log(MHpm(i1)/ Q)*Alpha/(2._dp*pi)  
End if 
End Do 
Do i1=1,3
If (MFd(i1).gt.Q) Then 
DeltaAlpha=DeltaAlpha-4._dp/9._dp*Log(MFd(i1)/ Q)*Alpha/(2._dp*pi)  
End if 
End Do 
Do i1=1,3
If (MFu(i1).gt.Q) Then 
DeltaAlpha=DeltaAlpha-16._dp/9._dp*Log(MFu(i1)/ Q)*Alpha/(2._dp*pi)  
End if 
End Do 
Do i1=1,3
If (MFe(i1).gt.Q) Then 
DeltaAlpha=DeltaAlpha-4._dp/3._dp*Log(MFe(i1)/ Q)*Alpha/(2._dp*pi)  
End if 
End Do 
Else 
DeltaAlpha=7._dp*Log(Q/mW)
If (MVWLm.gt.Q) Then 
DeltaAlpha=DeltaAlpha+1._dp/3._dp*Log(MVWLm/ Q)
End if 
If (MVWRm.gt.Q) Then 
DeltaAlpha=DeltaAlpha+1._dp/3._dp*Log(MVWRm/ Q)
End if 
Do i1=3,4
If (MHpm(i1).gt.Q) Then 
DeltaAlpha=DeltaAlpha+1._dp/3._dp*Log(MHpm(i1)/ Q) 
End if 
End Do 
Do i1=1,3
If (MFd(i1).gt.Q) Then 
DeltaAlpha=DeltaAlpha+4._dp/9._dp*Log(MFd(i1)/ Q) 
End if 
End Do 
Do i1=1,3
If (MFu(i1).gt.Q) Then 
DeltaAlpha=DeltaAlpha+16._dp/9._dp*Log(MFu(i1)/ Q) 
End if 
End Do 
Do i1=1,3
If (MFe(i1).gt.Q) Then 
DeltaAlpha=DeltaAlpha+4._dp/3._dp*Log(MFe(i1)/ Q) 
End if 
End Do 
DeltaAlpha=Delta_Alpha_Lepton+Delta_Alpha_Hadron& 
    &-alpha*DeltaAlpha/(2._dp*Pi) 
End If 
 
AlphaEwDR=Alpha/(1._dp-DeltaAlpha) 
 
End Function AlphaEwDR 
 
 
Real(dp) Function AlphaSDR(Q,MFd,MFu) 
Real(dp),Intent(in)::Q,MFd(3),MFu(3) 
Integer::i1 
Real(dp)::DeltaAlpha 
DeltaAlpha = 0._dp 
If (rMS.lt.0.5_dp) Then 
DeltaAlpha = 0.5_dp 
End if 
Do i1=1,3
 If (Abs(MFd(i1)/ Q).gt.1._dp) Then 
  DeltaAlpha=DeltaAlpha-2._dp/3._dp*Log(MFd(i1)/ Q) 
 End If 
End Do 
Do i1=1,3
 If (Abs(MFu(i1)/ Q).gt.1._dp) Then 
  DeltaAlpha=DeltaAlpha-2._dp/3._dp*Log(MFu(i1)/ Q) 
 End If 
End Do 
DeltaAlpha=AlphaS_mZ*DeltaAlpha/(2._dp*Pi) 
AlphaSDR=AlphaS_mZ/(1._dp-DeltaAlpha)
 
End Function AlphaSDR 
Real(dp) Function AlphaEW_T(AlphaEW_In, Q,MVWLm,MVWRm,MHpm,MFd,MFu,MFe) 
 
Real(dp),Intent(in)::AlphaEW_In, Q,MVWLm,MVWRm,MHpm(4),MFd(3),MFu(3),MFe(3)
Integer::i1 
Real(dp)::DeltaAlpha 
DeltaAlpha=1._dp/(3._dp)*(1._dp-rMS)! conversion to DRbar if necessary 
DeltaAlpha=DeltaAlpha+1._dp/3._dp*Log(MVWRm/ Q)
Do i1=3,4
DeltaAlpha=DeltaAlpha+1._dp/3._dp*Log(MHpm(i1)/ Q) 
End Do 
DeltaAlpha=-AlphaEW_in*DeltaAlpha/(2._dp*Pi) 
AlphaEW_T=AlphaEW_in/(1._dp-DeltaAlpha) 
 
End Function AlphaEW_T 
 
 
Real(dp) Function DeltaAlphaEW_T(AlphaEW_In, Q,MVWLm,MVWRm,MHpm,MFd,MFu,MFe) 
 
Real(dp),Intent(in)::AlphaEW_In, Q,MVWLm,MVWRm,MHpm(4),MFd(3),MFu(3),MFe(3)
Integer::i1 
Real(dp)::DeltaAlpha 
DeltaAlpha=0._dp
DeltaAlpha=DeltaAlpha+1._dp/3._dp*Log(MVWRm/ Q)
Do i1=3,4
DeltaAlpha=DeltaAlpha+1._dp/3._dp*Log(MHpm(i1)/ Q) 
End Do 
DeltaAlphaEW_T=-AlphaEW_in*DeltaAlpha/(2._dp*Pi) 
End Function DeltaAlphaEW_T 
 
 
Real(dp) Function AlphaS_T(AlphaS_In, Q,MFd,MFu) 
Real(dp),Intent(in):: AlphaS_In, Q,MFd(3),MFu(3) 
Integer::i1 
Real(dp)::DeltaAlpha 
DeltaAlpha=0._dp 
!Conversion to DR bar if necessary 
If (rMS.lt.0.5_dp) Then 
DeltaAlpha=0.5_dp 
End if
Do i1=4,3
DeltaAlpha=DeltaAlpha-2._dp/3._dp*Log(MFd(i1)/ Q) 
End Do 
Do i1=4,3
DeltaAlpha=DeltaAlpha-2._dp/3._dp*Log(MFu(i1)/ Q) 
End Do 
DeltaAlpha=AlphaS_In*DeltaAlpha/(2._dp*Pi) 
   AlphaS_T=AlphaS_In/(1._dp-DeltaAlpha)
 
End Function AlphaS_T



Subroutine DeltaVB(sinW2,sinW2_dr,rho,MAh,MFe,MFv,Mhh,MHpm,MVWLm,MVWRm,               & 
& MVZR,g2,gBL,k1,PhiW,TW,UC,ZER,UP,ZEL,vR,Y,YR,Yt,ZH,ZM,res)

Implicit None 
Real(dp),Intent(in) :: MAh(4),MFe(3),MFv(9),Mhh(4),MHpm(4),MVWLm,MVWRm,MVZR,g2,gBL,k1,PhiW,TW,               & 
& UC(4,4),UP(4,4),vR,ZH(4,4)

Complex(dp),Intent(in) :: ZER(3,3),ZEL(3,3),Y(3,3),YR(3,3),Yt(3,3),ZM(9,9)

Real(dp) :: MAh2(4),MFe2(3),MFv2(9),Mhh2(4),MHpm2(4),MVWLm2,MVWRm2,MVZR2

Complex(dp) :: cplAhcHpmVWLm(4,4),cplAhcVWRmVWLm(4),cplcFeFeAhL(3,3,4),cplcFeFeAhR(3,3,4),           & 
& cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),             & 
& cplcFeFvHpmL(3,9,4),cplcFeFvHpmR(3,9,4),cplcFeFvVWLmL(3,9),cplcFeFvVWLmR(3,9),         & 
& cplcFeFvVWRmL(3,9),cplcFeFvVWRmR(3,9),cplcHpmVWLmVZR(4),cplcVWLmVWLmVZR,               & 
& cplcVWRmVWLmVZR,cplFvFecHpmL(9,3,4),cplFvFecHpmR(9,3,4),cplFvFecVWLmL(9,3),            & 
& cplFvFecVWLmR(9,3),cplFvFecVWRmL(9,3),cplFvFecVWRmR(9,3),cplFvFvAhL(9,9,4),            & 
& cplFvFvAhR(9,9,4),cplFvFvhhL(9,9,4),cplFvFvhhR(9,9,4),cplFvFvVZRL(9,9),cplFvFvVZRR(9,9),& 
& cplhhcHpmVWLm(4,4),cplhhcVWLmVWLm(4),cplhhcVWRmVWLm(4)

Integer :: i1,i2,i3,i4,gt1,gt2,gt3,gt4 
Real(dp), Intent(in) :: sinW2,sinW2_Dr, rho 
Real(dp), Intent(out) :: res 
 
Complex(dp) :: sumI, coup1L,coup1R,coup2L,coup2R,coup3L,coup3R,coup3, coup4L,coup4R, teil 
Complex(dp) :: D27m2, D0m2, vertex, phase 
Real(dp) :: cosW2, cosW2_Dr, chargefactor 
Iname = Iname+1
NameOfUnit(Iname) = "DeltaVB" 
MAh2 = MAh**2 
MFe2 = MFe**2 
MFv2 = MFv**2 
Mhh2 = Mhh**2 
MHpm2 = MHpm**2 
MVWLm2 = MVWLm**2 
MVWRm2 = MVWRm**2 
MVZR2 = MVZR**2 

 
 ! Fix neutrino phases 
 
cplcFeFeAhL = 0._dp 
cplcFeFeAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFeFeAhT(gt1,gt2,gt3,Y,Yt,UP,ZEL,ZER,cplcFeFeAhL(gt1,gt2,gt3)            & 
& ,cplcFeFeAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvAhL = 0._dp 
cplFvFvAhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 4
Call CouplingFvFvAhT(gt1,gt2,gt3,Y,Yt,YR,UP,ZM,cplFvFvAhL(gt1,gt2,gt3),               & 
& cplFvFvAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhcHpmVWLm = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
Call CouplingAhcHpmVWLmT(gt1,gt2,g2,UP,UC,PhiW,cplAhcHpmVWLm(gt1,gt2))

 End Do 
End Do 


cplAhcVWRmVWLm = 0._dp 
Do gt1 = 1, 4
Call CouplingAhcVWRmVWLmT(gt1,g2,k1,UP,cplAhcVWRmVWLm(gt1))

End Do 


cplFvFecHpmL = 0._dp 
cplFvFecHpmR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingFvFecHpmT(gt1,gt2,gt3,Y,Yt,YR,UC,ZEL,ZER,ZM,cplFvFecHpmL(gt1,gt2,gt3)    & 
& ,cplFvFecHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFecVWLmL = 0._dp 
cplFvFecVWLmR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
Call CouplingFvFecVWLmT(gt1,gt2,g2,ZEL,ZER,ZM,PhiW,cplFvFecVWLmL(gt1,gt2)             & 
& ,cplFvFecVWLmR(gt1,gt2))

 End Do 
End Do 


cplFvFecVWRmL = 0._dp 
cplFvFecVWRmR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 3
Call CouplingFvFecVWRmT(gt1,gt2,g2,ZEL,ZER,ZM,PhiW,cplFvFecVWRmL(gt1,gt2)             & 
& ,cplFvFecVWRmR(gt1,gt2))

 End Do 
End Do 


cplcFeFehhL = 0._dp 
cplcFeFehhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFeFehhT(gt1,gt2,gt3,Y,Yt,ZH,ZEL,ZER,cplcFeFehhL(gt1,gt2,gt3)            & 
& ,cplcFeFehhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFeVZRL = 0._dp 
cplcFeFeVZRR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZRT(gt1,gt2,gBL,g2,TW,cplcFeFeVZRL(gt1,gt2),cplcFeFeVZRR(gt1,gt2))

 End Do 
End Do 


cplFvFvhhL = 0._dp 
cplFvFvhhR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
  Do gt3 = 1, 4
Call CouplingFvFvhhT(gt1,gt2,gt3,Y,Yt,YR,ZH,ZM,cplFvFvhhL(gt1,gt2,gt3),               & 
& cplFvFvhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplFvFvVZRL = 0._dp 
cplFvFvVZRR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingFvFvVZRT(gt1,gt2,gBL,g2,ZM,TW,cplFvFvVZRL(gt1,gt2),cplFvFvVZRR(gt1,gt2))

 End Do 
End Do 


cplcFeFvHpmL = 0._dp 
cplcFeFvHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
  Do gt3 = 1, 4
Call CouplingcFeFvHpmT(gt1,gt2,gt3,Y,Yt,YR,UC,ZEL,ZER,ZM,cplcFeFvHpmL(gt1,gt2,gt3)    & 
& ,cplcFeFvHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFeFvVWLmL = 0._dp 
cplcFeFvVWLmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
Call CouplingcFeFvVWLmT(gt1,gt2,g2,ZEL,ZER,ZM,PhiW,cplcFeFvVWLmL(gt1,gt2)             & 
& ,cplcFeFvVWLmR(gt1,gt2))

 End Do 
End Do 


cplcFeFvVWRmL = 0._dp 
cplcFeFvVWRmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 9
Call CouplingcFeFvVWRmT(gt1,gt2,g2,ZEL,ZER,ZM,PhiW,cplcFeFvVWRmL(gt1,gt2)             & 
& ,cplcFeFvVWRmR(gt1,gt2))

 End Do 
End Do 


cplhhcHpmVWLm = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
Call CouplinghhcHpmVWLmT(gt1,gt2,g2,ZH,UC,PhiW,cplhhcHpmVWLm(gt1,gt2))

 End Do 
End Do 


cplhhcVWLmVWLm = 0._dp 
Do gt1 = 1, 4
Call CouplinghhcVWLmVWLmT(gt1,g2,k1,vR,ZH,PhiW,cplhhcVWLmVWLm(gt1))

End Do 


cplhhcVWRmVWLm = 0._dp 
Do gt1 = 1, 4
Call CouplinghhcVWRmVWLmT(gt1,g2,k1,vR,ZH,PhiW,cplhhcVWRmVWLm(gt1))

End Do 


cplcHpmVWLmVZR = 0._dp 
Do gt1 = 1, 4
Call CouplingcHpmVWLmVZRT(gt1,gBL,g2,k1,vR,UC,TW,PhiW,cplcHpmVWLmVZR(gt1))

End Do 


cplcVWLmVWLmVZR = 0._dp 
Call CouplingcVWLmVWLmVZRT(g2,TW,PhiW,cplcVWLmVWLmVZR)



cplcVWRmVWLmVZR = 0._dp 
Call CouplingcVWRmVWLmVZRT(g2,TW,PhiW,cplcVWRmVWLmVZR)



!-------------------------- 
!SM Contributions 
!-------------------------- 
cosW2 = 1._dp - sinW2 
cosW2_DR = 1._dp - sinW2_DR 
sumI = 6._dp & 
  & + Log(cosW2)*(3.5_dp - 2.5_dp *sinW2   & 
  & - sinW2_DR*(5._dp - 1.5_dp*cosW2/cosW2_DR))/sinW2   
res = sumI*g2**2*rho 
 
 
If (IncludeBSMdeltaVB) Then 
!-------------------------- 
!BSM  Contributions 
!-------------------------- 
teil = 0._dp 
 
Do gt1=1,9 
 Do gt2=1,9 
sumI = 0._dp 
 
If (mf_l2(2).gt. 0.5_dp*MFv2(gt2)) Then 
chargefactor = 1 
Do i1=1,4
  Do i2=1,9
If ((MAh2(i1).gt.mf_l2(2)).Or.(MFv2(i2).gt.mf_l2(2))) Then
coup1L = cplFvFvAhL(gt1,i2,i1)
coup1R = cplFvFvAhR(gt1,i2,i1)
coup2R = Conjg(cplFvFvAhL(gt2,i2,i1))
coup2L = Conjg(cplFvFvAhR(gt2,i2,i1))
sumI = sumI + chargefactor*0.5_dp*coup1L*coup2R*B1(0._dp,MFv2(i2),MAh2(i1))  
End if 
   End Do
  End Do




chargefactor = 1 
Do i1=1,3
  Do i2=1,4
If ((MFe2(i1).gt.mf_l2(2)).Or.(MHpm2(i2).gt.mf_l2(2))) Then
coup1L = cplFvFecHpmL(gt1,i1,i2)
coup1R = cplFvFecHpmR(gt1,i1,i2)
coup2R = Conjg(cplFvFecHpmL(gt2,i1,i2))
coup2L = Conjg(cplFvFecHpmR(gt2,i1,i2))
sumI = sumI + chargefactor*0.5_dp*coup1L*coup2R*B1(0._dp,MFe2(i1),MHpm2(i2))  
End if 
   End Do
  End Do




chargefactor = 1 
Do i1=1,3
If ((MFe2(i1).gt.mf_l2(2)).Or.(MVWRm2.gt.mf_l2(2))) Then
coup1L = cplFvFecVWRmL(gt1,i1)
coup1R = cplFvFecVWRmR(gt1,i1)
coup2L = Conjg(cplFvFecVWRmL(gt2,i1))
coup2R = Conjg(cplFvFecVWRmR(gt2,i1))
End if 
   End Do




chargefactor = 1 
Do i1=1,9
  Do i2=1,4
If ((MFv2(i1).gt.mf_l2(2)).Or.(Mhh2(i2).gt.mf_l2(2))) Then
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2R = Conjg(cplFvFvhhL(gt2,i1,i2))
coup2L = Conjg(cplFvFvhhR(gt2,i1,i2))
sumI = sumI + chargefactor*0.5_dp*coup1L*coup2R*B1(0._dp,MFv2(i1),Mhh2(i2))  
End if 
   End Do
  End Do




chargefactor = 1 
Do i1=1,9
If ((MFv2(i1).gt.mf_l2(2)).Or.(MVZR2.gt.mf_l2(2))) Then
coup1L = cplFvFvVZRL(gt1,i1)
coup1R = cplFvFvVZRR(gt1,i1)
coup2L = Conjg(cplFvFvVZRL(gt2,i1))
coup2R = Conjg(cplFvFvVZRR(gt2,i1))
End if 
   End Do




chargefactor = 1 
Do i1=1,4
  Do i2=1,3
If ((MHpm2(i1).gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2))) Then
coup1L = cplcFeFvHpmL(i2,gt1,i1)
coup1R = cplcFeFvHpmR(i2,gt1,i1)
coup2R = Conjg(cplcFeFvHpmL(i2,gt2,i1))
coup2L = Conjg(cplcFeFvHpmR(i2,gt2,i1))
sumI = sumI + chargefactor*0.5_dp*coup1L*coup2R*B1(0._dp,MFe2(i2),MHpm2(i1))  
End if 
   End Do
  End Do




chargefactor = 1 
  Do i2=1,3
If ((MVWRm2.gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2))) Then
coup1L = cplcFeFvVWRmL(i2,gt1)
coup1R = cplcFeFvVWRmR(i2,gt1)
coup2L = Conjg(cplcFeFvVWRmL(i2,gt2))
coup2R = Conjg(cplcFeFvVWRmR(i2,gt2))
End if 
  End Do




res = res + sumI*(Kronecker(gt2,1)+Kronecker(gt2,2)) 
End if 
End Do 
 
End Do 
 
Do gt1=1,2 
Do  gt2=1,3 
sumI = 0._dp 
 
chargefactor = 1 
Do i1=1,4
  Do i2=1,3
If ((MAh2(i1).gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2))) Then
coup1L = cplcFeFeAhL(i2,gt1,i1)
coup1R = cplcFeFeAhR(i2,gt1,i1)
coup2R = Conjg(cplcFeFeAhL(i2,gt2,i1))
coup2L = Conjg(cplcFeFeAhR(i2,gt2,i1))
sumI = sumI + chargefactor*0.5_dp*coup1L*coup2R*B1(0._dp,MFe2(i2),MAh2(i1))  
End if 
   End Do
  End Do




chargefactor = 1 
Do i1=1,9
  Do i2=1,4
If ((MFv2(i1).gt.mf_l2(2)).Or.(MHpm2(i2).gt.mf_l2(2))) Then
coup1L = cplFvFecHpmL(i1,gt1,i2)
coup1R = cplFvFecHpmR(i1,gt1,i2)
coup2R = Conjg(cplFvFecHpmL(i1,gt2,i2))
coup2L = Conjg(cplFvFecHpmR(i1,gt2,i2))
sumI = sumI + chargefactor*0.5_dp*coup1L*coup2R*B1(0._dp,MFv2(i1),MHpm2(i2))  
End if 
   End Do
  End Do




chargefactor = 1 
Do i1=1,9
If ((MFv2(i1).gt.mf_l2(2)).Or.(MVWRm2.gt.mf_l2(2))) Then
coup1L = cplFvFecVWRmL(i1,gt1)
coup1R = cplFvFecVWRmR(i1,gt1)
coup2L = Conjg(cplFvFecVWRmL(i1,gt2))
coup2R = Conjg(cplFvFecVWRmR(i1,gt2))
End if 
   End Do




chargefactor = 1 
Do i1=1,4
  Do i2=1,3
If ((Mhh2(i1).gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2))) Then
coup1L = cplcFeFehhL(i2,gt1,i1)
coup1R = cplcFeFehhR(i2,gt1,i1)
coup2R = Conjg(cplcFeFehhL(i2,gt2,i1))
coup2L = Conjg(cplcFeFehhR(i2,gt2,i1))
sumI = sumI + chargefactor*0.5_dp*coup1L*coup2R*B1(0._dp,MFe2(i2),Mhh2(i1))  
End if 
   End Do
  End Do




chargefactor = 1 
  Do i2=1,3
If ((MVZR2.gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2))) Then
coup1L = cplcFeFeVZRL(i2,gt1)
coup1R = cplcFeFeVZRR(i2,gt1)
coup2L = Conjg(cplcFeFeVZRL(i2,gt2))
coup2R = Conjg(cplcFeFeVZRR(i2,gt2))
End if 
  End Do




res = res + sumI 
End Do 
 
End Do 
 
vertex = 0._dp 
 
Do gt1=1,9 
 Do gt2=1,2 
chargefactor = 1 
Do i1= 1,4
  Do i2= 1,9
   Do i3= 1,3
  If ((MAh2(i1).gt.mf_l2(2)).Or.(MFv2(i2).gt.mf_l2(2)).Or.(MFe2(i3).gt.mf_l2(2))) Then
coup1L = cplFvFvAhL(gt1,i2,i1)
coup1R = cplFvFvAhR(gt1,i2,i1)
coup2L = cplcFeFeAhL(gt2,i3,i1)
coup2R = cplcFeFeAhR(gt2,i3,i1)
coup3L = -cplcFeFvVWLmR(i3,i2)
coup3R = -cplcFeFvVWLmL(i3,i2)
vertex = vertex + chargefactor*(coup1L*coup2R*(-sqrt2*coup3R*MFv(i2)*MFe(i3)& 
& *C0_3m(MAh2(i1),MFv2(i2),MFe2(i3)) + oosqrt2*coup3L* & 
& (B0(0._dp,MFv2(i2),MFe2(i3))-0.5_dp +MAh2(i1)*C0_3m(MAh2(i1),MFv2(i2),MFe2(i3))))) 
End if 
   End Do
  End Do
End Do


chargefactor = 1 
Do i1= 1,9
  Do i2= 1,4
   Do i3= 1,4
  If ((MFv2(i1).gt.mf_l2(2)).Or.(MAh2(i2).gt.mf_l2(2)).Or.(MHpm2(i3).gt.mf_l2(2))) Then
coup1L = cplFvFvAhL(gt1,i1,i2)
coup1R = cplFvFvAhR(gt1,i1,i2)
coup2L = cplcFeFvHpmL(gt2,i1,i3)
coup2R = cplcFeFvHpmR(gt2,i1,i3)
coup3 = cplAhcHpmVWLm(i2,i3)
vertex = vertex + chargefactor*(0.5_dp*sqrt2*coup1L*coup2R*coup3*(MFv2(i1)*C0_3m(MFv2(i1),MAh2(i2),MHpm2(i3)) + B0(0._dp,MAh2(i2),MHpm2(i3)) +0.5_dp)) 
End if 
   End Do
  End Do
End Do


chargefactor = 1 
Do i1= 1,9
  Do i2= 1,4
   Do i3= 1,4
  If ((MFv2(i1).gt.mf_l2(2)).Or.(Mhh2(i2).gt.mf_l2(2)).Or.(MHpm2(i3).gt.mf_l2(2))) Then
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = cplcFeFvHpmL(gt2,i1,i3)
coup2R = cplcFeFvHpmR(gt2,i1,i3)
coup3 = cplhhcHpmVWLm(i2,i3)
vertex = vertex + chargefactor*(0.5_dp*sqrt2*coup1L*coup2R*coup3*(MFv2(i1)*C0_3m(MFv2(i1),Mhh2(i2),MHpm2(i3)) + B0(0._dp,Mhh2(i2),MHpm2(i3)) +0.5_dp)) 
End if 
   End Do
  End Do
End Do


chargefactor = 1 
Do i1= 1,9
  i2= 1
   Do i3= 1,4
  If ((MFv2(i1).gt.mf_l2(2)).Or.(MVZR2.gt.mf_l2(2)).Or.(MHpm2(i3).gt.mf_l2(2))) Then
coup1L = cplFvFvVZRL(gt1,i1)
coup1R = cplFvFvVZRR(gt1,i1)
coup2L = cplcFeFvHpmL(gt2,i1,i3)
coup2R = cplcFeFvHpmR(gt2,i1,i3)
coup3 = cplcHpmVWLmVZR(i3)
End if 
   End Do
End Do


chargefactor = 1 
Do i1= 1,9
  Do i2= 1,4
  If ((MFv2(i1).gt.mf_l2(2)).Or.(Mhh2(i2).gt.mf_l2(2)).Or.(MVWLm2.gt.mf_l2(2))) Then
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = cplcFeFvVWLmL(gt2,i1)
coup2R = cplcFeFvVWLmR(gt2,i1)
coup3 = cplhhcVWLmVWLm(i2)
End if 
   End Do
  End Do


chargefactor = 1 
Do i1= 1,9
  i2= 1
  If ((MFv2(i1).gt.mf_l2(2)).Or.(MVZR2.gt.mf_l2(2)).Or.(MVWLm2.gt.mf_l2(2))) Then
coup1L = cplFvFvVZRL(gt1,i1)
coup1R = cplFvFvVZRR(gt1,i1)
coup2L = cplcFeFvVWLmL(gt2,i1)
coup2R = cplcFeFvVWLmR(gt2,i1)
coup3 = -cplcVWLmVWLmVZR
End if 
   End Do


chargefactor = 1 
Do i1= 1,9
  Do i2= 1,4
  If ((MFv2(i1).gt.mf_l2(2)).Or.(MAh2(i2).gt.mf_l2(2)).Or.(MVWRm2.gt.mf_l2(2))) Then
coup1L = cplFvFvAhL(gt1,i1,i2)
coup1R = cplFvFvAhR(gt1,i1,i2)
coup2L = cplcFeFvVWRmL(gt2,i1)
coup2R = cplcFeFvVWRmR(gt2,i1)
coup3 = cplAhcVWRmVWLm(i2)
End if 
   End Do
  End Do


chargefactor = 1 
Do i1= 1,9
  Do i2= 1,4
  If ((MFv2(i1).gt.mf_l2(2)).Or.(Mhh2(i2).gt.mf_l2(2)).Or.(MVWRm2.gt.mf_l2(2))) Then
coup1L = cplFvFvhhL(gt1,i1,i2)
coup1R = cplFvFvhhR(gt1,i1,i2)
coup2L = cplcFeFvVWRmL(gt2,i1)
coup2R = cplcFeFvVWRmR(gt2,i1)
coup3 = cplhhcVWRmVWLm(i2)
End if 
   End Do
  End Do


chargefactor = 1 
Do i1= 1,9
  i2= 1
  If ((MFv2(i1).gt.mf_l2(2)).Or.(MVZR2.gt.mf_l2(2)).Or.(MVWRm2.gt.mf_l2(2))) Then
coup1L = cplFvFvVZRL(gt1,i1)
coup1R = cplFvFvVZRR(gt1,i1)
coup2L = cplcFeFvVWRmL(gt2,i1)
coup2R = cplcFeFvVWRmR(gt2,i1)
coup3 = -cplcVWRmVWLmVZR
End if 
   End Do


chargefactor = 1 
Do i1= 1,4
  Do i2= 1,9
   Do i3= 1,3
  If ((Mhh2(i1).gt.mf_l2(2)).Or.(MFv2(i2).gt.mf_l2(2)).Or.(MFe2(i3).gt.mf_l2(2))) Then
coup1L = cplFvFvhhL(gt1,i2,i1)
coup1R = cplFvFvhhR(gt1,i2,i1)
coup2L = cplcFeFehhL(gt2,i3,i1)
coup2R = cplcFeFehhR(gt2,i3,i1)
coup3L = -cplcFeFvVWLmR(i3,i2)
coup3R = -cplcFeFvVWLmL(i3,i2)
vertex = vertex + chargefactor*(coup1L*coup2R*(-sqrt2*coup3R*MFv(i2)*MFe(i3)& 
& *C0_3m(Mhh2(i1),MFv2(i2),MFe2(i3)) + oosqrt2*coup3L* & 
& (B0(0._dp,MFv2(i2),MFe2(i3))-0.5_dp +Mhh2(i1)*C0_3m(Mhh2(i1),MFv2(i2),MFe2(i3))))) 
End if 
   End Do
  End Do
End Do


chargefactor = 1 
  Do i2= 1,9
   Do i3= 1,3
  If ((MVZR2.gt.mf_l2(2)).Or.(MFv2(i2).gt.mf_l2(2)).Or.(MFe2(i3).gt.mf_l2(2))) Then
coup1L = cplFvFvVZRL(gt1,i2)
coup1R = cplFvFvVZRR(gt1,i2)
coup2L = cplcFeFeVZRL(gt2,i3)
coup2R = cplcFeFeVZRR(gt2,i3)
coup3L = -cplcFeFvVWLmR(i3,i2)
coup3R = -cplcFeFvVWLmL(i3,i2)
End if 
  End Do
End Do


chargefactor = 1 
Do i1= 1,3
  Do i2= 1,4
   Do i3= 1,4
  If ((MFe2(i1).gt.mf_l2(2)).Or.(MHpm2(i2).gt.mf_l2(2)).Or.(MAh2(i3).gt.mf_l2(2))) Then
coup1L = cplcFeFvHpmL(i1,gt1,i2)
coup1R = cplcFeFvHpmR(i1,gt1,i2)
coup2L = cplcFeFeAhL(gt2,i1,i3)
coup2R = cplcFeFeAhR(gt2,i1,i3)
coup3 = -cplAhcHpmVWLm(i3,i2)
vertex = vertex + chargefactor*(0.5_dp*sqrt2*coup1L*coup2R*coup3*(MFe2(i1)*C0_3m(MFe2(i1),MHpm2(i2),MAh2(i3)) + B0(0._dp,MHpm2(i2),MAh2(i3)) +0.5_dp)) 
End if 
   End Do
  End Do
End Do


chargefactor = 1 
Do i1= 1,3
  i2= 1
   Do i3= 1,4
  If ((MFe2(i1).gt.mf_l2(2)).Or.(MVWRm2.gt.mf_l2(2)).Or.(MAh2(i3).gt.mf_l2(2))) Then
coup1L = cplcFeFvVWRmL(i1,gt1)
coup1R = cplcFeFvVWRmR(i1,gt1)
coup2L = cplcFeFeAhL(gt2,i1,i3)
coup2R = cplcFeFeAhR(gt2,i1,i3)
coup3 = cplAhcVWRmVWLm(i3)
End if 
   End Do
End Do


chargefactor = 1 
Do i1= 1,3
  Do i2= 1,4
   Do i3= 1,4
  If ((MFe2(i1).gt.mf_l2(2)).Or.(MHpm2(i2).gt.mf_l2(2)).Or.(Mhh2(i3).gt.mf_l2(2))) Then
coup1L = cplcFeFvHpmL(i1,gt1,i2)
coup1R = cplcFeFvHpmR(i1,gt1,i2)
coup2L = cplcFeFehhL(gt2,i1,i3)
coup2R = cplcFeFehhR(gt2,i1,i3)
coup3 = -cplhhcHpmVWLm(i3,i2)
vertex = vertex + chargefactor*(0.5_dp*sqrt2*coup1L*coup2R*coup3*(MFe2(i1)*C0_3m(MFe2(i1),MHpm2(i2),Mhh2(i3)) + B0(0._dp,MHpm2(i2),Mhh2(i3)) +0.5_dp)) 
End if 
   End Do
  End Do
End Do


chargefactor = 1 
Do i1= 1,3
  i2= 1
   Do i3= 1,4
  If ((MFe2(i1).gt.mf_l2(2)).Or.(MVWLm2.gt.mf_l2(2)).Or.(Mhh2(i3).gt.mf_l2(2))) Then
coup1L = cplcFeFvVWLmL(i1,gt1)
coup1R = cplcFeFvVWLmR(i1,gt1)
coup2L = cplcFeFehhL(gt2,i1,i3)
coup2R = cplcFeFehhR(gt2,i1,i3)
coup3 = cplhhcVWLmVWLm(i3)
End if 
   End Do
End Do


chargefactor = 1 
Do i1= 1,3
  i2= 1
   Do i3= 1,4
  If ((MFe2(i1).gt.mf_l2(2)).Or.(MVWRm2.gt.mf_l2(2)).Or.(Mhh2(i3).gt.mf_l2(2))) Then
coup1L = cplcFeFvVWRmL(i1,gt1)
coup1R = cplcFeFvVWRmR(i1,gt1)
coup2L = cplcFeFehhL(gt2,i1,i3)
coup2R = cplcFeFehhR(gt2,i1,i3)
coup3 = cplhhcVWRmVWLm(i3)
End if 
   End Do
End Do


chargefactor = 1 
Do i1= 1,3
  Do i2= 1,4
  If ((MFe2(i1).gt.mf_l2(2)).Or.(MHpm2(i2).gt.mf_l2(2)).Or.(MVZR2.gt.mf_l2(2))) Then
coup1L = cplcFeFvHpmL(i1,gt1,i2)
coup1R = cplcFeFvHpmR(i1,gt1,i2)
coup2L = cplcFeFeVZRL(gt2,i1)
coup2R = cplcFeFeVZRR(gt2,i1)
coup3 = cplcHpmVWLmVZR(i2)
End if 
   End Do
  End Do


chargefactor = 1 
Do i1= 1,3
  i2= 1
  If ((MFe2(i1).gt.mf_l2(2)).Or.(MVWLm2.gt.mf_l2(2)).Or.(MVZR2.gt.mf_l2(2))) Then
coup1L = cplcFeFvVWLmL(i1,gt1)
coup1R = cplcFeFvVWLmR(i1,gt1)
coup2L = cplcFeFeVZRL(gt2,i1)
coup2R = cplcFeFeVZRR(gt2,i1)
coup3 = cplcVWLmVWLmVZR
End if 
   End Do


chargefactor = 1 
Do i1= 1,3
  i2= 1
  If ((MFe2(i1).gt.mf_l2(2)).Or.(MVWRm2.gt.mf_l2(2)).Or.(MVZR2.gt.mf_l2(2))) Then
coup1L = cplcFeFvVWRmL(i1,gt1)
coup1R = cplcFeFvVWRmR(i1,gt1)
coup2L = cplcFeFeVZRL(gt2,i1)
coup2R = cplcFeFeVZRR(gt2,i1)
coup3 = cplcVWRmVWLmVZR
End if 
   End Do


chargefactor = 1 
Do i1= 1,4
  Do i2= 1,3
   Do i3= 1,9
  If ((MHpm2(i1).gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2)).Or.(MFv2(i3).gt.mf_l2(2))) Then
coup1L = cplFvFecHpmL(gt1,i2,i1)
coup1R = cplFvFecHpmR(gt1,i2,i1)
coup2L = cplcFeFvHpmL(gt2,i3,i1)
coup2R = cplcFeFvHpmR(gt2,i3,i1)
coup3L = cplcFeFvVWLmL(i2,i3)
coup3R = cplcFeFvVWLmR(i2,i3)
vertex = vertex + chargefactor*(coup1L*coup2R*(-sqrt2*coup3R*MFe(i2)*MFv(i3)& 
& *C0_3m(MHpm2(i1),MFe2(i2),MFv2(i3)) + oosqrt2*coup3L* & 
& (B0(0._dp,MFe2(i2),MFv2(i3))-0.5_dp +MHpm2(i1)*C0_3m(MHpm2(i1),MFe2(i2),MFv2(i3))))) 
End if 
   End Do
  End Do
End Do


chargefactor = 1 
  Do i2= 1,3
   Do i3= 1,9
  If ((MVWLm2.gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2)).Or.(MFv2(i3).gt.mf_l2(2))) Then
coup1L = cplFvFecVWLmL(gt1,i2)
coup1R = cplFvFecVWLmR(gt1,i2)
coup2L = cplcFeFvVWLmL(gt2,i3)
coup2R = cplcFeFvVWLmR(gt2,i3)
coup3L = cplcFeFvVWLmL(i2,i3)
coup3R = cplcFeFvVWLmR(i2,i3)
End if 
  End Do
End Do


chargefactor = 1 
  Do i2= 1,3
   Do i3= 1,9
  If ((MVWRm2.gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2)).Or.(MFv2(i3).gt.mf_l2(2))) Then
coup1L = cplFvFecVWRmL(gt1,i2)
coup1R = cplFvFecVWRmR(gt1,i2)
coup2L = cplcFeFvVWRmL(gt2,i3)
coup2R = cplcFeFvVWRmR(gt2,i3)
coup3L = cplcFeFvVWLmL(i2,i3)
coup3R = cplcFeFvVWLmR(i2,i3)
End if 
  End Do
End Do


 End Do 
 
End Do 
 
res = res + vertex/g2 
Do gt1=1,9 
 Do gt2=1,9 
gt3 = 2 
gt4 = 1 
! Fe,Hpm,Fv,Hpm
chargefactor = 1 
Do i1=1,3
  Do i2=1,4
    Do i3=1,9
      Do i4=1,4
If ((MFe2(i1).gt.mf_l2(2)).Or.(MHpm2(i2).gt.mf_l2(2)).Or.(MFv2(i3).gt.mf_l2(2)).Or.(MHpm2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFecHpmL(gt1,i1,i4)
coup1R = cplFvFecHpmR(gt1,i1,i4)
coup2L = cplcFeFvHpmL(i1,gt2,i2)
coup2R = cplcFeFvHpmR(i1,gt2,i2)
coup3L = cplFvFecHpmL(i3,gt3,i2)
coup3R = cplFvFecHpmR(i3,gt3,i2)
coup4L = cplcFeFvHpmL(gt4,i3,i4)
coup4R = cplcFeFvHpmR(gt4,i3,i4)
D27m2 = D27_Bagger(MHpm2(i2),MHpm2(i4),MFe2(i1),MFv2(i3))
If(Real(D27m2,dp).eq.Real(D27m2,dp)) Then 
teil = teil + D27m2*chargefactor*coup1L*coup2R*coup3L*coup4R 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


 ! Fe,Hpm,Fv,VWRm
chargefactor = 1 
Do i1=1,3
  Do i2=1,4
    Do i3=1,9
If ((MFe2(i1).gt.mf_l2(2)).Or.(MHpm2(i2).gt.mf_l2(2)).Or.(MFv2(i3).gt.mf_l2(2)).Or.(MVWRm2.gt.mf_l2(2))) Then
coup1L = cplFvFecVWRmL(gt1,i1)
coup1R = cplFvFecVWRmR(gt1,i1)
coup2L = cplcFeFvHpmL(i1,gt2,i2)
coup2R = cplcFeFvHpmR(i1,gt2,i2)
coup3L = cplFvFecHpmL(i3,gt3,i2)
coup3R = cplFvFecHpmR(i3,gt3,i2)
coup4L = cplcFeFvVWRmL(gt4,i3)
coup4R = cplcFeFvVWRmR(gt4,i3)
End if 
    End Do 
   End Do 
  End Do 


 ! Fe,VWRm,Fv,Hpm
chargefactor = 1 
Do i1=1,3
    Do i3=1,9
      Do i4=1,4
If ((MFe2(i1).gt.mf_l2(2)).Or.(MVWRm2.gt.mf_l2(2)).Or.(MFv2(i3).gt.mf_l2(2)).Or.(MHpm2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFecHpmL(gt1,i1,i4)
coup1R = cplFvFecHpmR(gt1,i1,i4)
coup2L = cplcFeFvVWRmL(i1,gt2)
coup2R = cplcFeFvVWRmR(i1,gt2)
coup3L = cplFvFecVWRmL(i3,gt3)
coup3R = cplFvFecVWRmR(i3,gt3)
coup4L = cplcFeFvHpmL(gt4,i3,i4)
coup4R = cplcFeFvHpmR(gt4,i3,i4)
End if 
    End Do 
  End Do 
End Do 


 ! Fe,VWRm,Fv,VWRm
chargefactor = 1 
Do i1=1,3
    Do i3=1,9
If ((MFe2(i1).gt.mf_l2(2)).Or.(MVWRm2.gt.mf_l2(2)).Or.(MFv2(i3).gt.mf_l2(2)).Or.(MVWRm2.gt.mf_l2(2))) Then
coup1L = cplFvFecVWRmL(gt1,i1)
coup1R = cplFvFecVWRmR(gt1,i1)
coup2L = cplcFeFvVWRmL(i1,gt2)
coup2R = cplcFeFvVWRmR(i1,gt2)
coup3L = cplFvFecVWRmL(i3,gt3)
coup3R = cplFvFecVWRmR(i3,gt3)
coup4L = cplcFeFvVWRmL(gt4,i3)
coup4R = cplcFeFvVWRmR(gt4,i3)
End if 
    End Do 
  End Do 


 ! Fv,Ah,bar[Fe],Ah
chargefactor = 1 
Do i1=1,9
  Do i2=1,4
    Do i3=1,3
      Do i4=1,4
If ((MFv2(i1).gt.mf_l2(2)).Or.(MAh2(i2).gt.mf_l2(2)).Or.(MFe2(i3).gt.mf_l2(2)).Or.(MAh2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFvAhL(gt1,i1,i4)
coup1R = cplFvFvAhR(gt1,i1,i4)
coup2L = cplFvFvAhL(gt2,i1,i2)
coup2R = cplFvFvAhR(gt2,i1,i2)
coup3L = cplcFeFeAhL(i3,gt3,i2)
coup3R = cplcFeFeAhR(i3,gt3,i2)
coup4L = cplcFeFeAhL(gt4,i3,i4)
coup4R = cplcFeFeAhR(gt4,i3,i4)
D27m2 = D27_Bagger(MAh2(i2),MAh2(i4),MFv2(i1),MFe2(i3))
If(Real(D27m2,dp).eq.Real(D27m2,dp)) Then 
teil = teil + D27m2*chargefactor*coup1L*coup2R*coup3L*coup4R 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


 ! Fv,Ah,bar[Fe],hh
chargefactor = 1 
Do i1=1,9
  Do i2=1,4
    Do i3=1,3
      Do i4=1,4
If ((MFv2(i1).gt.mf_l2(2)).Or.(MAh2(i2).gt.mf_l2(2)).Or.(MFe2(i3).gt.mf_l2(2)).Or.(Mhh2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFvhhL(gt1,i1,i4)
coup1R = cplFvFvhhR(gt1,i1,i4)
coup2L = cplFvFvAhL(gt2,i1,i2)
coup2R = cplFvFvAhR(gt2,i1,i2)
coup3L = cplcFeFeAhL(i3,gt3,i2)
coup3R = cplcFeFeAhR(i3,gt3,i2)
coup4L = cplcFeFehhL(gt4,i3,i4)
coup4R = cplcFeFehhR(gt4,i3,i4)
D27m2 = D27_Bagger(MAh2(i2),Mhh2(i4),MFv2(i1),MFe2(i3))
If(Real(D27m2,dp).eq.Real(D27m2,dp)) Then 
teil = teil + D27m2*chargefactor*coup1L*coup2R*coup3L*coup4R 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


 ! Fv,Ah,bar[Fe],VZR
chargefactor = 1 
Do i1=1,9
  Do i2=1,4
    Do i3=1,3
If ((MFv2(i1).gt.mf_l2(2)).Or.(MAh2(i2).gt.mf_l2(2)).Or.(MFe2(i3).gt.mf_l2(2)).Or.(MVZR2.gt.mf_l2(2))) Then
coup1L = cplFvFvVZRL(gt1,i1)
coup1R = cplFvFvVZRR(gt1,i1)
coup2L = cplFvFvAhL(gt2,i1,i2)
coup2R = cplFvFvAhR(gt2,i1,i2)
coup3L = cplcFeFeAhL(i3,gt3,i2)
coup3R = cplcFeFeAhR(i3,gt3,i2)
coup4L = cplcFeFeVZRL(gt4,i3)
coup4R = cplcFeFeVZRR(gt4,i3)
End if 
    End Do 
   End Do 
  End Do 


 ! Fv,hh,bar[Fe],Ah
chargefactor = 1 
Do i1=1,9
  Do i2=1,4
    Do i3=1,3
      Do i4=1,4
If ((MFv2(i1).gt.mf_l2(2)).Or.(Mhh2(i2).gt.mf_l2(2)).Or.(MFe2(i3).gt.mf_l2(2)).Or.(MAh2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFvAhL(gt1,i1,i4)
coup1R = cplFvFvAhR(gt1,i1,i4)
coup2L = cplFvFvhhL(gt2,i1,i2)
coup2R = cplFvFvhhR(gt2,i1,i2)
coup3L = cplcFeFehhL(i3,gt3,i2)
coup3R = cplcFeFehhR(i3,gt3,i2)
coup4L = cplcFeFeAhL(gt4,i3,i4)
coup4R = cplcFeFeAhR(gt4,i3,i4)
D27m2 = D27_Bagger(Mhh2(i2),MAh2(i4),MFv2(i1),MFe2(i3))
If(Real(D27m2,dp).eq.Real(D27m2,dp)) Then 
teil = teil + D27m2*chargefactor*coup1L*coup2R*coup3L*coup4R 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


 ! Fv,hh,bar[Fe],hh
chargefactor = 1 
Do i1=1,9
  Do i2=1,4
    Do i3=1,3
      Do i4=1,4
If ((MFv2(i1).gt.mf_l2(2)).Or.(Mhh2(i2).gt.mf_l2(2)).Or.(MFe2(i3).gt.mf_l2(2)).Or.(Mhh2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFvhhL(gt1,i1,i4)
coup1R = cplFvFvhhR(gt1,i1,i4)
coup2L = cplFvFvhhL(gt2,i1,i2)
coup2R = cplFvFvhhR(gt2,i1,i2)
coup3L = cplcFeFehhL(i3,gt3,i2)
coup3R = cplcFeFehhR(i3,gt3,i2)
coup4L = cplcFeFehhL(gt4,i3,i4)
coup4R = cplcFeFehhR(gt4,i3,i4)
D27m2 = D27_Bagger(Mhh2(i2),Mhh2(i4),MFv2(i1),MFe2(i3))
If(Real(D27m2,dp).eq.Real(D27m2,dp)) Then 
teil = teil + D27m2*chargefactor*coup1L*coup2R*coup3L*coup4R 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


 ! Fv,hh,bar[Fe],VZR
chargefactor = 1 
Do i1=1,9
  Do i2=1,4
    Do i3=1,3
If ((MFv2(i1).gt.mf_l2(2)).Or.(Mhh2(i2).gt.mf_l2(2)).Or.(MFe2(i3).gt.mf_l2(2)).Or.(MVZR2.gt.mf_l2(2))) Then
coup1L = cplFvFvVZRL(gt1,i1)
coup1R = cplFvFvVZRR(gt1,i1)
coup2L = cplFvFvhhL(gt2,i1,i2)
coup2R = cplFvFvhhR(gt2,i1,i2)
coup3L = cplcFeFehhL(i3,gt3,i2)
coup3R = cplcFeFehhR(i3,gt3,i2)
coup4L = cplcFeFeVZRL(gt4,i3)
coup4R = cplcFeFeVZRR(gt4,i3)
End if 
    End Do 
   End Do 
  End Do 


 ! Fv,VZR,bar[Fe],Ah
chargefactor = 1 
Do i1=1,9
    Do i3=1,3
      Do i4=1,4
If ((MFv2(i1).gt.mf_l2(2)).Or.(MVZR2.gt.mf_l2(2)).Or.(MFe2(i3).gt.mf_l2(2)).Or.(MAh2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFvAhL(gt1,i1,i4)
coup1R = cplFvFvAhR(gt1,i1,i4)
coup2L = cplFvFvVZRL(gt2,i1)
coup2R = cplFvFvVZRR(gt2,i1)
coup3L = cplcFeFeVZRL(i3,gt3)
coup3R = cplcFeFeVZRR(i3,gt3)
coup4L = cplcFeFeAhL(gt4,i3,i4)
coup4R = cplcFeFeAhR(gt4,i3,i4)
End if 
    End Do 
  End Do 
End Do 


 ! Fv,VZR,bar[Fe],hh
chargefactor = 1 
Do i1=1,9
    Do i3=1,3
      Do i4=1,4
If ((MFv2(i1).gt.mf_l2(2)).Or.(MVZR2.gt.mf_l2(2)).Or.(MFe2(i3).gt.mf_l2(2)).Or.(Mhh2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFvhhL(gt1,i1,i4)
coup1R = cplFvFvhhR(gt1,i1,i4)
coup2L = cplFvFvVZRL(gt2,i1)
coup2R = cplFvFvVZRR(gt2,i1)
coup3L = cplcFeFeVZRL(i3,gt3)
coup3R = cplcFeFeVZRR(i3,gt3)
coup4L = cplcFeFehhL(gt4,i3,i4)
coup4R = cplcFeFehhR(gt4,i3,i4)
End if 
    End Do 
  End Do 
End Do 


 ! Fv,VZR,bar[Fe],VZR
chargefactor = 1 
Do i1=1,9
    Do i3=1,3
If ((MFv2(i1).gt.mf_l2(2)).Or.(MVZR2.gt.mf_l2(2)).Or.(MFe2(i3).gt.mf_l2(2)).Or.(MVZR2.gt.mf_l2(2))) Then
coup1L = cplFvFvVZRL(gt1,i1)
coup1R = cplFvFvVZRR(gt1,i1)
coup2L = cplFvFvVZRL(gt2,i1)
coup2R = cplFvFvVZRR(gt2,i1)
coup3L = cplcFeFeVZRL(i3,gt3)
coup3R = cplcFeFeVZRR(i3,gt3)
coup4L = cplcFeFeVZRL(gt4,i3)
coup4R = cplcFeFeVZRR(gt4,i3)
End if 
    End Do 
  End Do 


 ! Ah,Fv,Hpm,Fv
chargefactor = 1 
Do i1=1,4
  Do i2=1,9
    Do i3=1,4
      Do i4=1,9
If ((MAh2(i1).gt.mf_l2(2)).Or.(MFv2(i2).gt.mf_l2(2)).Or.(MHpm2(i3).gt.mf_l2(2)).Or.(MFv2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFvAhL(gt1,i4,i1)
coup1R = cplFvFvAhR(gt1,i4,i1)
coup2L = cplFvFvAhL(gt2,i2,i1)
coup2R = cplFvFvAhR(gt2,i2,i1)
coup3L = cplcFeFvHpmL(gt4,i2,i3)
coup3R = cplcFeFvHpmR(gt4,i2,i3)
coup4L = cplFvFecHpmL(i4,gt3,i3)
coup4R = cplFvFecHpmR(i4,gt3,i3)
D0m2 = D0_Bagger(MAh2(i1),MHpm2(i3),MFv2(i2),MFv2(i4))*MFv(i2)*MFv(i4) 
D27m2 = D27_Bagger(MAh2(i1),MHpm2(i3),MFv2(i2),MFv2(i4))
If ((Real(D27m2,dp).eq.Real(D27m2,dp)).And.(Real(D0m2,dp).eq.Real(D0m2,dp))) Then 
teil = teil + 0.5_dp*chargefactor*D27m2*coup1L*coup2R*coup3L*coup4R+D0m2*coup1L*coup2L*coup3R*coup4R 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


 ! Ah,Fv,VWRm,Fv
chargefactor = 1 
Do i1=1,4
  Do i2=1,9
      Do i4=1,9
If ((MAh2(i1).gt.mf_l2(2)).Or.(MFv2(i2).gt.mf_l2(2)).Or.(MVWRm2.gt.mf_l2(2)).Or.(MFv2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFvAhL(gt1,i4,i1)
coup1R = cplFvFvAhR(gt1,i4,i1)
coup2L = cplFvFvAhL(gt2,i2,i1)
coup2R = cplFvFvAhR(gt2,i2,i1)
coup3L = cplcFeFvVWRmL(gt4,i2)
coup3R = cplcFeFvVWRmR(gt4,i2)
coup4L = cplFvFecVWRmL(i4,gt3)
coup4R = cplFvFecVWRmR(i4,gt3)
End if 
    End Do 
   End Do 
End Do 


 ! hh,Fv,Hpm,Fv
chargefactor = 1 
Do i1=1,4
  Do i2=1,9
    Do i3=1,4
      Do i4=1,9
If ((Mhh2(i1).gt.mf_l2(2)).Or.(MFv2(i2).gt.mf_l2(2)).Or.(MHpm2(i3).gt.mf_l2(2)).Or.(MFv2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFvhhL(gt1,i4,i1)
coup1R = cplFvFvhhR(gt1,i4,i1)
coup2L = cplFvFvhhL(gt2,i2,i1)
coup2R = cplFvFvhhR(gt2,i2,i1)
coup3L = cplcFeFvHpmL(gt4,i2,i3)
coup3R = cplcFeFvHpmR(gt4,i2,i3)
coup4L = cplFvFecHpmL(i4,gt3,i3)
coup4R = cplFvFecHpmR(i4,gt3,i3)
D0m2 = D0_Bagger(Mhh2(i1),MHpm2(i3),MFv2(i2),MFv2(i4))*MFv(i2)*MFv(i4) 
D27m2 = D27_Bagger(Mhh2(i1),MHpm2(i3),MFv2(i2),MFv2(i4))
If ((Real(D27m2,dp).eq.Real(D27m2,dp)).And.(Real(D0m2,dp).eq.Real(D0m2,dp))) Then 
teil = teil + 0.5_dp*chargefactor*D27m2*coup1L*coup2R*coup3L*coup4R+D0m2*coup1L*coup2L*coup3R*coup4R 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


 ! hh,Fv,VWRm,Fv
chargefactor = 1 
Do i1=1,4
  Do i2=1,9
      Do i4=1,9
If ((Mhh2(i1).gt.mf_l2(2)).Or.(MFv2(i2).gt.mf_l2(2)).Or.(MVWRm2.gt.mf_l2(2)).Or.(MFv2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFvhhL(gt1,i4,i1)
coup1R = cplFvFvhhR(gt1,i4,i1)
coup2L = cplFvFvhhL(gt2,i2,i1)
coup2R = cplFvFvhhR(gt2,i2,i1)
coup3L = cplcFeFvVWRmL(gt4,i2)
coup3R = cplcFeFvVWRmR(gt4,i2)
coup4L = cplFvFecVWRmL(i4,gt3)
coup4R = cplFvFecVWRmR(i4,gt3)
End if 
    End Do 
   End Do 
End Do 


 ! conj[Hpm],bar[Fe],Ah,bar[Fe]
chargefactor = 1 
Do i1=1,4
  Do i2=1,3
    Do i3=1,4
      Do i4=1,3
If ((MHpm2(i1).gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2)).Or.(MAh2(i3).gt.mf_l2(2)).Or.(MFe2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFecHpmL(gt1,i4,i1)
coup1R = cplFvFecHpmR(gt1,i4,i1)
coup2L = cplcFeFvHpmL(i2,gt2,i1)
coup2R = cplcFeFvHpmR(i2,gt2,i1)
coup3L = cplcFeFeAhL(gt4,i2,i3)
coup3R = cplcFeFeAhR(gt4,i2,i3)
coup4L = cplcFeFeAhL(i4,gt3,i3)
coup4R = cplcFeFeAhR(i4,gt3,i3)
D0m2 = D0_Bagger(MHpm2(i1),MAh2(i3),MFe2(i2),MFe2(i4))*MFe(i2)*MFe(i4) 
D27m2 = D27_Bagger(MHpm2(i1),MAh2(i3),MFe2(i2),MFe2(i4))
If ((Real(D27m2,dp).eq.Real(D27m2,dp)).And.(Real(D0m2,dp).eq.Real(D0m2,dp))) Then 
teil = teil + 0.5_dp*chargefactor*D27m2*coup1L*coup2R*coup3L*coup4R+D0m2*coup1L*coup2L*coup3R*coup4R 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


 ! conj[Hpm],bar[Fe],hh,bar[Fe]
chargefactor = 1 
Do i1=1,4
  Do i2=1,3
    Do i3=1,4
      Do i4=1,3
If ((MHpm2(i1).gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2)).Or.(Mhh2(i3).gt.mf_l2(2)).Or.(MFe2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFecHpmL(gt1,i4,i1)
coup1R = cplFvFecHpmR(gt1,i4,i1)
coup2L = cplcFeFvHpmL(i2,gt2,i1)
coup2R = cplcFeFvHpmR(i2,gt2,i1)
coup3L = cplcFeFehhL(gt4,i2,i3)
coup3R = cplcFeFehhR(gt4,i2,i3)
coup4L = cplcFeFehhL(i4,gt3,i3)
coup4R = cplcFeFehhR(i4,gt3,i3)
D0m2 = D0_Bagger(MHpm2(i1),Mhh2(i3),MFe2(i2),MFe2(i4))*MFe(i2)*MFe(i4) 
D27m2 = D27_Bagger(MHpm2(i1),Mhh2(i3),MFe2(i2),MFe2(i4))
If ((Real(D27m2,dp).eq.Real(D27m2,dp)).And.(Real(D0m2,dp).eq.Real(D0m2,dp))) Then 
teil = teil + 0.5_dp*chargefactor*D27m2*coup1L*coup2R*coup3L*coup4R+D0m2*coup1L*coup2L*coup3R*coup4R 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


 ! conj[Hpm],bar[Fe],VZR,bar[Fe]
chargefactor = 1 
Do i1=1,4
  Do i2=1,3
      Do i4=1,3
If ((MHpm2(i1).gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2)).Or.(MVZR2.gt.mf_l2(2)).Or.(MFe2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFecHpmL(gt1,i4,i1)
coup1R = cplFvFecHpmR(gt1,i4,i1)
coup2L = cplcFeFvHpmL(i2,gt2,i1)
coup2R = cplcFeFvHpmR(i2,gt2,i1)
coup3L = cplcFeFeVZRL(gt4,i2)
coup3R = cplcFeFeVZRR(gt4,i2)
coup4L = cplcFeFeVZRL(i4,gt3)
coup4R = cplcFeFeVZRR(i4,gt3)
End if 
    End Do 
   End Do 
End Do 


 ! Ah,Fe,Hpm,Fv
chargefactor = 1 
Do i1=1,4
  Do i2=1,3
    Do i3=1,4
      Do i4=1,9
If ((MAh2(i1).gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2)).Or.(MHpm2(i3).gt.mf_l2(2)).Or.(MFv2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFvAhL(gt1,i4,i1)
coup1R = cplFvFvAhR(gt1,i4,i1)
coup2L = cplcFeFeAhL(gt4,i2,i1)
coup2R = cplcFeFeAhR(gt4,i2,i1)
coup3L = cplcFeFvHpmL(i2,gt2,i3)
coup3R = cplcFeFvHpmR(i2,gt2,i3)
coup4L = cplFvFecHpmL(i4,gt3,i3)
coup4R = cplFvFecHpmR(i4,gt3,i3)
D0m2 = D0_Bagger(MAh2(i1),MHpm2(i3),MFe2(i2),MFv2(i4))*MFe(i2)*MFv(i4) 
If (Real(D0m2,dp).eq.Real(D0m2,dp)) Then 
teil = teil + 0.5_dp*chargefactor*D0m2*coup1L*coup2R*coup3R*coup4L 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


 ! Ah,Fe,VWRm,Fv
chargefactor = 1 
Do i1=1,4
  Do i2=1,3
      Do i4=1,9
If ((MAh2(i1).gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2)).Or.(MVWRm2.gt.mf_l2(2)).Or.(MFv2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFvAhL(gt1,i4,i1)
coup1R = cplFvFvAhR(gt1,i4,i1)
coup2L = cplcFeFeAhL(gt4,i2,i1)
coup2R = cplcFeFeAhR(gt4,i2,i1)
coup3L = cplcFeFvVWRmL(i2,gt2)
coup3R = cplcFeFvVWRmR(i2,gt2)
coup4L = cplFvFecVWRmL(i4,gt3)
coup4R = cplFvFecVWRmR(i4,gt3)
End if 
    End Do 
   End Do 
End Do 


 ! hh,Fe,Hpm,Fv
chargefactor = 1 
Do i1=1,4
  Do i2=1,3
    Do i3=1,4
      Do i4=1,9
If ((Mhh2(i1).gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2)).Or.(MHpm2(i3).gt.mf_l2(2)).Or.(MFv2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFvhhL(gt1,i4,i1)
coup1R = cplFvFvhhR(gt1,i4,i1)
coup2L = cplcFeFehhL(gt4,i2,i1)
coup2R = cplcFeFehhR(gt4,i2,i1)
coup3L = cplcFeFvHpmL(i2,gt2,i3)
coup3R = cplcFeFvHpmR(i2,gt2,i3)
coup4L = cplFvFecHpmL(i4,gt3,i3)
coup4R = cplFvFecHpmR(i4,gt3,i3)
D0m2 = D0_Bagger(Mhh2(i1),MHpm2(i3),MFe2(i2),MFv2(i4))*MFe(i2)*MFv(i4) 
If (Real(D0m2,dp).eq.Real(D0m2,dp)) Then 
teil = teil + 0.5_dp*chargefactor*D0m2*coup1L*coup2R*coup3R*coup4L 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


 ! hh,Fe,VWRm,Fv
chargefactor = 1 
Do i1=1,4
  Do i2=1,3
      Do i4=1,9
If ((Mhh2(i1).gt.mf_l2(2)).Or.(MFe2(i2).gt.mf_l2(2)).Or.(MVWRm2.gt.mf_l2(2)).Or.(MFv2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFvhhL(gt1,i4,i1)
coup1R = cplFvFvhhR(gt1,i4,i1)
coup2L = cplcFeFehhL(gt4,i2,i1)
coup2R = cplcFeFehhR(gt4,i2,i1)
coup3L = cplcFeFvVWRmL(i2,gt2)
coup3R = cplcFeFvVWRmR(i2,gt2)
coup4L = cplFvFecVWRmL(i4,gt3)
coup4R = cplFvFecVWRmR(i4,gt3)
End if 
    End Do 
   End Do 
End Do 


 ! conj[Hpm],Fv,Ah,bar[Fe]
chargefactor = 1 
Do i1=1,4
  Do i2=1,9
    Do i3=1,4
      Do i4=1,3
If ((MHpm2(i1).gt.mf_l2(2)).Or.(MFv2(i2).gt.mf_l2(2)).Or.(MAh2(i3).gt.mf_l2(2)).Or.(MFe2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFecHpmL(gt1,i4,i1)
coup1R = cplFvFecHpmR(gt1,i4,i1)
coup2L = cplcFeFvHpmL(gt4,i2,i1)
coup2R = cplcFeFvHpmR(gt4,i2,i1)
coup3L = cplFvFvAhL(gt2,i2,i3)
coup3R = cplFvFvAhR(gt2,i2,i3)
coup4L = cplcFeFeAhL(i4,gt3,i3)
coup4R = cplcFeFeAhR(i4,gt3,i3)
D0m2 = D0_Bagger(MHpm2(i1),MAh2(i3),MFv2(i2),MFe2(i4))*MFv(i2)*MFe(i4) 
If (Real(D0m2,dp).eq.Real(D0m2,dp)) Then 
teil = teil + 0.5_dp*chargefactor*D0m2*coup1L*coup2R*coup3R*coup4L 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


 ! conj[Hpm],Fv,hh,bar[Fe]
chargefactor = 1 
Do i1=1,4
  Do i2=1,9
    Do i3=1,4
      Do i4=1,3
If ((MHpm2(i1).gt.mf_l2(2)).Or.(MFv2(i2).gt.mf_l2(2)).Or.(Mhh2(i3).gt.mf_l2(2)).Or.(MFe2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFecHpmL(gt1,i4,i1)
coup1R = cplFvFecHpmR(gt1,i4,i1)
coup2L = cplcFeFvHpmL(gt4,i2,i1)
coup2R = cplcFeFvHpmR(gt4,i2,i1)
coup3L = cplFvFvhhL(gt2,i2,i3)
coup3R = cplFvFvhhR(gt2,i2,i3)
coup4L = cplcFeFehhL(i4,gt3,i3)
coup4R = cplcFeFehhR(i4,gt3,i3)
D0m2 = D0_Bagger(MHpm2(i1),Mhh2(i3),MFv2(i2),MFe2(i4))*MFv(i2)*MFe(i4) 
If (Real(D0m2,dp).eq.Real(D0m2,dp)) Then 
teil = teil + 0.5_dp*chargefactor*D0m2*coup1L*coup2R*coup3R*coup4L 
End if
End if 
    End Do 
   End Do 
  End Do 
End Do 


 ! conj[Hpm],Fv,VZR,bar[Fe]
chargefactor = 1 
Do i1=1,4
  Do i2=1,9
      Do i4=1,3
If ((MHpm2(i1).gt.mf_l2(2)).Or.(MFv2(i2).gt.mf_l2(2)).Or.(MVZR2.gt.mf_l2(2)).Or.(MFe2(i4).gt.mf_l2(2))) Then
coup1L = cplFvFecHpmL(gt1,i4,i1)
coup1R = cplFvFecHpmR(gt1,i4,i1)
coup2L = cplcFeFvHpmL(gt4,i2,i1)
coup2R = cplcFeFvHpmR(gt4,i2,i1)
coup3L = cplFvFvVZRL(gt2,i2)
coup3R = cplFvFvVZRR(gt2,i2)
coup4L = cplcFeFeVZRL(i4,gt3)
coup4R = cplcFeFeVZRR(i4,gt3)
End if 
    End Do 
   End Do 
End Do 


  End Do 
 
End Do 
 

 
sumI = -2._dp*cosW2_DR*mz2*Real(teil,dp)/g2**2 
res = res + SumI 
End if ! BSM part 
res = res*oo16pi2 
Iname = Iname-1
End subroutine DeltaVB 
 
 
Subroutine CoupHiggsToPhoton(mHiggs,inG,ratFd,ratFe,ratFu,ratHpm,ratVWLm,             & 
& ratVWRm,MFd,MFe,MFu,MHpm,MVWLm,MVWRm,gNLO,coup)

Implicit None 
Complex(dp),Intent(in) :: ratFd(3),ratFe(3),ratFu(3),ratHpm(4),ratVWLm,ratVWRm

Real(dp),Intent(in) :: MFd(3),MFe(3),MFu(3),MHpm(4),MVWLm,MVWRm

Integer, Intent(in) :: inG 
Real(dp), Intent(in) :: mHiggs, gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
coup = coup + 1*(-1)**2*ratVWLm*A_one(mH2p/MVWLm**2)
HPPloopVWLm(inG) = HPPloopVWLm(inG)+1*(-1)**2*ratVWLm*A_one(mH2p/MVWLm**2)
coup = coup + 1*(-1)**2*ratVWRm*A_one(mH2p/MVWRm**2)
HPPloopVWRm(inG) = HPPloopVWRm(inG)+1*(-1)**2*ratVWRm*A_one(mH2p/MVWRm**2)
Do i1 = 3 , 4
coup = coup + 1*(-1)**2*ratHpm(i1)*A_zero(mH2p/MHpm(i1)**2)
HPPloopHpm(i1,inG) = HPPloopHpm(i1,inG)+1*(-1)**2*ratHpm(i1)*A_zero(mH2p/MHpm(i1)**2)
End Do 
Do i1 = 1 , 3
coup = coup + cNLO_onehalf(mHiggs,MFd(i1),gNLO)*3*(-1._dp/3._dp)**2*ratFd(i1)*A_onehalf(mH2p/MFd(i1)**2)
HPPloopFd(i1,inG) = HPPloopFd(i1,inG) + cNLO_onehalf(mHiggs,MFd(i1),gNLO)*3*(-1._dp/3._dp)**2*ratFd(i1)*A_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 = 1 , 3
coup = coup + cNLO_onehalf(mHiggs,MFu(i1),gNLO)*3*(2._dp/3._dp)**2*ratFu(i1)*A_onehalf(mH2p/MFu(i1)**2)
HPPloopFu(i1,inG) = HPPloopFu(i1,inG) + cNLO_onehalf(mHiggs,MFu(i1),gNLO)*3*(2._dp/3._dp)**2*ratFu(i1)*A_onehalf(mH2p/MFu(i1)**2)
End Do 
Do i1 = 1 , 3
coup = coup + 1*(-1)**2*ratFe(i1)*A_onehalf(mH2p/MFe(i1)**2)
HPPloopFe(i1,inG) = HPPloopFe(i1,inG)+1*(-1)**2*ratFe(i1)*A_onehalf(mH2p/MFe(i1)**2)
End Do 
End Subroutine CoupHiggsToPhoton

Subroutine CoupHiggsToGluon(mHiggs,inG,ratFd,ratFu,MFd,MFu,gNLO,coup)

Implicit None 
Complex(dp),Intent(in) :: ratFd(3),ratFu(3)

Real(dp),Intent(in) :: MFd(3),MFu(3)

Integer, Intent(in) :: inG 
Real(dp), Intent(in) :: mHiggs, gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
Do i1 = 1 , 3
coup = coup + 1*ratFd(i1)*A_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 = 1 , 3
coup = coup + 1*ratFu(i1)*A_onehalf(mH2p/MFu(i1)**2)
End Do 
coup = 0.75_dp*coup 
End Subroutine CoupHiggsToGluon

Subroutine CoupHiggsToPhotonSM(mHiggs,MFd,MFe,MFu,MHpm,MVWLm,MVWRm,gNLO,coup)

Implicit None 
Real(dp),Intent(in) :: MFd(3),MFe(3),MFu(3),MHpm(4),MVWLm,MVWRm

Real(dp), Intent(in) :: mHiggs, gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
coup = coup + 1*(-1)**2*A_one(mH2p/MVWLm**2)
Do i1 =1, 3 
coup = coup + cNLO_onehalf(mHiggs,MFd(i1),gNLO)*3*(-1._dp/3._dp)**2*A_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 =1, 3 
coup = coup + cNLO_onehalf(mHiggs,MFu(i1),gNLO)*3*(2._dp/3._dp)**2*A_onehalf(mH2p/MFu(i1)**2)
End Do 
Do i1 =1, 3 
coup = coup + 1*(-1)**2*A_onehalf(mH2p/MFe(i1)**2)
End Do 
End Subroutine CoupHiggsToPhotonSM 

Subroutine CoupHiggsToGluonSM(mHiggs,MFd,MFu,gNLO,coup)

Implicit None 
Real(dp),Intent(in) :: MFd(3),MFu(3)

Real(dp), Intent(in) :: mHiggs, gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
Do i1 =1, 3 
coup = coup + 1*A_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 =1, 3 
coup = coup + 1*A_onehalf(mH2p/MFu(i1)**2)
End Do 
coup = 0.75_dp*coup 
End Subroutine CoupHiggsToGluonSM 

Subroutine CoupPseudoHiggsToPhoton(mHiggs,inG,ratFd,ratFe,ratFu,ratHpm,               & 
& ratVWLm,ratVWRm,MFd,MFe,MFu,MHpm,MVWLm,MVWRm,gNLO,coup)

Implicit None 
Complex(dp),Intent(in) :: ratFd(3),ratFe(3),ratFu(3),ratHpm(4),ratVWLm,ratVWRm

Real(dp),Intent(in) :: MFd(3),MFe(3),MFu(3),MHpm(4),MVWLm,MVWRm

Real(dp), Intent(in) :: mHiggs, gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Integer, Intent(in) :: inG 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
Do i1 =1, 3
coup = coup + cANLO_onehalf(mHiggs,MFd(i1),gNLO)*3*(-1._dp/3._dp)**2*ratFd(i1)*AP_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 =1, 3
coup = coup + cANLO_onehalf(mHiggs,MFu(i1),gNLO)*3*(2._dp/3._dp)**2*ratFu(i1)*AP_onehalf(mH2p/MFu(i1)**2)
End Do 
Do i1 =1, 3
coup = coup + cANLO_onehalf(mHiggs,MFe(i1),gNLO)*1*(-1)**2*ratFe(i1)*AP_onehalf(mH2p/MFe(i1)**2)
End Do 
End Subroutine CoupPseudoHiggsToPhoton

Subroutine CoupPseudoHiggsToGluon(mHiggs,inG,ratFd,ratFu,MFd,MFu,gNLO,coup)

Implicit None 
Complex(dp),Intent(in) :: ratFd(3),ratFu(3)

Real(dp),Intent(in) :: MFd(3),MFu(3)

Real(dp), Intent(in) :: mHiggs, gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Integer, Intent(in) :: inG 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
Do i1 =1, 3
coup = coup + 1*ratFd(i1)*AP_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 =1, 3
coup = coup + 1*ratFu(i1)*AP_onehalf(mH2p/MFu(i1)**2)
End Do 
coup = 0.75_dp*coup 
End Subroutine CoupPseudoHiggsToGluon

Subroutine CoupPseudoHiggsToPhotonSM(mHiggs,MFd,MFe,MFu,MHpm,MVWLm,MVWRm,             & 
& gNLO,coup)

Implicit None 
Real(dp),Intent(in) :: MFd(3),MFe(3),MFu(3),MHpm(4),MVWLm,MVWRm

Real(dp), Intent(in) :: mHiggs,gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
Do i1 =1, 3
coup = coup + cANLO_onehalf(mHiggs,MFd(i1),gNLO)*3*(-1._dp/3._dp)**2**AP_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 =1, 3
coup = coup + cANLO_onehalf(mHiggs,MFu(i1),gNLO)*3*(2._dp/3._dp)**2**AP_onehalf(mH2p/MFu(i1)**2)
End Do 
Do i1 =1, 3
coup = coup + cANLO_onehalf(mHiggs,MFe(i1),gNLO)*1*(-1)**2**AP_onehalf(mH2p/MFe(i1)**2)
End Do 
End Subroutine CoupPseudoHiggsToPhotonSM 

Subroutine CoupPseudoHiggsToGluonSM(mHiggs,MFd,MFu,gNLO,coup)

Implicit None 
Real(dp),Intent(in) :: MFd(3),MFu(3)

Real(dp), Intent(in) :: mHiggs,gNLO 
Complex(dp), Intent(out) :: coup 
Integer :: i1 
Real(dp) :: Mh2p 
mH2p = 0.25_dp*mHiggs**2 
coup = 0._dp 
 
Do i1 =1, 3
coup = coup + 1*AP_onehalf(mH2p/MFd(i1)**2)
End Do 
Do i1 =1, 3
coup = coup + 1*AP_onehalf(mH2p/MFu(i1)**2)
End Do 
coup = 0.75_dp*coup 
End Subroutine CoupPseudoHiggsToGluonSM 

Complex(dp) Function cNLO_onehalf(mH,mQ,g) 
Real(dp), Intent(in) :: mH, mQ, g
Real(dp)::tau 
tau=mH**2/(4._dp*mQ**2) 
If (g.lt.0._dp) Then 
  cNLO_onehalf = 1._dp 
Else 
  If (mH.lt.mQ) Then 
    cNLO_onehalf = 1._dp - oo4pi2*g**2  
  Else if (mH.gt.(2._dp*mQ)) Then 
   If (tau.lt.100._dp) Then 
    If (tau.lt.1.1_dp) Then 
      cNLO_onehalf=1._dp+(g**2/(4*Pi**2))*(&
       & (-1.033208159703536+7.10655096733206*tau-88.20900604676405*tau**2+598.6773733788388*tau**3-1967.3257953814561*tau**4+& 
       & 3247.6715405319346*tau**5-2330.127086890616*tau**6+677.9294006001846*tau**8-142.7923161120851*tau**10)& 
       &+(0._dp,1._dp)*(8.29739339711994-7.888861883558018/tau**3+10.437838040782095/tau**2-8.42394029242545/tau+0.2842283337270764*tau-&
       & 0.054995208547411904*tau*Log(tau)-1.6113597681662795*Log(4*tau)+0.000021811438531828155*tau**2*Log(tau**2))) 
    Else 
      cNLO_onehalf=1._dp+(g**2/(4*Pi**2))*(&
       & (-1.6170280814404576+0.40530581525102677/tau**3-0.33530992103515084/tau**2+3.9718559902660684/tau-0.000111953515865919*tau+& 
       & 9.129881821626589e-6*tau*Log(tau)+0.1338033886479311*Log(4*tau)-1.121902907800696e-12*tau**2*Log(tau**2))& 
       &+(0._dp,1._dp)*(8.29739339711994-7.888861883558018/tau**3+10.437838040782095/tau**2-8.42394029242545/tau+0.2842283337270764*tau-& 
       & 0.054995208547411904*tau*Log(tau)-1.6113597681662795*Log(4*tau)+0.000021811438531828155*tau**2*Log(tau**2))) 
    End if 
   Else ! mQ->0 
     cNLO_onehalf=1._dp+(g**2/(4*Pi**2))*&
      & (-(2._dp*Log(mH**2/mQ**2))/3._dp+(Pi**2-(Log(mH**2/mQ**2))**2)/18._dp+2*log(mH**2/4/mQ**2)&
      &+(0._dp,1._dp)*Pi/3*((Log(mH**2/mQ**2))/3+2._dp))
    End if 
  Else ! mQ~mH 
    cNLO_onehalf = 1._dp 
  End if 
End if 
End Function cNLO_onehalf 
 
Complex(dp) Function cANLO_onehalf(mH,mQ,g) 
Real(dp), Intent(in) :: mH, mQ, g
Real(dp)::tau 
tau=mH**2/(4._dp*mQ**2) 
If (g.lt.0._dp) Then 
  cANLO_onehalf = 1._dp 
Else 
  If (mH.lt.mQ) Then 
    cANLO_onehalf = 1._dp  
  Else if (mH.gt.(2._dp*mQ)) Then 
   If (tau.lt.100._dp) Then 
    If (tau.lt.1.1_dp) Then 
      cANLO_onehalf=1._dp+(g**2/(4*Pi**2))*(&
       & (-1.033208159703536+7.10655096733206*tau-88.20900604676405*tau**2+598.6773733788388*tau**3-1967.3257953814561*tau**4+& 
       & 3247.6715405319346*tau**5-2330.127086890616*tau**6+677.9294006001846*tau**8-142.7923161120851*tau**10)& 
       &+(0._dp,1._dp)*(8.29739339711994-7.888861883558018/tau**3+10.437838040782095/tau**2-8.42394029242545/tau+0.2842283337270764*tau-&
       & 0.054995208547411904*tau*Log(tau)-1.6113597681662795*Log(4*tau)+0.000021811438531828155*tau**2*Log(tau**2))) 
    Else 
      cANLO_onehalf=1._dp+(g**2/(4*Pi**2))*(&
       & (-1.6170280814404576+0.40530581525102677/tau**3-0.33530992103515084/tau**2+3.9718559902660684/tau-0.000111953515865919*tau+& 
       & 9.129881821626589e-6*tau*Log(tau)+0.1338033886479311*Log(4*tau)-1.121902907800696e-12*tau**2*Log(tau**2))& 
       &+(0._dp,1._dp)*(8.29739339711994-7.888861883558018/tau**3+10.437838040782095/tau**2-8.42394029242545/tau+0.2842283337270764*tau-& 
       & 0.054995208547411904*tau*Log(tau)-1.6113597681662795*Log(4*tau)+0.000021811438531828155*tau**2*Log(tau**2))) 
    End if 
   Else ! mQ->0 
     cANLO_onehalf=1._dp+(g**2/(4*Pi**2))*&
      & (-(2._dp*Log(mH**2/mQ**2))/3._dp+(Pi**2-(Log(mH**2/mQ**2))**2)/18._dp+2*log(mH**2/4/mQ**2)&
      &+(0._dp,1._dp)*Pi/3*((Log(mH**2/mQ**2))/3+2._dp))
    End if 
  Else ! mQ~mH 
    cANLO_onehalf = 1._dp 
  End if 
End if 
End Function cANLO_onehalf 
 
Real(dp) Function cNLO_zero(mH,mQ,g) 
Real(dp), Intent(in) :: mH, mQ, g
If (g.lt.0._dp) Then 
   cNLO_zero= 1._dp 
Else 
  If (mH.lt.mQ) Then 
    cNLO_zero = 1._dp + 2._dp*oo3pi2*g**2  
  Else  
    cNLO_zero = 1._dp 
  End if 
End if 
End Function cNLO_zero 
End Module LoopCouplings_DLRSM 
 
