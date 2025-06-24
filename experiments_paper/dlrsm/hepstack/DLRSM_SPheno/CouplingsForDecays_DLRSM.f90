! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.15.3 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 14:19 on 18.6.2025   
! ----------------------------------------------------------------------  
 
 
Module CouplingsForDecays_DLRSM
 
Use Control 
Use Settings 
Use Model_Data_DLRSM 
Use Couplings_DLRSM 
Use LoopCouplings_DLRSM 
Use Tadpoles_DLRSM 
 Use TreeLevelMasses_DLRSM 
Use Mathematics, Only: CompareMatrices, Adjungate 
 
Use StandardModel 
Contains 
 
 
 
Subroutine CouplingsFor_Fu_decays_2B(m_in,i1,MAhinput,MAh2input,MFdinput,             & 
& MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,Mhhinput,           & 
& Mhh2input,MHpminput,MHpm2input,MVWLminput,MVWLm2input,MVWRminput,MVWRm2input,          & 
& MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput,ZDRinput,            & 
& ZERinput,UPinput,ZURinput,ZDLinput,ZELinput,ZULinput,ZHinput,ZMinput,ZWinput,          & 
& ZZinput,gBLinput,g2input,g3input,LAM2input,LAM1input,RHO1input,RHO2input,              & 
& ALP2input,ALP1input,ALP3input,LAM5input,LAM6input,LAM3input,LAM4input,Yinput,          & 
& YQ1input,YQ2input,Ytinput,YLinput,YRinput,Muxinput,MU12input,MU22input,k1input,        & 
& vRinput,cplcFuFuAhL,cplcFuFuAhR,cplcFuFdcHpmL,cplcFuFdcHpmR,cplcFuFdcVWLmL,            & 
& cplcFuFdcVWLmR,cplcFuFdcVWRmL,cplcFuFdcVWRmR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,      & 
& cplcFuFuVZR,cplcFuFuVZRL,cplcFuFuVZRR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: gBLinput,g2input,g3input,LAM2input,LAM1input,RHO1input,RHO2input,ALP2input,           & 
& ALP1input,ALP3input,LAM5input,LAM6input,LAM3input,LAM4input,MU12input,MU22input,       & 
& k1input,vRinput

Complex(dp),Intent(in) :: Yinput(3,3),YQ1input(3,3),YQ2input(3,3),Ytinput(3,3),YLinput(3,3),YRinput(3,3),       & 
& Muxinput(3,3)

Real(dp),Intent(in) :: MAhinput(4),MAh2input(4),MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),           & 
& MFuinput(3),MFu2input(3),MFvinput(9),MFv2input(9),Mhhinput(4),Mhh2input(4),            & 
& MHpminput(4),MHpm2input(4),MVWLminput,MVWLm2input,MVWRminput,MVWRm2input,              & 
& MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput(4,4),UPinput(4,4),   & 
& ZHinput(4,4),ZZinput(3,3)

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& ZMinput(9,9),ZWinput(4,4)

Real(dp) :: gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,MU12,MU22,k1,vR

Complex(dp) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3),YL(3,3),YR(3,3),Mux(3,3)

Complex(dp),Intent(out) :: cplcFuFuAhL(3,3,4),cplcFuFuAhR(3,3,4),cplcFuFdcHpmL(3,3,4),cplcFuFdcHpmR(3,3,4),      & 
& cplcFuFdcVWLmL(3,3),cplcFuFdcVWLmR(3,3),cplcFuFdcVWRmL(3,3),cplcFuFdcVWRmR(3,3),       & 
& cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),               & 
& cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,               & 
& MVZR2,PhiW,TW,UC(4,4),UP(4,4),ZH(4,4),ZZ(3,3)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZM(9,9),ZW(4,4)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fu_2B'
 
