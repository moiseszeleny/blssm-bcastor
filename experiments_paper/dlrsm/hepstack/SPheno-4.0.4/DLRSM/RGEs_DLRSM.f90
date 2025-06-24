! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.15.3 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 14:12 on 18.6.2025   
! ----------------------------------------------------------------------  
 
 
Module RGEs_DLRSM 
 
Use Control 
Use Settings 
Use Model_Data_DLRSM 
Use Mathematics 
 
Logical,Private,Save::OnlyDiagonal

Real(dp),Parameter::id3R(3,3)=& 
   & Reshape(Source=(/& 
   & 1,0,0,& 
 &0,1,0,& 
 &0,0,1& 
 &/),shape=(/3,3/)) 
Contains 


Subroutine GToParameters142(g,gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,           & 
& LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22)

Implicit None 
Real(dp), Intent(in) :: g(142) 
Real(dp),Intent(out) :: gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,MU12,MU22

Complex(dp),Intent(out) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3),YL(3,3),YR(3,3),Mux(3,3)

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters142' 
 
gBL= g(1) 
g2= g(2) 
g3= g(3) 
LAM2= g(4) 
LAM1= g(5) 
RHO1= g(6) 
RHO2= g(7) 
ALP2= g(8) 
ALP1= g(9) 
ALP3= g(10) 
LAM5= g(11) 
LAM6= g(12) 
LAM3= g(13) 
LAM4= g(14) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Y(i1,i2) = Cmplx( g(SumI+15), g(SumI+16), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YQ1(i1,i2) = Cmplx( g(SumI+33), g(SumI+34), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YQ2(i1,i2) = Cmplx( g(SumI+51), g(SumI+52), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yt(i1,i2) = Cmplx( g(SumI+69), g(SumI+70), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YL(i1,i2) = Cmplx( g(SumI+87), g(SumI+88), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YR(i1,i2) = Cmplx( g(SumI+105), g(SumI+106), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Mux(i1,i2) = Cmplx( g(SumI+123), g(SumI+124), dp) 
End Do 
 End Do 
 
MU12= g(141) 
MU22= g(142) 
Do i1=1,142 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters142

Subroutine ParametersToG142(gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,             & 
& LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,g)

Implicit None 
Real(dp), Intent(out) :: g(142) 
Real(dp), Intent(in) :: gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,MU12,MU22

Complex(dp), Intent(in) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3),YL(3,3),YR(3,3),Mux(3,3)

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG142' 
 
g(1) = gBL  
g(2) = g2  
g(3) = g3  
g(4) = LAM2  
g(5) = LAM1  
g(6) = RHO1  
g(7) = RHO2  
g(8) = ALP2  
g(9) = ALP1  
g(10) = ALP3  
g(11) = LAM5  
g(12) = LAM6  
g(13) = LAM3  
g(14) = LAM4  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+15) = Real(Y(i1,i2), dp) 
g(SumI+16) = Aimag(Y(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+33) = Real(YQ1(i1,i2), dp) 
g(SumI+34) = Aimag(YQ1(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+51) = Real(YQ2(i1,i2), dp) 
g(SumI+52) = Aimag(YQ2(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+69) = Real(Yt(i1,i2), dp) 
g(SumI+70) = Aimag(Yt(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+87) = Real(YL(i1,i2), dp) 
g(SumI+88) = Aimag(YL(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+105) = Real(YR(i1,i2), dp) 
g(SumI+106) = Aimag(YR(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+123) = Real(Mux(i1,i2), dp) 
g(SumI+124) = Aimag(Mux(i1,i2)) 
End Do 
End Do 

g(141) = MU12  
g(142) = MU22  
Iname = Iname - 1 
 
End Subroutine ParametersToG142

Subroutine rge142(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: gBL,betagBL1,betagBL2,DgBL,g2,betag21,betag22,Dg2,g3,betag31,             & 
& betag32,Dg3,LAM2,betaLAM21,betaLAM22,DLAM2,LAM1,betaLAM11,betaLAM12,DLAM1,             & 
& RHO1,betaRHO11,betaRHO12,DRHO1,RHO2,betaRHO21,betaRHO22,DRHO2,ALP2,betaALP21,          & 
& betaALP22,DALP2,ALP1,betaALP11,betaALP12,DALP1,ALP3,betaALP31,betaALP32,               & 
& DALP3,LAM5,betaLAM51,betaLAM52,DLAM5,LAM6,betaLAM61,betaLAM62,DLAM6,LAM3,              & 
& betaLAM31,betaLAM32,DLAM3,LAM4,betaLAM41,betaLAM42,DLAM4,MU12,betaMU121,               & 
& betaMU122,DMU12,MU22,betaMU221,betaMU222,DMU22
Complex(dp) :: Y(3,3),betaY1(3,3),betaY2(3,3),DY(3,3),adjY(3,3),YQ1(3,3)              & 
& ,betaYQ11(3,3),betaYQ12(3,3),DYQ1(3,3),adjYQ1(3,3),YQ2(3,3),betaYQ21(3,3)              & 
& ,betaYQ22(3,3),DYQ2(3,3),adjYQ2(3,3),Yt(3,3),betaYt1(3,3),betaYt2(3,3),DYt(3,3)        & 
& ,adjYt(3,3),YL(3,3),betaYL1(3,3),betaYL2(3,3),DYL(3,3),adjYL(3,3),YR(3,3)              & 
& ,betaYR1(3,3),betaYR2(3,3),DYR(3,3),adjYR(3,3),Mux(3,3),betaMux1(3,3),betaMux2(3,3)    & 
& ,DMux(3,3),adjMux(3,3)
Iname = Iname +1 
NameOfUnit(Iname) = 'rge142' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters142(gy,gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,           & 
& LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22)

Call Adjungate(Y,adjY)
Call Adjungate(YQ1,adjYQ1)
Call Adjungate(YQ2,adjYQ2)
Call Adjungate(Yt,adjYt)
Call Adjungate(YL,adjYL)
Call Adjungate(YR,adjYR)
Call Adjungate(Mux,adjMux)


If (TwoLoopRGE) Then 
End If 
 
 
!-------------------- 
! gBL 
!-------------------- 
 
betagBL1  = 0

 
 
If (TwoLoopRGE) Then 
betagBL2 = 0

 
DgBL = oo16pi2*( betagBL1 + oo16pi2 * betagBL2 ) 

 
Else 
DgBL = oo16pi2* betagBL1 
End If 
 
 
!-------------------- 
! g2 
!-------------------- 
 
betag21  = 0

 
 
If (TwoLoopRGE) Then 
betag22 = 0

 
Dg2 = oo16pi2*( betag21 + oo16pi2 * betag22 ) 

 
Else 
Dg2 = oo16pi2* betag21 
End If 
 
 
!-------------------- 
! g3 
!-------------------- 
 
betag31  = 0

 
 
If (TwoLoopRGE) Then 
betag32 = 0

 
Dg3 = oo16pi2*( betag31 + oo16pi2 * betag32 ) 

 
Else 
Dg3 = oo16pi2* betag31 
End If 
 
 
!-------------------- 
! LAM2 
!-------------------- 
 
betaLAM21  = 0

 
 
If (TwoLoopRGE) Then 
betaLAM22 = 0

 
DLAM2 = oo16pi2*( betaLAM21 + oo16pi2 * betaLAM22 ) 

 
Else 
DLAM2 = oo16pi2* betaLAM21 
End If 
 
 
!-------------------- 
! LAM1 
!-------------------- 
 
betaLAM11  = 0

 
 
If (TwoLoopRGE) Then 
betaLAM12 = 0

 
DLAM1 = oo16pi2*( betaLAM11 + oo16pi2 * betaLAM12 ) 

 
Else 
DLAM1 = oo16pi2* betaLAM11 
End If 
 
 
!-------------------- 
! RHO1 
!-------------------- 
 
betaRHO11  = 0

 
 
If (TwoLoopRGE) Then 
betaRHO12 = 0

 
DRHO1 = oo16pi2*( betaRHO11 + oo16pi2 * betaRHO12 ) 

 
Else 
DRHO1 = oo16pi2* betaRHO11 
End If 
 
 
!-------------------- 
! RHO2 
!-------------------- 
 
betaRHO21  = 0

 
 
If (TwoLoopRGE) Then 
betaRHO22 = 0

 
DRHO2 = oo16pi2*( betaRHO21 + oo16pi2 * betaRHO22 ) 

 
Else 
DRHO2 = oo16pi2* betaRHO21 
End If 
 
 
!-------------------- 
! ALP2 
!-------------------- 
 
betaALP21  = 0

 
 
If (TwoLoopRGE) Then 
betaALP22 = 0

 
DALP2 = oo16pi2*( betaALP21 + oo16pi2 * betaALP22 ) 

 
Else 
DALP2 = oo16pi2* betaALP21 
End If 
 
 
!-------------------- 
! ALP1 
!-------------------- 
 
betaALP11  = 0

 
 
If (TwoLoopRGE) Then 
betaALP12 = 0

 
DALP1 = oo16pi2*( betaALP11 + oo16pi2 * betaALP12 ) 

 
Else 
DALP1 = oo16pi2* betaALP11 
End If 
 
 
!-------------------- 
! ALP3 
!-------------------- 
 
betaALP31  = 0

 
 
If (TwoLoopRGE) Then 
betaALP32 = 0

 
DALP3 = oo16pi2*( betaALP31 + oo16pi2 * betaALP32 ) 

 
Else 
DALP3 = oo16pi2* betaALP31 
End If 
 
 
!-------------------- 
! LAM5 
!-------------------- 
 
betaLAM51  = 0

 
 
If (TwoLoopRGE) Then 
betaLAM52 = 0

 
DLAM5 = oo16pi2*( betaLAM51 + oo16pi2 * betaLAM52 ) 

 
Else 
DLAM5 = oo16pi2* betaLAM51 
End If 
 
 
!-------------------- 
! LAM6 
!-------------------- 
 
betaLAM61  = 0

 
 
If (TwoLoopRGE) Then 
betaLAM62 = 0

 
DLAM6 = oo16pi2*( betaLAM61 + oo16pi2 * betaLAM62 ) 

 
Else 
DLAM6 = oo16pi2* betaLAM61 
End If 
 
 
!-------------------- 
! LAM3 
!-------------------- 
 
betaLAM31  = 0

 
 
If (TwoLoopRGE) Then 
betaLAM32 = 0

 
DLAM3 = oo16pi2*( betaLAM31 + oo16pi2 * betaLAM32 ) 

 
Else 
DLAM3 = oo16pi2* betaLAM31 
End If 
 
 
!-------------------- 
! LAM4 
!-------------------- 
 
betaLAM41  = 0

 
 
If (TwoLoopRGE) Then 
betaLAM42 = 0

 
DLAM4 = oo16pi2*( betaLAM41 + oo16pi2 * betaLAM42 ) 

 
Else 
DLAM4 = oo16pi2* betaLAM41 
End If 
 
 
!-------------------- 
! Y 
!-------------------- 
 
betaY1  = 0

 
 
If (TwoLoopRGE) Then 
betaY2 = 0

 
DY = oo16pi2*( betaY1 + oo16pi2 * betaY2 ) 

 
Else 
DY = oo16pi2* betaY1 
End If 
 
 
Call Chop(DY) 

!-------------------- 
! YQ1 
!-------------------- 
 
betaYQ11  = 0

 
 
If (TwoLoopRGE) Then 
betaYQ12 = 0

 
DYQ1 = oo16pi2*( betaYQ11 + oo16pi2 * betaYQ12 ) 

 
Else 
DYQ1 = oo16pi2* betaYQ11 
End If 
 
 
Call Chop(DYQ1) 

!-------------------- 
! YQ2 
!-------------------- 
 
betaYQ21  = 0

 
 
If (TwoLoopRGE) Then 
betaYQ22 = 0

 
DYQ2 = oo16pi2*( betaYQ21 + oo16pi2 * betaYQ22 ) 

 
Else 
DYQ2 = oo16pi2* betaYQ21 
End If 
 
 
Call Chop(DYQ2) 

!-------------------- 
! Yt 
!-------------------- 
 
betaYt1  = 0

 
 
If (TwoLoopRGE) Then 
betaYt2 = 0

 
DYt = oo16pi2*( betaYt1 + oo16pi2 * betaYt2 ) 

 
Else 
DYt = oo16pi2* betaYt1 
End If 
 
 
Call Chop(DYt) 

!-------------------- 
! YL 
!-------------------- 
 
betaYL1  = 0

 
 
If (TwoLoopRGE) Then 
betaYL2 = 0

 
DYL = oo16pi2*( betaYL1 + oo16pi2 * betaYL2 ) 

 
Else 
DYL = oo16pi2* betaYL1 
End If 
 
 
Call Chop(DYL) 

!-------------------- 
! YR 
!-------------------- 
 
betaYR1  = 0

 
 
If (TwoLoopRGE) Then 
betaYR2 = 0

 
DYR = oo16pi2*( betaYR1 + oo16pi2 * betaYR2 ) 

 
Else 
DYR = oo16pi2* betaYR1 
End If 
 
 
Call Chop(DYR) 

!-------------------- 
! Mux 
!-------------------- 
 
betaMux1  = 0

 
 
If (TwoLoopRGE) Then 
betaMux2 = 0

 
DMux = oo16pi2*( betaMux1 + oo16pi2 * betaMux2 ) 

 
Else 
DMux = oo16pi2* betaMux1 
End If 
 
 
Call Chop(DMux) 

!-------------------- 
! MU12 
!-------------------- 
 
betaMU121  = 0

 
 
If (TwoLoopRGE) Then 
betaMU122 = 0

 
DMU12 = oo16pi2*( betaMU121 + oo16pi2 * betaMU122 ) 

 
Else 
DMU12 = oo16pi2* betaMU121 
End If 
 
 
!-------------------- 
! MU22 
!-------------------- 
 
betaMU221  = 0

 
 
If (TwoLoopRGE) Then 
betaMU222 = 0

 
DMU22 = oo16pi2*( betaMU221 + oo16pi2 * betaMU222 ) 

 
Else 
DMU22 = oo16pi2* betaMU221 
End If 
 
 
Call ParametersToG142(DgBL,Dg2,Dg3,DLAM2,DLAM1,DRHO1,DRHO2,DALP2,DALP1,               & 
& DALP3,DLAM5,DLAM6,DLAM3,DLAM4,DY,DYQ1,DYQ2,DYt,DYL,DYR,DMux,DMU12,DMU22,f)

Iname = Iname - 1 
 
End Subroutine rge142  

Subroutine GToParameters144(g,gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,           & 
& LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,k1,vR)

Implicit None 
Real(dp), Intent(in) :: g(144) 
Real(dp),Intent(out) :: gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,MU12,MU22,k1,vR

Complex(dp),Intent(out) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3),YL(3,3),YR(3,3),Mux(3,3)

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'GToParameters144' 
 
gBL= g(1) 
g2= g(2) 
g3= g(3) 
LAM2= g(4) 
LAM1= g(5) 
RHO1= g(6) 
RHO2= g(7) 
ALP2= g(8) 
ALP1= g(9) 
ALP3= g(10) 
LAM5= g(11) 
LAM6= g(12) 
LAM3= g(13) 
LAM4= g(14) 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Y(i1,i2) = Cmplx( g(SumI+15), g(SumI+16), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YQ1(i1,i2) = Cmplx( g(SumI+33), g(SumI+34), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YQ2(i1,i2) = Cmplx( g(SumI+51), g(SumI+52), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Yt(i1,i2) = Cmplx( g(SumI+69), g(SumI+70), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YL(i1,i2) = Cmplx( g(SumI+87), g(SumI+88), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
YR(i1,i2) = Cmplx( g(SumI+105), g(SumI+106), dp) 
End Do 
 End Do 
 
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
Mux(i1,i2) = Cmplx( g(SumI+123), g(SumI+124), dp) 
End Do 
 End Do 
 
MU12= g(141) 
MU22= g(142) 
k1= g(143) 
vR= g(144) 
Do i1=1,144 
If (g(i1).ne.g(i1)) Then 
 Write(*,*) "NaN appearing in ",NameOfUnit(Iname) 
 Write(*,*) "At position ", i1 
 Call TerminateProgram 
End if 
End do 
Iname = Iname - 1 
 
End Subroutine GToParameters144

Subroutine ParametersToG144(gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,             & 
& LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,k1,vR,g)

Implicit None 
Real(dp), Intent(out) :: g(144) 
Real(dp), Intent(in) :: gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,MU12,MU22,k1,vR

Complex(dp), Intent(in) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3),YL(3,3),YR(3,3),Mux(3,3)

Integer i1, i2, i3, i4, SumI 
 
Iname = Iname +1 
NameOfUnit(Iname) = 'ParametersToG144' 
 
g(1) = gBL  
g(2) = g2  
g(3) = g3  
g(4) = LAM2  
g(5) = LAM1  
g(6) = RHO1  
g(7) = RHO2  
g(8) = ALP2  
g(9) = ALP1  
g(10) = ALP3  
g(11) = LAM5  
g(12) = LAM6  
g(13) = LAM3  
g(14) = LAM4  
Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+15) = Real(Y(i1,i2), dp) 
g(SumI+16) = Aimag(Y(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+33) = Real(YQ1(i1,i2), dp) 
g(SumI+34) = Aimag(YQ1(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+51) = Real(YQ2(i1,i2), dp) 
g(SumI+52) = Aimag(YQ2(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+69) = Real(Yt(i1,i2), dp) 
g(SumI+70) = Aimag(Yt(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+87) = Real(YL(i1,i2), dp) 
g(SumI+88) = Aimag(YL(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+105) = Real(YR(i1,i2), dp) 
g(SumI+106) = Aimag(YR(i1,i2)) 
End Do 
End Do 

Do i1 = 1,3
Do i2 = 1,3
SumI = (i2-1) + (i1-1)*3
SumI = SumI*2 
g(SumI+123) = Real(Mux(i1,i2), dp) 
g(SumI+124) = Aimag(Mux(i1,i2)) 
End Do 
End Do 

g(141) = MU12  
g(142) = MU22  
g(143) = k1  
g(144) = vR  
Iname = Iname - 1 
 
End Subroutine ParametersToG144

Subroutine rge144(len, T, GY, F) 
Implicit None 
Integer, Intent(in) :: len 
Real(dp), Intent(in) :: T, GY(len) 
Real(dp), Intent(out) :: F(len) 
Integer :: i1,i2,i3,i4 
Integer :: j1,j2,j3,j4,j5,j6,j7 
Real(dp) :: q 
Real(dp) :: gBL,betagBL1,betagBL2,DgBL,g2,betag21,betag22,Dg2,g3,betag31,             & 
& betag32,Dg3,LAM2,betaLAM21,betaLAM22,DLAM2,LAM1,betaLAM11,betaLAM12,DLAM1,             & 
& RHO1,betaRHO11,betaRHO12,DRHO1,RHO2,betaRHO21,betaRHO22,DRHO2,ALP2,betaALP21,          & 
& betaALP22,DALP2,ALP1,betaALP11,betaALP12,DALP1,ALP3,betaALP31,betaALP32,               & 
& DALP3,LAM5,betaLAM51,betaLAM52,DLAM5,LAM6,betaLAM61,betaLAM62,DLAM6,LAM3,              & 
& betaLAM31,betaLAM32,DLAM3,LAM4,betaLAM41,betaLAM42,DLAM4,MU12,betaMU121,               & 
& betaMU122,DMU12,MU22,betaMU221,betaMU222,DMU22,k1,betak11,betak12,Dk1,vR,              & 
& betavR1,betavR2,DvR
Complex(dp) :: Y(3,3),betaY1(3,3),betaY2(3,3),DY(3,3),adjY(3,3),YQ1(3,3)              & 
& ,betaYQ11(3,3),betaYQ12(3,3),DYQ1(3,3),adjYQ1(3,3),YQ2(3,3),betaYQ21(3,3)              & 
& ,betaYQ22(3,3),DYQ2(3,3),adjYQ2(3,3),Yt(3,3),betaYt1(3,3),betaYt2(3,3),DYt(3,3)        & 
& ,adjYt(3,3),YL(3,3),betaYL1(3,3),betaYL2(3,3),DYL(3,3),adjYL(3,3),YR(3,3)              & 
& ,betaYR1(3,3),betaYR2(3,3),DYR(3,3),adjYR(3,3),Mux(3,3),betaMux1(3,3),betaMux2(3,3)    & 
& ,DMux(3,3),adjMux(3,3)
Iname = Iname +1 
NameOfUnit(Iname) = 'rge144' 
 
OnlyDiagonal = .Not.GenerationMixing 
q = t 
 
Call GToParameters144(gy,gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,           & 
& LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,k1,vR)

Call Adjungate(Y,adjY)
Call Adjungate(YQ1,adjYQ1)
Call Adjungate(YQ2,adjYQ2)
Call Adjungate(Yt,adjYt)
Call Adjungate(YL,adjYL)
Call Adjungate(YR,adjYR)
Call Adjungate(Mux,adjMux)


If (TwoLoopRGE) Then 
End If 
 
 
!-------------------- 
! gBL 
!-------------------- 
 
betagBL1  = 0

 
 
If (TwoLoopRGE) Then 
betagBL2 = 0

 
DgBL = oo16pi2*( betagBL1 + oo16pi2 * betagBL2 ) 

 
Else 
DgBL = oo16pi2* betagBL1 
End If 
 
 
!-------------------- 
! g2 
!-------------------- 
 
betag21  = 0

 
 
If (TwoLoopRGE) Then 
betag22 = 0

 
Dg2 = oo16pi2*( betag21 + oo16pi2 * betag22 ) 

 
Else 
Dg2 = oo16pi2* betag21 
End If 
 
 
!-------------------- 
! g3 
!-------------------- 
 
betag31  = 0

 
 
If (TwoLoopRGE) Then 
betag32 = 0

 
Dg3 = oo16pi2*( betag31 + oo16pi2 * betag32 ) 

 
Else 
Dg3 = oo16pi2* betag31 
End If 
 
 
!-------------------- 
! LAM2 
!-------------------- 
 
betaLAM21  = 0

 
 
If (TwoLoopRGE) Then 
betaLAM22 = 0

 
DLAM2 = oo16pi2*( betaLAM21 + oo16pi2 * betaLAM22 ) 

 
Else 
DLAM2 = oo16pi2* betaLAM21 
End If 
 
 
!-------------------- 
! LAM1 
!-------------------- 
 
betaLAM11  = 0

 
 
If (TwoLoopRGE) Then 
betaLAM12 = 0

 
DLAM1 = oo16pi2*( betaLAM11 + oo16pi2 * betaLAM12 ) 

 
Else 
DLAM1 = oo16pi2* betaLAM11 
End If 
 
 
!-------------------- 
! RHO1 
!-------------------- 
 
betaRHO11  = 0

 
 
If (TwoLoopRGE) Then 
betaRHO12 = 0

 
DRHO1 = oo16pi2*( betaRHO11 + oo16pi2 * betaRHO12 ) 

 
Else 
DRHO1 = oo16pi2* betaRHO11 
End If 
 
 
!-------------------- 
! RHO2 
!-------------------- 
 
betaRHO21  = 0

 
 
If (TwoLoopRGE) Then 
betaRHO22 = 0

 
DRHO2 = oo16pi2*( betaRHO21 + oo16pi2 * betaRHO22 ) 

 
Else 
DRHO2 = oo16pi2* betaRHO21 
End If 
 
 
!-------------------- 
! ALP2 
!-------------------- 
 
betaALP21  = 0

 
 
If (TwoLoopRGE) Then 
betaALP22 = 0

 
DALP2 = oo16pi2*( betaALP21 + oo16pi2 * betaALP22 ) 

 
Else 
DALP2 = oo16pi2* betaALP21 
End If 
 
 
!-------------------- 
! ALP1 
!-------------------- 
 
betaALP11  = 0

 
 
If (TwoLoopRGE) Then 
betaALP12 = 0

 
DALP1 = oo16pi2*( betaALP11 + oo16pi2 * betaALP12 ) 

 
Else 
DALP1 = oo16pi2* betaALP11 
End If 
 
 
!-------------------- 
! ALP3 
!-------------------- 
 
betaALP31  = 0

 
 
If (TwoLoopRGE) Then 
betaALP32 = 0

 
DALP3 = oo16pi2*( betaALP31 + oo16pi2 * betaALP32 ) 

 
Else 
DALP3 = oo16pi2* betaALP31 
End If 
 
 
!-------------------- 
! LAM5 
!-------------------- 
 
betaLAM51  = 0

 
 
If (TwoLoopRGE) Then 
betaLAM52 = 0

 
DLAM5 = oo16pi2*( betaLAM51 + oo16pi2 * betaLAM52 ) 

 
Else 
DLAM5 = oo16pi2* betaLAM51 
End If 
 
 
!-------------------- 
! LAM6 
!-------------------- 
 
betaLAM61  = 0

 
 
If (TwoLoopRGE) Then 
betaLAM62 = 0

 
DLAM6 = oo16pi2*( betaLAM61 + oo16pi2 * betaLAM62 ) 

 
Else 
DLAM6 = oo16pi2* betaLAM61 
End If 
 
 
!-------------------- 
! LAM3 
!-------------------- 
 
betaLAM31  = 0

 
 
If (TwoLoopRGE) Then 
betaLAM32 = 0

 
DLAM3 = oo16pi2*( betaLAM31 + oo16pi2 * betaLAM32 ) 

 
Else 
DLAM3 = oo16pi2* betaLAM31 
End If 
 
 
!-------------------- 
! LAM4 
!-------------------- 
 
betaLAM41  = 0

 
 
If (TwoLoopRGE) Then 
betaLAM42 = 0

 
DLAM4 = oo16pi2*( betaLAM41 + oo16pi2 * betaLAM42 ) 

 
Else 
DLAM4 = oo16pi2* betaLAM41 
End If 
 
 
!-------------------- 
! Y 
!-------------------- 
 
betaY1  = 0

 
 
If (TwoLoopRGE) Then 
betaY2 = 0

 
DY = oo16pi2*( betaY1 + oo16pi2 * betaY2 ) 

 
Else 
DY = oo16pi2* betaY1 
End If 
 
 
Call Chop(DY) 

!-------------------- 
! YQ1 
!-------------------- 
 
betaYQ11  = 0

 
 
If (TwoLoopRGE) Then 
betaYQ12 = 0

 
DYQ1 = oo16pi2*( betaYQ11 + oo16pi2 * betaYQ12 ) 

 
Else 
DYQ1 = oo16pi2* betaYQ11 
End If 
 
 
Call Chop(DYQ1) 

!-------------------- 
! YQ2 
!-------------------- 
 
betaYQ21  = 0

 
 
If (TwoLoopRGE) Then 
betaYQ22 = 0

 
DYQ2 = oo16pi2*( betaYQ21 + oo16pi2 * betaYQ22 ) 

 
Else 
DYQ2 = oo16pi2* betaYQ21 
End If 
 
 
Call Chop(DYQ2) 

!-------------------- 
! Yt 
!-------------------- 
 
betaYt1  = 0

 
 
If (TwoLoopRGE) Then 
betaYt2 = 0

 
DYt = oo16pi2*( betaYt1 + oo16pi2 * betaYt2 ) 

 
Else 
DYt = oo16pi2* betaYt1 
End If 
 
 
Call Chop(DYt) 

!-------------------- 
! YL 
!-------------------- 
 
betaYL1  = 0

 
 
If (TwoLoopRGE) Then 
betaYL2 = 0

 
DYL = oo16pi2*( betaYL1 + oo16pi2 * betaYL2 ) 

 
Else 
DYL = oo16pi2* betaYL1 
End If 
 
 
Call Chop(DYL) 

!-------------------- 
! YR 
!-------------------- 
 
betaYR1  = 0

 
 
If (TwoLoopRGE) Then 
betaYR2 = 0

 
DYR = oo16pi2*( betaYR1 + oo16pi2 * betaYR2 ) 

 
Else 
DYR = oo16pi2* betaYR1 
End If 
 
 
Call Chop(DYR) 

!-------------------- 
! Mux 
!-------------------- 
 
betaMux1  = 0

 
 
If (TwoLoopRGE) Then 
betaMux2 = 0

 
DMux = oo16pi2*( betaMux1 + oo16pi2 * betaMux2 ) 

 
Else 
DMux = oo16pi2* betaMux1 
End If 
 
 
Call Chop(DMux) 

!-------------------- 
! MU12 
!-------------------- 
 
betaMU121  = 0

 
 
If (TwoLoopRGE) Then 
betaMU122 = 0

 
DMU12 = oo16pi2*( betaMU121 + oo16pi2 * betaMU122 ) 

 
Else 
DMU12 = oo16pi2* betaMU121 
End If 
 
 
!-------------------- 
! MU22 
!-------------------- 
 
betaMU221  = 0

 
 
If (TwoLoopRGE) Then 
betaMU222 = 0

 
DMU22 = oo16pi2*( betaMU221 + oo16pi2 * betaMU222 ) 

 
Else 
DMU22 = oo16pi2* betaMU221 
End If 
 
 
!-------------------- 
! k1 
!-------------------- 
 
betak11  = 0

 
 
If (TwoLoopRGE) Then 
betak12 = 0

 
Dk1 = oo16pi2*( betak11 + oo16pi2 * betak12 ) 

 
Else 
Dk1 = oo16pi2* betak11 
End If 
 
 
!-------------------- 
! vR 
!-------------------- 
 
betavR1  = 0

 
 
If (TwoLoopRGE) Then 
betavR2 = 0

 
DvR = oo16pi2*( betavR1 + oo16pi2 * betavR2 ) 

 
Else 
DvR = oo16pi2* betavR1 
End If 
 
 
Call ParametersToG144(DgBL,Dg2,Dg3,DLAM2,DLAM1,DRHO1,DRHO2,DALP2,DALP1,               & 
& DALP3,DLAM5,DLAM6,DLAM3,DLAM4,DY,DYQ1,DYQ2,DYt,DYL,DYR,DMux,DMU12,DMU22,               & 
& Dk1,DvR,f)

Iname = Iname - 1 
 
End Subroutine rge144  

End Module RGEs_DLRSM 
 
