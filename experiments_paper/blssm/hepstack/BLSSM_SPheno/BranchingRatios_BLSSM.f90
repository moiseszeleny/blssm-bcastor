! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.14.5 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 19:15 on 3.11.2021   
! ----------------------------------------------------------------------  
 
 
Module BranchingRatios_BLSSM 
 
Use Control 
Use Settings 
Use Couplings_BLSSM 
Use Model_Data_BLSSM 
Use LoopCouplings_BLSSM 
Use Glu3Decays_BLSSM 
Use Cha3Decays_BLSSM 
Use Chi3Decays_BLSSM 
Use Sd3Decays_BLSSM 
Use Su3Decays_BLSSM 
Use Se3Decays_BLSSM 
Use SvRe3Decays_BLSSM 
Use SvIm3Decays_BLSSM 
Use Fv3Decays_BLSSM 
Use TreeLevelDecays_BLSSM 
Use OneLoopDecays_BLSSM


 Contains 
 
Subroutine CalculateBR(CTBD,fac3,epsI,deltaM,kont,MAh,MAh2,MCha,MCha2,MChi,           & 
& MChi2,MFd,MFd2,MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,              & 
& MSd,MSd2,MSe,MSe2,MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,              & 
& MVZp,MVZp2,pG,TW,TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,              & 
& ZUR,ZVI,ZVR,ZW,ZZ,betaH,vd,vu,x1,x2,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,               & 
& MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,            & 
& MBBp,M1,M2,M3,MBp,gPSd,gTSd,BRSd,gPSu,gTSu,BRSu,gPSe,gTSe,BRSe,gPSvRe,gTSvRe,          & 
& BRSvRe,gPSvIm,gTSvIm,BRSvIm,gPhh,gThh,BRhh,gPAh,gTAh,BRAh,gPHpm,gTHpm,BRHpm,           & 
& gPVZp,gTVZp,BRVZp,gPGlu,gTGlu,BRGlu,gPCha,gTCha,BRCha,gPChi,gTChi,BRChi,               & 
& gPFu,gTFu,BRFu,gPFv,gTFv,BRFv)

Real(dp), Intent(in) :: epsI, deltaM, fac3 
Integer, Intent(inout) :: kont 
Logical, Intent(in) :: CTBD 
Real(dp),Intent(inout) :: g1,g2,g3,gBL,gYB,gBY,mHd2,mHu2,mC12,mC22

Complex(dp),Intent(inout) :: Yd(3,3),Ye(3,3),Yu(3,3),Yx(3,3),Yv(3,3),MuP,Mu,Td(3,3),Te(3,3),Tu(3,3),               & 
& Tx(3,3),Tv(3,3),BMuP,Bmu,mq2(3,3),ml2(3,3),md2(3,3),mu2(3,3),me2(3,3),mv2(3,3),        & 
& MBBp,M1,M2,M3,MBp

Real(dp),Intent(in) :: MAh(4),MAh2(4),MCha(2),MCha2(2),MChi(7),MChi2(7),MFd(3),MFd2(3),MFe(3),               & 
& MFe2(3),MFu(3),MFu2(3),MFv(6),MFv2(6),MGlu,MGlu2,Mhh(4),Mhh2(4),MHpm(2),               & 
& MHpm2(2),MSd(6),MSd2(6),MSe(6),MSe2(6),MSu(6),MSu2(6),MSvIm(6),MSvIm2(6),              & 
& MSvRe(6),MSvRe2(6),MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,TW,TWp,v,ZA(4,4),ZH(4,4),            & 
& ZP(2,2),ZZ(3,3),betaH

Complex(dp),Intent(in) :: pG,UM(2,2),UP(2,2),UV(6,6),ZD(6,6),ZDL(3,3),ZDR(3,3),ZE(6,6),ZEL(3,3),ZER(3,3),       & 
& ZN(7,7),ZU(6,6),ZUL(3,3),ZUR(3,3),ZVI(6,6),ZVR(6,6),ZW(2,2)

Real(dp),Intent(inout) :: vd,vu,x1,x2

Real(dp),Intent(inout) :: gPSd(6,2064),gTSd(6),BRSd(6,2064),gPSu(6,2064),gTSu(6),BRSu(6,2064),gPSe(6,2193),     & 
& gTSe(6),BRSe(6,2193),gPSvRe(6,2580),gTSvRe(6),BRSvRe(6,2580),gPSvIm(6,2580),           & 
& gTSvIm(6),BRSvIm(6,2580),gPhh(4,320),gThh(4),BRhh(4,320),gPAh(4,318),gTAh(4),          & 
& BRAh(4,318),gPHpm(2,167),gTHpm(2),BRHpm(2,167),gPVZp(1,243),gTVZp,BRVZp(1,243),        & 
& gPGlu(1,197),gTGlu,BRGlu(1,197),gPCha(2,588),gTCha(2),BRCha(2,588),gPChi(7,1078),      & 
& gTChi(7),BRChi(7,1078),gPFu(3,96),gTFu(3),BRFu(3,96),gPFv(6,921),gTFv(6),              & 
& BRFv(6,921)

Complex(dp) :: cplHiggsPP(4),cplHiggsGG(4),cplPseudoHiggsPP(4),cplPseudoHiggsGG(4),cplHiggsZZvirt(4),& 
& cplHiggsWWvirt(4)