sinW2=1._dp-mW2/mZ2 
gBL = gBLinput 
g2 = g2input 
g3 = g3input 
LAM2 = LAM2input 
LAM1 = LAM1input 
RHO1 = RHO1input 
RHO2 = RHO2input 
ALP2 = ALP2input 
ALP1 = ALP1input 
ALP3 = ALP3input 
LAM5 = LAM5input 
LAM6 = LAM6input 
LAM3 = LAM3input 
LAM4 = LAM4input 
Y = Yinput 
YQ1 = YQ1input 
YQ2 = YQ2input 
Yt = Ytinput 
YL = YLinput 
YR = YRinput 
Mux = Muxinput 
MU12 = MU12input 
MU22 = MU22input 
k1 = k1input 
vR = vRinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,              & 
& LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,k1,vR,(/ ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,           & 
& MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC,ZDR,ZER,UP,             & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,k1,vR,gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,             & 
& ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UC = UCinput 
UP = UPinput 
ZH = ZHinput 
ZM = ZMinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MVWLm = MVWLminput 
MVWLm2 = MVWLm2input 
MVWRm = MVWRminput 
MVWRm2 = MVWRm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZR = MVZRinput 
MVZR2 = MVZR2input 
End if 
cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFuFuAhT(gt1,gt2,gt3,YQ1,YQ2,UP,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)         & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcHpmL = 0._dp 
cplcFuFdcHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFuFdcHpmT(gt1,gt2,gt3,YQ1,YQ2,UC,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHpmL(gt1,gt2,gt3)& 
& ,cplcFuFdcHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFuFuhhT(gt1,gt2,gt3,YQ1,YQ2,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcVWLmL = 0._dp 
cplcFuFdcVWLmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWLmT(gt1,gt2,g2,ZDL,ZDR,ZUL,ZUR,PhiW,cplcFuFdcVWLmL(gt1,gt2)      & 
& ,cplcFuFdcVWLmR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWRmL = 0._dp 
cplcFuFdcVWRmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWRmT(gt1,gt2,g2,ZDL,ZDR,ZUL,ZUR,PhiW,cplcFuFdcVWRmL(gt1,gt2)      & 
& ,cplcFuFdcVWRmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,gBL,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZRL = 0._dp 
cplcFuFuVZRR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZRT(gt1,gt2,gBL,g2,TW,cplcFuFuVZRL(gt1,gt2),cplcFuFuVZRR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fu_decays_2B
 
Subroutine CouplingsFor_Fe_decays_2B(m_in,i1,MAhinput,MAh2input,MFdinput,             & 
& MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,Mhhinput,           & 
& Mhh2input,MHpminput,MHpm2input,MVWLminput,MVWLm2input,MVWRminput,MVWRm2input,          & 
& MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput,ZDRinput,            & 
& ZERinput,UPinput,ZURinput,ZDLinput,ZELinput,ZULinput,ZHinput,ZMinput,ZWinput,          & 
& ZZinput,gBLinput,g2input,g3input,LAM2input,LAM1input,RHO1input,RHO2input,              & 
& ALP2input,ALP1input,ALP3input,LAM5input,LAM6input,LAM3input,LAM4input,Yinput,          & 
& YQ1input,YQ2input,Ytinput,YLinput,YRinput,Muxinput,MU12input,MU22input,k1input,        & 
& vRinput,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,cplcFeFeVZL,cplcFeFeVZR,       & 
& cplcFeFeVZRL,cplcFeFeVZRR,cplcFeFvHpmL,cplcFeFvHpmR,cplcFeFvVWLmL,cplcFeFvVWLmR,       & 
& cplcFeFvVWRmL,cplcFeFvVWRmR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: gBLinput,g2input,g3input,LAM2input,LAM1input,RHO1input,RHO2input,ALP2input,           & 
& ALP1input,ALP3input,LAM5input,LAM6input,LAM3input,LAM4input,MU12input,MU22input,       & 
& k1input,vRinput

Complex(dp),Intent(in) :: Yinput(3,3),YQ1input(3,3),YQ2input(3,3),Ytinput(3,3),YLinput(3,3),YRinput(3,3),       & 
& Muxinput(3,3)

Real(dp),Intent(in) :: MAhinput(4),MAh2input(4),MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),           & 
& MFuinput(3),MFu2input(3),MFvinput(9),MFv2input(9),Mhhinput(4),Mhh2input(4),            & 
& MHpminput(4),MHpm2input(4),MVWLminput,MVWLm2input,MVWRminput,MVWRm2input,              & 
& MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput(4,4),UPinput(4,4),   & 
& ZHinput(4,4),ZZinput(3,3)

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& ZMinput(9,9),ZWinput(4,4)

Real(dp) :: gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,MU12,MU22,k1,vR

Complex(dp) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3),YL(3,3),YR(3,3),Mux(3,3)

Complex(dp),Intent(out) :: cplcFeFeAhL(3,3,4),cplcFeFeAhR(3,3,4),cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),          & 
& cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),cplcFeFvHpmL(3,9,4),& 
& cplcFeFvHpmR(3,9,4),cplcFeFvVWLmL(3,9),cplcFeFvVWLmR(3,9),cplcFeFvVWRmL(3,9),          & 
& cplcFeFvVWRmR(3,9)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,               & 
& MVZR2,PhiW,TW,UC(4,4),UP(4,4),ZH(4,4),ZZ(3,3)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZM(9,9),ZW(4,4)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fe_2B'
 
sinW2=1._dp-mW2/mZ2 
gBL = gBLinput 
g2 = g2input 
g3 = g3input 
LAM2 = LAM2input 
LAM1 = LAM1input 
RHO1 = RHO1input 
RHO2 = RHO2input 
ALP2 = ALP2input 
ALP1 = ALP1input 
ALP3 = ALP3input 
LAM5 = LAM5input 
LAM6 = LAM6input 
LAM3 = LAM3input 
LAM4 = LAM4input 
Y = Yinput 
YQ1 = YQ1input 
YQ2 = YQ2input 
Yt = Ytinput 
YL = YLinput 
YR = YRinput 
Mux = Muxinput 
MU12 = MU12input 
MU22 = MU22input 
k1 = k1input 
vR = vRinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,              & 
& LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,k1,vR,(/ ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,           & 
& MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC,ZDR,ZER,UP,             & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,k1,vR,gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,             & 
& ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UC = UCinput 
UP = UPinput 
ZH = ZHinput 
ZM = ZMinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MVWLm = MVWLminput 
MVWLm2 = MVWLm2input 
MVWRm = MVWRminput 
MVWRm2 = MVWRm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZR = MVZRinput 
MVZR2 = MVZR2input 
End if 
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


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,gBL,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZRL = 0._dp 
cplcFeFeVZRR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZRT(gt1,gt2,gBL,g2,TW,cplcFeFeVZRL(gt1,gt2),cplcFeFeVZRR(gt1,gt2))

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


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fe_decays_2B
 
Subroutine CouplingsFor_Fd_decays_2B(m_in,i1,MAhinput,MAh2input,MFdinput,             & 
& MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,Mhhinput,           & 
& Mhh2input,MHpminput,MHpm2input,MVWLminput,MVWLm2input,MVWRminput,MVWRm2input,          & 
& MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput,ZDRinput,            & 
& ZERinput,UPinput,ZURinput,ZDLinput,ZELinput,ZULinput,ZHinput,ZMinput,ZWinput,          & 
& ZZinput,gBLinput,g2input,g3input,LAM2input,LAM1input,RHO1input,RHO2input,              & 
& ALP2input,ALP1input,ALP3input,LAM5input,LAM6input,LAM3input,LAM4input,Yinput,          & 
& YQ1input,YQ2input,Ytinput,YLinput,YRinput,Muxinput,MU12input,MU22input,k1input,        & 
& vRinput,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,       & 
& cplcFdFdVZRL,cplcFdFdVZRR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWLmL,cplcFdFuVWLmR,       & 
& cplcFdFuVWRmL,cplcFdFuVWRmR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: gBLinput,g2input,g3input,LAM2input,LAM1input,RHO1input,RHO2input,ALP2input,           & 
& ALP1input,ALP3input,LAM5input,LAM6input,LAM3input,LAM4input,MU12input,MU22input,       & 
& k1input,vRinput

Complex(dp),Intent(in) :: Yinput(3,3),YQ1input(3,3),YQ2input(3,3),Ytinput(3,3),YLinput(3,3),YRinput(3,3),       & 
& Muxinput(3,3)

Real(dp),Intent(in) :: MAhinput(4),MAh2input(4),MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),           & 
& MFuinput(3),MFu2input(3),MFvinput(9),MFv2input(9),Mhhinput(4),Mhh2input(4),            & 
& MHpminput(4),MHpm2input(4),MVWLminput,MVWLm2input,MVWRminput,MVWRm2input,              & 
& MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput(4,4),UPinput(4,4),   & 
& ZHinput(4,4),ZZinput(3,3)

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& ZMinput(9,9),ZWinput(4,4)

Real(dp) :: gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,MU12,MU22,k1,vR

Complex(dp) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3),YL(3,3),YR(3,3),Mux(3,3)

Complex(dp),Intent(out) :: cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),          & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplcFdFuHpmL(3,3,4),& 
& cplcFdFuHpmR(3,3,4),cplcFdFuVWLmL(3,3),cplcFdFuVWLmR(3,3),cplcFdFuVWRmL(3,3),          & 
& cplcFdFuVWRmR(3,3)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,               & 
& MVZR2,PhiW,TW,UC(4,4),UP(4,4),ZH(4,4),ZZ(3,3)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZM(9,9),ZW(4,4)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fd_2B'
 
sinW2=1._dp-mW2/mZ2 
gBL = gBLinput 
g2 = g2input 
g3 = g3input 
LAM2 = LAM2input 
LAM1 = LAM1input 
RHO1 = RHO1input 
RHO2 = RHO2input 
ALP2 = ALP2input 
ALP1 = ALP1input 
ALP3 = ALP3input 
LAM5 = LAM5input 
LAM6 = LAM6input 
LAM3 = LAM3input 
LAM4 = LAM4input 
Y = Yinput 
YQ1 = YQ1input 
YQ2 = YQ2input 
Yt = Ytinput 
YL = YLinput 
YR = YRinput 
Mux = Muxinput 
MU12 = MU12input 
MU22 = MU22input 
k1 = k1input 
vR = vRinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,              & 
& LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,k1,vR,(/ ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,           & 
& MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC,ZDR,ZER,UP,             & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,k1,vR,gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,             & 
& ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UC = UCinput 
UP = UPinput 
ZH = ZHinput 
ZM = ZMinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MVWLm = MVWLminput 
MVWLm2 = MVWLm2input 
MVWRm = MVWRminput 
MVWRm2 = MVWRm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZR = MVZRinput 
MVZR2 = MVZR2input 
End if 
cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFdFdAhT(gt1,gt2,gt3,YQ1,YQ2,UP,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)         & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFdFdhhT(gt1,gt2,gt3,YQ1,YQ2,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFuHpmL = 0._dp 
cplcFdFuHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFdFuHpmT(gt1,gt2,gt3,YQ1,YQ2,UC,ZDL,ZDR,ZUL,ZUR,cplcFdFuHpmL(gt1,gt2,gt3)& 
& ,cplcFdFuHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,gBL,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZRL = 0._dp 
cplcFdFdVZRR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZRT(gt1,gt2,gBL,g2,TW,cplcFdFdVZRL(gt1,gt2),cplcFdFdVZRR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWLmL = 0._dp 
cplcFdFuVWLmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWLmT(gt1,gt2,g2,ZDL,ZDR,ZUL,ZUR,PhiW,cplcFdFuVWLmL(gt1,gt2)        & 
& ,cplcFdFuVWLmR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWRmL = 0._dp 
cplcFdFuVWRmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWRmT(gt1,gt2,g2,ZDL,ZDR,ZUL,ZUR,PhiW,cplcFdFuVWRmL(gt1,gt2)        & 
& ,cplcFdFuVWRmR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fd_decays_2B
 
Subroutine CouplingsFor_hh_decays_2B(m_in,i1,MAhinput,MAh2input,MFdinput,             & 
& MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,Mhhinput,           & 
& Mhh2input,MHpminput,MHpm2input,MVWLminput,MVWLm2input,MVWRminput,MVWRm2input,          & 
& MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput,ZDRinput,            & 
& ZERinput,UPinput,ZURinput,ZDLinput,ZELinput,ZULinput,ZHinput,ZMinput,ZWinput,          & 
& ZZinput,gBLinput,g2input,g3input,LAM2input,LAM1input,RHO1input,RHO2input,              & 
& ALP2input,ALP1input,ALP3input,LAM5input,LAM6input,LAM3input,LAM4input,Yinput,          & 
& YQ1input,YQ2input,Ytinput,YLinput,YRinput,Muxinput,MU12input,MU22input,k1input,        & 
& vRinput,cplHiggsPP,cplHiggsGG,cplHiggsZZvirt,cplHiggsWWvirt,cplAhAhhh,cplAhhhVZ,       & 
& cplAhhhVZR,cplcFdFdhhL,cplcFdFdhhR,cplcFeFehhL,cplcFeFehhR,cplcFuFuhhL,cplcFuFuhhR,    & 
& cplFvFvhhL,cplFvFvhhR,cplhhhhhh,cplhhHpmcHpm,cplhhHpmcVWLm,cplhhHpmcVWRm,              & 
& cplhhcVWLmVWLm,cplhhcVWRmVWLm,cplhhcVWRmVWRm,cplhhVZVZ,cplhhVZVZR,cplhhVZRVZR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: gBLinput,g2input,g3input,LAM2input,LAM1input,RHO1input,RHO2input,ALP2input,           & 
& ALP1input,ALP3input,LAM5input,LAM6input,LAM3input,LAM4input,MU12input,MU22input,       & 
& k1input,vRinput

Complex(dp),Intent(in) :: Yinput(3,3),YQ1input(3,3),YQ2input(3,3),Ytinput(3,3),YLinput(3,3),YRinput(3,3),       & 
& Muxinput(3,3)

Real(dp),Intent(in) :: MAhinput(4),MAh2input(4),MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),           & 
& MFuinput(3),MFu2input(3),MFvinput(9),MFv2input(9),Mhhinput(4),Mhh2input(4),            & 
& MHpminput(4),MHpm2input(4),MVWLminput,MVWLm2input,MVWRminput,MVWRm2input,              & 
& MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput(4,4),UPinput(4,4),   & 
& ZHinput(4,4),ZZinput(3,3)

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& ZMinput(9,9),ZWinput(4,4)

Real(dp) :: gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,MU12,MU22,k1,vR

Complex(dp) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3),YL(3,3),YR(3,3),Mux(3,3)

Complex(dp),Intent(out) :: cplHiggsPP(4),cplHiggsGG(4),cplHiggsZZvirt(4),cplHiggsWWvirt(4),cplAhAhhh(4,4,4),     & 
& cplAhhhVZ(4,4),cplAhhhVZR(4,4),cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),cplcFeFehhL(3,3,4),& 
& cplcFeFehhR(3,3,4),cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),cplFvFvhhL(9,9,4),            & 
& cplFvFvhhR(9,9,4),cplhhhhhh(4,4,4),cplhhHpmcHpm(4,4,4),cplhhHpmcVWLm(4,4),             & 
& cplhhHpmcVWRm(4,4),cplhhcVWLmVWLm(4),cplhhcVWRmVWLm(4),cplhhcVWRmVWRm(4),              & 
& cplhhVZVZ(4),cplhhVZVZR(4),cplhhVZRVZR(4)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,               & 
& MVZR2,PhiW,TW,UC(4,4),UP(4,4),ZH(4,4),ZZ(3,3)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZM(9,9),ZW(4,4)

Complex(dp) :: ratFd(3),ratFe(3),ratFu(3),ratHpm(4),ratVWLm,ratVWRm

Complex(dp) :: ratPFd(3),ratPFe(3),ratPFu(3),ratPHpm(4),ratPVWLm,ratPVWRm

Complex(dp) :: coup 
Real(dp) :: vev, gNLO, NLOqcd, NNLOqcd, NNNLOqcd, AlphaSQ, AlphaSQhlf 
Real(dp) :: g1SM,g2SM,g3SM,vSM
Complex(dp) ::YuSM(3,3),YdSM(3,3),YeSM(3,3)
Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_hh_2B'
 
sinW2=1._dp-mW2/mZ2 
gBL = gBLinput 
g2 = g2input 
g3 = g3input 
LAM2 = LAM2input 
LAM1 = LAM1input 
RHO1 = RHO1input 
RHO2 = RHO2input 
ALP2 = ALP2input 
ALP1 = ALP1input 
ALP3 = ALP3input 
LAM5 = LAM5input 
LAM6 = LAM6input 
LAM3 = LAM3input 
LAM4 = LAM4input 
Y = Yinput 
YQ1 = YQ1input 
YQ2 = YQ2input 
Yt = Ytinput 
YL = YLinput 
YR = YRinput 
Mux = Muxinput 
MU12 = MU12input 
MU22 = MU22input 
k1 = k1input 
vR = vRinput 
Qin=sqrt(getRenormalizationScale()) 
! Run always SM gauge couplings if present 
  Qin=sqrt(getRenormalizationScale()) 
  Call RunSMohdm(m_in,deltaM,g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM) 
   ! SM pole masses needed for diphoton/digluon rate 
   ! But only top and W play a role. 
   vSM=1/Sqrt((G_F*Sqrt(2._dp))) ! On-Shell VEV needed for loop 
   YuSM(3,3)=sqrt(2._dp)*mf_u(3)/vSM  ! On-Shell top needed in loop 
   ! Other running values kept to get H->ff correct 
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,k1,vR,gBL,               & 
& g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,             & 
& YL,YR,Mux,MU12,MU22,.False.)

AlphaSQhlf=g3**2/(4._dp*Pi) 
AlphaSQ=g3**2/(4._dp*Pi) 
Call SolveTadpoleEquations(gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,              & 
& LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,k1,vR,(/ ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,           & 
& MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC,ZDR,ZER,UP,             & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,k1,vR,gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,             & 
& ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UC = UCinput 
UP = UPinput 
ZH = ZHinput 
ZM = ZMinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
cplAhAhhh = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
  Do gt3 = 1, 4
Call CouplingAhAhhhT(gt1,gt2,gt3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,             & 
& LAM6,LAM3,LAM4,k1,vR,ZH,UP,cplAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhhhhh = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
  Do gt3 = 1, 4
Call CouplinghhhhhhT(gt1,gt2,gt3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,             & 
& LAM6,LAM3,k1,vR,ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhHpmcHpm = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
  Do gt3 = 1, 4
Call CouplinghhHpmcHpmT(gt1,gt2,gt3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,               & 
& LAM5,LAM6,LAM3,k1,vR,ZH,UC,cplhhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhhhVZ = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
Call CouplingAhhhVZT(gt1,gt2,gBL,g2,ZH,UP,TW,cplAhhhVZ(gt1,gt2))

 End Do 
End Do 


cplAhhhVZR = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
Call CouplingAhhhVZRT(gt1,gt2,gBL,g2,ZH,UP,TW,cplAhhhVZR(gt1,gt2))

 End Do 
End Do 


cplhhHpmcVWLm = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
Call CouplinghhHpmcVWLmT(gt1,gt2,g2,ZH,UC,PhiW,cplhhHpmcVWLm(gt1,gt2))

 End Do 
End Do 


cplhhHpmcVWRm = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
Call CouplinghhHpmcVWRmT(gt1,gt2,g2,ZH,UC,PhiW,cplhhHpmcVWRm(gt1,gt2))

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


cplhhcVWRmVWRm = 0._dp 
Do gt1 = 1, 4
Call CouplinghhcVWRmVWRmT(gt1,g2,k1,vR,ZH,PhiW,cplhhcVWRmVWRm(gt1))

End Do 


cplhhVZVZ = 0._dp 
Do gt1 = 1, 4
Call CouplinghhVZVZT(gt1,gBL,g2,k1,vR,ZH,TW,cplhhVZVZ(gt1))

End Do 


cplhhVZVZR = 0._dp 
Do gt1 = 1, 4
Call CouplinghhVZVZRT(gt1,gBL,g2,k1,vR,ZH,TW,cplhhVZVZR(gt1))

End Do 


cplhhVZRVZR = 0._dp 
Do gt1 = 1, 4
Call CouplinghhVZRVZRT(gt1,gBL,g2,k1,vR,ZH,TW,cplhhVZRVZR(gt1))

End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFdFdhhT(gt1,gt2,gt3,YQ1,YQ2,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
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


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFuFuhhT(gt1,gt2,gt3,YQ1,YQ2,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
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


vev=1/Sqrt((G_F*Sqrt(2._dp)))
cplHiggsWWvirt = cplhhcVWLmVWLm/vev 
cplHiggsZZvirt = cplhhVZVZ*Sqrt(7._dp/12._dp-10._dp/9._dp*Sin(TW)**2+40._dp/27._dp*Sin(TW)**4)/vev 
 

!----------------------------------------------------
! Coupling ratios for HiggsBounds 
!----------------------------------------------------
 
Do i2=1, 3
rHB_S_S_Fd(i1,i2) = Abs((cplcFdFdhhL(i2,i2,i1)+cplcFdFdhhR(i2,i2,i1))*vev/(2._dp*MFd(i2))) 
rHB_S_P_Fd(i1,i2) = Abs((cplcFdFdhhL(i2,i2,i1)-cplcFdFdhhR(i2,i2,i1))*vev/(2._dp*MFd(i2))) 
End Do 
Do i2=1, 3
rHB_S_S_Fe(i1,i2) = Abs((cplcFeFehhL(i2,i2,i1)+cplcFeFehhR(i2,i2,i1))*vev/(2._dp*MFe(i2))) 
rHB_S_P_Fe(i1,i2) = Abs((cplcFeFehhL(i2,i2,i1)-cplcFeFehhR(i2,i2,i1))*vev/(2._dp*MFe(i2))) 
End Do 
Do i2=1, 3
rHB_S_S_Fu(i1,i2) = Abs((cplcFuFuhhL(i2,i2,i1)+cplcFuFuhhR(i2,i2,i1))*vev/(2._dp*MFu(i2))) 
rHB_S_P_Fu(i1,i2) = Abs((cplcFuFuhhL(i2,i2,i1)-cplcFuFuhhR(i2,i2,i1))*vev/(2._dp*MFu(i2))) 
End Do 
Do i2=1, 9
rHB_S_S_Fv(i1,i2) = Abs((cplFvFvhhL(i2,i2,i1)+cplFvFvhhR(i2,i2,i1))*vev/(2._dp*MFv(i2))) 
rHB_S_P_Fv(i1,i2) = Abs((cplFvFvhhL(i2,i2,i1)-cplFvFvhhR(i2,i2,i1))*vev/(2._dp*MFv(i2))) 
End Do 
rHB_S_VWLm(i1) = Abs(-0.5_dp*cplhhcVWLmVWLm(i1)*vev/MVWLm2) 
rHB_S_VZ(i1) = Abs(-0.5_dp*cplhhVZVZ(i1)*vev/MVZ2) 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MVWLm = MVWLminput 
MVWLm2 = MVWLm2input 
MVWRm = MVWRminput 
MVWRm2 = MVWRm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZR = MVZRinput 
MVZR2 = MVZR2input 
End if 
!----------------------------------------------------
! Scalar Higgs coupling ratios 
!----------------------------------------------------
 
Do i2=1, 3
ratFd(i2) = cplcFdFdhhL(i2,i2,i1)*1._dp*vev/MFd(i2) 
End Do 
Do i2=1, 3
ratFe(i2) = cplcFeFehhL(i2,i2,i1)*1._dp*vev/MFe(i2) 
End Do 
Do i2=1, 3
ratFu(i2) = cplcFuFuhhL(i2,i2,i1)*1._dp*vev/MFu(i2) 
End Do 
Do i2=1, 4
ratHpm(i2) = 0.5_dp*cplhhHpmcHpm(i1,i2,i2)*vev/MHpm2(i2) 
End Do 
ratVWLm = -0.5_dp*cplhhcVWLmVWLm(i1)*vev/MVWLm2 
ratVWRm = -0.5_dp*cplhhcVWRmVWRm(i1)*vev/MVWRm2 
If (HigherOrderDiboson) Then 
  gNLO = Sqrt(AlphaSQhlf*4._dp*Pi) 
Else  
  gNLO = -1._dp 
End if 
Call CoupHiggsToPhoton(m_in,i1,ratFd,ratFe,ratFu,ratHpm,ratVWLm,ratVWRm,              & 
& MFd,MFe,MFu,MHpm,MVWLm,MVWRm,gNLO,coup)

cplHiggsPP(i1) = coup*Alpha 
CoupHPP(i1) = coup 
Call CoupHiggsToPhotonSM(m_in,MFd,MFe,MFu,MHpm,MVWLm,MVWRm,gNLO,coup)

ratioPP(i1) = Abs(cplHiggsPP(i1)/(coup*Alpha)) 
  gNLO = -1._dp 
Call CoupHiggsToGluon(m_in,i1,ratFd,ratFu,MFd,MFu,gNLO,coup)

cplHiggsGG(i1) = coup*AlphaSQ 
CoupHGG(i1) = coup 
Call CoupHiggsToGluonSM(m_in,MFd,MFu,gNLO,coup)

If (HigherOrderDiboson) Then 
  NLOqcd = 12._dp*oo48pi2*(95._dp/4._dp - 7._dp/6._dp*NFlav(m_in))*g3**2 
  NNLOqcd = 0.0005785973353112832_dp*(410.52103034222284_dp - 52.326413200014684_dp*NFlav(m_in)+NFlav(m_in)**2 & 
 & +(2.6337085360233763_dp +0.7392866066030529_dp *NFlav(m_in))*Log(m_in**2/mf_u(3)**2))*g3**4 
  NNNLOqcd = 0.00017781840290519607_dp*(42.74607514668917_dp + 11.191050460173795_dp*Log(m_in**2/mf_u(3)**2) + Log(m_in**2/mf_u(3)**2)**2)*g3**6 
Else 
  NLOqcd = 0._dp 
  NNLOqcd = 0._dp 
  NNNLOqcd = 0._dp 
End if 
coup = coup*Sqrt(1._dp + NLOqcd+NNLOqcd+NNNLOqcd) 
cplHiggsGG(i1) = cplHiggsGG(i1)*Sqrt(1._dp + NLOqcd+NNLOqcd+NNNLOqcd) 
CoupHGG(i1)=cplHiggsGG(i1) 
ratioGG(i1) = Abs(cplHiggsGG(i1)/(coup*AlphaSQ)) 
If (i1.eq.1) Then 
CPL_A_H_Z = Abs(cplAhhhVZ**2/(g2**2/(cos(TW)**2*4._dp)))
CPL_H_H_Z = 0._dp 
End if 
cplAhAhhh = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
  Do gt3 = 1, 4
Call CouplingAhAhhhT(gt1,gt2,gt3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,             & 
& LAM6,LAM3,LAM4,k1,vR,ZH,UP,cplAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhhhhh = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
  Do gt3 = 1, 4
Call CouplinghhhhhhT(gt1,gt2,gt3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,             & 
& LAM6,LAM3,k1,vR,ZH,cplhhhhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhHpmcHpm = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
  Do gt3 = 1, 4
Call CouplinghhHpmcHpmT(gt1,gt2,gt3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,               & 
& LAM5,LAM6,LAM3,k1,vR,ZH,UC,cplhhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhhhVZ = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
Call CouplingAhhhVZT(gt1,gt2,gBL,g2,ZH,UP,TW,cplAhhhVZ(gt1,gt2))

 End Do 
End Do 


cplAhhhVZR = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
Call CouplingAhhhVZRT(gt1,gt2,gBL,g2,ZH,UP,TW,cplAhhhVZR(gt1,gt2))

 End Do 
End Do 


cplhhHpmcVWLm = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
Call CouplinghhHpmcVWLmT(gt1,gt2,g2,ZH,UC,PhiW,cplhhHpmcVWLm(gt1,gt2))

 End Do 
End Do 


cplhhHpmcVWRm = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
Call CouplinghhHpmcVWRmT(gt1,gt2,g2,ZH,UC,PhiW,cplhhHpmcVWRm(gt1,gt2))

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


cplhhcVWRmVWRm = 0._dp 
Do gt1 = 1, 4
Call CouplinghhcVWRmVWRmT(gt1,g2,k1,vR,ZH,PhiW,cplhhcVWRmVWRm(gt1))

End Do 


cplhhVZVZ = 0._dp 
Do gt1 = 1, 4
Call CouplinghhVZVZT(gt1,gBL,g2,k1,vR,ZH,TW,cplhhVZVZ(gt1))

End Do 


cplhhVZVZR = 0._dp 
Do gt1 = 1, 4
Call CouplinghhVZVZRT(gt1,gBL,g2,k1,vR,ZH,TW,cplhhVZVZR(gt1))

End Do 


cplhhVZRVZR = 0._dp 
Do gt1 = 1, 4
Call CouplinghhVZRVZRT(gt1,gBL,g2,k1,vR,ZH,TW,cplhhVZRVZR(gt1))

End Do 


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFdFdhhT(gt1,gt2,gt3,YQ1,YQ2,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
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


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFuFuhhT(gt1,gt2,gt3,YQ1,YQ2,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
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


Iname = Iname - 1 
 
End subroutine CouplingsFor_hh_decays_2B
 
Subroutine CouplingsFor_Fv_decays_2B(m_in,i1,MAhinput,MAh2input,MFdinput,             & 
& MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,Mhhinput,           & 
& Mhh2input,MHpminput,MHpm2input,MVWLminput,MVWLm2input,MVWRminput,MVWRm2input,          & 
& MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput,ZDRinput,            & 
& ZERinput,UPinput,ZURinput,ZDLinput,ZELinput,ZULinput,ZHinput,ZMinput,ZWinput,          & 
& ZZinput,gBLinput,g2input,g3input,LAM2input,LAM1input,RHO1input,RHO2input,              & 
& ALP2input,ALP1input,ALP3input,LAM5input,LAM6input,LAM3input,LAM4input,Yinput,          & 
& YQ1input,YQ2input,Ytinput,YLinput,YRinput,Muxinput,MU12input,MU22input,k1input,        & 
& vRinput,cplFvFvAhL,cplFvFvAhR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWLmL,cplFvFecVWLmR,   & 
& cplFvFecVWRmL,cplFvFecVWRmR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,               & 
& cplFvFvVZRL,cplFvFvVZRR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: gBLinput,g2input,g3input,LAM2input,LAM1input,RHO1input,RHO2input,ALP2input,           & 
& ALP1input,ALP3input,LAM5input,LAM6input,LAM3input,LAM4input,MU12input,MU22input,       & 
& k1input,vRinput

Complex(dp),Intent(in) :: Yinput(3,3),YQ1input(3,3),YQ2input(3,3),Ytinput(3,3),YLinput(3,3),YRinput(3,3),       & 
& Muxinput(3,3)

Real(dp),Intent(in) :: MAhinput(4),MAh2input(4),MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),           & 
& MFuinput(3),MFu2input(3),MFvinput(9),MFv2input(9),Mhhinput(4),Mhh2input(4),            & 
& MHpminput(4),MHpm2input(4),MVWLminput,MVWLm2input,MVWRminput,MVWRm2input,              & 
& MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput(4,4),UPinput(4,4),   & 
& ZHinput(4,4),ZZinput(3,3)

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& ZMinput(9,9),ZWinput(4,4)

Real(dp) :: gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,MU12,MU22,k1,vR

Complex(dp) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3),YL(3,3),YR(3,3),Mux(3,3)

Complex(dp),Intent(out) :: cplFvFvAhL(9,9,4),cplFvFvAhR(9,9,4),cplFvFecHpmL(9,3,4),cplFvFecHpmR(9,3,4),          & 
& cplFvFecVWLmL(9,3),cplFvFecVWLmR(9,3),cplFvFecVWRmL(9,3),cplFvFecVWRmR(9,3),           & 
& cplFvFvhhL(9,9,4),cplFvFvhhR(9,9,4),cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplFvFvVZRL(9,9),  & 
& cplFvFvVZRR(9,9)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,               & 
& MVZR2,PhiW,TW,UC(4,4),UP(4,4),ZH(4,4),ZZ(3,3)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZM(9,9),ZW(4,4)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fv_2B'
 
sinW2=1._dp-mW2/mZ2 
gBL = gBLinput 
g2 = g2input 
g3 = g3input 
LAM2 = LAM2input 
LAM1 = LAM1input 
RHO1 = RHO1input 
RHO2 = RHO2input 
ALP2 = ALP2input 
ALP1 = ALP1input 
ALP3 = ALP3input 
LAM5 = LAM5input 
LAM6 = LAM6input 
LAM3 = LAM3input 
LAM4 = LAM4input 
Y = Yinput 
YQ1 = YQ1input 
YQ2 = YQ2input 
Yt = Ytinput 
YL = YLinput 
YR = YRinput 
Mux = Muxinput 
MU12 = MU12input 
MU22 = MU22input 
k1 = k1input 
vR = vRinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,              & 
& LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,k1,vR,(/ ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,           & 
& MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC,ZDR,ZER,UP,             & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,k1,vR,gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,             & 
& ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UC = UCinput 
UP = UPinput 
ZH = ZHinput 
ZM = ZMinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MVWLm = MVWLminput 
MVWLm2 = MVWLm2input 
MVWRm = MVWRminput 
MVWRm2 = MVWRm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZR = MVZRinput 
MVZR2 = MVZR2input 
End if 
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


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingFvFvVZT(gt1,gt2,gBL,g2,ZM,TW,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZRL = 0._dp 
cplFvFvVZRR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingFvFvVZRT(gt1,gt2,gBL,g2,ZM,TW,cplFvFvVZRL(gt1,gt2),cplFvFvVZRR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fv_decays_2B
 
Subroutine CouplingsFor_VZ_decays_2B(m_in,i1,MAhinput,MAh2input,MFdinput,             & 
& MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,Mhhinput,           & 
& Mhh2input,MHpminput,MHpm2input,MVWLminput,MVWLm2input,MVWRminput,MVWRm2input,          & 
& MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput,ZDRinput,            & 
& ZERinput,UPinput,ZURinput,ZDLinput,ZELinput,ZULinput,ZHinput,ZMinput,ZWinput,          & 
& ZZinput,gBLinput,g2input,g3input,LAM2input,LAM1input,RHO1input,RHO2input,              & 
& ALP2input,ALP1input,ALP3input,LAM5input,LAM6input,LAM3input,LAM4input,Yinput,          & 
& YQ1input,YQ2input,Ytinput,YLinput,YRinput,Muxinput,MU12input,MU22input,k1input,        & 
& vRinput,cplAhhhVZ,cplcFdFdVZL,cplcFdFdVZR,cplcFeFeVZL,cplcFeFeVZR,cplcFuFuVZL,         & 
& cplcFuFuVZR,cplFvFvVZL,cplFvFvVZR,cplhhVZVZ,cplhhVZVZR,cplHpmcHpmVZ,cplHpmcVWLmVZ,     & 
& cplHpmcVWRmVZ,cplcVWLmVWLmVZ,cplcVWRmVWLmVZ,cplcVWRmVWRmVZ,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: gBLinput,g2input,g3input,LAM2input,LAM1input,RHO1input,RHO2input,ALP2input,           & 
& ALP1input,ALP3input,LAM5input,LAM6input,LAM3input,LAM4input,MU12input,MU22input,       & 
& k1input,vRinput

Complex(dp),Intent(in) :: Yinput(3,3),YQ1input(3,3),YQ2input(3,3),Ytinput(3,3),YLinput(3,3),YRinput(3,3),       & 
& Muxinput(3,3)

Real(dp),Intent(in) :: MAhinput(4),MAh2input(4),MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),           & 
& MFuinput(3),MFu2input(3),MFvinput(9),MFv2input(9),Mhhinput(4),Mhh2input(4),            & 
& MHpminput(4),MHpm2input(4),MVWLminput,MVWLm2input,MVWRminput,MVWRm2input,              & 
& MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput(4,4),UPinput(4,4),   & 
& ZHinput(4,4),ZZinput(3,3)

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& ZMinput(9,9),ZWinput(4,4)

Real(dp) :: gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,MU12,MU22,k1,vR

Complex(dp) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3),YL(3,3),YR(3,3),Mux(3,3)

Complex(dp),Intent(out) :: cplAhhhVZ(4,4),cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),   & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplhhVZVZ(4),        & 
& cplhhVZVZR(4),cplHpmcHpmVZ(4,4),cplHpmcVWLmVZ(4),cplHpmcVWRmVZ(4),cplcVWLmVWLmVZ,      & 
& cplcVWRmVWLmVZ,cplcVWRmVWRmVZ

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,               & 
& MVZR2,PhiW,TW,UC(4,4),UP(4,4),ZH(4,4),ZZ(3,3)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZM(9,9),ZW(4,4)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_VZ_2B'
 
sinW2=1._dp-mW2/mZ2 
gBL = gBLinput 
g2 = g2input 
g3 = g3input 
LAM2 = LAM2input 
LAM1 = LAM1input 
RHO1 = RHO1input 
RHO2 = RHO2input 
ALP2 = ALP2input 
ALP1 = ALP1input 
ALP3 = ALP3input 
LAM5 = LAM5input 
LAM6 = LAM6input 
LAM3 = LAM3input 
LAM4 = LAM4input 
Y = Yinput 
YQ1 = YQ1input 
YQ2 = YQ2input 
Yt = Ytinput 
YL = YLinput 
YR = YRinput 
Mux = Muxinput 
MU12 = MU12input 
MU22 = MU22input 
k1 = k1input 
vR = vRinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,              & 
& LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,k1,vR,(/ ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,           & 
& MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC,ZDR,ZER,UP,             & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,k1,vR,gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,             & 
& ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UC = UCinput 
UP = UPinput 
ZH = ZHinput 
ZM = ZMinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MVWLm = MVWLminput 
MVWLm2 = MVWLm2input 
MVWRm = MVWRminput 
MVWRm2 = MVWRm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZR = MVZRinput 
MVZR2 = MVZR2input 
End if 
cplAhhhVZ = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
Call CouplingAhhhVZT(gt1,gt2,gBL,g2,ZH,UP,TW,cplAhhhVZ(gt1,gt2))

 End Do 
End Do 


cplHpmcHpmVZ = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
Call CouplingHpmcHpmVZT(gt1,gt2,gBL,g2,UC,TW,cplHpmcHpmVZ(gt1,gt2))

 End Do 
End Do 


cplhhVZVZ = 0._dp 
Do gt1 = 1, 4
Call CouplinghhVZVZT(gt1,gBL,g2,k1,vR,ZH,TW,cplhhVZVZ(gt1))

End Do 


cplhhVZVZR = 0._dp 
Do gt1 = 1, 4
Call CouplinghhVZVZRT(gt1,gBL,g2,k1,vR,ZH,TW,cplhhVZVZR(gt1))

End Do 


cplHpmcVWLmVZ = 0._dp 
Do gt1 = 1, 4
Call CouplingHpmcVWLmVZT(gt1,gBL,g2,k1,vR,UC,TW,PhiW,cplHpmcVWLmVZ(gt1))

End Do 


cplHpmcVWRmVZ = 0._dp 
Do gt1 = 1, 4
Call CouplingHpmcVWRmVZT(gt1,gBL,g2,k1,vR,UC,TW,PhiW,cplHpmcVWRmVZ(gt1))

End Do 


cplcVWLmVWLmVZ = 0._dp 
Call CouplingcVWLmVWLmVZT(g2,TW,PhiW,cplcVWLmVWLmVZ)



cplcVWRmVWLmVZ = 0._dp 
Call CouplingcVWRmVWLmVZT(g2,TW,PhiW,cplcVWRmVWLmVZ)



cplcVWRmVWRmVZ = 0._dp 
Call CouplingcVWRmVWRmVZT(g2,TW,PhiW,cplcVWRmVWRmVZ)



cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,gBL,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,gBL,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,gBL,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingFvFvVZT(gt1,gt2,gBL,g2,ZM,TW,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_VZ_decays_2B
 
Subroutine CouplingsFor_VZR_decays_2B(m_in,i1,MAhinput,MAh2input,MFdinput,            & 
& MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,Mhhinput,           & 
& Mhh2input,MHpminput,MHpm2input,MVWLminput,MVWLm2input,MVWRminput,MVWRm2input,          & 
& MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput,ZDRinput,            & 
& ZERinput,UPinput,ZURinput,ZDLinput,ZELinput,ZULinput,ZHinput,ZMinput,ZWinput,          & 
& ZZinput,gBLinput,g2input,g3input,LAM2input,LAM1input,RHO1input,RHO2input,              & 
& ALP2input,ALP1input,ALP3input,LAM5input,LAM6input,LAM3input,LAM4input,Yinput,          & 
& YQ1input,YQ2input,Ytinput,YLinput,YRinput,Muxinput,MU12input,MU22input,k1input,        & 
& vRinput,cplAhhhVZR,cplcFdFdVZRL,cplcFdFdVZRR,cplcFeFeVZRL,cplcFeFeVZRR,cplcFuFuVZRL,   & 
& cplcFuFuVZRR,cplFvFvVZRL,cplFvFvVZRR,cplhhVZVZR,cplhhVZRVZR,cplHpmcHpmVZR,             & 
& cplHpmcVWLmVZR,cplHpmcVWRmVZR,cplcVWLmVWLmVZR,cplcVWRmVWLmVZR,cplcVWRmVWRmVZR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: gBLinput,g2input,g3input,LAM2input,LAM1input,RHO1input,RHO2input,ALP2input,           & 
& ALP1input,ALP3input,LAM5input,LAM6input,LAM3input,LAM4input,MU12input,MU22input,       & 
& k1input,vRinput

Complex(dp),Intent(in) :: Yinput(3,3),YQ1input(3,3),YQ2input(3,3),Ytinput(3,3),YLinput(3,3),YRinput(3,3),       & 
& Muxinput(3,3)

Real(dp),Intent(in) :: MAhinput(4),MAh2input(4),MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),           & 
& MFuinput(3),MFu2input(3),MFvinput(9),MFv2input(9),Mhhinput(4),Mhh2input(4),            & 
& MHpminput(4),MHpm2input(4),MVWLminput,MVWLm2input,MVWRminput,MVWRm2input,              & 
& MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput(4,4),UPinput(4,4),   & 
& ZHinput(4,4),ZZinput(3,3)

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& ZMinput(9,9),ZWinput(4,4)

Real(dp) :: gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,MU12,MU22,k1,vR

Complex(dp) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3),YL(3,3),YR(3,3),Mux(3,3)

Complex(dp),Intent(out) :: cplAhhhVZR(4,4),cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),& 
& cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),cplFvFvVZRL(9,9),cplFvFvVZRR(9,9),cplhhVZVZR(4),   & 
& cplhhVZRVZR(4),cplHpmcHpmVZR(4,4),cplHpmcVWLmVZR(4),cplHpmcVWRmVZR(4),cplcVWLmVWLmVZR, & 
& cplcVWRmVWLmVZR,cplcVWRmVWRmVZR

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,               & 
& MVZR2,PhiW,TW,UC(4,4),UP(4,4),ZH(4,4),ZZ(3,3)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZM(9,9),ZW(4,4)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_VZR_2B'
 
sinW2=1._dp-mW2/mZ2 
gBL = gBLinput 
g2 = g2input 
g3 = g3input 
LAM2 = LAM2input 
LAM1 = LAM1input 
RHO1 = RHO1input 
RHO2 = RHO2input 
ALP2 = ALP2input 
ALP1 = ALP1input 
ALP3 = ALP3input 
LAM5 = LAM5input 
LAM6 = LAM6input 
LAM3 = LAM3input 
LAM4 = LAM4input 
Y = Yinput 
YQ1 = YQ1input 
YQ2 = YQ2input 
Yt = Ytinput 
YL = YLinput 
YR = YRinput 
Mux = Muxinput 
MU12 = MU12input 
MU22 = MU22input 
k1 = k1input 
vR = vRinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,              & 
& LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,k1,vR,(/ ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,           & 
& MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC,ZDR,ZER,UP,             & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,k1,vR,gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,             & 
& ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UC = UCinput 
UP = UPinput 
ZH = ZHinput 
ZM = ZMinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MVWLm = MVWLminput 
MVWLm2 = MVWLm2input 
MVWRm = MVWRminput 
MVWRm2 = MVWRm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZR = MVZRinput 
MVZR2 = MVZR2input 
End if 
cplAhhhVZR = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
Call CouplingAhhhVZRT(gt1,gt2,gBL,g2,ZH,UP,TW,cplAhhhVZR(gt1,gt2))

 End Do 
End Do 


cplHpmcHpmVZR = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
Call CouplingHpmcHpmVZRT(gt1,gt2,gBL,g2,UC,TW,cplHpmcHpmVZR(gt1,gt2))

 End Do 
End Do 


cplhhVZVZR = 0._dp 
Do gt1 = 1, 4
Call CouplinghhVZVZRT(gt1,gBL,g2,k1,vR,ZH,TW,cplhhVZVZR(gt1))

End Do 


cplhhVZRVZR = 0._dp 
Do gt1 = 1, 4
Call CouplinghhVZRVZRT(gt1,gBL,g2,k1,vR,ZH,TW,cplhhVZRVZR(gt1))

End Do 


cplHpmcVWLmVZR = 0._dp 
Do gt1 = 1, 4
Call CouplingHpmcVWLmVZRT(gt1,gBL,g2,k1,vR,UC,TW,PhiW,cplHpmcVWLmVZR(gt1))

End Do 


cplHpmcVWRmVZR = 0._dp 
Do gt1 = 1, 4
Call CouplingHpmcVWRmVZRT(gt1,gBL,g2,k1,vR,UC,TW,PhiW,cplHpmcVWRmVZR(gt1))

End Do 


cplcVWLmVWLmVZR = 0._dp 
Call CouplingcVWLmVWLmVZRT(g2,TW,PhiW,cplcVWLmVWLmVZR)



cplcVWRmVWLmVZR = 0._dp 
Call CouplingcVWRmVWLmVZRT(g2,TW,PhiW,cplcVWRmVWLmVZR)



cplcVWRmVWRmVZR = 0._dp 
Call CouplingcVWRmVWRmVZRT(g2,TW,PhiW,cplcVWRmVWRmVZR)



cplcFdFdVZRL = 0._dp 
cplcFdFdVZRR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZRT(gt1,gt2,gBL,g2,TW,cplcFdFdVZRL(gt1,gt2),cplcFdFdVZRR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZRL = 0._dp 
cplcFeFeVZRR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZRT(gt1,gt2,gBL,g2,TW,cplcFeFeVZRL(gt1,gt2),cplcFeFeVZRR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZRL = 0._dp 
cplcFuFuVZRR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZRT(gt1,gt2,gBL,g2,TW,cplcFuFuVZRL(gt1,gt2),cplcFuFuVZRR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZRL = 0._dp 
cplFvFvVZRR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingFvFvVZRT(gt1,gt2,gBL,g2,ZM,TW,cplFvFvVZRL(gt1,gt2),cplFvFvVZRR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_VZR_decays_2B
 
Subroutine CouplingsFor_Hpm_decays_2B(m_in,i1,MAhinput,MAh2input,MFdinput,            & 
& MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,Mhhinput,           & 
& Mhh2input,MHpminput,MHpm2input,MVWLminput,MVWLm2input,MVWRminput,MVWRm2input,          & 
& MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput,ZDRinput,            & 
& ZERinput,UPinput,ZURinput,ZDLinput,ZELinput,ZULinput,ZHinput,ZMinput,ZWinput,          & 
& ZZinput,gBLinput,g2input,g3input,LAM2input,LAM1input,RHO1input,RHO2input,              & 
& ALP2input,ALP1input,ALP3input,LAM5input,LAM6input,LAM3input,LAM4input,Yinput,          & 
& YQ1input,YQ2input,Ytinput,YLinput,YRinput,Muxinput,MU12input,MU22input,k1input,        & 
& vRinput,cplAhHpmcHpm,cplAhcHpmVWLm,cplAhcHpmVWRm,cplcFuFdcHpmL,cplcFuFdcHpmR,          & 
& cplFvFecHpmL,cplFvFecHpmR,cplhhHpmcHpm,cplhhcHpmVWLm,cplhhcHpmVWRm,cplHpmcHpmVZ,       & 
& cplHpmcHpmVZR,cplcHpmVWLmVZ,cplcHpmVWLmVZR,cplcHpmVWRmVZ,cplcHpmVWRmVZR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: gBLinput,g2input,g3input,LAM2input,LAM1input,RHO1input,RHO2input,ALP2input,           & 
& ALP1input,ALP3input,LAM5input,LAM6input,LAM3input,LAM4input,MU12input,MU22input,       & 
& k1input,vRinput

Complex(dp),Intent(in) :: Yinput(3,3),YQ1input(3,3),YQ2input(3,3),Ytinput(3,3),YLinput(3,3),YRinput(3,3),       & 
& Muxinput(3,3)

Real(dp),Intent(in) :: MAhinput(4),MAh2input(4),MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),           & 
& MFuinput(3),MFu2input(3),MFvinput(9),MFv2input(9),Mhhinput(4),Mhh2input(4),            & 
& MHpminput(4),MHpm2input(4),MVWLminput,MVWLm2input,MVWRminput,MVWRm2input,              & 
& MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput(4,4),UPinput(4,4),   & 
& ZHinput(4,4),ZZinput(3,3)

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& ZMinput(9,9),ZWinput(4,4)

Real(dp) :: gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,MU12,MU22,k1,vR

Complex(dp) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3),YL(3,3),YR(3,3),Mux(3,3)

Complex(dp),Intent(out) :: cplAhHpmcHpm(4,4,4),cplAhcHpmVWLm(4,4),cplAhcHpmVWRm(4,4),cplcFuFdcHpmL(3,3,4),       & 
& cplcFuFdcHpmR(3,3,4),cplFvFecHpmL(9,3,4),cplFvFecHpmR(9,3,4),cplhhHpmcHpm(4,4,4),      & 
& cplhhcHpmVWLm(4,4),cplhhcHpmVWRm(4,4),cplHpmcHpmVZ(4,4),cplHpmcHpmVZR(4,4),            & 
& cplcHpmVWLmVZ(4),cplcHpmVWLmVZR(4),cplcHpmVWRmVZ(4),cplcHpmVWRmVZR(4)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,               & 
& MVZR2,PhiW,TW,UC(4,4),UP(4,4),ZH(4,4),ZZ(3,3)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZM(9,9),ZW(4,4)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Hpm_2B'
 
sinW2=1._dp-mW2/mZ2 
gBL = gBLinput 
g2 = g2input 
g3 = g3input 
LAM2 = LAM2input 
LAM1 = LAM1input 
RHO1 = RHO1input 
RHO2 = RHO2input 
ALP2 = ALP2input 
ALP1 = ALP1input 
ALP3 = ALP3input 
LAM5 = LAM5input 
LAM6 = LAM6input 
LAM3 = LAM3input 
LAM4 = LAM4input 
Y = Yinput 
YQ1 = YQ1input 
YQ2 = YQ2input 
Yt = Ytinput 
YL = YLinput 
YR = YRinput 
Mux = Muxinput 
MU12 = MU12input 
MU22 = MU22input 
k1 = k1input 
vR = vRinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,              & 
& LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,k1,vR,(/ ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,           & 
& MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC,ZDR,ZER,UP,             & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,k1,vR,gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,             & 
& ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UC = UCinput 
UP = UPinput 
ZH = ZHinput 
ZM = ZMinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MVWLm = MVWLminput 
MVWLm2 = MVWLm2input 
MVWRm = MVWRminput 
MVWRm2 = MVWRm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZR = MVZRinput 
MVZR2 = MVZR2input 
End if 
cplAhHpmcHpm = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
  Do gt3 = 1, 4
Call CouplingAhHpmcHpmT(gt1,gt2,gt3,LAM2,ALP2,ALP3,LAM5,LAM6,LAM4,k1,vR,              & 
& UP,UC,cplAhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplhhHpmcHpm = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
  Do gt3 = 1, 4
Call CouplinghhHpmcHpmT(gt1,gt2,gt3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,               & 
& LAM5,LAM6,LAM3,k1,vR,ZH,UC,cplhhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhcHpmVWLm = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
Call CouplingAhcHpmVWLmT(gt1,gt2,g2,UP,UC,PhiW,cplAhcHpmVWLm(gt1,gt2))

 End Do 
End Do 


cplAhcHpmVWRm = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
Call CouplingAhcHpmVWRmT(gt1,gt2,g2,UP,UC,PhiW,cplAhcHpmVWRm(gt1,gt2))

 End Do 
End Do 


cplhhcHpmVWLm = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
Call CouplinghhcHpmVWLmT(gt1,gt2,g2,ZH,UC,PhiW,cplhhcHpmVWLm(gt1,gt2))

 End Do 
End Do 


cplhhcHpmVWRm = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
Call CouplinghhcHpmVWRmT(gt1,gt2,g2,ZH,UC,PhiW,cplhhcHpmVWRm(gt1,gt2))

 End Do 
End Do 


cplHpmcHpmVZ = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
Call CouplingHpmcHpmVZT(gt1,gt2,gBL,g2,UC,TW,cplHpmcHpmVZ(gt1,gt2))

 End Do 
End Do 


cplHpmcHpmVZR = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
Call CouplingHpmcHpmVZRT(gt1,gt2,gBL,g2,UC,TW,cplHpmcHpmVZR(gt1,gt2))

 End Do 
End Do 


cplcHpmVWLmVZ = 0._dp 
Do gt1 = 1, 4
Call CouplingcHpmVWLmVZT(gt1,gBL,g2,k1,vR,UC,TW,PhiW,cplcHpmVWLmVZ(gt1))

End Do 


cplcHpmVWLmVZR = 0._dp 
Do gt1 = 1, 4
Call CouplingcHpmVWLmVZRT(gt1,gBL,g2,k1,vR,UC,TW,PhiW,cplcHpmVWLmVZR(gt1))

End Do 


cplcHpmVWRmVZ = 0._dp 
Do gt1 = 1, 4
Call CouplingcHpmVWRmVZT(gt1,gBL,g2,k1,vR,UC,TW,PhiW,cplcHpmVWRmVZ(gt1))

End Do 


cplcHpmVWRmVZR = 0._dp 
Do gt1 = 1, 4
Call CouplingcHpmVWRmVZRT(gt1,gBL,g2,k1,vR,UC,TW,PhiW,cplcHpmVWRmVZR(gt1))

End Do 


cplcFuFdcHpmL = 0._dp 
cplcFuFdcHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFuFdcHpmT(gt1,gt2,gt3,YQ1,YQ2,UC,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHpmL(gt1,gt2,gt3)& 
& ,cplcFuFdcHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
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


Iname = Iname - 1 
 
End subroutine CouplingsFor_Hpm_decays_2B
 
Subroutine CouplingsFor_Ah_decays_2B(m_in,i1,MAhinput,MAh2input,MFdinput,             & 
& MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,Mhhinput,           & 
& Mhh2input,MHpminput,MHpm2input,MVWLminput,MVWLm2input,MVWRminput,MVWRm2input,          & 
& MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput,ZDRinput,            & 
& ZERinput,UPinput,ZURinput,ZDLinput,ZELinput,ZULinput,ZHinput,ZMinput,ZWinput,          & 
& ZZinput,gBLinput,g2input,g3input,LAM2input,LAM1input,RHO1input,RHO2input,              & 
& ALP2input,ALP1input,ALP3input,LAM5input,LAM6input,LAM3input,LAM4input,Yinput,          & 
& YQ1input,YQ2input,Ytinput,YLinput,YRinput,Muxinput,MU12input,MU22input,k1input,        & 
& vRinput,cplPseudoHiggsPP,cplPseudoHiggsGG,cplAhAhhh,cplcFdFdAhL,cplcFdFdAhR,           & 
& cplcFeFeAhL,cplcFeFeAhR,cplcFuFuAhL,cplcFuFuAhR,cplFvFvAhL,cplFvFvAhR,cplAhhhVZ,       & 
& cplAhhhVZR,cplAhHpmcHpm,cplAhHpmcVWLm,cplAhHpmcVWRm,cplAhcVWRmVWLm,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: gBLinput,g2input,g3input,LAM2input,LAM1input,RHO1input,RHO2input,ALP2input,           & 
& ALP1input,ALP3input,LAM5input,LAM6input,LAM3input,LAM4input,MU12input,MU22input,       & 
& k1input,vRinput

Complex(dp),Intent(in) :: Yinput(3,3),YQ1input(3,3),YQ2input(3,3),Ytinput(3,3),YLinput(3,3),YRinput(3,3),       & 
& Muxinput(3,3)

Real(dp),Intent(in) :: MAhinput(4),MAh2input(4),MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),           & 
& MFuinput(3),MFu2input(3),MFvinput(9),MFv2input(9),Mhhinput(4),Mhh2input(4),            & 
& MHpminput(4),MHpm2input(4),MVWLminput,MVWLm2input,MVWRminput,MVWRm2input,              & 
& MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput(4,4),UPinput(4,4),   & 
& ZHinput(4,4),ZZinput(3,3)

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& ZMinput(9,9),ZWinput(4,4)

Real(dp) :: gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,MU12,MU22,k1,vR

Complex(dp) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3),YL(3,3),YR(3,3),Mux(3,3)

Complex(dp),Intent(out) :: cplPseudoHiggsPP(4),cplPseudoHiggsGG(4),cplAhAhhh(4,4,4),cplcFdFdAhL(3,3,4),          & 
& cplcFdFdAhR(3,3,4),cplcFeFeAhL(3,3,4),cplcFeFeAhR(3,3,4),cplcFuFuAhL(3,3,4),           & 
& cplcFuFuAhR(3,3,4),cplFvFvAhL(9,9,4),cplFvFvAhR(9,9,4),cplAhhhVZ(4,4),cplAhhhVZR(4,4), & 
& cplAhHpmcHpm(4,4,4),cplAhHpmcVWLm(4,4),cplAhHpmcVWRm(4,4),cplAhcVWRmVWLm(4)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,               & 
& MVZR2,PhiW,TW,UC(4,4),UP(4,4),ZH(4,4),ZZ(3,3)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZM(9,9),ZW(4,4)

Complex(dp) :: ratFd(3),ratFe(3),ratFu(3),ratHpm(4),ratVWLm,ratVWRm

Complex(dp) :: ratPFd(3),ratPFe(3),ratPFu(3),ratPHpm(4),ratPVWLm,ratPVWRm

Complex(dp) :: coup 
Real(dp) :: vev, gNLO, NLOqcd, NNLOqcd, NNNLOqcd, AlphaSQ, AlphaSQhlf 
Real(dp) :: g1SM,g2SM,g3SM,vSM
Complex(dp) ::YuSM(3,3),YdSM(3,3),YeSM(3,3)
Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Ah_2B'
 
sinW2=1._dp-mW2/mZ2 
gBL = gBLinput 
g2 = g2input 
g3 = g3input 
LAM2 = LAM2input 
LAM1 = LAM1input 
RHO1 = RHO1input 
RHO2 = RHO2input 
ALP2 = ALP2input 
ALP1 = ALP1input 
ALP3 = ALP3input 
LAM5 = LAM5input 
LAM6 = LAM6input 
LAM3 = LAM3input 
LAM4 = LAM4input 
Y = Yinput 
YQ1 = YQ1input 
YQ2 = YQ2input 
Yt = Ytinput 
YL = YLinput 
YR = YRinput 
Mux = Muxinput 
MU12 = MU12input 
MU22 = MU22input 
k1 = k1input 
vR = vRinput 
Qin=sqrt(getRenormalizationScale()) 
! Run always SM gauge couplings if present 
  Qin=sqrt(getRenormalizationScale()) 
  Call RunSMohdm(m_in,deltaM,g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM) 
   ! SM pole masses needed for diphoton/digluon rate 
   ! But only top and W play a role. 
   vSM=1/Sqrt((G_F*Sqrt(2._dp))) ! On-Shell VEV needed for loop 
   YuSM(3,3)=sqrt(2._dp)*mf_u(3)/vSM  ! On-Shell top needed in loop 
   ! Other running values kept to get H->ff correct 
Call SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,k1,vR,gBL,               & 
& g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,             & 
& YL,YR,Mux,MU12,MU22,.False.)

AlphaSQhlf=g3**2/(4._dp*Pi) 
AlphaSQ=g3**2/(4._dp*Pi) 
Call SolveTadpoleEquations(gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,              & 
& LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,k1,vR,(/ ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,           & 
& MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC,ZDR,ZER,UP,             & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,k1,vR,gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,             & 
& ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UC = UCinput 
UP = UPinput 
ZH = ZHinput 
ZM = ZMinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
cplAhAhhh = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
  Do gt3 = 1, 4
Call CouplingAhAhhhT(gt1,gt2,gt3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,             & 
& LAM6,LAM3,LAM4,k1,vR,ZH,UP,cplAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhHpmcHpm = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
  Do gt3 = 1, 4
Call CouplingAhHpmcHpmT(gt1,gt2,gt3,LAM2,ALP2,ALP3,LAM5,LAM6,LAM4,k1,vR,              & 
& UP,UC,cplAhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhhhVZ = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
Call CouplingAhhhVZT(gt1,gt2,gBL,g2,ZH,UP,TW,cplAhhhVZ(gt1,gt2))

 End Do 
End Do 


cplAhhhVZR = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
Call CouplingAhhhVZRT(gt1,gt2,gBL,g2,ZH,UP,TW,cplAhhhVZR(gt1,gt2))

 End Do 
End Do 


cplAhHpmcVWLm = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
Call CouplingAhHpmcVWLmT(gt1,gt2,g2,UP,UC,PhiW,cplAhHpmcVWLm(gt1,gt2))

 End Do 
End Do 


cplAhHpmcVWRm = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
Call CouplingAhHpmcVWRmT(gt1,gt2,g2,UP,UC,PhiW,cplAhHpmcVWRm(gt1,gt2))

 End Do 
End Do 


cplAhcVWRmVWLm = 0._dp 
Do gt1 = 1, 4
Call CouplingAhcVWRmVWLmT(gt1,g2,k1,UP,cplAhcVWRmVWLm(gt1))

End Do 


cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFdFdAhT(gt1,gt2,gt3,YQ1,YQ2,UP,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)         & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


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


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFuFuAhT(gt1,gt2,gt3,YQ1,YQ2,UP,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)         & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

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


vev=1/Sqrt((G_F*Sqrt(2._dp)))
!----------------------------------------------------
! Coupling ratios for HiggsBounds 
!----------------------------------------------------
 
Do i2=1, 3
rHB_P_S_Fd(i1,i2) = 1._dp*Abs((cplcFdFdAhL(i2,i2,i1)+cplcFdFdAhR(i2,i2,i1))*vev/(2._dp*MFd(i2))) 
rHB_P_P_Fd(i1,i2) = 1._dp*Abs((cplcFdFdAhL(i2,i2,i1)-cplcFdFdAhR(i2,i2,i1))*vev/(2._dp*MFd(i2))) 
End Do 
Do i2=1, 3
rHB_P_S_Fe(i1,i2) = 1._dp*Abs((cplcFeFeAhL(i2,i2,i1)+cplcFeFeAhR(i2,i2,i1))*vev/(2._dp*MFe(i2))) 
rHB_P_P_Fe(i1,i2) = 1._dp*Abs((cplcFeFeAhL(i2,i2,i1)-cplcFeFeAhR(i2,i2,i1))*vev/(2._dp*MFe(i2))) 
End Do 
Do i2=1, 3
rHB_P_S_Fu(i1,i2) = 1._dp*Abs((cplcFuFuAhL(i2,i2,i1)+cplcFuFuAhR(i2,i2,i1))*vev/(2._dp*MFu(i2))) 
rHB_P_P_Fu(i1,i2) = 1._dp*Abs((cplcFuFuAhL(i2,i2,i1)-cplcFuFuAhR(i2,i2,i1))*vev/(2._dp*MFu(i2))) 
End Do 
Do i2=1, 9
rHB_P_S_Fv(i1,i2) = 1._dp*Abs((cplFvFvAhL(i2,i2,i1)+cplFvFvAhR(i2,i2,i1))*vev/(2._dp*MFv(i2))) 
rHB_P_P_Fv(i1,i2) = 1._dp*Abs((cplFvFvAhL(i2,i2,i1)-cplFvFvAhR(i2,i2,i1))*vev/(2._dp*MFv(i2))) 
End Do 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MVWLm = MVWLminput 
MVWLm2 = MVWLm2input 
MVWRm = MVWRminput 
MVWRm2 = MVWRm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZR = MVZRinput 
MVZR2 = MVZR2input 
End if 
!----------------------------------------------------
! Pseudo Scalar Higgs coupling ratios 
!----------------------------------------------------
 
Do i2=1, 3
ratPFd(i2) = cplcFdFdAhL(i2,i2,i1)*1._dp*vev/MFd(i2) 
End Do 
Do i2=1, 3
ratPFe(i2) = cplcFeFeAhL(i2,i2,i1)*1._dp*vev/MFe(i2) 
End Do 
Do i2=1, 3
ratPFu(i2) = cplcFuFuAhL(i2,i2,i1)*1._dp*vev/MFu(i2) 
End Do 
Do i2=1, 4
ratPHpm(i2) = 0.5_dp*cplAhHpmcHpm(i1,i2,i2)*vev/MHpm2(i2) 
End Do 
ratPVWLm = 0._dp 
ratPVWRm = 0._dp 
If (HigherOrderDiboson) Then 
  gNLO = g3 
Else  
  gNLO = -1._dp 
End if 
Call CoupPseudoHiggsToPhoton(m_in,i1,ratPFd,ratPFe,ratPFu,ratPHpm,ratPVWLm,           & 
& ratPVWRm,MFd,MFe,MFu,MHpm,MVWLm,MVWRm,gNLO,coup)

cplPseudoHiggsPP(i1) = 2._dp*coup*Alpha 
CoupAPP(i1) = 2._dp*coup 
Call CoupHiggsToPhotonSM(m_in,MFd,MFe,MFu,MHpm,MVWLm,MVWRm,gNLO,coup)

ratioPPP(i1) = Abs(cplPseudoHiggsPP(i1)/(coup*oo4pi*(1._dp-mW2/mZ2)*g2**2)) 
  gNLO = -1._dp 
Call CoupPseudoHiggsToGluon(m_in,i1,ratPFd,ratPFu,MFd,MFu,gNLO,coup)

If (HigherOrderDiboson) Then 
  NLOqcd = 12._dp*oo48pi2*(97._dp/4._dp - 7._dp/6._dp*NFlav(m_in))*g3**2 
  NNLOqcd = (171.544_dp +  5._dp*Log(m_in**2/mf_u(3)**2))*g3**4/(4._dp*Pi**2)**2 
  NNNLOqcd = 0._dp 
Else 
  NLOqcd = 0._dp 
  NNLOqcd = 0._dp 
  NNNLOqcd = 0._dp 
End if 
cplPseudoHiggsGG(i1) = 2._dp*coup*AlphaSQ*Sqrt(1._dp + NLOqcd+NNLOqcd+NNNLOqcd) 
CoupAGG(i1) = 2._dp*coup*AlphaSQ*Sqrt(1._dp + NLOqcd+NNLOqcd+NNNLOqcd) 
Call CoupHiggsToGluonSM(m_in,MFd,MFu,gNLO,coup)

coup = coup*Sqrt(1._dp + NLOqcd+NNLOqcd+NNNLOqcd) 
ratioPGG(i1) = Abs(cplPseudoHiggsGG(i1)/(coup*AlphaSQ)) 

If (i1.eq.3) Then 
CPL_A_A_Z = 0._dp 
End if 
cplAhAhhh = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
  Do gt3 = 1, 4
Call CouplingAhAhhhT(gt1,gt2,gt3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,             & 
& LAM6,LAM3,LAM4,k1,vR,ZH,UP,cplAhAhhh(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhHpmcHpm = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
  Do gt3 = 1, 4
Call CouplingAhHpmcHpmT(gt1,gt2,gt3,LAM2,ALP2,ALP3,LAM5,LAM6,LAM4,k1,vR,              & 
& UP,UC,cplAhHpmcHpm(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplAhhhVZ = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
Call CouplingAhhhVZT(gt1,gt2,gBL,g2,ZH,UP,TW,cplAhhhVZ(gt1,gt2))

 End Do 
End Do 


cplAhhhVZR = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
Call CouplingAhhhVZRT(gt1,gt2,gBL,g2,ZH,UP,TW,cplAhhhVZR(gt1,gt2))

 End Do 
End Do 


cplAhHpmcVWLm = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
Call CouplingAhHpmcVWLmT(gt1,gt2,g2,UP,UC,PhiW,cplAhHpmcVWLm(gt1,gt2))

 End Do 
End Do 


cplAhHpmcVWRm = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
Call CouplingAhHpmcVWRmT(gt1,gt2,g2,UP,UC,PhiW,cplAhHpmcVWRm(gt1,gt2))

 End Do 
End Do 


cplAhcVWRmVWLm = 0._dp 
Do gt1 = 1, 4
Call CouplingAhcVWRmVWLmT(gt1,g2,k1,UP,cplAhcVWRmVWLm(gt1))

End Do 


cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFdFdAhT(gt1,gt2,gt3,YQ1,YQ2,UP,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)         & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


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


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFuFuAhT(gt1,gt2,gt3,YQ1,YQ2,UP,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)         & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

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


Iname = Iname - 1 
 
End subroutine CouplingsFor_Ah_decays_2B
 
Subroutine CouplingsFor_VWLm_decays_2B(m_in,i1,MAhinput,MAh2input,MFdinput,           & 
& MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,Mhhinput,           & 
& Mhh2input,MHpminput,MHpm2input,MVWLminput,MVWLm2input,MVWRminput,MVWRm2input,          & 
& MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput,ZDRinput,            & 
& ZERinput,UPinput,ZURinput,ZDLinput,ZELinput,ZULinput,ZHinput,ZMinput,ZWinput,          & 
& ZZinput,gBLinput,g2input,g3input,LAM2input,LAM1input,RHO1input,RHO2input,              & 
& ALP2input,ALP1input,ALP3input,LAM5input,LAM6input,LAM3input,LAM4input,Yinput,          & 
& YQ1input,YQ2input,Ytinput,YLinput,YRinput,Muxinput,MU12input,MU22input,k1input,        & 
& vRinput,cplAhHpmcVWLm,cplAhcVWLmVWRm,cplcFuFdcVWLmL,cplcFuFdcVWLmR,cplFvFecVWLmL,      & 
& cplFvFecVWLmR,cplhhHpmcVWLm,cplhhcVWLmVWLm,cplhhcVWLmVWRm,cplHpmcVWLmVZ,               & 
& cplHpmcVWLmVZR,cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,cplcVWLmVWRmVZ,cplcVWLmVWRmVZR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: gBLinput,g2input,g3input,LAM2input,LAM1input,RHO1input,RHO2input,ALP2input,           & 
& ALP1input,ALP3input,LAM5input,LAM6input,LAM3input,LAM4input,MU12input,MU22input,       & 
& k1input,vRinput

Complex(dp),Intent(in) :: Yinput(3,3),YQ1input(3,3),YQ2input(3,3),Ytinput(3,3),YLinput(3,3),YRinput(3,3),       & 
& Muxinput(3,3)

Real(dp),Intent(in) :: MAhinput(4),MAh2input(4),MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),           & 
& MFuinput(3),MFu2input(3),MFvinput(9),MFv2input(9),Mhhinput(4),Mhh2input(4),            & 
& MHpminput(4),MHpm2input(4),MVWLminput,MVWLm2input,MVWRminput,MVWRm2input,              & 
& MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput(4,4),UPinput(4,4),   & 
& ZHinput(4,4),ZZinput(3,3)

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& ZMinput(9,9),ZWinput(4,4)

Real(dp) :: gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,MU12,MU22,k1,vR

Complex(dp) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3),YL(3,3),YR(3,3),Mux(3,3)

Complex(dp),Intent(out) :: cplAhHpmcVWLm(4,4),cplAhcVWLmVWRm(4),cplcFuFdcVWLmL(3,3),cplcFuFdcVWLmR(3,3),         & 
& cplFvFecVWLmL(9,3),cplFvFecVWLmR(9,3),cplhhHpmcVWLm(4,4),cplhhcVWLmVWLm(4),            & 
& cplhhcVWLmVWRm(4),cplHpmcVWLmVZ(4),cplHpmcVWLmVZR(4),cplcVWLmVWLmVZ,cplcVWLmVWLmVZR,   & 
& cplcVWLmVWRmVZ,cplcVWLmVWRmVZR

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,               & 
& MVZR2,PhiW,TW,UC(4,4),UP(4,4),ZH(4,4),ZZ(3,3)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZM(9,9),ZW(4,4)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_VWLm_2B'
 
sinW2=1._dp-mW2/mZ2 
gBL = gBLinput 
g2 = g2input 
g3 = g3input 
LAM2 = LAM2input 
LAM1 = LAM1input 
RHO1 = RHO1input 
RHO2 = RHO2input 
ALP2 = ALP2input 
ALP1 = ALP1input 
ALP3 = ALP3input 
LAM5 = LAM5input 
LAM6 = LAM6input 
LAM3 = LAM3input 
LAM4 = LAM4input 
Y = Yinput 
YQ1 = YQ1input 
YQ2 = YQ2input 
Yt = Ytinput 
YL = YLinput 
YR = YRinput 
Mux = Muxinput 
MU12 = MU12input 
MU22 = MU22input 
k1 = k1input 
vR = vRinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,              & 
& LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,k1,vR,(/ ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,           & 
& MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC,ZDR,ZER,UP,             & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,k1,vR,gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,             & 
& ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UC = UCinput 
UP = UPinput 
ZH = ZHinput 
ZM = ZMinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MVWLm = MVWLminput 
MVWLm2 = MVWLm2input 
MVWRm = MVWRminput 
MVWRm2 = MVWRm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZR = MVZRinput 
MVZR2 = MVZR2input 
End if 
cplAhHpmcVWLm = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
Call CouplingAhHpmcVWLmT(gt1,gt2,g2,UP,UC,PhiW,cplAhHpmcVWLm(gt1,gt2))

 End Do 
End Do 


cplhhHpmcVWLm = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
Call CouplinghhHpmcVWLmT(gt1,gt2,g2,ZH,UC,PhiW,cplhhHpmcVWLm(gt1,gt2))

 End Do 
End Do 


cplAhcVWLmVWRm = 0._dp 
Do gt1 = 1, 4
Call CouplingAhcVWLmVWRmT(gt1,g2,k1,UP,cplAhcVWLmVWRm(gt1))

End Do 


cplhhcVWLmVWLm = 0._dp 
Do gt1 = 1, 4
Call CouplinghhcVWLmVWLmT(gt1,g2,k1,vR,ZH,PhiW,cplhhcVWLmVWLm(gt1))

End Do 


cplhhcVWLmVWRm = 0._dp 
Do gt1 = 1, 4
Call CouplinghhcVWLmVWRmT(gt1,g2,k1,vR,ZH,PhiW,cplhhcVWLmVWRm(gt1))

End Do 


cplHpmcVWLmVZ = 0._dp 
Do gt1 = 1, 4
Call CouplingHpmcVWLmVZT(gt1,gBL,g2,k1,vR,UC,TW,PhiW,cplHpmcVWLmVZ(gt1))

End Do 


cplHpmcVWLmVZR = 0._dp 
Do gt1 = 1, 4
Call CouplingHpmcVWLmVZRT(gt1,gBL,g2,k1,vR,UC,TW,PhiW,cplHpmcVWLmVZR(gt1))

End Do 


cplcVWLmVWLmVZ = 0._dp 
Call CouplingcVWLmVWLmVZT(g2,TW,PhiW,cplcVWLmVWLmVZ)



cplcVWLmVWLmVZR = 0._dp 
Call CouplingcVWLmVWLmVZRT(g2,TW,PhiW,cplcVWLmVWLmVZR)



cplcVWLmVWRmVZ = 0._dp 
Call CouplingcVWLmVWRmVZT(g2,TW,PhiW,cplcVWLmVWRmVZ)



cplcVWLmVWRmVZR = 0._dp 
Call CouplingcVWLmVWRmVZRT(g2,TW,PhiW,cplcVWLmVWRmVZR)



cplcFuFdcVWLmL = 0._dp 
cplcFuFdcVWLmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWLmT(gt1,gt2,g2,ZDL,ZDR,ZUL,ZUR,PhiW,cplcFuFdcVWLmL(gt1,gt2)      & 
& ,cplcFuFdcVWLmR(gt1,gt2))

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


Iname = Iname - 1 
 
End subroutine CouplingsFor_VWLm_decays_2B
 
Subroutine CouplingsFor_VWRm_decays_2B(m_in,i1,MAhinput,MAh2input,MFdinput,           & 
& MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,Mhhinput,           & 
& Mhh2input,MHpminput,MHpm2input,MVWLminput,MVWLm2input,MVWRminput,MVWRm2input,          & 
& MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput,ZDRinput,            & 
& ZERinput,UPinput,ZURinput,ZDLinput,ZELinput,ZULinput,ZHinput,ZMinput,ZWinput,          & 
& ZZinput,gBLinput,g2input,g3input,LAM2input,LAM1input,RHO1input,RHO2input,              & 
& ALP2input,ALP1input,ALP3input,LAM5input,LAM6input,LAM3input,LAM4input,Yinput,          & 
& YQ1input,YQ2input,Ytinput,YLinput,YRinput,Muxinput,MU12input,MU22input,k1input,        & 
& vRinput,cplAhHpmcVWRm,cplAhcVWRmVWLm,cplcFuFdcVWRmL,cplcFuFdcVWRmR,cplFvFecVWRmL,      & 
& cplFvFecVWRmR,cplhhHpmcVWRm,cplhhcVWRmVWLm,cplhhcVWRmVWRm,cplHpmcVWRmVZ,               & 
& cplHpmcVWRmVZR,cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,cplcVWRmVWRmVZ,cplcVWRmVWRmVZR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: gBLinput,g2input,g3input,LAM2input,LAM1input,RHO1input,RHO2input,ALP2input,           & 
& ALP1input,ALP3input,LAM5input,LAM6input,LAM3input,LAM4input,MU12input,MU22input,       & 
& k1input,vRinput

Complex(dp),Intent(in) :: Yinput(3,3),YQ1input(3,3),YQ2input(3,3),Ytinput(3,3),YLinput(3,3),YRinput(3,3),       & 
& Muxinput(3,3)

Real(dp),Intent(in) :: MAhinput(4),MAh2input(4),MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),           & 
& MFuinput(3),MFu2input(3),MFvinput(9),MFv2input(9),Mhhinput(4),Mhh2input(4),            & 
& MHpminput(4),MHpm2input(4),MVWLminput,MVWLm2input,MVWRminput,MVWRm2input,              & 
& MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput(4,4),UPinput(4,4),   & 
& ZHinput(4,4),ZZinput(3,3)

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& ZMinput(9,9),ZWinput(4,4)

Real(dp) :: gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,MU12,MU22,k1,vR

Complex(dp) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3),YL(3,3),YR(3,3),Mux(3,3)

Complex(dp),Intent(out) :: cplAhHpmcVWRm(4,4),cplAhcVWRmVWLm(4),cplcFuFdcVWRmL(3,3),cplcFuFdcVWRmR(3,3),         & 
& cplFvFecVWRmL(9,3),cplFvFecVWRmR(9,3),cplhhHpmcVWRm(4,4),cplhhcVWRmVWLm(4),            & 
& cplhhcVWRmVWRm(4),cplHpmcVWRmVZ(4),cplHpmcVWRmVZR(4),cplcVWRmVWLmVZ,cplcVWRmVWLmVZR,   & 
& cplcVWRmVWRmVZ,cplcVWRmVWRmVZR

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,               & 
& MVZR2,PhiW,TW,UC(4,4),UP(4,4),ZH(4,4),ZZ(3,3)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZM(9,9),ZW(4,4)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_VWRm_2B'
 
sinW2=1._dp-mW2/mZ2 
gBL = gBLinput 
g2 = g2input 
g3 = g3input 
LAM2 = LAM2input 
LAM1 = LAM1input 
RHO1 = RHO1input 
RHO2 = RHO2input 
ALP2 = ALP2input 
ALP1 = ALP1input 
ALP3 = ALP3input 
LAM5 = LAM5input 
LAM6 = LAM6input 
LAM3 = LAM3input 
LAM4 = LAM4input 
Y = Yinput 
YQ1 = YQ1input 
YQ2 = YQ2input 
Yt = Ytinput 
YL = YLinput 
YR = YRinput 
Mux = Muxinput 
MU12 = MU12input 
MU22 = MU22input 
k1 = k1input 
vR = vRinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,              & 
& LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,k1,vR,(/ ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,           & 
& MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC,ZDR,ZER,UP,             & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,k1,vR,gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,             & 
& ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UC = UCinput 
UP = UPinput 
ZH = ZHinput 
ZM = ZMinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MVWLm = MVWLminput 
MVWLm2 = MVWLm2input 
MVWRm = MVWRminput 
MVWRm2 = MVWRm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZR = MVZRinput 
MVZR2 = MVZR2input 
End if 
cplAhHpmcVWRm = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
Call CouplingAhHpmcVWRmT(gt1,gt2,g2,UP,UC,PhiW,cplAhHpmcVWRm(gt1,gt2))

 End Do 
End Do 


cplhhHpmcVWRm = 0._dp 
Do gt1 = 1, 4
 Do gt2 = 1, 4
Call CouplinghhHpmcVWRmT(gt1,gt2,g2,ZH,UC,PhiW,cplhhHpmcVWRm(gt1,gt2))

 End Do 
End Do 


cplAhcVWRmVWLm = 0._dp 
Do gt1 = 1, 4
Call CouplingAhcVWRmVWLmT(gt1,g2,k1,UP,cplAhcVWRmVWLm(gt1))

End Do 


cplhhcVWRmVWLm = 0._dp 
Do gt1 = 1, 4
Call CouplinghhcVWRmVWLmT(gt1,g2,k1,vR,ZH,PhiW,cplhhcVWRmVWLm(gt1))

End Do 


cplhhcVWRmVWRm = 0._dp 
Do gt1 = 1, 4
Call CouplinghhcVWRmVWRmT(gt1,g2,k1,vR,ZH,PhiW,cplhhcVWRmVWRm(gt1))

End Do 


cplHpmcVWRmVZ = 0._dp 
Do gt1 = 1, 4
Call CouplingHpmcVWRmVZT(gt1,gBL,g2,k1,vR,UC,TW,PhiW,cplHpmcVWRmVZ(gt1))

End Do 


cplHpmcVWRmVZR = 0._dp 
Do gt1 = 1, 4
Call CouplingHpmcVWRmVZRT(gt1,gBL,g2,k1,vR,UC,TW,PhiW,cplHpmcVWRmVZR(gt1))

End Do 


cplcVWRmVWLmVZ = 0._dp 
Call CouplingcVWRmVWLmVZT(g2,TW,PhiW,cplcVWRmVWLmVZ)



cplcVWRmVWLmVZR = 0._dp 
Call CouplingcVWRmVWLmVZRT(g2,TW,PhiW,cplcVWRmVWLmVZR)



cplcVWRmVWRmVZ = 0._dp 
Call CouplingcVWRmVWRmVZT(g2,TW,PhiW,cplcVWRmVWRmVZ)



cplcVWRmVWRmVZR = 0._dp 
Call CouplingcVWRmVWRmVZRT(g2,TW,PhiW,cplcVWRmVWRmVZR)



cplcFuFdcVWRmL = 0._dp 
cplcFuFdcVWRmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWRmT(gt1,gt2,g2,ZDL,ZDR,ZUL,ZUR,PhiW,cplcFuFdcVWRmL(gt1,gt2)      & 
& ,cplcFuFdcVWRmR(gt1,gt2))

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


Iname = Iname - 1 
 
End subroutine CouplingsFor_VWRm_decays_2B
 
Subroutine CouplingsFor_Fu_decays_3B(m_in,i1,MAhinput,MAh2input,MFdinput,             & 
& MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,Mhhinput,           & 
& Mhh2input,MHpminput,MHpm2input,MVWLminput,MVWLm2input,MVWRminput,MVWRm2input,          & 
& MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput,ZDRinput,            & 
& ZERinput,UPinput,ZURinput,ZDLinput,ZELinput,ZULinput,ZHinput,ZMinput,ZWinput,          & 
& ZZinput,gBLinput,g2input,g3input,LAM2input,LAM1input,RHO1input,RHO2input,              & 
& ALP2input,ALP1input,ALP3input,LAM5input,LAM6input,LAM3input,LAM4input,Yinput,          & 
& YQ1input,YQ2input,Ytinput,YLinput,YRinput,Muxinput,MU12input,MU22input,k1input,        & 
& vRinput,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,       & 
& cplcFdFdVZRL,cplcFdFdVZRR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWLmL,cplcFdFuVWLmR,       & 
& cplcFdFuVWRmL,cplcFdFuVWRmR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZRL,cplcFeFeVZRR,cplcFeFvHpmL,cplcFeFvHpmR,           & 
& cplcFeFvVWLmL,cplcFeFvVWLmR,cplcFeFvVWRmL,cplcFeFvVWRmR,cplcFuFdcHpmL,cplcFuFdcHpmR,   & 
& cplcFuFdcVWLmL,cplcFuFdcVWLmR,cplcFuFdcVWRmL,cplcFuFdcVWRmR,cplcFuFuAhL,               & 
& cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZRL,              & 
& cplcFuFuVZRR,cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,        & 
& cplFvFvVZRL,cplFvFvVZRR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: gBLinput,g2input,g3input,LAM2input,LAM1input,RHO1input,RHO2input,ALP2input,           & 
& ALP1input,ALP3input,LAM5input,LAM6input,LAM3input,LAM4input,MU12input,MU22input,       & 
& k1input,vRinput

Complex(dp),Intent(in) :: Yinput(3,3),YQ1input(3,3),YQ2input(3,3),Ytinput(3,3),YLinput(3,3),YRinput(3,3),       & 
& Muxinput(3,3)

Real(dp),Intent(in) :: MAhinput(4),MAh2input(4),MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),           & 
& MFuinput(3),MFu2input(3),MFvinput(9),MFv2input(9),Mhhinput(4),Mhh2input(4),            & 
& MHpminput(4),MHpm2input(4),MVWLminput,MVWLm2input,MVWRminput,MVWRm2input,              & 
& MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput(4,4),UPinput(4,4),   & 
& ZHinput(4,4),ZZinput(3,3)

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& ZMinput(9,9),ZWinput(4,4)

Real(dp) :: gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,MU12,MU22,k1,vR

Complex(dp) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3),YL(3,3),YR(3,3),Mux(3,3)

Complex(dp),Intent(out) :: cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),          & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplcFdFuHpmL(3,3,4),& 
& cplcFdFuHpmR(3,3,4),cplcFdFuVWLmL(3,3),cplcFdFuVWLmR(3,3),cplcFdFuVWRmL(3,3),          & 
& cplcFdFuVWRmR(3,3),cplcFeFeAhL(3,3,4),cplcFeFeAhR(3,3,4),cplcFeFehhL(3,3,4),           & 
& cplcFeFehhR(3,3,4),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),& 
& cplcFeFvHpmL(3,9,4),cplcFeFvHpmR(3,9,4),cplcFeFvVWLmL(3,9),cplcFeFvVWLmR(3,9),         & 
& cplcFeFvVWRmL(3,9),cplcFeFvVWRmR(3,9),cplcFuFdcHpmL(3,3,4),cplcFuFdcHpmR(3,3,4),       & 
& cplcFuFdcVWLmL(3,3),cplcFuFdcVWLmR(3,3),cplcFuFdcVWRmL(3,3),cplcFuFdcVWRmR(3,3),       & 
& cplcFuFuAhL(3,3,4),cplcFuFuAhR(3,3,4),cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),           & 
& cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),cplFvFvAhL(9,9,4),& 
& cplFvFvAhR(9,9,4),cplFvFvhhL(9,9,4),cplFvFvhhR(9,9,4),cplFvFvVZL(9,9),cplFvFvVZR(9,9), & 
& cplFvFvVZRL(9,9),cplFvFvVZRR(9,9)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,               & 
& MVZR2,PhiW,TW,UC(4,4),UP(4,4),ZH(4,4),ZZ(3,3)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZM(9,9),ZW(4,4)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fu_3B'
 
sinW2=1._dp-mW2/mZ2 
gBL = gBLinput 
g2 = g2input 
g3 = g3input 
LAM2 = LAM2input 
LAM1 = LAM1input 
RHO1 = RHO1input 
RHO2 = RHO2input 
ALP2 = ALP2input 
ALP1 = ALP1input 
ALP3 = ALP3input 
LAM5 = LAM5input 
LAM6 = LAM6input 
LAM3 = LAM3input 
LAM4 = LAM4input 
Y = Yinput 
YQ1 = YQ1input 
YQ2 = YQ2input 
Yt = Ytinput 
YL = YLinput 
YR = YRinput 
Mux = Muxinput 
MU12 = MU12input 
MU22 = MU22input 
k1 = k1input 
vR = vRinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,              & 
& LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,k1,vR,(/ ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,           & 
& MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC,ZDR,ZER,UP,             & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,k1,vR,gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,             & 
& ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UC = UCinput 
UP = UPinput 
ZH = ZHinput 
ZM = ZMinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MVWLm = MVWLminput 
MVWLm2 = MVWLm2input 
MVWRm = MVWRminput 
MVWRm2 = MVWRm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZR = MVZRinput 
MVZR2 = MVZR2input 
End if 
cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFdFdAhT(gt1,gt2,gt3,YQ1,YQ2,UP,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)         & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


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


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFuFuAhT(gt1,gt2,gt3,YQ1,YQ2,UP,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)         & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

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


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFdFdhhT(gt1,gt2,gt3,YQ1,YQ2,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcHpmL = 0._dp 
cplcFuFdcHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFuFdcHpmT(gt1,gt2,gt3,YQ1,YQ2,UC,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHpmL(gt1,gt2,gt3)& 
& ,cplcFuFdcHpmR(gt1,gt2,gt3))

  End Do 
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


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFuFuhhT(gt1,gt2,gt3,YQ1,YQ2,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFuHpmL = 0._dp 
cplcFdFuHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFdFuHpmT(gt1,gt2,gt3,YQ1,YQ2,UC,ZDL,ZDR,ZUL,ZUR,cplcFdFuHpmL(gt1,gt2,gt3)& 
& ,cplcFdFuHpmR(gt1,gt2,gt3))

  End Do 
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


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,gBL,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZRL = 0._dp 
cplcFdFdVZRR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZRT(gt1,gt2,gBL,g2,TW,cplcFdFdVZRL(gt1,gt2),cplcFdFdVZRR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWLmL = 0._dp 
cplcFuFdcVWLmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWLmT(gt1,gt2,g2,ZDL,ZDR,ZUL,ZUR,PhiW,cplcFuFdcVWLmL(gt1,gt2)      & 
& ,cplcFuFdcVWLmR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWRmL = 0._dp 
cplcFuFdcVWRmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWRmT(gt1,gt2,g2,ZDL,ZDR,ZUL,ZUR,PhiW,cplcFuFdcVWRmL(gt1,gt2)      & 
& ,cplcFuFdcVWRmR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,gBL,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZRL = 0._dp 
cplcFeFeVZRR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZRT(gt1,gt2,gBL,g2,TW,cplcFeFeVZRL(gt1,gt2),cplcFeFeVZRR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWLmL = 0._dp 
cplcFdFuVWLmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWLmT(gt1,gt2,g2,ZDL,ZDR,ZUL,ZUR,PhiW,cplcFdFuVWLmL(gt1,gt2)        & 
& ,cplcFdFuVWLmR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWRmL = 0._dp 
cplcFdFuVWRmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWRmT(gt1,gt2,g2,ZDL,ZDR,ZUL,ZUR,PhiW,cplcFdFuVWRmL(gt1,gt2)        & 
& ,cplcFdFuVWRmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,gBL,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZRL = 0._dp 
cplcFuFuVZRR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZRT(gt1,gt2,gBL,g2,TW,cplcFuFuVZRL(gt1,gt2),cplcFuFuVZRR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingFvFvVZT(gt1,gt2,gBL,g2,ZM,TW,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZRL = 0._dp 
cplFvFvVZRR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingFvFvVZRT(gt1,gt2,gBL,g2,ZM,TW,cplFvFvVZRL(gt1,gt2),cplFvFvVZRR(gt1,gt2))

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


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fu_decays_3B
 
Subroutine CouplingsFor_Fe_decays_3B(m_in,i1,MAhinput,MAh2input,MFdinput,             & 
& MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,Mhhinput,           & 
& Mhh2input,MHpminput,MHpm2input,MVWLminput,MVWLm2input,MVWRminput,MVWRm2input,          & 
& MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput,ZDRinput,            & 
& ZERinput,UPinput,ZURinput,ZDLinput,ZELinput,ZULinput,ZHinput,ZMinput,ZWinput,          & 
& ZZinput,gBLinput,g2input,g3input,LAM2input,LAM1input,RHO1input,RHO2input,              & 
& ALP2input,ALP1input,ALP3input,LAM5input,LAM6input,LAM3input,LAM4input,Yinput,          & 
& YQ1input,YQ2input,Ytinput,YLinput,YRinput,Muxinput,MU12input,MU22input,k1input,        & 
& vRinput,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,       & 
& cplcFdFdVZRL,cplcFdFdVZRR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,             & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZRL,cplcFeFeVZRR,cplcFeFvHpmL,cplcFeFvHpmR,           & 
& cplcFeFvVWLmL,cplcFeFvVWLmR,cplcFeFvVWRmL,cplcFeFvVWRmR,cplcFuFdcHpmL,cplcFuFdcHpmR,   & 
& cplcFuFdcVWLmL,cplcFuFdcVWLmR,cplcFuFdcVWRmL,cplcFuFdcVWRmR,cplcFuFuAhL,               & 
& cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZRL,              & 
& cplcFuFuVZRR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWLmL,cplFvFecVWLmR,cplFvFecVWRmL,      & 
& cplFvFecVWRmR,cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,       & 
& cplFvFvVZRL,cplFvFvVZRR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: gBLinput,g2input,g3input,LAM2input,LAM1input,RHO1input,RHO2input,ALP2input,           & 
& ALP1input,ALP3input,LAM5input,LAM6input,LAM3input,LAM4input,MU12input,MU22input,       & 
& k1input,vRinput

Complex(dp),Intent(in) :: Yinput(3,3),YQ1input(3,3),YQ2input(3,3),Ytinput(3,3),YLinput(3,3),YRinput(3,3),       & 
& Muxinput(3,3)

Real(dp),Intent(in) :: MAhinput(4),MAh2input(4),MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),           & 
& MFuinput(3),MFu2input(3),MFvinput(9),MFv2input(9),Mhhinput(4),Mhh2input(4),            & 
& MHpminput(4),MHpm2input(4),MVWLminput,MVWLm2input,MVWRminput,MVWRm2input,              & 
& MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput(4,4),UPinput(4,4),   & 
& ZHinput(4,4),ZZinput(3,3)

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& ZMinput(9,9),ZWinput(4,4)

Real(dp) :: gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,MU12,MU22,k1,vR

Complex(dp) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3),YL(3,3),YR(3,3),Mux(3,3)

Complex(dp),Intent(out) :: cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),          & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplcFeFeAhL(3,3,4),& 
& cplcFeFeAhR(3,3,4),cplcFeFehhL(3,3,4),cplcFeFehhR(3,3,4),cplcFeFeVZL(3,3),             & 
& cplcFeFeVZR(3,3),cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),cplcFeFvHpmL(3,9,4),              & 
& cplcFeFvHpmR(3,9,4),cplcFeFvVWLmL(3,9),cplcFeFvVWLmR(3,9),cplcFeFvVWRmL(3,9),          & 
& cplcFeFvVWRmR(3,9),cplcFuFdcHpmL(3,3,4),cplcFuFdcHpmR(3,3,4),cplcFuFdcVWLmL(3,3),      & 
& cplcFuFdcVWLmR(3,3),cplcFuFdcVWRmL(3,3),cplcFuFdcVWRmR(3,3),cplcFuFuAhL(3,3,4),        & 
& cplcFuFuAhR(3,3,4),cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),cplcFuFuVZL(3,3),             & 
& cplcFuFuVZR(3,3),cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),cplFvFecHpmL(9,3,4),              & 
& cplFvFecHpmR(9,3,4),cplFvFecVWLmL(9,3),cplFvFecVWLmR(9,3),cplFvFecVWRmL(9,3),          & 
& cplFvFecVWRmR(9,3),cplFvFvAhL(9,9,4),cplFvFvAhR(9,9,4),cplFvFvhhL(9,9,4),              & 
& cplFvFvhhR(9,9,4),cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplFvFvVZRL(9,9),cplFvFvVZRR(9,9)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,               & 
& MVZR2,PhiW,TW,UC(4,4),UP(4,4),ZH(4,4),ZZ(3,3)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZM(9,9),ZW(4,4)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fe_3B'
 
sinW2=1._dp-mW2/mZ2 
gBL = gBLinput 
g2 = g2input 
g3 = g3input 
LAM2 = LAM2input 
LAM1 = LAM1input 
RHO1 = RHO1input 
RHO2 = RHO2input 
ALP2 = ALP2input 
ALP1 = ALP1input 
ALP3 = ALP3input 
LAM5 = LAM5input 
LAM6 = LAM6input 
LAM3 = LAM3input 
LAM4 = LAM4input 
Y = Yinput 
YQ1 = YQ1input 
YQ2 = YQ2input 
Yt = Ytinput 
YL = YLinput 
YR = YRinput 
Mux = Muxinput 
MU12 = MU12input 
MU22 = MU22input 
k1 = k1input 
vR = vRinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,              & 
& LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,k1,vR,(/ ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,           & 
& MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC,ZDR,ZER,UP,             & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,k1,vR,gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,             & 
& ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UC = UCinput 
UP = UPinput 
ZH = ZHinput 
ZM = ZMinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MVWLm = MVWLminput 
MVWLm2 = MVWLm2input 
MVWRm = MVWRminput 
MVWRm2 = MVWRm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZR = MVZRinput 
MVZR2 = MVZR2input 
End if 
cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFdFdAhT(gt1,gt2,gt3,YQ1,YQ2,UP,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)         & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


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


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFuFuAhT(gt1,gt2,gt3,YQ1,YQ2,UP,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)         & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

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


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFdFdhhT(gt1,gt2,gt3,YQ1,YQ2,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcHpmL = 0._dp 
cplcFuFdcHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFuFdcHpmT(gt1,gt2,gt3,YQ1,YQ2,UC,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHpmL(gt1,gt2,gt3)& 
& ,cplcFuFdcHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
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


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFuFuhhT(gt1,gt2,gt3,YQ1,YQ2,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
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


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,gBL,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZRL = 0._dp 
cplcFdFdVZRR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZRT(gt1,gt2,gBL,g2,TW,cplcFdFdVZRL(gt1,gt2),cplcFdFdVZRR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWLmL = 0._dp 
cplcFuFdcVWLmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWLmT(gt1,gt2,g2,ZDL,ZDR,ZUL,ZUR,PhiW,cplcFuFdcVWLmL(gt1,gt2)      & 
& ,cplcFuFdcVWLmR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWRmL = 0._dp 
cplcFuFdcVWRmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWRmT(gt1,gt2,g2,ZDL,ZDR,ZUL,ZUR,PhiW,cplcFuFdcVWRmL(gt1,gt2)      & 
& ,cplcFuFdcVWRmR(gt1,gt2))

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


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,gBL,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZRL = 0._dp 
cplcFeFeVZRR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZRT(gt1,gt2,gBL,g2,TW,cplcFeFeVZRL(gt1,gt2),cplcFeFeVZRR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,gBL,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZRL = 0._dp 
cplcFuFuVZRR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZRT(gt1,gt2,gBL,g2,TW,cplcFuFuVZRL(gt1,gt2),cplcFuFuVZRR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingFvFvVZT(gt1,gt2,gBL,g2,ZM,TW,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZRL = 0._dp 
cplFvFvVZRR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingFvFvVZRT(gt1,gt2,gBL,g2,ZM,TW,cplFvFvVZRL(gt1,gt2),cplFvFvVZRR(gt1,gt2))

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


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fe_decays_3B
 
Subroutine CouplingsFor_Fd_decays_3B(m_in,i1,MAhinput,MAh2input,MFdinput,             & 
& MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,Mhhinput,           & 
& Mhh2input,MHpminput,MHpm2input,MVWLminput,MVWLm2input,MVWRminput,MVWRm2input,          & 
& MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput,ZDRinput,            & 
& ZERinput,UPinput,ZURinput,ZDLinput,ZELinput,ZULinput,ZHinput,ZMinput,ZWinput,          & 
& ZZinput,gBLinput,g2input,g3input,LAM2input,LAM1input,RHO1input,RHO2input,              & 
& ALP2input,ALP1input,ALP3input,LAM5input,LAM6input,LAM3input,LAM4input,Yinput,          & 
& YQ1input,YQ2input,Ytinput,YLinput,YRinput,Muxinput,MU12input,MU22input,k1input,        & 
& vRinput,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,       & 
& cplcFdFdVZRL,cplcFdFdVZRR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWLmL,cplcFdFuVWLmR,       & 
& cplcFdFuVWRmL,cplcFdFuVWRmR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZRL,cplcFeFeVZRR,cplcFuFdcHpmL,cplcFuFdcHpmR,         & 
& cplcFuFdcVWLmL,cplcFuFdcVWLmR,cplcFuFdcVWRmL,cplcFuFdcVWRmR,cplcFuFuAhL,               & 
& cplcFuFuAhR,cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZRL,              & 
& cplcFuFuVZRR,cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWLmL,cplFvFecVWLmR,cplFvFecVWRmL,      & 
& cplFvFecVWRmR,cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,       & 
& cplFvFvVZRL,cplFvFvVZRR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: gBLinput,g2input,g3input,LAM2input,LAM1input,RHO1input,RHO2input,ALP2input,           & 
& ALP1input,ALP3input,LAM5input,LAM6input,LAM3input,LAM4input,MU12input,MU22input,       & 
& k1input,vRinput

Complex(dp),Intent(in) :: Yinput(3,3),YQ1input(3,3),YQ2input(3,3),Ytinput(3,3),YLinput(3,3),YRinput(3,3),       & 
& Muxinput(3,3)

Real(dp),Intent(in) :: MAhinput(4),MAh2input(4),MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),           & 
& MFuinput(3),MFu2input(3),MFvinput(9),MFv2input(9),Mhhinput(4),Mhh2input(4),            & 
& MHpminput(4),MHpm2input(4),MVWLminput,MVWLm2input,MVWRminput,MVWRm2input,              & 
& MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput(4,4),UPinput(4,4),   & 
& ZHinput(4,4),ZZinput(3,3)

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& ZMinput(9,9),ZWinput(4,4)

Real(dp) :: gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,MU12,MU22,k1,vR

Complex(dp) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3),YL(3,3),YR(3,3),Mux(3,3)

Complex(dp),Intent(out) :: cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),          & 
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

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,               & 
& MVZR2,PhiW,TW,UC(4,4),UP(4,4),ZH(4,4),ZZ(3,3)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZM(9,9),ZW(4,4)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fd_3B'
 
sinW2=1._dp-mW2/mZ2 
gBL = gBLinput 
g2 = g2input 
g3 = g3input 
LAM2 = LAM2input 
LAM1 = LAM1input 
RHO1 = RHO1input 
RHO2 = RHO2input 
ALP2 = ALP2input 
ALP1 = ALP1input 
ALP3 = ALP3input 
LAM5 = LAM5input 
LAM6 = LAM6input 
LAM3 = LAM3input 
LAM4 = LAM4input 
Y = Yinput 
YQ1 = YQ1input 
YQ2 = YQ2input 
Yt = Ytinput 
YL = YLinput 
YR = YRinput 
Mux = Muxinput 
MU12 = MU12input 
MU22 = MU22input 
k1 = k1input 
vR = vRinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,              & 
& LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,k1,vR,(/ ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,           & 
& MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC,ZDR,ZER,UP,             & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,k1,vR,gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,             & 
& ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UC = UCinput 
UP = UPinput 
ZH = ZHinput 
ZM = ZMinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MVWLm = MVWLminput 
MVWLm2 = MVWLm2input 
MVWRm = MVWRminput 
MVWRm2 = MVWRm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZR = MVZRinput 
MVZR2 = MVZR2input 
End if 
cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFdFdAhT(gt1,gt2,gt3,YQ1,YQ2,UP,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)         & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


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


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFuFuAhT(gt1,gt2,gt3,YQ1,YQ2,UP,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)         & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

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


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFdFdhhT(gt1,gt2,gt3,YQ1,YQ2,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFuFdcHpmL = 0._dp 
cplcFuFdcHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFuFdcHpmT(gt1,gt2,gt3,YQ1,YQ2,UC,ZDL,ZDR,ZUL,ZUR,cplcFuFdcHpmL(gt1,gt2,gt3)& 
& ,cplcFuFdcHpmR(gt1,gt2,gt3))

  End Do 
 End Do 
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


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFuFuhhT(gt1,gt2,gt3,YQ1,YQ2,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFuHpmL = 0._dp 
cplcFdFuHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFdFuHpmT(gt1,gt2,gt3,YQ1,YQ2,UC,ZDL,ZDR,ZUL,ZUR,cplcFdFuHpmL(gt1,gt2,gt3)& 
& ,cplcFdFuHpmR(gt1,gt2,gt3))

  End Do 
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


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,gBL,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZRL = 0._dp 
cplcFdFdVZRR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZRT(gt1,gt2,gBL,g2,TW,cplcFdFdVZRL(gt1,gt2),cplcFdFdVZRR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWLmL = 0._dp 
cplcFuFdcVWLmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWLmT(gt1,gt2,g2,ZDL,ZDR,ZUL,ZUR,PhiW,cplcFuFdcVWLmL(gt1,gt2)      & 
& ,cplcFuFdcVWLmR(gt1,gt2))

 End Do 
End Do 


cplcFuFdcVWRmL = 0._dp 
cplcFuFdcVWRmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFdcVWRmT(gt1,gt2,g2,ZDL,ZDR,ZUL,ZUR,PhiW,cplcFuFdcVWRmL(gt1,gt2)      & 
& ,cplcFuFdcVWRmR(gt1,gt2))

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


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,gBL,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZRL = 0._dp 
cplcFeFeVZRR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZRT(gt1,gt2,gBL,g2,TW,cplcFeFeVZRL(gt1,gt2),cplcFeFeVZRR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWLmL = 0._dp 
cplcFdFuVWLmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWLmT(gt1,gt2,g2,ZDL,ZDR,ZUL,ZUR,PhiW,cplcFdFuVWLmL(gt1,gt2)        & 
& ,cplcFdFuVWLmR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWRmL = 0._dp 
cplcFdFuVWRmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWRmT(gt1,gt2,g2,ZDL,ZDR,ZUL,ZUR,PhiW,cplcFdFuVWRmL(gt1,gt2)        & 
& ,cplcFdFuVWRmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,gBL,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZRL = 0._dp 
cplcFuFuVZRR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZRT(gt1,gt2,gBL,g2,TW,cplcFuFuVZRL(gt1,gt2),cplcFuFuVZRR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingFvFvVZT(gt1,gt2,gBL,g2,ZM,TW,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZRL = 0._dp 
cplFvFvVZRR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingFvFvVZRT(gt1,gt2,gBL,g2,ZM,TW,cplFvFvVZRL(gt1,gt2),cplFvFvVZRR(gt1,gt2))

 End Do 
End Do 


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fd_decays_3B
 
Subroutine CouplingsFor_Fv_decays_3B(m_in,i1,MAhinput,MAh2input,MFdinput,             & 
& MFd2input,MFeinput,MFe2input,MFuinput,MFu2input,MFvinput,MFv2input,Mhhinput,           & 
& Mhh2input,MHpminput,MHpm2input,MVWLminput,MVWLm2input,MVWRminput,MVWRm2input,          & 
& MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput,ZDRinput,            & 
& ZERinput,UPinput,ZURinput,ZDLinput,ZELinput,ZULinput,ZHinput,ZMinput,ZWinput,          & 
& ZZinput,gBLinput,g2input,g3input,LAM2input,LAM1input,RHO1input,RHO2input,              & 
& ALP2input,ALP1input,ALP3input,LAM5input,LAM6input,LAM3input,LAM4input,Yinput,          & 
& YQ1input,YQ2input,Ytinput,YLinput,YRinput,Muxinput,MU12input,MU22input,k1input,        & 
& vRinput,cplcFdFdAhL,cplcFdFdAhR,cplcFdFdhhL,cplcFdFdhhR,cplcFdFdVZL,cplcFdFdVZR,       & 
& cplcFdFdVZRL,cplcFdFdVZRR,cplcFdFuHpmL,cplcFdFuHpmR,cplcFdFuVWLmL,cplcFdFuVWLmR,       & 
& cplcFdFuVWRmL,cplcFdFuVWRmR,cplcFeFeAhL,cplcFeFeAhR,cplcFeFehhL,cplcFeFehhR,           & 
& cplcFeFeVZL,cplcFeFeVZR,cplcFeFeVZRL,cplcFeFeVZRR,cplcFeFvHpmL,cplcFeFvHpmR,           & 
& cplcFeFvVWLmL,cplcFeFvVWLmR,cplcFeFvVWRmL,cplcFeFvVWRmR,cplcFuFuAhL,cplcFuFuAhR,       & 
& cplcFuFuhhL,cplcFuFuhhR,cplcFuFuVZL,cplcFuFuVZR,cplcFuFuVZRL,cplcFuFuVZRR,             & 
& cplFvFecHpmL,cplFvFecHpmR,cplFvFecVWLmL,cplFvFecVWLmR,cplFvFecVWRmL,cplFvFecVWRmR,     & 
& cplFvFvAhL,cplFvFvAhR,cplFvFvhhL,cplFvFvhhR,cplFvFvVZL,cplFvFvVZR,cplFvFvVZRL,         & 
& cplFvFvVZRR,deltaM)

Implicit None 

Real(dp), Intent(in) :: m_in 
Real(dp), Intent(in) :: deltaM 
Integer, Intent(in) :: i1 
Real(dp),Intent(in) :: gBLinput,g2input,g3input,LAM2input,LAM1input,RHO1input,RHO2input,ALP2input,           & 
& ALP1input,ALP3input,LAM5input,LAM6input,LAM3input,LAM4input,MU12input,MU22input,       & 
& k1input,vRinput

Complex(dp),Intent(in) :: Yinput(3,3),YQ1input(3,3),YQ2input(3,3),Ytinput(3,3),YLinput(3,3),YRinput(3,3),       & 
& Muxinput(3,3)

Real(dp),Intent(in) :: MAhinput(4),MAh2input(4),MFdinput(3),MFd2input(3),MFeinput(3),MFe2input(3),           & 
& MFuinput(3),MFu2input(3),MFvinput(9),MFv2input(9),Mhhinput(4),Mhh2input(4),            & 
& MHpminput(4),MHpm2input(4),MVWLminput,MVWLm2input,MVWRminput,MVWRm2input,              & 
& MVZinput,MVZ2input,MVZRinput,MVZR2input,PhiWinput,TWinput,UCinput(4,4),UPinput(4,4),   & 
& ZHinput(4,4),ZZinput(3,3)

Complex(dp),Intent(in) :: ZDRinput(3,3),ZERinput(3,3),ZURinput(3,3),ZDLinput(3,3),ZELinput(3,3),ZULinput(3,3),  & 
& ZMinput(9,9),ZWinput(4,4)

Real(dp) :: gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,MU12,MU22,k1,vR

Complex(dp) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3),YL(3,3),YR(3,3),Mux(3,3)

Complex(dp),Intent(out) :: cplcFdFdAhL(3,3,4),cplcFdFdAhR(3,3,4),cplcFdFdhhL(3,3,4),cplcFdFdhhR(3,3,4),          & 
& cplcFdFdVZL(3,3),cplcFdFdVZR(3,3),cplcFdFdVZRL(3,3),cplcFdFdVZRR(3,3),cplcFdFuHpmL(3,3,4),& 
& cplcFdFuHpmR(3,3,4),cplcFdFuVWLmL(3,3),cplcFdFuVWLmR(3,3),cplcFdFuVWRmL(3,3),          & 
& cplcFdFuVWRmR(3,3),cplcFeFeAhL(3,3,4),cplcFeFeAhR(3,3,4),cplcFeFehhL(3,3,4),           & 
& cplcFeFehhR(3,3,4),cplcFeFeVZL(3,3),cplcFeFeVZR(3,3),cplcFeFeVZRL(3,3),cplcFeFeVZRR(3,3),& 
& cplcFeFvHpmL(3,9,4),cplcFeFvHpmR(3,9,4),cplcFeFvVWLmL(3,9),cplcFeFvVWLmR(3,9),         & 
& cplcFeFvVWRmL(3,9),cplcFeFvVWRmR(3,9),cplcFuFuAhL(3,3,4),cplcFuFuAhR(3,3,4),           & 
& cplcFuFuhhL(3,3,4),cplcFuFuhhR(3,3,4),cplcFuFuVZL(3,3),cplcFuFuVZR(3,3),               & 
& cplcFuFuVZRL(3,3),cplcFuFuVZRR(3,3),cplFvFecHpmL(9,3,4),cplFvFecHpmR(9,3,4),           & 
& cplFvFecVWLmL(9,3),cplFvFecVWLmR(9,3),cplFvFecVWRmL(9,3),cplFvFecVWRmR(9,3),           & 
& cplFvFvAhL(9,9,4),cplFvFvAhR(9,9,4),cplFvFvhhL(9,9,4),cplFvFvhhR(9,9,4),               & 
& cplFvFvVZL(9,9),cplFvFvVZR(9,9),cplFvFvVZRL(9,9),cplFvFvVZRR(9,9)

Integer :: i2, i3, gt1, gt2, gt3, kont 
Real(dp) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,               & 
& MVZR2,PhiW,TW,UC(4,4),UP(4,4),ZH(4,4),ZZ(3,3)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZM(9,9),ZW(4,4)

Real(dp) :: gSM(11), sinW2, dt, tz, Qin 
Iname = Iname + 1 
NameOfUnit(Iname) = 'Couplings_Fv_3B'
 
sinW2=1._dp-mW2/mZ2 
gBL = gBLinput 
g2 = g2input 
g3 = g3input 
LAM2 = LAM2input 
LAM1 = LAM1input 
RHO1 = RHO1input 
RHO2 = RHO2input 
ALP2 = ALP2input 
ALP1 = ALP1input 
ALP3 = ALP3input 
LAM5 = LAM5input 
LAM6 = LAM6input 
LAM3 = LAM3input 
LAM4 = LAM4input 
Y = Yinput 
YQ1 = YQ1input 
YQ2 = YQ2input 
Yt = Ytinput 
YL = YLinput 
YR = YRinput 
Mux = Muxinput 
MU12 = MU12input 
MU22 = MU22input 
k1 = k1input 
vR = vRinput 
Qin=sqrt(getRenormalizationScale()) 
Call SolveTadpoleEquations(gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,              & 
& LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,k1,vR,(/ ZeroC, ZeroC, ZeroC, ZeroC /))

! --- Calculate running tree-level masses for loop induced couplings and Quark mixing matrices --- 
Call TreeMasses(MAh,MAh2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,Mhh,Mhh2,MHpm,           & 
& MHpm2,MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,MVZR2,PhiW,TW,UC,ZDR,ZER,UP,             & 
& ZUR,ZDL,ZEL,ZUL,ZH,ZM,ZW,ZZ,k1,vR,gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,             & 
& ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,.True.,kont)

If (ExternalZfactors) Then 
! --- Use the 1-loop mixing matrices calculated at M_SUSY in the vertices --- 
UC = UCinput 
UP = UPinput 
ZH = ZHinput 
ZM = ZMinput 
ZW = ZWinput 
ZZ = ZZinput 
End if 
If (PoleMassesInLoops) Then 
! --- Use the pole masses --- 
MAh = MAhinput 
MAh2 = MAh2input 
MFd = MFdinput 
MFd2 = MFd2input 
MFe = MFeinput 
MFe2 = MFe2input 
MFu = MFuinput 
MFu2 = MFu2input 
MFv = MFvinput 
MFv2 = MFv2input 
Mhh = Mhhinput 
Mhh2 = Mhh2input 
MHpm = MHpminput 
MHpm2 = MHpm2input 
MVWLm = MVWLminput 
MVWLm2 = MVWLm2input 
MVWRm = MVWRminput 
MVWRm2 = MVWRm2input 
MVZ = MVZinput 
MVZ2 = MVZ2input 
MVZR = MVZRinput 
MVZR2 = MVZR2input 
End if 
cplcFdFdAhL = 0._dp 
cplcFdFdAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFdFdAhT(gt1,gt2,gt3,YQ1,YQ2,UP,ZDL,ZDR,cplcFdFdAhL(gt1,gt2,gt3)         & 
& ,cplcFdFdAhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


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


cplcFuFuAhL = 0._dp 
cplcFuFuAhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFuFuAhT(gt1,gt2,gt3,YQ1,YQ2,UP,ZUL,ZUR,cplcFuFuAhL(gt1,gt2,gt3)         & 
& ,cplcFuFuAhR(gt1,gt2,gt3))

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


cplcFdFdhhL = 0._dp 
cplcFdFdhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFdFdhhT(gt1,gt2,gt3,YQ1,YQ2,ZH,ZDL,ZDR,cplcFdFdhhL(gt1,gt2,gt3)         & 
& ,cplcFdFdhhR(gt1,gt2,gt3))

  End Do 
 End Do 
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


cplcFuFuhhL = 0._dp 
cplcFuFuhhR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFuFuhhT(gt1,gt2,gt3,YQ1,YQ2,ZH,ZUL,ZUR,cplcFuFuhhL(gt1,gt2,gt3)         & 
& ,cplcFuFuhhR(gt1,gt2,gt3))

  End Do 
 End Do 
End Do 


cplcFdFuHpmL = 0._dp 
cplcFdFuHpmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
  Do gt3 = 1, 4
Call CouplingcFdFuHpmT(gt1,gt2,gt3,YQ1,YQ2,UC,ZDL,ZDR,ZUL,ZUR,cplcFdFuHpmL(gt1,gt2,gt3)& 
& ,cplcFdFuHpmR(gt1,gt2,gt3))

  End Do 
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


cplcFdFdVZL = 0._dp 
cplcFdFdVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZT(gt1,gt2,gBL,g2,TW,cplcFdFdVZL(gt1,gt2),cplcFdFdVZR(gt1,gt2))

 End Do 
End Do 


cplcFdFdVZRL = 0._dp 
cplcFdFdVZRR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFdVZRT(gt1,gt2,gBL,g2,TW,cplcFdFdVZRL(gt1,gt2),cplcFdFdVZRR(gt1,gt2))

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


cplcFeFeVZL = 0._dp 
cplcFeFeVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZT(gt1,gt2,gBL,g2,TW,cplcFeFeVZL(gt1,gt2),cplcFeFeVZR(gt1,gt2))

 End Do 
End Do 


cplcFeFeVZRL = 0._dp 
cplcFeFeVZRR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFeFeVZRT(gt1,gt2,gBL,g2,TW,cplcFeFeVZRL(gt1,gt2),cplcFeFeVZRR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWLmL = 0._dp 
cplcFdFuVWLmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWLmT(gt1,gt2,g2,ZDL,ZDR,ZUL,ZUR,PhiW,cplcFdFuVWLmL(gt1,gt2)        & 
& ,cplcFdFuVWLmR(gt1,gt2))

 End Do 
End Do 


cplcFdFuVWRmL = 0._dp 
cplcFdFuVWRmR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFdFuVWRmT(gt1,gt2,g2,ZDL,ZDR,ZUL,ZUR,PhiW,cplcFdFuVWRmL(gt1,gt2)        & 
& ,cplcFdFuVWRmR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZL = 0._dp 
cplcFuFuVZR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZT(gt1,gt2,gBL,g2,TW,cplcFuFuVZL(gt1,gt2),cplcFuFuVZR(gt1,gt2))

 End Do 
End Do 


cplcFuFuVZRL = 0._dp 
cplcFuFuVZRR = 0._dp 
Do gt1 = 1, 3
 Do gt2 = 1, 3
Call CouplingcFuFuVZRT(gt1,gt2,gBL,g2,TW,cplcFuFuVZRL(gt1,gt2),cplcFuFuVZRR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZL = 0._dp 
cplFvFvVZR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingFvFvVZT(gt1,gt2,gBL,g2,ZM,TW,cplFvFvVZL(gt1,gt2),cplFvFvVZR(gt1,gt2))

 End Do 
End Do 


cplFvFvVZRL = 0._dp 
cplFvFvVZRR = 0._dp 
Do gt1 = 1, 9
 Do gt2 = 1, 9
Call CouplingFvFvVZRT(gt1,gt2,gBL,g2,ZM,TW,cplFvFvVZRL(gt1,gt2),cplFvFvVZRR(gt1,gt2))

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


Iname = Iname - 1 
 
End subroutine CouplingsFor_Fv_decays_3B
 
Function NFlav(m_in) 
Implicit None 
Real(dp), Intent(in) :: m_in 
Real(dp) :: NFlav 
If (m_in.lt.mf_d(3)) Then 
  NFlav = 4._dp 
Else If (m_in.lt.mf_u(3)) Then 
  NFlav = 5._dp 
Else 
  NFlav = 6._dp 
End if 
End Function

Subroutine RunSM(scale_out,deltaM,tb,g1,g2,g3,Yu, Yd, Ye, vd, vu) 
Implicit None
Real(dp), Intent(in) :: scale_out,deltaM, tb
Real(dp), Intent(out) :: g1, g2, g3, vd, vu
Complex(dp), Intent(out) :: Yu(3,3), Yd(3,3), Ye(3,3)
Real(dp) :: dt, gSM(14), gSM2(2), gSM3(3), mtopMS,  sinw2, vev, tz, alphaStop 
Integer :: kont

RunningTopMZ = .false.

Yd = 0._dp
Ye = 0._dp
Yu = 0._dp

If (.not.RunningTopMZ) Then

! Calculating alpha_S(m_top)
gSM2(1)=sqrt(Alpha_mZ*4*Pi) 
gSM2(2)=sqrt(AlphaS_mZ*4*Pi) 


tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM2,2,tz,0._dp,deltaM,dt,0._dp,RGEAlphaS,kont)



alphaStop = gSM2(2)**2/4._dp/Pi



! m_top^pole to m_top^MS(m_top) 

mtopMS = mf_u(3)*(1._dp - 4._dp/3._dp*alphaStop/Pi)


! Running m_top^MS(m_top) to M_Z 

gSM3(1)=gSM2(1) 
gSM3(2)=gSM2(2)
gSM3(3)=mtopMS

tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM3,3,0._dp,tz,deltaM,dt,0._dp,RGEtop,kont)


mf_u_mz_running = gSM3(3)


RunningTopMZ = .True.

End if

! Starting values at MZ

gSM(1)=sqrt(Alpha_mZ*4*Pi) 
gSM(2)=sqrt(AlphaS_mZ*4*Pi) 
gSM(3)= 0.486E-03_dp ! mf_l_mz(1) 
gSM(4)= 0.10272 !mf_l_mz(2) 
gSM(5)= 1.74624 !mf_l_mz(3) 
gSM(6)= 1.27E-03_dp ! mf_u_mz(1) 
gSM(7)= 0.619  ! mf_u_mz(2) 
gSM(8)= mf_u_mz_running ! m_top 
gSM(9)= 2.9E-03_dp !mf_d_mz(1) 
gSM(10)= 0.055 !mf_d_mz(2) 
gSM(11)= 2.85 ! mf_d_mz(3) 
 

! To get the running sin(w2) 
SinW2 = 0.22290_dp
gSM(12) = 5._dp/3._dp*Alpha_MZ/(1-sinW2)
gSM(13) = Alpha_MZ/Sinw2
gSM(14) = AlphaS_mZ

  nUp =2._dp 
  nDown =3._dp 
  nLep =3._dp 
 

If (scale_out.gt.sqrt(mz2)) Then

 ! From M_Z to Min(M_top,scale_out) 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(sqrt(mz2)/mf_u(3)) 
  dt=tz/50._dp 
 Else 
  tz=Log(sqrt(mz2)/scale_out) 
  dt=tz/50._dp 
 End if 

  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)


 ! From M_top to M_SUSY if M_top < M_SUSY 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(mf_u(3)/scale_out) 
  dt=tz/50._dp 
  nUp =3._dp 
  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)
 End if 
Else

 ! From M_Z down to scale_out
  tz=Log(scale_out/sqrt(mz2)) 
  dt=tz/50._dp 
  Call odeint(gSM,14,0._dp,tz,deltaM,dt,0._dp,rge11_SMa,kont)

End if

! Calculating Couplings 

 sinW2=1._dp-mW2/mZ2 
 vev=Sqrt(mZ2*(1._dp-sinW2)*SinW2/(gSM(1)**2/4._dp))
 vd=vev/Sqrt(1._dp+tb**2)
 vu=tb*vd
 
Yd(1,1) =gSM(9)*sqrt(2._dp)/vd 
Yd(2,2) =gSM(10)*sqrt(2._dp)/vd 
Yd(3,3) =gSM(11)*sqrt(2._dp)/vd 
Ye(1,1) =gSM(3)*sqrt(2._dp)/vd 
Ye(2,2)=gSM(4)*sqrt(2._dp)/vd 
Ye(3,3)=gSM(5)*sqrt(2._dp)/vd 
Yu(1,1)=gSM(6)*sqrt(2._dp)/vu 
Yu(2,2)=gSM(7)*sqrt(2._dp)/vu 
Yu(3,3)=gSM(8)*sqrt(2._dp)/vu 


g3 =gSM(2) 
g3running=gSM(2) 

g1 = sqrt(gSM(12)*4._dp*Pi*3._dp/5._dp)
g2 = sqrt(gSM(13)*4._dp*Pi)
! g3 = sqrt(gSM(3)*4._dp*Pi)

sinw2 = g1**2/(g1**2 + g2**2)

!g2=gSM(1)/sqrt(sinW2) 
!g1 = g2*Sqrt(sinW2/(1._dp-sinW2)) 

If (GenerationMixing) Then 

If (YukawaScheme.Eq.1) Then ! CKM into Yu
 If (TransposedYukawa) Then ! check, if superpotential is Yu Hu u q  or Yu Hu q u
   Yu= Matmul(Transpose(CKM),Transpose(Yu))
 Else 
   Yu=Transpose(Matmul(Transpose(CKM),Transpose(Yu)))
 End if 

Else ! CKM into Yd 
 
 If (TransposedYukawa) Then ! 
  Yd= Matmul(Conjg(CKM),Transpose(Yd))
 Else 
  Yd=Transpose(Matmul(Conjg(CKM),Transpose(Yd)))
 End if 

End if ! Yukawa scheme
End If ! Generatoin mixing


End Subroutine RunSM


Subroutine RunSMohdm(scale_out,deltaM,g1,g2,g3,Yu, Yd, Ye, v) 
Implicit None
Real(dp), Intent(in) :: scale_out,deltaM
Real(dp), Intent(out) :: g1, g2, g3, v
Complex(dp), Intent(out) :: Yu(3,3), Yd(3,3), Ye(3,3)
Real(dp) :: dt, gSM(14), gSM2(2), gSM3(3), mtopMS,  sinw2, vev, tz, alphaStop 
Integer :: kont

Yd = 0._dp
Ye = 0._dp
Yu = 0._dp

If (.not.RunningTopMZ) Then

! Calculating alpha_S(m_top)
gSM2(1)=sqrt(Alpha_mZ*4*Pi) 
gSM2(2)=sqrt(AlphaS_mZ*4*Pi) 


tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM2,2,tz,0._dp,deltaM,dt,0._dp,RGEAlphaS,kont)



alphaStop = gSM2(2)**2/4._dp/Pi



! m_top^pole to m_top^MS(m_top) 

mtopMS = mf_u(3)*(1._dp - 4._dp/3._dp*alphaStop/Pi)


! Running m_top^MS(m_top) to M_Z 

gSM3(1)=gSM2(1) 
gSM3(2)=gSM2(2)
gSM3(3)=mtopMS

tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM3,3,0._dp,tz,deltaM,dt,0._dp,RGEtop,kont)


mf_u_mz_running = gSM3(3)


RunningTopMZ = .True.

End if

! Starting values at MZ

gSM(1)=sqrt(Alpha_mZ*4*Pi) 
gSM(2)=sqrt(AlphaS_mZ*4*Pi) 
gSM(3)= 0.486E-03_dp ! mf_l_mz(1) 
gSM(4)= 0.10272 !mf_l_mz(2) 
gSM(5)= 1.74624 !mf_l_mz(3) 
gSM(6)= 1.27E-03_dp ! mf_u_mz(1) 
gSM(7)= 0.619  ! mf_u_mz(2) 
gSM(8)= mf_u_mz_running ! m_top 
gSM(9)= 2.9E-03_dp !mf_d_mz(1) 
gSM(10)= 0.055 !mf_d_mz(2) 
gSM(11)= 2.85 ! mf_d_mz(3) 
 

! To get the running sin(w2) 
SinW2 = 0.22290_dp
gSM(12) = 5._dp/3._dp*Alpha_MZ/(1-sinW2)
gSM(13) = Alpha_MZ/Sinw2
gSM(14) = AlphaS_mZ

  nUp =2._dp 
  nDown =3._dp 
  nLep =3._dp 
 

If (scale_out.gt.sqrt(mz2)) Then

 ! From M_Z to Min(M_top,scale_out) 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(sqrt(mz2)/mf_u(3)) 
  dt=tz/50._dp 
 Else 
  tz=Log(sqrt(mz2)/scale_out) 
  dt=tz/50._dp 
 End if 

  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)


 ! From M_top to M_SUSY if M_top < M_SUSY 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(mf_u(3)/scale_out) 
  dt=tz/50._dp 
  nUp =3._dp 
  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)
 End if 
Else

 ! From M_Z down to scale_out
  If (abs(scale_out - sqrt(mz2)).gt.1.0E-3_dp) Then 
   tz=Log(scale_out/sqrt(mz2)) 
   dt=tz/50._dp 
   Call odeint(gSM,14,0._dp,tz,deltaM,dt,0._dp,rge11_SMa,kont)
  End if
End if

! Calculating Couplings 

 sinW2=1._dp-mW2/mZ2 
 vev=Sqrt(mZ2*(1._dp-sinW2)*SinW2/(gSM(1)**2/4._dp))
 v = vev
 
Yd(1,1) =gSM(9)*sqrt(2._dp)/v 
Yd(2,2) =gSM(10)*sqrt(2._dp)/v 
Yd(3,3) =gSM(11)*sqrt(2._dp)/v 
Ye(1,1) =gSM(3)*sqrt(2._dp)/v 
Ye(2,2)=gSM(4)*sqrt(2._dp)/v 
Ye(3,3)=gSM(5)*sqrt(2._dp)/v 
Yu(1,1)=gSM(6)*sqrt(2._dp)/v 
Yu(2,2)=gSM(7)*sqrt(2._dp)/v 
Yu(3,3)=gSM(8)*sqrt(2._dp)/v 


g3 =gSM(2) 
g3running=gSM(2) 

g1 = sqrt(gSM(12)*4._dp*Pi*3._dp/5._dp)
g2 = sqrt(gSM(13)*4._dp*Pi)
! g3 = sqrt(gSM(3)*4._dp*Pi)

sinw2 = g1**2/(g1**2 + g2**2)

g2=gSM(1)/sqrt(sinW2) 
g1 = g2*Sqrt(sinW2/(1._dp-sinW2)) 

If (GenerationMixing) Then 

If (YukawaScheme.Eq.1) Then ! CKM into Yu
 If (TransposedYukawa) Then ! check, if superpotential is Yu Hu u q  or Yu Hu q u
   Yu= Matmul(Transpose(CKM),Transpose(Yu))
 Else 
   Yu=Transpose(Matmul(Transpose(CKM),Transpose(Yu)))
 End if 

Else ! CKM into Yd 
 
 If (TransposedYukawa) Then ! 
  Yd= Matmul(Conjg(CKM),Transpose(Yd))
 Else 
  Yd=Transpose(Matmul(Conjg(CKM),Transpose(Yd)))
 End if 

End if ! Yukawa scheme
End If ! Generation mixing



End Subroutine RunSMohdm

Subroutine RunSMgauge(scale_out,deltaM,g1,g2,g3) 
Implicit None
Real(dp), Intent(in) :: scale_out,deltaM
Real(dp), Intent(out) :: g1, g2, g3
Complex(dp) :: Yu(3,3), Yd(3,3), Ye(3,3)
Real(dp) :: v, dt, gSM(14), gSM2(2), gSM3(3), mtopMS,  sinw2, vev, tz, alphaStop 
Integer :: kont

Yd = 0._dp
Ye = 0._dp
Yu = 0._dp

RunningTopMZ = .false.

If (.not.RunningTopMZ) Then

! Calculating alpha_S(m_top)
gSM2(1)=sqrt(Alpha_mZ*4*Pi) 
gSM2(2)=sqrt(AlphaS_mZ*4*Pi) 


tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM2,2,tz,0._dp,deltaM,dt,0._dp,RGEAlphaS,kont)



alphaStop = gSM2(2)**2/4._dp/Pi



! m_top^pole to m_top^MS(m_top) 

mtopMS = mf_u(3)*(1._dp - 4._dp/3._dp*alphaStop/Pi)


! Running m_top^MS(m_top) to M_Z 

gSM3(1)=gSM2(1) 
gSM3(2)=gSM2(2)
gSM3(3)=mtopMS

tz=Log(sqrt(mz2)/mf_u(3)) 
dt=tz/50._dp 
Call odeint(gSM3,3,0._dp,tz,deltaM,dt,0._dp,RGEtop,kont)


mf_u_mz_running = gSM3(3)


RunningTopMZ = .True.

End if

! Starting values at MZ

gSM(1)=sqrt(Alpha_mZ*4*Pi) 
gSM(2)=sqrt(AlphaS_mZ*4*Pi) 
gSM(3)= 0.486E-03_dp ! mf_l_mz(1) 
gSM(4)= 0.10272 !mf_l_mz(2) 
gSM(5)= 1.74624 !mf_l_mz(3) 
gSM(6)= 1.27E-03_dp ! mf_u_mz(1) 
gSM(7)= 0.619  ! mf_u_mz(2) 
gSM(8)= mf_u_mz_running ! m_top 
gSM(9)= 2.9E-03_dp !mf_d_mz(1) 
gSM(10)= 0.055 !mf_d_mz(2) 
gSM(11)= 2.85 ! mf_d_mz(3) 
 

! To get the running sin(w2) 
SinW2 = 0.22290_dp
gSM(12) = 5._dp/3._dp*Alpha_MZ/(1-sinW2)
gSM(13) = Alpha_MZ/Sinw2
gSM(14) = AlphaS_mZ

  nUp =2._dp 
  nDown =3._dp 
  nLep =3._dp 
 

If (scale_out.gt.sqrt(mz2)) Then

 ! From M_Z to Min(M_top,scale_out) 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(sqrt(mz2)/mf_u(3)) 
  dt=tz/50._dp 
 Else 
  tz=Log(sqrt(mz2)/scale_out) 
  dt=tz/50._dp 
 End if 

  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)


 ! From M_top to M_SUSY if M_top < M_SUSY 
 If (scale_out.gt.mf_u(3)) Then 
  tz=Log(mf_u(3)/scale_out) 
  dt=tz/50._dp 
  nUp =3._dp 
  Call odeint(gSM,14,tz,0._dp,deltaM,dt,0._dp,rge11,kont)
 End if 
Else

 ! From M_Z down to scale_out
  tz=Log(scale_out/sqrt(mz2)) 
  dt=tz/50._dp 
  Call odeint(gSM,14,0._dp,tz,deltaM,dt,0._dp,rge11_SMa,kont)

End if

! Calculating Couplings 

 sinW2=1._dp-mW2/mZ2 
 vev=Sqrt(mZ2*(1._dp-sinW2)*SinW2/(gSM(1)**2/4._dp))
 v = vev
 
Yd(1,1) =gSM(9)*sqrt(2._dp)/v 
Yd(2,2) =gSM(10)*sqrt(2._dp)/v 
Yd(3,3) =gSM(11)*sqrt(2._dp)/v 
Ye(1,1) =gSM(3)*sqrt(2._dp)/v 
Ye(2,2)=gSM(4)*sqrt(2._dp)/v 
Ye(3,3)=gSM(5)*sqrt(2._dp)/v 
Yu(1,1)=gSM(6)*sqrt(2._dp)/v 
Yu(2,2)=gSM(7)*sqrt(2._dp)/v 
Yu(3,3)=gSM(8)*sqrt(2._dp)/v 


g3 =gSM(2) 
g3running=gSM(2) 

g1 = sqrt(gSM(12)*4._dp*Pi*3._dp/5._dp)
g2 = sqrt(gSM(13)*4._dp*Pi)
! g3 = sqrt(gSM(3)*4._dp*Pi)

sinw2 = g1**2/(g1**2 + g2**2)

g2=gSM(1)/sqrt(sinW2) 
g1 = g2*Sqrt(sinW2/(1._dp-sinW2)) 

If (GenerationMixing) Then 
If (TransposedYukawa) Then ! check, if superpotential is Yu Hu u q  or Yu Hu q u
 Yu= Matmul(Transpose(CKM),Transpose(Yu))
Else 
 Yu=Transpose(Matmul(Transpose(CKM),Transpose(Yu)))
End if 
End If


End Subroutine RunSMgauge
End Module CouplingsForDecays_DLRSM
