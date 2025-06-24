! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.15.3 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 14:19 on 18.6.2025   
! ----------------------------------------------------------------------  
 
 
Module Tadpoles_DLRSM 
 
Use Model_Data_DLRSM 
Use TreeLevelMasses_DLRSM 
Use RGEs_DLRSM 
Use Control 
Use Settings 
Use Mathematics 

Contains 


Subroutine SolveTadpoleEquations(gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,             & 
& ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,k1,vR,Tad1Loop)

Implicit None
Real(dp),Intent(inout) :: gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,MU12,MU22,k1,vR

Complex(dp),Intent(inout) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3),YL(3,3),YR(3,3),Mux(3,3)

Complex(dp), Intent(in) :: Tad1Loop(4)

! For numerical routines 
Real(dp) :: gC(144)
logical :: broycheck 
Real(dp) :: broyx(2)

If (HighScaleModel.Eq."LOW") Then 
MU12 = k1**2*(LAM1 + LAM2) + ((ALP1 + ALP3)*vR**2)/2._dp + Tad1Loop(3)/k1
MU22 = (ALP1*k1**2)/2._dp + (ALP3*k1**2)/2._dp + RHO1*vR**2 + Tad1Loop(4)/vR

 ! ----------- Check solutions for consistency  -------- 

 ! Check for NaNs 
If (MU12.ne.MU12) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for MU12" 
   Call TerminateProgram  
 End If 
 If (MU22.ne.MU22) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for MU22" 
   Call TerminateProgram  
 End If 
 Else 
MU12 = k1**2*(LAM1 + LAM2) + ((ALP1 + ALP3)*vR**2)/2._dp + Tad1Loop(3)/k1
MU22 = (ALP1*k1**2)/2._dp + (ALP3*k1**2)/2._dp + RHO1*vR**2 + Tad1Loop(4)/vR

 ! ----------- Check solutions for consistency  -------- 

 ! Check for NaNs 
If (MU12.ne.MU12) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for MU12" 
   Call TerminateProgram  
 End If 
 If (MU22.ne.MU22) Then 
   Write(*,*) "NaN appearing in solution of tadpole equations for MU22" 
   Call TerminateProgram  
 End If 
 End if 
End Subroutine SolveTadpoleEquations

Subroutine CalculateTadpoles(gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,            & 
& LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,Yt,YL,YR,Mux,MU12,MU22,k1,vR,Tad1Loop,TadpoleValues)

Real(dp),Intent(in) :: gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,MU12,MU22,k1,vR

Complex(dp),Intent(in) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3),YL(3,3),YR(3,3),Mux(3,3)

Complex(dp), Intent(in) :: Tad1Loop(2)

Real(dp), Intent(out) :: TadpoleValues(2)

TadpoleValues(1) = Real(-1._dp/2._dp*(k1*(2*k1**2*(LAM1 + LAM2) - 2._dp*(MU12)        & 
&  + (ALP1 + ALP3)*vR**2)) - Tad1Loop(3),dp) 
TadpoleValues(2) = Real(-1._dp/2._dp*(vR*((ALP1 + ALP3)*k1**2 - 2._dp*(MU22)          & 
&  + 2*RHO1*vR**2)) - Tad1Loop(4),dp) 
End Subroutine CalculateTadpoles 

End Module Tadpoles_DLRSM 
 