Real(dp) :: gGluFdcFdChi(1,3,3,7),gGluFdcFucCha(1,3,3,2),gGluFucFuChi(1,3,3,7),gChaChacChaCha(2,2,2,2),& 
& gChaChaChiChi(2,2,7,7),gChaChacFdFd(2,2,3,3),gChaChacFeFe(2,2,3,3),gChaChacFuFu(2,2,3,3),& 
& gChaChaFvFv(2,2,6,6),gChaChicFuFd(2,7,3,3),gChaChiFvFe(2,7,6,3),gChaFdcFuGlu(2,3,3,1), & 
& gChaFecChaFe(2,3,2,3),gChiChicChaCha(7,7,2,2),gChiChiChiChi(7,7,7,7),gChiChicFdFd(7,7,3,3),& 
& gChiChicFeFe(7,7,3,3),gChiChicFuFu(7,7,3,3),gChiChiFvFv(7,7,6,6),gChiChacFdFu(7,2,3,3),& 
& gChiChacFeFv(7,2,3,6),gChiFdcFdGlu(7,3,3,1),gChiFucFuGlu(7,3,3,1),gSdAhChaFu(6,4,2,3), & 
& gSdAhChiFd(6,4,7,3),gSdAhFdGlu(6,4,3,1),gSdSuChaChi(6,6,2,7),gSdChaFdcHpm(6,2,3,2),    & 
& gSdhhChaFu(6,4,2,3),gSdChaGluSu(6,2,1,6),gSdSdChacCha(6,6,2,2),gSdSdChiChi(6,6,7,7),   & 
& gSdhhChiFd(6,4,7,3),gSdHpmChiFu(6,2,7,3),gSdChiGluSd(6,7,1,6),gSdFdFdcSd(6,3,3,6),     & 
& gSdFdFecSe(6,3,3,6),gSdFuFdcSu(6,3,3,6),gSdFdFvSvIm(6,3,6,6),gSdFdFvSvRe(6,3,6,6),     & 
& gSdHpmFdcCha(6,2,3,2),gSdSdFdcFd(6,6,3,3),gSdFdSecFe(6,3,6,3),gSdSuFdcFu(6,6,3,3),     & 
& gSdFuFeSvIm(6,3,3,6),gSdFuFeSvRe(6,3,3,6),gSdFuFvSe(6,3,6,6),gSdSdFucFu(6,6,3,3),      & 
& gSdhhFdGlu(6,4,3,1),gSdHpmFuGlu(6,2,3,1),gSdGluGluSd(6,1,1,6),gSdSdFecFe(6,6,3,3),     & 
& gSdSdFvFv(6,6,6,6),gSdSuFeFv(6,6,3,6),gSuAhChiFu(6,4,7,3),gSuAhFdcCha(6,4,3,2),        & 
& gSuAhFuGlu(6,4,3,1),gSuSuChiChi(6,6,7,7),gSucHpmChiFd(6,2,7,3),gSuhhChiFu(6,4,7,3),    & 
& gSuChiGluSu(6,7,1,6),gSuSdChicCha(6,6,7,2),gSuFdFucSd(6,3,3,6),gSuFdFvcSe(6,3,6,6),    & 
& gSuhhFdcCha(6,4,3,2),gSuSuFdcFd(6,6,3,3),gSuFdSvImcFe(6,3,6,3),gSuFdSvRecFe(6,3,6,3),  & 
& gSucHpmChaFu(6,2,2,3),gSuFuFecSe(6,3,3,6),gSuFuFucSu(6,3,3,6),gSuFuFvSvIm(6,3,6,6),    & 
& gSuFuFvSvRe(6,3,6,6),gSucChaFuHpm(6,2,3,2),gSuSdFucFd(6,6,3,3),gSuFuSecFe(6,3,6,3),    & 
& gSuSuFucFu(6,6,3,3),gSucHpmFdGlu(6,2,3,1),gSuhhFuGlu(6,4,3,1),gSuGluGluSu(6,1,1,6),    & 
& gSuGluSdcCha(6,1,6,2),gSuSdFvcFe(6,6,6,3),gSuSuChacCha(6,6,2,2),gSuSuFecFe(6,6,3,3),   & 
& gSuSuFvFv(6,6,6,6),gSeAhChaFv(6,4,2,6),gSeAhChiFe(6,4,7,3),gSeChaChacSe(6,2,2,6),      & 
& gSeSvImChaChi(6,6,2,7),gSeSvReChaChi(6,6,2,7),gSeChaFecHpm(6,2,3,2),gSehhChaFv(6,4,2,6),& 
& gSeHpmChacFe(6,2,2,3),gSeSeChacCha(6,6,2,2),gSeSeChiChi(6,6,7,7),gSehhChiFe(6,4,7,3),  & 
& gSeHpmChiFv(6,2,7,6),gSeFeFdcSd(6,3,3,6),gSeFeFecSe(6,3,3,6),gSeFeFucSu(6,3,3,6),      & 
& gSeSvImFeFv(6,6,3,6),gSeSvReFeFv(6,6,3,6),gSeHpmFecCha(6,2,3,2),gSeFeSdcFd(6,3,6,3),   & 
& gSeSeFecFe(6,6,3,3),gSeFeSucFu(6,3,6,3),gSeFvFdcSu(6,6,3,6),gSeSeFvFv(6,6,6,6),        & 
& gSeFvSdcFu(6,6,6,3),gSeSeFdcFd(6,6,3,3),gSeSeFucFu(6,6,3,3),gSeSvImFdcFu(6,6,3,3),     & 
& gSeSvReFdcFu(6,6,3,3),gSvReAhChacFe(6,4,2,3),gSvReAhChiFv(6,4,7,6),gSvRecSeChaChi(6,6,2,7),& 
& gSvRecHpmChaFv(6,2,2,6),gSvRehhChacFe(6,4,2,3),gSvReSvImChacCha(6,6,2,2),              & 
& gSvReSvReChacCha(6,6,2,2),gSvReSvImChiChi(6,6,7,7),gSvReSvReChiChi(6,6,7,7),           & 
& gSvRecHpmChiFe(6,2,7,3),gSvRehhChiFv(6,4,7,6),gSvReFeFucSd(6,3,3,6),gSvRecSeFeFv(6,6,3,6),& 
& gSvReFeSucFd(6,3,6,3),gSvReSvImFecFe(6,6,3,3),gSvReSvReFecFe(6,6,3,3),gSvReFvFdcSd(6,6,3,6),& 
& gSvReFvFucSu(6,6,3,6),gSvReSvImFvFv(6,6,6,6),gSvReSvReFvFv(6,6,6,6),gSvReSeFucFd(6,6,3,3),& 
& gSvReSvImFdcFd(6,6,3,3),gSvReSvImFucFu(6,6,3,3),gSvReSvReFdcFd(6,6,3,3),               & 
& gSvReSvReFucFu(6,6,3,3),gSvImAhChacFe(6,4,2,3),gSvImAhChiFv(6,4,7,6),gSvImcSeChaChi(6,6,2,7),& 
& gSvImcHpmChaFv(6,2,2,6),gSvImhhChacFe(6,4,2,3),gSvImSvImChacCha(6,6,2,2)

Real(dp) :: gSvImSvReChacCha(6,6,2,2),gSvImSvImChiChi(6,6,7,7),gSvImSvReChiChi(6,6,7,7),           & 
& gSvImcHpmChiFe(6,2,7,3),gSvImhhChiFv(6,4,7,6),gSvImFeFucSd(6,3,3,6),gSvImcSeFeFv(6,6,3,6),& 
& gSvImFeSucFd(6,3,6,3),gSvImSvImFecFe(6,6,3,3),gSvImSvReFecFe(6,6,3,3),gSvImFvFdcSd(6,6,3,6),& 
& gSvImFvFucSu(6,6,3,6),gSvImSvImFvFv(6,6,6,6),gSvImSvReFvFv(6,6,6,6),gSvImSeFucFd(6,6,3,3),& 
& gSvImSvImFdcFd(6,6,3,3),gSvImSvImFucFu(6,6,3,3),gSvImSvReFdcFd(6,6,3,3),               & 
& gSvImSvReFucFu(6,6,3,3),gFvFvcChaCha(6,6,2,2),gFvFvChiChi(6,6,7,7),gFvFvcFdFd(6,6,3,3),& 
& gFvFvcFeFe(6,6,3,3),gFvFvcFuFu(6,6,3,3),gFvFvFvFv(6,6,6,6),gFvcFeChiCha(6,3,7,2),      & 
& gFvFecFdFu(6,3,3,3)

Complex(dp) :: coup 
Real(dp) :: vev 
Real(dp) :: gTVZ,gTVWm

Iname = Iname + 1 
NameOfUnit(Iname) = 'CalculateBR'
 
Write(*,*) "Calculating branching ratios and decay widths" 
gTVWm = gamW 
gTVZ = gamZ 
! One-Loop Decays 
If (OneLoopDecays) Then 
Call CalculateOneLoopDecays(gP1LSd,gP1LSu,gP1LSe,gP1LSvRe,gP1LSvIm,gP1Lhh,            & 
& gP1LAh,gP1LHpm,gP1LGlu,gP1LCha,gP1LChi,gP1LFu,gP1LFv,MSd,MSd2,MSu,MSu2,MSe,            & 
& MSe2,MSvIm,MSvIm2,MSvRe,MSvRe2,Mhh,Mhh2,MAh,MAh2,MHpm,MHpm2,MChi,MChi2,MCha,           & 
& MCha2,MFv,MFv2,MFe,MFe2,MFd,MFd2,MFu,MFu2,MGlu,MGlu2,MVZ,MVZp,MVZ2,MVZp2,              & 
& MVWm,MVWm2,ZD,ZU,ZE,ZVI,ZVR,ZH,ZA,ZP,ZN,UM,UP,UV,ZEL,ZER,ZDL,ZDR,ZUL,ZUR,              & 
& vd,vu,x1,x2,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,            & 
& Bmu,mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,epsI,deltaM,kont)

End if 


gPSd = 0._dp 
gTSd = 0._dp 
BRSd = 0._dp 
Call SdTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,               & 
& TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,             & 
& betaH,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,              & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,             & 
& gPSd(:,1:102),gTSd,BRSd(:,1:102))

Do i1=1,6
gTSd(i1) =Sum(gPSd(i1,:)) 
If (gTSd(i1).Gt.0._dp) BRSd(i1,: ) =gPSd(i1,:)/gTSd(i1) 
If (OneLoopDecays) Then 
gT1LSd(i1) =Sum(gP1LSd(i1,:)) 
If (gT1LSd(i1).Gt.0._dp) BR1LSd(i1,: ) =gP1LSd(i1,:)/gT1LSd(i1) 
End if
End Do 
 

gPSu = 0._dp 
gTSu = 0._dp 
BRSu = 0._dp 
Call SuTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,               & 
& TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,             & 
& betaH,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,              & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,             & 
& gPSu(:,1:102),gTSu,BRSu(:,1:102))

Do i1=1,6
gTSu(i1) =Sum(gPSu(i1,:)) 
If (gTSu(i1).Gt.0._dp) BRSu(i1,: ) =gPSu(i1,:)/gTSu(i1) 
If (OneLoopDecays) Then 
gT1LSu(i1) =Sum(gP1LSu(i1,:)) 
If (gT1LSu(i1).Gt.0._dp) BR1LSu(i1,: ) =gP1LSu(i1,:)/gT1LSu(i1) 
End if
End Do 
 

gPSe = 0._dp 
gTSe = 0._dp 
BRSe = 0._dp 
Call SeTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,               & 
& TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,             & 
& betaH,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,              & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,             & 
& gPSe(:,1:111),gTSe,BRSe(:,1:111))

Do i1=1,6
gTSe(i1) =Sum(gPSe(i1,:)) 
If (gTSe(i1).Gt.0._dp) BRSe(i1,: ) =gPSe(i1,:)/gTSe(i1) 
If (OneLoopDecays) Then 
gT1LSe(i1) =Sum(gP1LSe(i1,:)) 
If (gT1LSe(i1).Gt.0._dp) BR1LSe(i1,: ) =gP1LSe(i1,:)/gT1LSe(i1) 
End if
End Do 
 

gPSvRe = 0._dp 
gTSvRe = 0._dp 
BRSvRe = 0._dp 
Call SvReTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,              & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,               & 
& TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,             & 
& betaH,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,              & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,             & 
& gPSvRe(:,1:168),gTSvRe,BRSvRe(:,1:168))

Do i1=1,6
gTSvRe(i1) =Sum(gPSvRe(i1,:)) 
If (gTSvRe(i1).Gt.0._dp) BRSvRe(i1,: ) =gPSvRe(i1,:)/gTSvRe(i1) 
If (OneLoopDecays) Then 
gT1LSvRe(i1) =Sum(gP1LSvRe(i1,:)) 
If (gT1LSvRe(i1).Gt.0._dp) BR1LSvRe(i1,: ) =gP1LSvRe(i1,:)/gT1LSvRe(i1) 
End if
End Do 
 

gPSvIm = 0._dp 
gTSvIm = 0._dp 
BRSvIm = 0._dp 
Call SvImTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,              & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,               & 
& TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,             & 
& betaH,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,              & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,             & 
& gPSvIm(:,1:168),gTSvIm,BRSvIm(:,1:168))

Do i1=1,6
gTSvIm(i1) =Sum(gPSvIm(i1,:)) 
If (gTSvIm(i1).Gt.0._dp) BRSvIm(i1,: ) =gPSvIm(i1,:)/gTSvIm(i1) 
If (OneLoopDecays) Then 
gT1LSvIm(i1) =Sum(gP1LSvIm(i1,:)) 
If (gT1LSvIm(i1).Gt.0._dp) BR1LSvIm(i1,: ) =gP1LSvIm(i1,:)/gT1LSvIm(i1) 
End if
End Do 
 

gPhh = 0._dp 
gThh = 0._dp 
BRhh = 0._dp 
Call hhTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,               & 
& TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,             & 
& betaH,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,              & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,             & 
& gPhh,gThh,BRhh)

Do i1=1,4
gThh(i1) =Sum(gPhh(i1,:)) 
If (gThh(i1).Gt.0._dp) BRhh(i1,: ) =gPhh(i1,:)/gThh(i1) 
If (OneLoopDecays) Then 
gT1Lhh(i1) =Sum(gP1Lhh(i1,:)) 
If (gT1Lhh(i1).Gt.0._dp) BR1Lhh(i1,: ) =gP1Lhh(i1,:)/gT1Lhh(i1) 
End if
End Do 
 

gPAh = 0._dp 
gTAh = 0._dp 
BRAh = 0._dp 
Call AhTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,               & 
& TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,             & 
& betaH,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,              & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,             & 
& gPAh,gTAh,BRAh)

Do i1=1,4
gTAh(i1) =Sum(gPAh(i1,:)) 
If (gTAh(i1).Gt.0._dp) BRAh(i1,: ) =gPAh(i1,:)/gTAh(i1) 
If (OneLoopDecays) Then 
gT1LAh(i1) =Sum(gP1LAh(i1,:)) 
If (gT1LAh(i1).Gt.0._dp) BR1LAh(i1,: ) =gP1LAh(i1,:)/gT1LAh(i1) 
End if
End Do 
 

! Set Goldstone Widhts 
gTAh(1)=gTVZ
gTAh(2)=gTVZp


gPHpm = 0._dp 
gTHpm = 0._dp 
BRHpm = 0._dp 
Call HpmTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,               & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,               & 
& TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,             & 
& betaH,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,              & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,             & 
& gPHpm,gTHpm,BRHpm)

Do i1=1,2
gTHpm(i1) =Sum(gPHpm(i1,:)) 
If (gTHpm(i1).Gt.0._dp) BRHpm(i1,: ) =gPHpm(i1,:)/gTHpm(i1) 
If (OneLoopDecays) Then 
gT1LHpm(i1) =Sum(gP1LHpm(i1,:)) 
If (gT1LHpm(i1).Gt.0._dp) BR1LHpm(i1,: ) =gP1LHpm(i1,:)/gT1LHpm(i1) 
End if
End Do 
 

! Set Goldstone Widhts 
gTHpm(1)=gTVWm


gPVZp = 0._dp 
gTVZp = 0._dp 
BRVZp = 0._dp 
Call VZpTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,               & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,               & 
& TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,             & 
& betaH,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,              & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,             & 
& gPVZp,gTVZp,BRVZp)

Do i1=1,1
gTVZp =Sum(gPVZp(i1,:)) 
If (gTVZp.Gt.0._dp) BRVZp(i1,: ) =gPVZp(i1,:)/gTVZp 
End Do 
 

! Set Goldstone Widhts 
gTAh(2)=gTVZp


gPGlu = 0._dp 
gTGlu = 0._dp 
BRGlu = 0._dp 
Call GluTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,               & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,               & 
& TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,             & 
& betaH,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,              & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,             & 
& gPGlu(:,1:53),gTGlu,BRGlu(:,1:53))

Do i1=1,1
gTGlu =Sum(gPGlu(i1,:)) 
If (gTGlu.Gt.0._dp) BRGlu(i1,: ) =gPGlu(i1,:)/gTGlu 
If (OneLoopDecays) Then 
gT1LGlu =Sum(gP1LGlu(i1,:)) 
If (gT1LGlu.Gt.0._dp) BR1LGlu(i1,: ) =gP1LGlu(i1,:)/gT1LGlu 
End if
End Do 
 

gPCha = 0._dp 
gTCha = 0._dp 
BRCha = 0._dp 
Call ChaTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,               & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,               & 
& TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,             & 
& betaH,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,              & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,             & 
& gPCha(:,1:140),gTCha,BRCha(:,1:140))

Do i1=1,2
gTCha(i1) =Sum(gPCha(i1,:)) 
If (gTCha(i1).Gt.0._dp) BRCha(i1,: ) =gPCha(i1,:)/gTCha(i1) 
If (OneLoopDecays) Then 
gT1LCha(i1) =Sum(gP1LCha(i1,:)) 
If (gT1LCha(i1).Gt.0._dp) BR1LCha(i1,: ) =gP1LCha(i1,:)/gT1LCha(i1) 
End if
End Do 
 

gPChi = 0._dp 
gTChi = 0._dp 
BRChi = 0._dp 
Call ChiTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,               & 
& MFe,MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,           & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,               & 
& TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,             & 
& betaH,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,              & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,             & 
& gPChi(:,1:194),gTChi,BRChi(:,1:194))

Do i1=1,7
gTChi(i1) =Sum(gPChi(i1,:)) 
If (gTChi(i1).Gt.0._dp) BRChi(i1,: ) =gPChi(i1,:)/gTChi(i1) 
If (OneLoopDecays) Then 
gT1LChi(i1) =Sum(gP1LChi(i1,:)) 
If (gT1LChi(i1).Gt.0._dp) BR1LChi(i1,: ) =gP1LChi(i1,:)/gT1LChi(i1) 
End if
End Do 
 

gPFu = 0._dp 
gTFu = 0._dp 
BRFu = 0._dp 
Call FuTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,               & 
& TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,             & 
& betaH,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,              & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,             & 
& gPFu,gTFu,BRFu)

Do i1=1,3
gTFu(i1) =Sum(gPFu(i1,:)) 
If (gTFu(i1).Gt.0._dp) BRFu(i1,: ) =gPFu(i1,:)/gTFu(i1) 
If (OneLoopDecays) Then 
gT1LFu(i1) =Sum(gP1LFu(i1,:)) 
If (gT1LFu(i1).Gt.0._dp) BR1LFu(i1,: ) =gP1LFu(i1,:)/gT1LFu(i1) 
End if
End Do 
 

gPFv = 0._dp 
gTFv = 0._dp 
BRFv = 0._dp 
Call FvTwoBodyDecay(-1,DeltaM,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,            & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,               & 
& TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,             & 
& betaH,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,              & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,             & 
& gPFv(:,1:156),gTFv,BRFv(:,1:156))

Do i1=1,6
gTFv(i1) =Sum(gPFv(i1,:)) 
If (gTFv(i1).Gt.0._dp) BRFv(i1,: ) =gPFv(i1,:)/gTFv(i1) 
If (OneLoopDecays) Then 
gT1LFv(i1) =Sum(gP1LFv(i1,:)) 
If (gT1LFv(i1).Gt.0._dp) BR1LFv(i1,: ) =gP1LFv(i1,:)/gT1LFv(i1) 
End if
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysS).and.(Calc3BodyDecay_Sd)) Then 
If (MaxVal(gTSd).Lt.MaxVal(fac3*Abs(MSd))) Then 
Call SdThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,              & 
& UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,              & 
& g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,               & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,gSdAhChaFu,          & 
& gSdAhChiFd,gSdAhFdGlu,gSdSuChaChi,gSdChaFdcHpm,gSdhhChaFu,gSdChaGluSu,gSdSdChacCha,    & 
& gSdSdChiChi,gSdhhChiFd,gSdHpmChiFu,gSdChiGluSd,gSdFdFdcSd,gSdFdFecSe,gSdFuFdcSu,       & 
& gSdFdFvSvIm,gSdFdFvSvRe,gSdHpmFdcCha,gSdSdFdcFd,gSdFdSecFe,gSdSuFdcFu,gSdFuFeSvIm,     & 
& gSdFuFeSvRe,gSdFuFvSe,gSdSdFucFu,gSdhhFdGlu,gSdHpmFuGlu,gSdGluGluSd,gSdSdFecFe,        & 
& gSdSdFvFv,gSdSuFeFv,epsI,deltaM,.False.,gTSd,gPSd(:,103:2064),BRSd(:,103:2064))

Else 
Call SdThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,              & 
& UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,              & 
& g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,               & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,gSdAhChaFu,          & 
& gSdAhChiFd,gSdAhFdGlu,gSdSuChaChi,gSdChaFdcHpm,gSdhhChaFu,gSdChaGluSu,gSdSdChacCha,    & 
& gSdSdChiChi,gSdhhChiFd,gSdHpmChiFu,gSdChiGluSd,gSdFdFdcSd,gSdFdFecSe,gSdFuFdcSu,       & 
& gSdFdFvSvIm,gSdFdFvSvRe,gSdHpmFdcCha,gSdSdFdcFd,gSdFdSecFe,gSdSuFdcFu,gSdFuFeSvIm,     & 
& gSdFuFeSvRe,gSdFuFvSe,gSdSdFucFu,gSdhhFdGlu,gSdHpmFuGlu,gSdGluGluSd,gSdSdFecFe,        & 
& gSdSdFvFv,gSdSuFeFv,epsI,deltaM,.True.,gTSd,gPSd(:,103:2064),BRSd(:,103:2064))

End If 
 
End If 
Else 
Call SdThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,              & 
& UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,              & 
& g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,               & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,gSdAhChaFu,          & 
& gSdAhChiFd,gSdAhFdGlu,gSdSuChaChi,gSdChaFdcHpm,gSdhhChaFu,gSdChaGluSu,gSdSdChacCha,    & 
& gSdSdChiChi,gSdhhChiFd,gSdHpmChiFu,gSdChiGluSd,gSdFdFdcSd,gSdFdFecSe,gSdFuFdcSu,       & 
& gSdFdFvSvIm,gSdFdFvSvRe,gSdHpmFdcCha,gSdSdFdcFd,gSdFdSecFe,gSdSuFdcFu,gSdFuFeSvIm,     & 
& gSdFuFeSvRe,gSdFuFvSe,gSdSdFucFu,gSdhhFdGlu,gSdHpmFuGlu,gSdGluGluSd,gSdSdFecFe,        & 
& gSdSdFvFv,gSdSuFeFv,epsI,deltaM,.False.,gTSd,gPSd(:,103:2064),BRSd(:,103:2064))

End If 
Do i1=1,6
gTSd(i1) =Sum(gPSd(i1,:)) 
If (gTSd(i1).Gt.0._dp) BRSd(i1,: ) =gPSd(i1,:)/gTSd(i1) 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysS).and.(Calc3BodyDecay_Su)) Then 
If (MaxVal(gTSu).Lt.MaxVal(fac3*Abs(MSu))) Then 
Call SuThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,              & 
& UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,              & 
& g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,               & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,gSuAhChiFu,          & 
& gSuAhFdcCha,gSuAhFuGlu,gSuSuChiChi,gSucHpmChiFd,gSuhhChiFu,gSuChiGluSu,gSuSdChicCha,   & 
& gSuFdFucSd,gSuFdFvcSe,gSuhhFdcCha,gSuSuFdcFd,gSuFdSvImcFe,gSuFdSvRecFe,gSucHpmChaFu,   & 
& gSuFuFecSe,gSuFuFucSu,gSuFuFvSvIm,gSuFuFvSvRe,gSucChaFuHpm,gSuSdFucFd,gSuFuSecFe,      & 
& gSuSuFucFu,gSucHpmFdGlu,gSuhhFuGlu,gSuGluGluSu,gSuGluSdcCha,gSuSdFvcFe,gSuSuChacCha,   & 
& gSuSuFecFe,gSuSuFvFv,epsI,deltaM,.False.,gTSu,gPSu(:,103:2064),BRSu(:,103:2064))

Else 
Call SuThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,              & 
& UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,              & 
& g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,               & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,gSuAhChiFu,          & 
& gSuAhFdcCha,gSuAhFuGlu,gSuSuChiChi,gSucHpmChiFd,gSuhhChiFu,gSuChiGluSu,gSuSdChicCha,   & 
& gSuFdFucSd,gSuFdFvcSe,gSuhhFdcCha,gSuSuFdcFd,gSuFdSvImcFe,gSuFdSvRecFe,gSucHpmChaFu,   & 
& gSuFuFecSe,gSuFuFucSu,gSuFuFvSvIm,gSuFuFvSvRe,gSucChaFuHpm,gSuSdFucFd,gSuFuSecFe,      & 
& gSuSuFucFu,gSucHpmFdGlu,gSuhhFuGlu,gSuGluGluSu,gSuGluSdcCha,gSuSdFvcFe,gSuSuChacCha,   & 
& gSuSuFecFe,gSuSuFvFv,epsI,deltaM,.True.,gTSu,gPSu(:,103:2064),BRSu(:,103:2064))

End If 
 
End If 
Else 
Call SuThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,              & 
& UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,              & 
& g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,               & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,gSuAhChiFu,          & 
& gSuAhFdcCha,gSuAhFuGlu,gSuSuChiChi,gSucHpmChiFd,gSuhhChiFu,gSuChiGluSu,gSuSdChicCha,   & 
& gSuFdFucSd,gSuFdFvcSe,gSuhhFdcCha,gSuSuFdcFd,gSuFdSvImcFe,gSuFdSvRecFe,gSucHpmChaFu,   & 
& gSuFuFecSe,gSuFuFucSu,gSuFuFvSvIm,gSuFuFvSvRe,gSucChaFuHpm,gSuSdFucFd,gSuFuSecFe,      & 
& gSuSuFucFu,gSucHpmFdGlu,gSuhhFuGlu,gSuGluGluSu,gSuGluSdcCha,gSuSdFvcFe,gSuSuChacCha,   & 
& gSuSuFecFe,gSuSuFvFv,epsI,deltaM,.False.,gTSu,gPSu(:,103:2064),BRSu(:,103:2064))

End If 
Do i1=1,6
gTSu(i1) =Sum(gPSu(i1,:)) 
If (gTSu(i1).Gt.0._dp) BRSu(i1,: ) =gPSu(i1,:)/gTSu(i1) 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysS).and.(Calc3BodyDecay_Se)) Then 
If (MaxVal(gTSe).Lt.MaxVal(fac3*Abs(MSe))) Then 
Call SeThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,              & 
& UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,              & 
& g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,               & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,gSeAhChaFv,          & 
& gSeAhChiFe,gSeChaChacSe,gSeSvImChaChi,gSeSvReChaChi,gSeChaFecHpm,gSehhChaFv,           & 
& gSeHpmChacFe,gSeSeChacCha,gSeSeChiChi,gSehhChiFe,gSeHpmChiFv,gSeFeFdcSd,               & 
& gSeFeFecSe,gSeFeFucSu,gSeSvImFeFv,gSeSvReFeFv,gSeHpmFecCha,gSeFeSdcFd,gSeSeFecFe,      & 
& gSeFeSucFu,gSeFvFdcSu,gSeSeFvFv,gSeFvSdcFu,gSeSeFdcFd,gSeSeFucFu,gSeSvImFdcFu,         & 
& gSeSvReFdcFu,epsI,deltaM,.False.,gTSe,gPSe(:,112:2193),BRSe(:,112:2193))

Else 
Call SeThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,              & 
& UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,              & 
& g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,               & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,gSeAhChaFv,          & 
& gSeAhChiFe,gSeChaChacSe,gSeSvImChaChi,gSeSvReChaChi,gSeChaFecHpm,gSehhChaFv,           & 
& gSeHpmChacFe,gSeSeChacCha,gSeSeChiChi,gSehhChiFe,gSeHpmChiFv,gSeFeFdcSd,               & 
& gSeFeFecSe,gSeFeFucSu,gSeSvImFeFv,gSeSvReFeFv,gSeHpmFecCha,gSeFeSdcFd,gSeSeFecFe,      & 
& gSeFeSucFu,gSeFvFdcSu,gSeSeFvFv,gSeFvSdcFu,gSeSeFdcFd,gSeSeFucFu,gSeSvImFdcFu,         & 
& gSeSvReFdcFu,epsI,deltaM,.True.,gTSe,gPSe(:,112:2193),BRSe(:,112:2193))

End If 
 
End If 
Else 
Call SeThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,              & 
& UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,              & 
& g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,               & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,gSeAhChaFv,          & 
& gSeAhChiFe,gSeChaChacSe,gSeSvImChaChi,gSeSvReChaChi,gSeChaFecHpm,gSehhChaFv,           & 
& gSeHpmChacFe,gSeSeChacCha,gSeSeChiChi,gSehhChiFe,gSeHpmChiFv,gSeFeFdcSd,               & 
& gSeFeFecSe,gSeFeFucSu,gSeSvImFeFv,gSeSvReFeFv,gSeHpmFecCha,gSeFeSdcFd,gSeSeFecFe,      & 
& gSeFeSucFu,gSeFvFdcSu,gSeSeFvFv,gSeFvSdcFu,gSeSeFdcFd,gSeSeFucFu,gSeSvImFdcFu,         & 
& gSeSvReFdcFu,epsI,deltaM,.False.,gTSe,gPSe(:,112:2193),BRSe(:,112:2193))

End If 
Do i1=1,6
gTSe(i1) =Sum(gPSe(i1,:)) 
If (gTSe(i1).Gt.0._dp) BRSe(i1,: ) =gPSe(i1,:)/gTSe(i1) 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysS).and.(Calc3BodyDecay_SvRe)) Then 
If (MaxVal(gTSvRe).Lt.MaxVal(fac3*Abs(MSvRe))) Then 
Call SvReThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,               & 
& TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,             & 
& betaH,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,              & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,             & 
& gSvReAhChacFe,gSvReAhChiFv,gSvRecSeChaChi,gSvRecHpmChaFv,gSvRehhChacFe,gSvReSvImChacCha,& 
& gSvReSvReChacCha,gSvReSvImChiChi,gSvReSvReChiChi,gSvRecHpmChiFe,gSvRehhChiFv,          & 
& gSvReFeFucSd,gSvRecSeFeFv,gSvReFeSucFd,gSvReSvImFecFe,gSvReSvReFecFe,gSvReFvFdcSd,     & 
& gSvReFvFucSu,gSvReSvImFvFv,gSvReSvReFvFv,gSvReSeFucFd,gSvReSvImFdcFd,gSvReSvImFucFu,   & 
& gSvReSvReFdcFd,gSvReSvReFucFu,epsI,deltaM,.False.,gTSvRe,gPSvRe(:,169:2580)            & 
& ,BRSvRe(:,169:2580))

Else 
Call SvReThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,               & 
& TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,             & 
& betaH,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,              & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,             & 
& gSvReAhChacFe,gSvReAhChiFv,gSvRecSeChaChi,gSvRecHpmChaFv,gSvRehhChacFe,gSvReSvImChacCha,& 
& gSvReSvReChacCha,gSvReSvImChiChi,gSvReSvReChiChi,gSvRecHpmChiFe,gSvRehhChiFv,          & 
& gSvReFeFucSd,gSvRecSeFeFv,gSvReFeSucFd,gSvReSvImFecFe,gSvReSvReFecFe,gSvReFvFdcSd,     & 
& gSvReFvFucSu,gSvReSvImFvFv,gSvReSvReFvFv,gSvReSeFucFd,gSvReSvImFdcFd,gSvReSvImFucFu,   & 
& gSvReSvReFdcFd,gSvReSvReFucFu,epsI,deltaM,.True.,gTSvRe,gPSvRe(:,169:2580)             & 
& ,BRSvRe(:,169:2580))

End If 
 
End If 
Else 
Call SvReThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,               & 
& TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,             & 
& betaH,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,              & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,             & 
& gSvReAhChacFe,gSvReAhChiFv,gSvRecSeChaChi,gSvRecHpmChaFv,gSvRehhChacFe,gSvReSvImChacCha,& 
& gSvReSvReChacCha,gSvReSvImChiChi,gSvReSvReChiChi,gSvRecHpmChiFe,gSvRehhChiFv,          & 
& gSvReFeFucSd,gSvRecSeFeFv,gSvReFeSucFd,gSvReSvImFecFe,gSvReSvReFecFe,gSvReFvFdcSd,     & 
& gSvReFvFucSu,gSvReSvImFvFv,gSvReSvReFvFv,gSvReSeFucFd,gSvReSvImFdcFd,gSvReSvImFucFu,   & 
& gSvReSvReFdcFd,gSvReSvReFucFu,epsI,deltaM,.False.,gTSvRe,gPSvRe(:,169:2580)            & 
& ,BRSvRe(:,169:2580))

End If 
Do i1=1,6
gTSvRe(i1) =Sum(gPSvRe(i1,:)) 
If (gTSvRe(i1).Gt.0._dp) BRSvRe(i1,: ) =gPSvRe(i1,:)/gTSvRe(i1) 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysS).and.(Calc3BodyDecay_SvIm)) Then 
If (MaxVal(gTSvIm).Lt.MaxVal(fac3*Abs(MSvIm))) Then 
Call SvImThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,               & 
& TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,             & 
& betaH,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,              & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,             & 
& gSvImAhChacFe,gSvImAhChiFv,gSvImcSeChaChi,gSvImcHpmChaFv,gSvImhhChacFe,gSvImSvImChacCha,& 
& gSvImSvReChacCha,gSvImSvImChiChi,gSvImSvReChiChi,gSvImcHpmChiFe,gSvImhhChiFv,          & 
& gSvImFeFucSd,gSvImcSeFeFv,gSvImFeSucFd,gSvImSvImFecFe,gSvImSvReFecFe,gSvImFvFdcSd,     & 
& gSvImFvFucSu,gSvImSvImFvFv,gSvImSvReFvFv,gSvImSeFucFd,gSvImSvImFdcFd,gSvImSvImFucFu,   & 
& gSvImSvReFdcFd,gSvImSvReFucFu,epsI,deltaM,.False.,gTSvIm,gPSvIm(:,169:2580)            & 
& ,BRSvIm(:,169:2580))

Else 
Call SvImThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,               & 
& TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,             & 
& betaH,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,              & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,             & 
& gSvImAhChacFe,gSvImAhChiFv,gSvImcSeChaChi,gSvImcHpmChaFv,gSvImhhChacFe,gSvImSvImChacCha,& 
& gSvImSvReChacCha,gSvImSvImChiChi,gSvImSvReChiChi,gSvImcHpmChiFe,gSvImhhChiFv,          & 
& gSvImFeFucSd,gSvImcSeFeFv,gSvImFeSucFd,gSvImSvImFecFe,gSvImSvReFecFe,gSvImFvFdcSd,     & 
& gSvImFvFucSu,gSvImSvImFvFv,gSvImSvReFvFv,gSvImSeFucFd,gSvImSvImFdcFd,gSvImSvImFucFu,   & 
& gSvImSvReFdcFd,gSvImSvReFucFu,epsI,deltaM,.True.,gTSvIm,gPSvIm(:,169:2580)             & 
& ,BRSvIm(:,169:2580))

End If 
 
End If 
Else 
Call SvImThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,               & 
& MFe2,MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,               & 
& MSu,MSu2,MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,               & 
& TWp,UM,UP,UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,             & 
& betaH,g1,g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,              & 
& mq2,ml2,mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,             & 
& gSvImAhChacFe,gSvImAhChiFv,gSvImcSeChaChi,gSvImcHpmChaFv,gSvImhhChacFe,gSvImSvImChacCha,& 
& gSvImSvReChacCha,gSvImSvImChiChi,gSvImSvReChiChi,gSvImcHpmChiFe,gSvImhhChiFv,          & 
& gSvImFeFucSd,gSvImcSeFeFv,gSvImFeSucFd,gSvImSvImFecFe,gSvImSvReFecFe,gSvImFvFdcSd,     & 
& gSvImFvFucSu,gSvImSvImFvFv,gSvImSvReFvFv,gSvImSeFucFd,gSvImSvImFdcFd,gSvImSvImFucFu,   & 
& gSvImSvReFdcFd,gSvImSvReFucFu,epsI,deltaM,.False.,gTSvIm,gPSvIm(:,169:2580)            & 
& ,BRSvIm(:,169:2580))

End If 
Do i1=1,6
gTSvIm(i1) =Sum(gPSvIm(i1,:)) 
If (gTSvIm(i1).Gt.0._dp) BRSvIm(i1,: ) =gPSvIm(i1,:)/gTSvIm(i1) 
End Do 
 

! No 3-body decays for hh  
! No 3-body decays for Ah  
! No 3-body decays for Hpm  
! No 3-body decays for VZp  
If (.Not.CTBD) Then 
If ((Enable3BDecaysF).and.(Calc3BodyDecay_Glu)) Then 
If (gTGlu.Lt.fac3*Abs(MGlu)) Then 
Call GluThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,              & 
& UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,              & 
& g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,               & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,gTSd,gTSu,           & 
& gGluFdcFdChi,gGluFdcFucCha,gGluFucFuChi,epsI,deltaM,.False.,gTGlu,gPGlu(:,54:197)      & 
& ,BRGlu(:,54:197))

Else 
Call GluThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,              & 
& UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,              & 
& g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,               & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,gTSd,gTSu,           & 
& gGluFdcFdChi,gGluFdcFucCha,gGluFucFuChi,epsI,deltaM,.True.,gTGlu,gPGlu(:,54:197)       & 
& ,BRGlu(:,54:197))

End If 
 
End If 
Else 
Call GluThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,              & 
& UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,              & 
& g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,               & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,gTSd,gTSu,           & 
& gGluFdcFdChi,gGluFdcFucCha,gGluFucFuChi,epsI,deltaM,.False.,gTGlu,gPGlu(:,54:197)      & 
& ,BRGlu(:,54:197))

End If 
Do i1=1,1
gTGlu =Sum(gPGlu(i1,:)) 
If (gTGlu.Gt.0._dp) BRGlu(i1,: ) =gPGlu(i1,:)/gTGlu 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysF).and.(Calc3BodyDecay_Cha)) Then 
If (MaxVal(gTCha).Lt.MaxVal(fac3*Abs(MCha))) Then 
Call ChaThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,              & 
& UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,              & 
& g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,               & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,gTAh,gThh,           & 
& gTHpm,gTSd,gTSe,gTSu,gTSvIm,gTSvRe,gTVWm,gTVZ,gTVZp,gChaChacChaCha,gChaChaChiChi,      & 
& gChaChacFdFd,gChaChacFeFe,gChaChacFuFu,gChaChaFvFv,gChaChicFuFd,gChaChiFvFe,           & 
& gChaFdcFuGlu,gChaFecChaFe,epsI,deltaM,.False.,gTCha,gPCha(:,141:588),BRCha(:,141:588))

Else 
Call ChaThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,              & 
& UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,              & 
& g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,               & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,gTAh,gThh,           & 
& gTHpm,gTSd,gTSe,gTSu,gTSvIm,gTSvRe,gTVWm,gTVZ,gTVZp,gChaChacChaCha,gChaChaChiChi,      & 
& gChaChacFdFd,gChaChacFeFe,gChaChacFuFu,gChaChaFvFv,gChaChicFuFd,gChaChiFvFe,           & 
& gChaFdcFuGlu,gChaFecChaFe,epsI,deltaM,.True.,gTCha,gPCha(:,141:588),BRCha(:,141:588))

End If 
 
End If 
Else 
Call ChaThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,              & 
& UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,              & 
& g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,               & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,gTAh,gThh,           & 
& gTHpm,gTSd,gTSe,gTSu,gTSvIm,gTSvRe,gTVWm,gTVZ,gTVZp,gChaChacChaCha,gChaChaChiChi,      & 
& gChaChacFdFd,gChaChacFeFe,gChaChacFuFu,gChaChaFvFv,gChaChicFuFd,gChaChiFvFe,           & 
& gChaFdcFuGlu,gChaFecChaFe,epsI,deltaM,.False.,gTCha,gPCha(:,141:588),BRCha(:,141:588))

End If 
Do i1=1,2
gTCha(i1) =Sum(gPCha(i1,:)) 
If (gTCha(i1).Gt.0._dp) BRCha(i1,: ) =gPCha(i1,:)/gTCha(i1) 
End Do 
 

If (.Not.CTBD) Then 
If ((Enable3BDecaysF).and.(Calc3BodyDecay_Chi)) Then 
If (MaxVal(gTChi).Lt.MaxVal(fac3*Abs(MChi))) Then 
Call ChiThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,              & 
& UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,              & 
& g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,               & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,gTAh,gThh,           & 
& gTHpm,gTSd,gTSe,gTSu,gTSvIm,gTSvRe,gTVWm,gTVZ,gTVZp,gChiChicChaCha,gChiChiChiChi,      & 
& gChiChicFdFd,gChiChicFeFe,gChiChicFuFu,gChiChiFvFv,gChiChacFdFu,gChiChacFeFv,          & 
& gChiFdcFdGlu,gChiFucFuGlu,epsI,deltaM,.False.,gTChi,gPChi(:,195:1078),BRChi(:,195:1078))

Else 
Call ChiThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,              & 
& UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,              & 
& g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,               & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,gTAh,gThh,           & 
& gTHpm,gTSd,gTSe,gTSu,gTSvIm,gTSvRe,gTVWm,gTVZ,gTVZp,gChiChicChaCha,gChiChiChiChi,      & 
& gChiChicFdFd,gChiChicFeFe,gChiChicFuFu,gChiChiFvFv,gChiChacFdFu,gChiChacFeFv,          & 
& gChiFdcFdGlu,gChiFucFuGlu,epsI,deltaM,.True.,gTChi,gPChi(:,195:1078),BRChi(:,195:1078))

End If 
 
End If 
Else 
Call ChiThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,           & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,              & 
& UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,              & 
& g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,               & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,gTAh,gThh,           & 
& gTHpm,gTSd,gTSe,gTSu,gTSvIm,gTSvRe,gTVWm,gTVZ,gTVZp,gChiChicChaCha,gChiChiChiChi,      & 
& gChiChicFdFd,gChiChicFeFe,gChiChicFuFu,gChiChiFvFv,gChiChacFdFu,gChiChacFeFv,          & 
& gChiFdcFdGlu,gChiFucFuGlu,epsI,deltaM,.False.,gTChi,gPChi(:,195:1078),BRChi(:,195:1078))

End If 
Do i1=1,7
gTChi(i1) =Sum(gPChi(i1,:)) 
If (gTChi(i1).Gt.0._dp) BRChi(i1,: ) =gPChi(i1,:)/gTChi(i1) 
End Do 
 

! No 3-body decays for Fu  
If (.Not.CTBD) Then 
If ((Enable3BDecaysF).and.(Calc3BodyDecay_Fv)) Then 
If (MaxVal(gTFv).Lt.MaxVal(fac3*Abs(MFv))) Then 
Call FvThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,              & 
& UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,              & 
& g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,               & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,gTAh,gThh,           & 
& gTHpm,gTSe,gTSvIm,gTSvRe,gTVWm,gTVZ,gTVZp,gFvFvcChaCha,gFvFvChiChi,gFvFvcFdFd,         & 
& gFvFvcFeFe,gFvFvcFuFu,gFvFvFvFv,gFvcFeChiCha,gFvFecFdFu,epsI,deltaM,.False.,           & 
& gTFv,gPFv(:,157:921),BRFv(:,157:921))

Else 
Call FvThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,              & 
& UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,              & 
& g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,               & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,gTAh,gThh,           & 
& gTHpm,gTSe,gTSvIm,gTSvRe,gTVWm,gTVZ,gTVZp,gFvFvcChaCha,gFvFvChiChi,gFvFvcFdFd,         & 
& gFvFvcFeFe,gFvFvcFuFu,gFvFvFvFv,gFvcFeChiCha,gFvFecFdFu,epsI,deltaM,.True.,            & 
& gTFv,gPFv(:,157:921),BRFv(:,157:921))

End If 
 
End If 
Else 
Call FvThreeBodyDecay(-1,MAh,MAh2,MCha,MCha2,MChi,MChi2,MFd,MFd2,MFe,MFe2,            & 
& MFu,MFu2,MFv,MFv2,MGlu,MGlu2,Mhh,Mhh2,MHpm,MHpm2,MSd,MSd2,MSe,MSe2,MSu,MSu2,           & 
& MSvIm,MSvIm2,MSvRe,MSvRe2,MVWm,MVWm2,MVZ,MVZ2,MVZp,MVZp2,pG,TW,TWp,UM,UP,              & 
& UV,v,ZA,ZD,ZDL,ZDR,ZE,ZEL,ZER,ZH,ZN,ZP,ZU,ZUL,ZUR,ZVI,ZVR,ZW,ZZ,betaH,g1,              & 
& g2,g3,gBL,gYB,gBY,Yd,Ye,Yu,Yx,Yv,MuP,Mu,Td,Te,Tu,Tx,Tv,BMuP,Bmu,mq2,ml2,               & 
& mHd2,mHu2,md2,mu2,me2,mv2,mC12,mC22,MBBp,M1,M2,M3,MBp,vd,vu,x1,x2,gTAh,gThh,           & 
& gTHpm,gTSe,gTSvIm,gTSvRe,gTVWm,gTVZ,gTVZp,gFvFvcChaCha,gFvFvChiChi,gFvFvcFdFd,         & 
& gFvFvcFeFe,gFvFvcFuFu,gFvFvFvFv,gFvcFeChiCha,gFvFecFdFu,epsI,deltaM,.False.,           & 
& gTFv,gPFv(:,157:921),BRFv(:,157:921))

End If 
Do i1=1,6
gTFv(i1) =Sum(gPFv(i1,:)) 
If (gTFv(i1).Gt.0._dp) BRFv(i1,: ) =gPFv(i1,:)/gTFv(i1) 
End Do 
 

Iname = Iname - 1 
 
End Subroutine CalculateBR 
End Module BranchingRatios_BLSSM 
 