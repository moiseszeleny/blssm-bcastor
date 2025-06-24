! ------------------------------------------------------------------------------  
! This file was automatically created by SARAH version 4.15.3 
! SARAH References: arXiv:0806.0538, 0909.2863, 1002.0840, 1207.0906, 1309.7223,
!           1405.1434, 1411.0675, 1503.03098, 1703.09237, 1706.05372, 1805.07306  
! (c) Florian Staub, Mark Goodsell and Werner Porod 2020  
! ------------------------------------------------------------------------------  
! File created at 14:13 on 18.6.2025   
! ----------------------------------------------------------------------  
 
 
Module Model_Data_DLRSM 
 
Use Control 
Use Settings 
Use LoopFunctions 
Logical, Save :: Calc3BodyDecay_Fu=.True.
Logical, Save :: Calc3BodyDecay_Fe=.True.
Logical, Save :: Calc3BodyDecay_Fd=.True.
Logical, Save :: Calc3BodyDecay_Fv=.True.
Real(dp) :: tau_pi0=0.0000000000000000852_dp, mass_pi0=0.13498_dp
Real(dp) :: tau_pip=0.000000026_dp, mass_pip=0.13957_dp
Real(dp) :: tau_rho0=0.00000000000000000000000441_dp, mass_rho0=0.77549_dp
Real(dp) :: tau_D0=0.00000000000041_dp, mass_D0=1.86486_dp
Real(dp) :: tau_Dp=0.00000000000104_dp, mass_Dp=1.86926_dp
Real(dp) :: tau_DSp=0.0000000000005_dp, mass_DSp=1.96849_dp
Real(dp) :: tau_DSsp=0, mass_DSsp=2.1123_dp
Real(dp) :: tau_eta=0.000000000000000000506_dp, mass_eta=0.54785_dp
Real(dp) :: tau_etap=0.00000000000000000000331_dp, mass_etap=0.95778_dp
Real(dp) :: tau_omega=0.0000000000000000000000775_dp, mass_omega=0.78265_dp
Real(dp) :: tau_phi=0.000000000000000000000154_dp, mass_phi=1.01946_dp
Real(dp) :: tau_KL0=0.0000000512_dp, mass_KL0=0
Real(dp) :: tau_KS0=0.00000000009_dp, mass_KS0=0
Real(dp) :: tau_K0=0, mass_K0=0.49761_dp
Real(dp) :: tau_Kp=0.0000000124_dp, mass_Kp=0.49368_dp
Real(dp) :: tau_B0d=0.00000000000152_dp, mass_B0d=5.27958_dp
Real(dp) :: tau_B0s=0.0000000000015_dp, mass_B0s=5.36677_dp
Real(dp) :: tau_Bp=0.00000000000164_dp, mass_Bp=5.27925_dp
Real(dp) :: tau_B0c=0.0000000000000000000000143_dp, mass_B0c=5.3252_dp
Real(dp) :: tau_Bpc=0.0000000000000000000000143_dp, mass_Bpc=5.3252_dp
Real(dp) :: tau_Bcp=0.000000000000454_dp, mass_Bcp=6.277_dp
Real(dp) :: tau_K0c=0.0000000000000000000000142_dp, mass_K0c=0.8959_dp
Real(dp) :: tau_Kpc=0.000000000000000000000013_dp, mass_Kpc=0.8917_dp
Real(dp) :: tau_etac=0.0000000000000000000000222_dp, mass_etac=2.981_dp
Real(dp) :: tau_JPsi=0.00000000000000000000000708_dp, mass_JPSi=3096.92_dp
Real(dp) :: tau_Ups=0.0000000000000000000000121_dp, mass_Ups=9.4603_dp
Real(dp) :: f_k_CONST=0.1598_dp
Real(dp) :: f_Kp_CONST=0.156_dp
Real(dp) :: h_k_CONST=0
Real(dp) :: f_pi_CONST=0.118_dp
Real(dp) :: f_B0d_CONST=0.19_dp
Real(dp) :: f_B0s_CONST=0.227_dp
Real(dp) :: f_Bp_CONST=0.234_dp
Real(dp) :: f_eta_q_CONST=0.13_dp
Real(dp) :: f_eta_s_CONST=0
Real(dp) :: h_eta_q_CONST=0
Real(dp) :: h_eta_s_CONST=0
Real(dp) :: f_etap_CONST=0.172_dp
Real(dp) :: f_rho_CONST=0.22_dp
Real(dp) :: h_rho_CONST=0
Real(dp) :: f_omega_q_CONST=0
Real(dp) :: f_omega_s_CONST=0
Real(dp) :: h_omega_q_CONST=0
Real(dp) :: h_omega_s_CONST=0
Real(dp) :: f_Dp_CONST=0.256_dp
Real(dp) :: f_D_CONST=0.248_dp
Real(dp) :: f_Dsp_CONST=0.256_dp
Complex(dp) :: coeffC7sm = 0._dp
Complex(dp) :: coeffC7 = 0._dp
Complex(dp) :: coeffC7p = 0._dp
Complex(dp) :: coeffC7NP = 0._dp
Complex(dp) :: coeffC7pNP = 0._dp
Complex(dp) :: coeffC8sm = 0._dp
Complex(dp) :: coeffC8 = 0._dp
Complex(dp) :: coeffC8p = 0._dp
Complex(dp) :: coeffC8NP = 0._dp
Complex(dp) :: coeffC8pNP = 0._dp
Complex(dp) :: coeffC9eeSM = 0._dp
Complex(dp) :: coeffC9ee = 0._dp
Complex(dp) :: coeffC9Pee = 0._dp
Complex(dp) :: coeffC9eeNP = 0._dp
Complex(dp) :: coeffC9PeeNP = 0._dp
Complex(dp) :: coeffC10eeSM = 0._dp
Complex(dp) :: coeffC10ee = 0._dp
Complex(dp) :: coeffC10Pee = 0._dp
Complex(dp) :: coeffC10eeNP = 0._dp
Complex(dp) :: coeffC10PeeNP = 0._dp
Complex(dp) :: coeffC9mumuSM = 0._dp
Complex(dp) :: coeffC9mumu = 0._dp
Complex(dp) :: coeffC9Pmumu = 0._dp
Complex(dp) :: coeffC9mumuNP = 0._dp
Complex(dp) :: coeffC9PmumuNP = 0._dp
Complex(dp) :: coeffC10mumuSM = 0._dp
Complex(dp) :: coeffC10mumu = 0._dp
Complex(dp) :: coeffC10Pmumu = 0._dp
Complex(dp) :: coeffC10mumuNP = 0._dp
Complex(dp) :: coeffC10PmumuNP = 0._dp
Complex(dp) :: coeffCLnu1nu1SM = 0._dp
Complex(dp) :: coeffCLnu1nu1 = 0._dp
Complex(dp) :: coeffCLPnu1nu1 = 0._dp
Complex(dp) :: coeffCLnu1nu1NP = 0._dp
Complex(dp) :: coeffCLPnu1nu1NP = 0._dp
Complex(dp) :: coeffCLnu2nu2SM = 0._dp
Complex(dp) :: coeffCLnu2nu2 = 0._dp
Complex(dp) :: coeffCLPnu2nu2 = 0._dp
Complex(dp) :: coeffCLnu2nu2NP = 0._dp
Complex(dp) :: coeffCLPnu2nu2NP = 0._dp
Complex(dp) :: coeffCLnu3nu3SM = 0._dp
Complex(dp) :: coeffCLnu3nu3 = 0._dp
Complex(dp) :: coeffCLPnu3nu3 = 0._dp
Complex(dp) :: coeffCLnu3nu3NP = 0._dp
Complex(dp) :: coeffCLPnu3nu3NP = 0._dp
Complex(dp) :: coeffCRnu1nu1SM = 0._dp
Complex(dp) :: coeffCRnu1nu1 = 0._dp
Complex(dp) :: coeffCRPnu1nu1 = 0._dp
Complex(dp) :: coeffCRnu1nu1NP = 0._dp
Complex(dp) :: coeffCRPnu1nu1NP = 0._dp
Complex(dp) :: coeffCRnu2nu2SM = 0._dp
Complex(dp) :: coeffCRnu2nu2 = 0._dp
Complex(dp) :: coeffCRPnu2nu2 = 0._dp
Complex(dp) :: coeffCRnu2nu2NP = 0._dp
Complex(dp) :: coeffCRPnu2nu2NP = 0._dp
Complex(dp) :: coeffCRnu3nu3SM = 0._dp
Complex(dp) :: coeffCRnu3nu3 = 0._dp
Complex(dp) :: coeffCRPnu3nu3 = 0._dp
Complex(dp) :: coeffCRnu3nu3NP = 0._dp
Complex(dp) :: coeffCRPnu3nu3NP = 0._dp
Complex(dp) :: coeffKK_SLL = 0._dp
Complex(dp) :: coeffKK_SRR = 0._dp
Complex(dp) :: coeffKK_SLR = 0._dp
Complex(dp) :: coeffKK_VLL = 0._dp
Complex(dp) :: coeffKK_VRR = 0._dp
Complex(dp) :: coeffKK_VLR = 0._dp
Complex(dp) :: coeffKK_TLL = 0._dp
Complex(dp) :: coeffKK_TRR = 0._dp
Complex(dp) :: coeffBB_SLL = 0._dp
Complex(dp) :: coeffBB_SRR = 0._dp
Complex(dp) :: coeffBB_SLR = 0._dp
Complex(dp) :: coeffBB_VLL = 0._dp
Complex(dp) :: coeffBB_VRR = 0._dp
Complex(dp) :: coeffBB_VLR = 0._dp
Complex(dp) :: coeffBB_TLL = 0._dp
Complex(dp) :: coeffBB_TRR = 0._dp
Complex(dp) :: coeffBsBs_SLL = 0._dp
Complex(dp) :: coeffBsBs_SRR = 0._dp
Complex(dp) :: coeffBsBs_SLR = 0._dp
Complex(dp) :: coeffBsBs_VLL = 0._dp
Complex(dp) :: coeffBsBs_VRR = 0._dp
Complex(dp) :: coeffBsBs_VLR = 0._dp
Complex(dp) :: coeffBsBs_TLL = 0._dp
Complex(dp) :: coeffBsBs_TRR = 0._dp
Complex(dp) :: coeffKK_SLLNP = 0._dp
Complex(dp) :: coeffKK_SRRNP = 0._dp
Complex(dp) :: coeffKK_SLRNP = 0._dp
Complex(dp) :: coeffKK_VLLNP = 0._dp
Complex(dp) :: coeffKK_VRRNP = 0._dp
Complex(dp) :: coeffKK_VLRNP = 0._dp
Complex(dp) :: coeffKK_TLLNP = 0._dp
Complex(dp) :: coeffKK_TRRNP = 0._dp
Complex(dp) :: coeffBB_SLLNP = 0._dp
Complex(dp) :: coeffBB_SRRNP = 0._dp
Complex(dp) :: coeffBB_SLRNP = 0._dp
Complex(dp) :: coeffBB_VLLNP = 0._dp
Complex(dp) :: coeffBB_VRRNP = 0._dp
Complex(dp) :: coeffBB_VLRNP = 0._dp
Complex(dp) :: coeffBB_TLLNP = 0._dp
Complex(dp) :: coeffBB_TRRNP = 0._dp
Complex(dp) :: coeffBsBs_SLLNP = 0._dp
Complex(dp) :: coeffBsBs_SRRNP = 0._dp
Complex(dp) :: coeffBsBs_SLRNP = 0._dp
Complex(dp) :: coeffBsBs_VLLNP = 0._dp
Complex(dp) :: coeffBsBs_VRRNP = 0._dp
Complex(dp) :: coeffBsBs_VLRNP = 0._dp
Complex(dp) :: coeffBsBs_TLLNP = 0._dp
Complex(dp) :: coeffBsBs_TRRNP = 0._dp
Complex(dp) :: coeffKK_SLLSM = 0._dp
Complex(dp) :: coeffKK_SRRSM = 0._dp
Complex(dp) :: coeffKK_SLRSM = 0._dp
Complex(dp) :: coeffKK_VLLSM = 0._dp
Complex(dp) :: coeffKK_VRRSM = 0._dp
Complex(dp) :: coeffKK_VLRSM = 0._dp
Complex(dp) :: coeffKK_TLLSM = 0._dp
Complex(dp) :: coeffKK_TRRSM = 0._dp
Complex(dp) :: coeffBB_SLLSM = 0._dp
Complex(dp) :: coeffBB_SRRSM = 0._dp
Complex(dp) :: coeffBB_SLRSM = 0._dp
Complex(dp) :: coeffBB_VLLSM = 0._dp
Complex(dp) :: coeffBB_VRRSM = 0._dp
Complex(dp) :: coeffBB_VLRSM = 0._dp
Complex(dp) :: coeffBB_TLLSM = 0._dp
Complex(dp) :: coeffBB_TRRSM = 0._dp
Complex(dp) :: coeffBsBs_SLLSM = 0._dp
Complex(dp) :: coeffBsBs_SRRSM = 0._dp
Complex(dp) :: coeffBsBs_SLRSM = 0._dp
Complex(dp) :: coeffBsBs_VLLSM = 0._dp
Complex(dp) :: coeffBsBs_VRRSM = 0._dp
Complex(dp) :: coeffBsBs_VLRSM = 0._dp
Complex(dp) :: coeffBsBs_TLLSM = 0._dp
Complex(dp) :: coeffBsBs_TRRSM = 0._dp
Complex(dp) :: DVLL_2323 = 0._dp
Complex(dp) :: DVRR_2323 = 0._dp
Complex(dp) :: DVLR_2323 = 0._dp
Complex(dp) :: DSRR_2323 = 0._dp
Complex(dp) :: DSRR_3232 = 0._dp
Complex(dp) :: DVLL_1313 = 0._dp
Complex(dp) :: DVRR_1313 = 0._dp
Complex(dp) :: DVLR_1313 = 0._dp
Complex(dp) :: DSRR_1313 = 0._dp
Complex(dp) :: DSRR_3131 = 0._dp
Complex(dp) :: DVLL_1212 = 0._dp
Complex(dp) :: DVRR_1212 = 0._dp
Complex(dp) :: DVLR_1212 = 0._dp
Complex(dp) :: DSRR_1212 = 0._dp
Complex(dp) :: DSRR_2121 = 0._dp
Complex(dp) :: DVLL_1323 = 0._dp
Complex(dp) :: DVRR_1323 = 0._dp
Complex(dp) :: DVLR_1323 = 0._dp
Complex(dp) :: DVLR_2313 = 0._dp
Complex(dp) :: DSRR_1323 = 0._dp
Complex(dp) :: DSRR_3132 = 0._dp
Complex(dp) :: DVLL_1232 = 0._dp
Complex(dp) :: DVRR_1232 = 0._dp
Complex(dp) :: DVLR_1232 = 0._dp
Complex(dp) :: DVLR_2321 = 0._dp
Complex(dp) :: DSRR_1232 = 0._dp
Complex(dp) :: DSRR_2123 = 0._dp
Complex(dp) :: DVLL_1213 = 0._dp
Complex(dp) :: DVRR_1213 = 0._dp
Complex(dp) :: DVLR_1213 = 0._dp
Complex(dp) :: DVLR_1312 = 0._dp
Complex(dp) :: DSRR_1213 = 0._dp
Complex(dp) :: DSRR_2131 = 0._dp
Complex(dp) :: GVLL_3111 = 0._dp
Complex(dp) :: GVLL_3121 = 0._dp
Complex(dp) :: GVLL_3131 = 0._dp
Complex(dp) :: GVRL_3111 = 0._dp
Complex(dp) :: GVRL_3121 = 0._dp
Complex(dp) :: GVRL_3131 = 0._dp
Complex(dp) :: GSLL_3111 = 0._dp
Complex(dp) :: GSLL_3121 = 0._dp
Complex(dp) :: GSLL_3131 = 0._dp
Complex(dp) :: GSRL_3111 = 0._dp
Complex(dp) :: GSRL_3121 = 0._dp
Complex(dp) :: GSRL_3131 = 0._dp
Complex(dp) :: GVLL_3211 = 0._dp
Complex(dp) :: GVLL_3221 = 0._dp
Complex(dp) :: GVLL_3231 = 0._dp
Complex(dp) :: GVRL_3211 = 0._dp
Complex(dp) :: GVRL_3221 = 0._dp
Complex(dp) :: GVRL_3231 = 0._dp
Complex(dp) :: GSLL_3211 = 0._dp
Complex(dp) :: GSLL_3221 = 0._dp
Complex(dp) :: GSLL_3231 = 0._dp
Complex(dp) :: GSRL_3211 = 0._dp
Complex(dp) :: GSRL_3221 = 0._dp
Complex(dp) :: GSRL_3231 = 0._dp
Complex(dp) :: GVLL_2111 = 0._dp
Complex(dp) :: GVLL_2121 = 0._dp
Complex(dp) :: GVLL_2131 = 0._dp
Complex(dp) :: GVRL_2111 = 0._dp
Complex(dp) :: GVRL_2121 = 0._dp
Complex(dp) :: GVRL_2131 = 0._dp
Complex(dp) :: GSLL_2111 = 0._dp
Complex(dp) :: GSLL_2121 = 0._dp
Complex(dp) :: GSLL_2131 = 0._dp
Complex(dp) :: GSRL_2111 = 0._dp
Complex(dp) :: GSRL_2121 = 0._dp
Complex(dp) :: GSRL_2131 = 0._dp
Complex(dp) :: GVLL_2211 = 0._dp
Complex(dp) :: GVLL_2221 = 0._dp
Complex(dp) :: GVLL_2231 = 0._dp
Complex(dp) :: GVRL_2211 = 0._dp
Complex(dp) :: GVRL_2221 = 0._dp
Complex(dp) :: GVRL_2231 = 0._dp
Complex(dp) :: GSLL_2211 = 0._dp
Complex(dp) :: GSLL_2221 = 0._dp
Complex(dp) :: GSLL_2231 = 0._dp
Complex(dp) :: GSRL_2211 = 0._dp
Complex(dp) :: GSRL_2221 = 0._dp
Complex(dp) :: GSRL_2231 = 0._dp
Complex(dp) :: GVLL_1111 = 0._dp
Complex(dp) :: GVLL_1121 = 0._dp
Complex(dp) :: GVLL_1131 = 0._dp
Complex(dp) :: GVRL_1111 = 0._dp
Complex(dp) :: GVRL_1121 = 0._dp
Complex(dp) :: GVRL_1131 = 0._dp
Complex(dp) :: GSLL_1111 = 0._dp
Complex(dp) :: GSLL_1121 = 0._dp
Complex(dp) :: GSLL_1131 = 0._dp
Complex(dp) :: GSRL_1111 = 0._dp
Complex(dp) :: GSRL_1121 = 0._dp
Complex(dp) :: GSRL_1131 = 0._dp
Complex(dp) :: GVLL_1211 = 0._dp
Complex(dp) :: GVLL_1221 = 0._dp
Complex(dp) :: GVLL_1231 = 0._dp
Complex(dp) :: GVRL_1211 = 0._dp
Complex(dp) :: GVRL_1221 = 0._dp
Complex(dp) :: GVRL_1231 = 0._dp
Complex(dp) :: GSLL_1211 = 0._dp
Complex(dp) :: GSLL_1221 = 0._dp
Complex(dp) :: GSLL_1231 = 0._dp
Complex(dp) :: GSRL_1211 = 0._dp
Complex(dp) :: GSRL_1221 = 0._dp
Complex(dp) :: GSRL_1231 = 0._dp
Complex(dp) :: GVLL_3112 = 0._dp
Complex(dp) :: GVLL_3122 = 0._dp
Complex(dp) :: GVLL_3132 = 0._dp
Complex(dp) :: GVRL_3112 = 0._dp
Complex(dp) :: GVRL_3122 = 0._dp
Complex(dp) :: GVRL_3132 = 0._dp
Complex(dp) :: GSLL_3112 = 0._dp
Complex(dp) :: GSLL_3122 = 0._dp
Complex(dp) :: GSLL_3132 = 0._dp
Complex(dp) :: GSRL_3112 = 0._dp
Complex(dp) :: GSRL_3122 = 0._dp
Complex(dp) :: GSRL_3132 = 0._dp
Complex(dp) :: GVLL_3212 = 0._dp
Complex(dp) :: GVLL_3222 = 0._dp
Complex(dp) :: GVLL_3232 = 0._dp
Complex(dp) :: GVRL_3212 = 0._dp
Complex(dp) :: GVRL_3222 = 0._dp
Complex(dp) :: GVRL_3232 = 0._dp
Complex(dp) :: GSLL_3212 = 0._dp
Complex(dp) :: GSLL_3222 = 0._dp
Complex(dp) :: GSLL_3232 = 0._dp
Complex(dp) :: GSRL_3212 = 0._dp
Complex(dp) :: GSRL_3222 = 0._dp
Complex(dp) :: GSRL_3232 = 0._dp
Complex(dp) :: GVLL_2112 = 0._dp
Complex(dp) :: GVLL_2122 = 0._dp
Complex(dp) :: GVLL_2132 = 0._dp
Complex(dp) :: GVRL_2112 = 0._dp
Complex(dp) :: GVRL_2122 = 0._dp
Complex(dp) :: GVRL_2132 = 0._dp
Complex(dp) :: GSLL_2112 = 0._dp
Complex(dp) :: GSLL_2122 = 0._dp
Complex(dp) :: GSLL_2132 = 0._dp
Complex(dp) :: GSRL_2112 = 0._dp
Complex(dp) :: GSRL_2122 = 0._dp
Complex(dp) :: GSRL_2132 = 0._dp
Complex(dp) :: GVLL_2212 = 0._dp
Complex(dp) :: GVLL_2222 = 0._dp
Complex(dp) :: GVLL_2232 = 0._dp
Complex(dp) :: GVRL_2212 = 0._dp
Complex(dp) :: GVRL_2222 = 0._dp
Complex(dp) :: GVRL_2232 = 0._dp
Complex(dp) :: GSLL_2212 = 0._dp
Complex(dp) :: GSLL_2222 = 0._dp
Complex(dp) :: GSLL_2232 = 0._dp
Complex(dp) :: GSRL_2212 = 0._dp
Complex(dp) :: GSRL_2222 = 0._dp
Complex(dp) :: GSRL_2232 = 0._dp
Complex(dp) :: GVLL_1112 = 0._dp
Complex(dp) :: GVLL_1122 = 0._dp
Complex(dp) :: GVLL_1132 = 0._dp
Complex(dp) :: GVRL_1112 = 0._dp
Complex(dp) :: GVRL_1122 = 0._dp
Complex(dp) :: GVRL_1132 = 0._dp
Complex(dp) :: GSLL_1112 = 0._dp
Complex(dp) :: GSLL_1122 = 0._dp
Complex(dp) :: GSLL_1132 = 0._dp
Complex(dp) :: GSRL_1112 = 0._dp
Complex(dp) :: GSRL_1122 = 0._dp
Complex(dp) :: GSRL_1132 = 0._dp
Complex(dp) :: GVLL_1212 = 0._dp
Complex(dp) :: GVLL_1222 = 0._dp
Complex(dp) :: GVLL_1232 = 0._dp
Complex(dp) :: GVRL_1212 = 0._dp
Complex(dp) :: GVRL_1222 = 0._dp
Complex(dp) :: GVRL_1232 = 0._dp
Complex(dp) :: GSLL_1212 = 0._dp
Complex(dp) :: GSLL_1222 = 0._dp
Complex(dp) :: GSLL_1232 = 0._dp
Complex(dp) :: GSRL_1212 = 0._dp
Complex(dp) :: GSRL_1222 = 0._dp
Complex(dp) :: GSRL_1232 = 0._dp
Complex(dp) :: GVLL_3113 = 0._dp
Complex(dp) :: GVLL_3123 = 0._dp
Complex(dp) :: GVLL_3133 = 0._dp
Complex(dp) :: GVRL_3113 = 0._dp
Complex(dp) :: GVRL_3123 = 0._dp
Complex(dp) :: GVRL_3133 = 0._dp
Complex(dp) :: GSLL_3113 = 0._dp
Complex(dp) :: GSLL_3123 = 0._dp
Complex(dp) :: GSLL_3133 = 0._dp
Complex(dp) :: GSRL_3113 = 0._dp
Complex(dp) :: GSRL_3123 = 0._dp
Complex(dp) :: GSRL_3133 = 0._dp
Complex(dp) :: GVLL_3213 = 0._dp
Complex(dp) :: GVLL_3223 = 0._dp
Complex(dp) :: GVLL_3233 = 0._dp
Complex(dp) :: GVRL_3213 = 0._dp
Complex(dp) :: GVRL_3223 = 0._dp
Complex(dp) :: GVRL_3233 = 0._dp
Complex(dp) :: GSLL_3213 = 0._dp
Complex(dp) :: GSLL_3223 = 0._dp
Complex(dp) :: GSLL_3233 = 0._dp
Complex(dp) :: GSRL_3213 = 0._dp
Complex(dp) :: GSRL_3223 = 0._dp
Complex(dp) :: GSRL_3233 = 0._dp
Complex(dp) :: GVLL_2113 = 0._dp
Complex(dp) :: GVLL_2123 = 0._dp
Complex(dp) :: GVLL_2133 = 0._dp
Complex(dp) :: GVRL_2113 = 0._dp
Complex(dp) :: GVRL_2123 = 0._dp
Complex(dp) :: GVRL_2133 = 0._dp
Complex(dp) :: GSLL_2113 = 0._dp
Complex(dp) :: GSLL_2123 = 0._dp
Complex(dp) :: GSLL_2133 = 0._dp
Complex(dp) :: GSRL_2113 = 0._dp
Complex(dp) :: GSRL_2123 = 0._dp
Complex(dp) :: GSRL_2133 = 0._dp
Complex(dp) :: GVLL_2213 = 0._dp
Complex(dp) :: GVLL_2223 = 0._dp
Complex(dp) :: GVLL_2233 = 0._dp
Complex(dp) :: GVRL_2213 = 0._dp
Complex(dp) :: GVRL_2223 = 0._dp
Complex(dp) :: GVRL_2233 = 0._dp
Complex(dp) :: GSLL_2213 = 0._dp
Complex(dp) :: GSLL_2223 = 0._dp
Complex(dp) :: GSLL_2233 = 0._dp
Complex(dp) :: GSRL_2213 = 0._dp
Complex(dp) :: GSRL_2223 = 0._dp
Complex(dp) :: GSRL_2233 = 0._dp
Complex(dp) :: GVLL_1113 = 0._dp
Complex(dp) :: GVLL_1123 = 0._dp
Complex(dp) :: GVLL_1133 = 0._dp
Complex(dp) :: GVRL_1113 = 0._dp
Complex(dp) :: GVRL_1123 = 0._dp
Complex(dp) :: GVRL_1133 = 0._dp
Complex(dp) :: GSLL_1113 = 0._dp
Complex(dp) :: GSLL_1123 = 0._dp
Complex(dp) :: GSLL_1133 = 0._dp
Complex(dp) :: GSRL_1113 = 0._dp
Complex(dp) :: GSRL_1123 = 0._dp
Complex(dp) :: GSRL_1133 = 0._dp
Complex(dp) :: GVLL_1213 = 0._dp
Complex(dp) :: GVLL_1223 = 0._dp
Complex(dp) :: GVLL_1233 = 0._dp
Complex(dp) :: GVRL_1213 = 0._dp
Complex(dp) :: GVRL_1223 = 0._dp
Complex(dp) :: GVRL_1233 = 0._dp
Complex(dp) :: GSLL_1213 = 0._dp
Complex(dp) :: GSLL_1223 = 0._dp
Complex(dp) :: GSLL_1233 = 0._dp
Complex(dp) :: GSRL_1213 = 0._dp
Complex(dp) :: GSRL_1223 = 0._dp
Complex(dp) :: GSRL_1233 = 0._dp
Complex(dp) :: FVLL_2311 = 0._dp
Complex(dp) :: FVLL_2322 = 0._dp
Complex(dp) :: FVLL_2333 = 0._dp
Complex(dp) :: FVLL_2312 = 0._dp
Complex(dp) :: FVLL_2313 = 0._dp
Complex(dp) :: FVLL_2323 = 0._dp
Complex(dp) :: FVLL_3212 = 0._dp
Complex(dp) :: FVLL_3213 = 0._dp
Complex(dp) :: FVLL_3223 = 0._dp
Complex(dp) :: FVRL_2311 = 0._dp
Complex(dp) :: FVRL_2322 = 0._dp
Complex(dp) :: FVRL_2333 = 0._dp
Complex(dp) :: FVRL_2312 = 0._dp
Complex(dp) :: FVRL_2313 = 0._dp
Complex(dp) :: FVRL_2323 = 0._dp
Complex(dp) :: FVRL_3212 = 0._dp
Complex(dp) :: FVRL_3213 = 0._dp
Complex(dp) :: FVRL_3223 = 0._dp
Complex(dp) :: FVLL_1311 = 0._dp
Complex(dp) :: FVLL_1322 = 0._dp
Complex(dp) :: FVLL_1333 = 0._dp
Complex(dp) :: FVLL_1312 = 0._dp
Complex(dp) :: FVLL_1313 = 0._dp
Complex(dp) :: FVLL_1323 = 0._dp
Complex(dp) :: FVLL_3112 = 0._dp
Complex(dp) :: FVLL_3113 = 0._dp
Complex(dp) :: FVLL_3123 = 0._dp
Complex(dp) :: FVRL_1311 = 0._dp
Complex(dp) :: FVRL_1322 = 0._dp
Complex(dp) :: FVRL_1333 = 0._dp
Complex(dp) :: FVRL_1312 = 0._dp
Complex(dp) :: FVRL_1313 = 0._dp
Complex(dp) :: FVRL_1323 = 0._dp
Complex(dp) :: FVRL_3112 = 0._dp
Complex(dp) :: FVRL_3113 = 0._dp
Complex(dp) :: FVRL_3123 = 0._dp
Complex(dp) :: FVLL_2111 = 0._dp
Complex(dp) :: FVLL_2122 = 0._dp
Complex(dp) :: FVLL_2133 = 0._dp
Complex(dp) :: FVLL_2112 = 0._dp
Complex(dp) :: FVLL_2113 = 0._dp
Complex(dp) :: FVLL_2123 = 0._dp
Complex(dp) :: FVLL_1212 = 0._dp
Complex(dp) :: FVLL_1213 = 0._dp
Complex(dp) :: FVLL_1223 = 0._dp
Complex(dp) :: FVRL_2111 = 0._dp
Complex(dp) :: FVRL_2122 = 0._dp
Complex(dp) :: FVRL_2133 = 0._dp
Complex(dp) :: FVRL_2112 = 0._dp
Complex(dp) :: FVRL_2113 = 0._dp
Complex(dp) :: FVRL_2123 = 0._dp
Complex(dp) :: FVRL_1212 = 0._dp
Complex(dp) :: FVRL_1213 = 0._dp
Complex(dp) :: FVRL_1223 = 0._dp
Complex(dp) :: Q1R_23 = 0._dp
Complex(dp) :: Q1R_32 = 0._dp
Complex(dp) :: Q2R_23 = 0._dp
Complex(dp) :: Q2R_32 = 0._dp
Complex(dp) :: DVLL_2311 = 0._dp
Complex(dp) :: DVLL_2322 = 0._dp
Complex(dp) :: DVLL_2333 = 0._dp
Complex(dp) :: DVLL_1231 = 0._dp
Complex(dp) :: DVRR_2311 = 0._dp
Complex(dp) :: DVRR_2322 = 0._dp
Complex(dp) :: DVRR_2333 = 0._dp
Complex(dp) :: DVRR_1231 = 0._dp
Complex(dp) :: DVLR_2311 = 0._dp
Complex(dp) :: DVLR_2322 = 0._dp
Complex(dp) :: DVLR_2333 = 0._dp
Complex(dp) :: DVRL_2311 = 0._dp
Complex(dp) :: DVRL_2322 = 0._dp
Complex(dp) :: DVRL_2333 = 0._dp
Complex(dp) :: DVLR_1231 = 0._dp
Complex(dp) :: DVLR_1321 = 0._dp
Complex(dp) :: DSRR_2311 = 0._dp
Complex(dp) :: DSRR_2322 = 0._dp
Complex(dp) :: DSRR_2333 = 0._dp
Complex(dp) :: DSRR_3211 = 0._dp
Complex(dp) :: DSRR_3222 = 0._dp
Complex(dp) :: DSRR_3233 = 0._dp
Complex(dp) :: DSRR_1231 = 0._dp
Complex(dp) :: DSRR_1321 = 0._dp
Complex(dp) :: EVLL_2311 = 0._dp
Complex(dp) :: EVLL_2322 = 0._dp
Complex(dp) :: EVLL_2333 = 0._dp
Complex(dp) :: EVRR_2311 = 0._dp
Complex(dp) :: EVRR_2322 = 0._dp
Complex(dp) :: EVRR_2333 = 0._dp
Complex(dp) :: EVLR_2311 = 0._dp
Complex(dp) :: EVLR_2322 = 0._dp
Complex(dp) :: EVLR_2333 = 0._dp
Complex(dp) :: EVRL_2311 = 0._dp
Complex(dp) :: EVRL_2322 = 0._dp
Complex(dp) :: EVRL_2333 = 0._dp
Complex(dp) :: ESRR_2311 = 0._dp
Complex(dp) :: ESRR_2322 = 0._dp
Complex(dp) :: ESRR_2333 = 0._dp
Complex(dp) :: ESRR_3211 = 0._dp
Complex(dp) :: ESRR_3222 = 0._dp
Complex(dp) :: ESRR_3233 = 0._dp
Complex(dp) :: ESLR_2311 = 0._dp
Complex(dp) :: ESLR_2322 = 0._dp
Complex(dp) :: ESLR_2333 = 0._dp
Complex(dp) :: ESLR_3211 = 0._dp
Complex(dp) :: ESLR_3222 = 0._dp
Complex(dp) :: ESLR_3233 = 0._dp
Complex(dp) :: ETRR_2311 = 0._dp
Complex(dp) :: ETRR_2322 = 0._dp
Complex(dp) :: ETRR_2333 = 0._dp
Complex(dp) :: ETRR_3211 = 0._dp
Complex(dp) :: ETRR_3222 = 0._dp
Complex(dp) :: ETRR_3233 = 0._dp
Complex(dp) :: Q1R_13 = 0._dp
Complex(dp) :: Q1R_31 = 0._dp
Complex(dp) :: Q2R_13 = 0._dp
Complex(dp) :: Q2R_31 = 0._dp
Complex(dp) :: DVLL_1311 = 0._dp
Complex(dp) :: DVLL_1322 = 0._dp
Complex(dp) :: DVLL_1333 = 0._dp
Complex(dp) :: DVLL_2132 = 0._dp
Complex(dp) :: DVRR_1311 = 0._dp
Complex(dp) :: DVRR_1322 = 0._dp
Complex(dp) :: DVRR_1333 = 0._dp
Complex(dp) :: DVRR_2132 = 0._dp
Complex(dp) :: DVLR_1311 = 0._dp
Complex(dp) :: DVLR_1322 = 0._dp
Complex(dp) :: DVLR_1333 = 0._dp
Complex(dp) :: DVRL_1311 = 0._dp
Complex(dp) :: DVRL_1322 = 0._dp
Complex(dp) :: DVRL_1333 = 0._dp
Complex(dp) :: DVLR_2132 = 0._dp
Complex(dp) :: DVLR_2312 = 0._dp
Complex(dp) :: DSRR_1311 = 0._dp
Complex(dp) :: DSRR_1322 = 0._dp
Complex(dp) :: DSRR_1333 = 0._dp
Complex(dp) :: DSRR_3111 = 0._dp
Complex(dp) :: DSRR_3122 = 0._dp
Complex(dp) :: DSRR_3133 = 0._dp
Complex(dp) :: DSRR_2132 = 0._dp
Complex(dp) :: DSRR_2312 = 0._dp
Complex(dp) :: EVLL_1311 = 0._dp
Complex(dp) :: EVLL_1322 = 0._dp
Complex(dp) :: EVLL_1333 = 0._dp
Complex(dp) :: EVRR_1311 = 0._dp
Complex(dp) :: EVRR_1322 = 0._dp
Complex(dp) :: EVRR_1333 = 0._dp
Complex(dp) :: EVLR_1311 = 0._dp
Complex(dp) :: EVLR_1322 = 0._dp
Complex(dp) :: EVLR_1333 = 0._dp
Complex(dp) :: EVRL_1311 = 0._dp
Complex(dp) :: EVRL_1322 = 0._dp
Complex(dp) :: EVRL_1333 = 0._dp
Complex(dp) :: ESRR_1311 = 0._dp
Complex(dp) :: ESRR_1322 = 0._dp
Complex(dp) :: ESRR_1333 = 0._dp
Complex(dp) :: ESRR_3111 = 0._dp
Complex(dp) :: ESRR_3122 = 0._dp
Complex(dp) :: ESRR_3133 = 0._dp
Complex(dp) :: ESLR_1311 = 0._dp
Complex(dp) :: ESLR_1322 = 0._dp
Complex(dp) :: ESLR_1333 = 0._dp
Complex(dp) :: ESLR_3111 = 0._dp
Complex(dp) :: ESLR_3122 = 0._dp
Complex(dp) :: ESLR_3133 = 0._dp
Complex(dp) :: ETRR_1311 = 0._dp
Complex(dp) :: ETRR_1322 = 0._dp
Complex(dp) :: ETRR_1333 = 0._dp
Complex(dp) :: ETRR_3111 = 0._dp
Complex(dp) :: ETRR_3122 = 0._dp
Complex(dp) :: ETRR_3133 = 0._dp
Complex(dp) :: Q1R_12 = 0._dp
Complex(dp) :: Q1R_21 = 0._dp
Complex(dp) :: Q2R_12 = 0._dp
Complex(dp) :: Q2R_21 = 0._dp
Complex(dp) :: DVLL_1211 = 0._dp
Complex(dp) :: DVLL_1222 = 0._dp
Complex(dp) :: DVLL_1233 = 0._dp
Complex(dp) :: DVLL_3123 = 0._dp
Complex(dp) :: DVRR_1211 = 0._dp
Complex(dp) :: DVRR_1222 = 0._dp
Complex(dp) :: DVRR_1233 = 0._dp
Complex(dp) :: DVRR_3123 = 0._dp
Complex(dp) :: DVLR_1211 = 0._dp
Complex(dp) :: DVLR_1222 = 0._dp
Complex(dp) :: DVLR_1233 = 0._dp
Complex(dp) :: DVRL_1211 = 0._dp
Complex(dp) :: DVRL_1222 = 0._dp
Complex(dp) :: DVRL_1233 = 0._dp
Complex(dp) :: DVLR_3123 = 0._dp
Complex(dp) :: DVLR_3213 = 0._dp
Complex(dp) :: DSRR_1211 = 0._dp
Complex(dp) :: DSRR_1222 = 0._dp
Complex(dp) :: DSRR_1233 = 0._dp
Complex(dp) :: DSRR_2111 = 0._dp
Complex(dp) :: DSRR_2122 = 0._dp
Complex(dp) :: DSRR_2133 = 0._dp
Complex(dp) :: DSRR_3123 = 0._dp
Complex(dp) :: DSRR_3213 = 0._dp
Complex(dp) :: EVLL_1211 = 0._dp
Complex(dp) :: EVLL_1222 = 0._dp
Complex(dp) :: EVLL_1233 = 0._dp
Complex(dp) :: EVRR_1211 = 0._dp
Complex(dp) :: EVRR_1222 = 0._dp
Complex(dp) :: EVRR_1233 = 0._dp
Complex(dp) :: EVLR_1211 = 0._dp
Complex(dp) :: EVLR_1222 = 0._dp
Complex(dp) :: EVLR_1233 = 0._dp
Complex(dp) :: EVRL_1211 = 0._dp
Complex(dp) :: EVRL_1222 = 0._dp
Complex(dp) :: EVRL_1233 = 0._dp
Complex(dp) :: ESRR_1211 = 0._dp
Complex(dp) :: ESRR_1222 = 0._dp
Complex(dp) :: ESRR_1233 = 0._dp
Complex(dp) :: ESRR_2111 = 0._dp
Complex(dp) :: ESRR_2122 = 0._dp
Complex(dp) :: ESRR_2133 = 0._dp
Complex(dp) :: ESLR_1211 = 0._dp
Complex(dp) :: ESLR_1222 = 0._dp
Complex(dp) :: ESLR_1233 = 0._dp
Complex(dp) :: ESLR_2111 = 0._dp
Complex(dp) :: ESLR_2122 = 0._dp
Complex(dp) :: ESLR_2133 = 0._dp
Complex(dp) :: ETRR_1211 = 0._dp
Complex(dp) :: ETRR_1222 = 0._dp
Complex(dp) :: ETRR_1233 = 0._dp
Complex(dp) :: ETRR_2111 = 0._dp
Complex(dp) :: ETRR_2122 = 0._dp
Complex(dp) :: ETRR_2133 = 0._dp
Complex(dp) :: EVLL_2312 = 0._dp
Complex(dp) :: EVRR_2312 = 0._dp
Complex(dp) :: EVLR_2312 = 0._dp
Complex(dp) :: EVRL_2312 = 0._dp
Complex(dp) :: ESRR_2312 = 0._dp
Complex(dp) :: ESRR_3221 = 0._dp
Complex(dp) :: ESLR_2312 = 0._dp
Complex(dp) :: ESLR_3221 = 0._dp
Complex(dp) :: ETRR_2312 = 0._dp
Complex(dp) :: ETRR_3221 = 0._dp
Complex(dp) :: EVLL_3212 = 0._dp
Complex(dp) :: EVRR_3212 = 0._dp
Complex(dp) :: EVLR_3212 = 0._dp
Complex(dp) :: EVRL_3212 = 0._dp
Complex(dp) :: ESRR_3212 = 0._dp
Complex(dp) :: ESRR_2321 = 0._dp
Complex(dp) :: ESLR_3212 = 0._dp
Complex(dp) :: ESLR_2321 = 0._dp
Complex(dp) :: ETRR_3212 = 0._dp
Complex(dp) :: ETRR_2321 = 0._dp
Complex(dp) :: EVLL_2313 = 0._dp
Complex(dp) :: EVRR_2313 = 0._dp
Complex(dp) :: EVLR_2313 = 0._dp
Complex(dp) :: EVRL_2313 = 0._dp
Complex(dp) :: ESRR_2313 = 0._dp
Complex(dp) :: ESRR_3231 = 0._dp
Complex(dp) :: ESLR_2313 = 0._dp
Complex(dp) :: ESLR_3231 = 0._dp
Complex(dp) :: ETRR_2313 = 0._dp
Complex(dp) :: ETRR_3231 = 0._dp
Complex(dp) :: EVLL_3213 = 0._dp
Complex(dp) :: EVRR_3213 = 0._dp
Complex(dp) :: EVLR_3213 = 0._dp
Complex(dp) :: EVRL_3213 = 0._dp
Complex(dp) :: ESRR_3213 = 0._dp
Complex(dp) :: ESRR_2331 = 0._dp
Complex(dp) :: ESLR_3213 = 0._dp
Complex(dp) :: ESLR_2331 = 0._dp
Complex(dp) :: ETRR_3213 = 0._dp
Complex(dp) :: ETRR_2331 = 0._dp
Complex(dp) :: EVLL_2323 = 0._dp
Complex(dp) :: EVRR_2323 = 0._dp
Complex(dp) :: EVLR_2323 = 0._dp
Complex(dp) :: EVRL_2323 = 0._dp
Complex(dp) :: ESRR_2323 = 0._dp
Complex(dp) :: ESRR_3232 = 0._dp
Complex(dp) :: ESLR_2323 = 0._dp
Complex(dp) :: ESLR_3232 = 0._dp
Complex(dp) :: ETRR_2323 = 0._dp
Complex(dp) :: ETRR_3232 = 0._dp
Complex(dp) :: EVLL_3223 = 0._dp
Complex(dp) :: EVRR_3223 = 0._dp
Complex(dp) :: EVLR_3223 = 0._dp
Complex(dp) :: EVRL_3223 = 0._dp
Complex(dp) :: ESRR_3223 = 0._dp
Complex(dp) :: ESRR_2332 = 0._dp
Complex(dp) :: ESLR_3223 = 0._dp
Complex(dp) :: ESLR_2332 = 0._dp
Complex(dp) :: ETRR_3223 = 0._dp
Complex(dp) :: ETRR_2332 = 0._dp
Complex(dp) :: EVLL_1312 = 0._dp
Complex(dp) :: EVRR_1312 = 0._dp
Complex(dp) :: EVLR_1312 = 0._dp
Complex(dp) :: EVRL_1312 = 0._dp
Complex(dp) :: ESRR_1312 = 0._dp
Complex(dp) :: ESRR_3121 = 0._dp
Complex(dp) :: ESLR_1312 = 0._dp
Complex(dp) :: ESLR_3121 = 0._dp
Complex(dp) :: ETRR_1312 = 0._dp
Complex(dp) :: ETRR_3121 = 0._dp
Complex(dp) :: EVLL_3112 = 0._dp
Complex(dp) :: EVRR_3112 = 0._dp
Complex(dp) :: EVLR_3112 = 0._dp
Complex(dp) :: EVRL_3112 = 0._dp
Complex(dp) :: ESRR_3112 = 0._dp
Complex(dp) :: ESRR_1321 = 0._dp
Complex(dp) :: ESLR_3112 = 0._dp
Complex(dp) :: ESLR_1321 = 0._dp
Complex(dp) :: ETRR_3112 = 0._dp
Complex(dp) :: ETRR_1321 = 0._dp
Complex(dp) :: EVLL_1313 = 0._dp
Complex(dp) :: EVRR_1313 = 0._dp
Complex(dp) :: EVLR_1313 = 0._dp
Complex(dp) :: EVRL_1313 = 0._dp
Complex(dp) :: ESRR_1313 = 0._dp
Complex(dp) :: ESRR_3131 = 0._dp
Complex(dp) :: ESLR_1313 = 0._dp
Complex(dp) :: ESLR_3131 = 0._dp
Complex(dp) :: ETRR_1313 = 0._dp
Complex(dp) :: ETRR_3131 = 0._dp
Complex(dp) :: EVLL_3113 = 0._dp
Complex(dp) :: EVRR_3113 = 0._dp
Complex(dp) :: EVLR_3113 = 0._dp
Complex(dp) :: EVRL_3113 = 0._dp
Complex(dp) :: ESRR_3113 = 0._dp
Complex(dp) :: ESRR_1331 = 0._dp
Complex(dp) :: ESLR_3113 = 0._dp
Complex(dp) :: ESLR_1331 = 0._dp
Complex(dp) :: ETRR_3113 = 0._dp
Complex(dp) :: ETRR_1331 = 0._dp
Complex(dp) :: EVLL_1323 = 0._dp
Complex(dp) :: EVRR_1323 = 0._dp
Complex(dp) :: EVLR_1323 = 0._dp
Complex(dp) :: EVRL_1323 = 0._dp
Complex(dp) :: ESRR_1323 = 0._dp
Complex(dp) :: ESRR_3132 = 0._dp
Complex(dp) :: ESLR_1323 = 0._dp
Complex(dp) :: ESLR_3132 = 0._dp
Complex(dp) :: ETRR_1323 = 0._dp
Complex(dp) :: ETRR_3132 = 0._dp
Complex(dp) :: EVLL_3123 = 0._dp
Complex(dp) :: EVRR_3123 = 0._dp
Complex(dp) :: EVLR_3123 = 0._dp
Complex(dp) :: EVRL_3123 = 0._dp
Complex(dp) :: ESRR_3123 = 0._dp
Complex(dp) :: ESRR_1332 = 0._dp
Complex(dp) :: ESLR_3123 = 0._dp
Complex(dp) :: ESLR_1332 = 0._dp
Complex(dp) :: ETRR_3123 = 0._dp
Complex(dp) :: ETRR_1332 = 0._dp
Complex(dp) :: EVLL_2112 = 0._dp
Complex(dp) :: EVRR_2112 = 0._dp
Complex(dp) :: EVLR_2112 = 0._dp
Complex(dp) :: EVRL_2112 = 0._dp
Complex(dp) :: ESRR_2112 = 0._dp
Complex(dp) :: ESRR_1221 = 0._dp
Complex(dp) :: ESLR_2112 = 0._dp
Complex(dp) :: ESLR_1221 = 0._dp
Complex(dp) :: ETRR_2112 = 0._dp
Complex(dp) :: ETRR_1221 = 0._dp
Complex(dp) :: EVLL_1212 = 0._dp
Complex(dp) :: EVRR_1212 = 0._dp
Complex(dp) :: EVLR_1212 = 0._dp
Complex(dp) :: EVRL_1212 = 0._dp
Complex(dp) :: ESRR_1212 = 0._dp
Complex(dp) :: ESRR_2121 = 0._dp
Complex(dp) :: ESLR_1212 = 0._dp
Complex(dp) :: ESLR_2121 = 0._dp
Complex(dp) :: ETRR_1212 = 0._dp
Complex(dp) :: ETRR_2121 = 0._dp
Complex(dp) :: EVLL_2113 = 0._dp
Complex(dp) :: EVRR_2113 = 0._dp
Complex(dp) :: EVLR_2113 = 0._dp
Complex(dp) :: EVRL_2113 = 0._dp
Complex(dp) :: ESRR_2113 = 0._dp
Complex(dp) :: ESRR_1231 = 0._dp
Complex(dp) :: ESLR_2113 = 0._dp
Complex(dp) :: ESLR_1231 = 0._dp
Complex(dp) :: ETRR_2113 = 0._dp
Complex(dp) :: ETRR_1231 = 0._dp
Complex(dp) :: EVLL_1213 = 0._dp
Complex(dp) :: EVRR_1213 = 0._dp
Complex(dp) :: EVLR_1213 = 0._dp
Complex(dp) :: EVRL_1213 = 0._dp
Complex(dp) :: ESRR_1213 = 0._dp
Complex(dp) :: ESRR_2131 = 0._dp
Complex(dp) :: ESLR_1213 = 0._dp
Complex(dp) :: ESLR_2131 = 0._dp
Complex(dp) :: ETRR_1213 = 0._dp
Complex(dp) :: ETRR_2131 = 0._dp
Complex(dp) :: EVLL_2123 = 0._dp
Complex(dp) :: EVRR_2123 = 0._dp
Complex(dp) :: EVLR_2123 = 0._dp
Complex(dp) :: EVRL_2123 = 0._dp
Complex(dp) :: ESRR_2123 = 0._dp
Complex(dp) :: ESRR_1232 = 0._dp
Complex(dp) :: ESLR_2123 = 0._dp
Complex(dp) :: ESLR_1232 = 0._dp
Complex(dp) :: ETRR_2123 = 0._dp
Complex(dp) :: ETRR_1232 = 0._dp
Complex(dp) :: EVLL_1223 = 0._dp
Complex(dp) :: EVRR_1223 = 0._dp
Complex(dp) :: EVLR_1223 = 0._dp
Complex(dp) :: EVRL_1223 = 0._dp
Complex(dp) :: ESRR_1223 = 0._dp
Complex(dp) :: ESRR_2132 = 0._dp
Complex(dp) :: ESLR_1223 = 0._dp
Complex(dp) :: ESLR_2132 = 0._dp
Complex(dp) :: ETRR_1223 = 0._dp
Complex(dp) :: ETRR_2132 = 0._dp
Complex(dp) :: K2R_21 = 0._dp
Complex(dp) :: K2R_12 = 0._dp
Complex(dp) :: AVLL_1121 = 0._dp
Complex(dp) :: AVLL_2221 = 0._dp
Complex(dp) :: AVLL_3321 = 0._dp
Complex(dp) :: AVRR_1121 = 0._dp
Complex(dp) :: AVRR_2221 = 0._dp
Complex(dp) :: AVRR_3321 = 0._dp
Complex(dp) :: AVLR_1121 = 0._dp
Complex(dp) :: AVLR_2221 = 0._dp
Complex(dp) :: AVLR_3321 = 0._dp
Complex(dp) :: AVLR_2111 = 0._dp
Complex(dp) :: AVLR_2122 = 0._dp
Complex(dp) :: AVLR_2133 = 0._dp
Complex(dp) :: AVLR_3213 = 0._dp
Complex(dp) :: AVLR_3123 = 0._dp
Complex(dp) :: ASRR_1121 = 0._dp
Complex(dp) :: ASRR_2221 = 0._dp
Complex(dp) :: ASRR_3321 = 0._dp
Complex(dp) :: ASRR_1112 = 0._dp
Complex(dp) :: ASRR_2212 = 0._dp
Complex(dp) :: ASRR_3312 = 0._dp
Complex(dp) :: ASRR_3213 = 0._dp
Complex(dp) :: ASRR_3123 = 0._dp
Complex(dp) :: BVLL_2111 = 0._dp
Complex(dp) :: BVLL_2122 = 0._dp
Complex(dp) :: BVLL_2133 = 0._dp
Complex(dp) :: BVRR_2111 = 0._dp
Complex(dp) :: BVRR_2122 = 0._dp
Complex(dp) :: BVRR_2133 = 0._dp
Complex(dp) :: BVLR_2111 = 0._dp
Complex(dp) :: BVLR_2122 = 0._dp
Complex(dp) :: BVLR_2133 = 0._dp
Complex(dp) :: BSRL_2111 = 0._dp
Complex(dp) :: BSRL_2122 = 0._dp
Complex(dp) :: BSRL_2133 = 0._dp
Complex(dp) :: BSRL_1211 = 0._dp
Complex(dp) :: BSRL_1222 = 0._dp
Complex(dp) :: BSRL_1233 = 0._dp
Complex(dp) :: BSRR_2111 = 0._dp
Complex(dp) :: BSRR_2122 = 0._dp
Complex(dp) :: BSRR_2133 = 0._dp
Complex(dp) :: BSRR_1211 = 0._dp
Complex(dp) :: BSRR_1222 = 0._dp
Complex(dp) :: BSRR_1233 = 0._dp
Complex(dp) :: BTRR_2111 = 0._dp
Complex(dp) :: BTRR_2122 = 0._dp
Complex(dp) :: BTRR_2133 = 0._dp
Complex(dp) :: BTRR_1211 = 0._dp
Complex(dp) :: BTRR_1222 = 0._dp
Complex(dp) :: BTRR_1233 = 0._dp
Complex(dp) :: EVLR_1121 = 0._dp
Complex(dp) :: EVLR_2221 = 0._dp
Complex(dp) :: EVLR_3321 = 0._dp
Complex(dp) :: CVLL_2111 = 0._dp
Complex(dp) :: CVLL_2122 = 0._dp
Complex(dp) :: CVRR_2111 = 0._dp
Complex(dp) :: CVRR_2122 = 0._dp
Complex(dp) :: CVLR_2111 = 0._dp
Complex(dp) :: CVLR_2122 = 0._dp
Complex(dp) :: CSRL_2111 = 0._dp
Complex(dp) :: CSRL_2122 = 0._dp
Complex(dp) :: CSRL_1211 = 0._dp
Complex(dp) :: CSRL_1222 = 0._dp
Complex(dp) :: CSRR_2111 = 0._dp
Complex(dp) :: CSRR_2122 = 0._dp
Complex(dp) :: CSRR_1211 = 0._dp
Complex(dp) :: CSRR_1222 = 0._dp
Complex(dp) :: CTRR_2111 = 0._dp
Complex(dp) :: CTRR_2122 = 0._dp
Complex(dp) :: CTRR_1211 = 0._dp
Complex(dp) :: CTRR_1222 = 0._dp
Complex(dp) :: K2R_31 = 0._dp
Complex(dp) :: K2R_13 = 0._dp
Complex(dp) :: AVLL_1131 = 0._dp
Complex(dp) :: AVLL_2231 = 0._dp
Complex(dp) :: AVLL_3331 = 0._dp
Complex(dp) :: AVRR_1131 = 0._dp
Complex(dp) :: AVRR_2231 = 0._dp
Complex(dp) :: AVRR_3331 = 0._dp
Complex(dp) :: AVLR_1131 = 0._dp
Complex(dp) :: AVLR_2231 = 0._dp
Complex(dp) :: AVLR_3331 = 0._dp
Complex(dp) :: AVLR_3111 = 0._dp
Complex(dp) :: AVLR_3122 = 0._dp
Complex(dp) :: AVLR_3133 = 0._dp
Complex(dp) :: AVLR_2312 = 0._dp
Complex(dp) :: AVLR_2132 = 0._dp
Complex(dp) :: ASRR_1131 = 0._dp
Complex(dp) :: ASRR_2231 = 0._dp
Complex(dp) :: ASRR_3331 = 0._dp
Complex(dp) :: ASRR_1113 = 0._dp
Complex(dp) :: ASRR_2213 = 0._dp
Complex(dp) :: ASRR_3313 = 0._dp
Complex(dp) :: ASRR_2312 = 0._dp
Complex(dp) :: ASRR_2132 = 0._dp
Complex(dp) :: BVLL_3111 = 0._dp
Complex(dp) :: BVLL_3122 = 0._dp
Complex(dp) :: BVLL_3133 = 0._dp
Complex(dp) :: BVRR_3111 = 0._dp
Complex(dp) :: BVRR_3122 = 0._dp
Complex(dp) :: BVRR_3133 = 0._dp
Complex(dp) :: BVLR_3111 = 0._dp
Complex(dp) :: BVLR_3122 = 0._dp
Complex(dp) :: BVLR_3133 = 0._dp
Complex(dp) :: BSRL_3111 = 0._dp
Complex(dp) :: BSRL_3122 = 0._dp
Complex(dp) :: BSRL_3133 = 0._dp
Complex(dp) :: BSRL_1311 = 0._dp
Complex(dp) :: BSRL_1322 = 0._dp
Complex(dp) :: BSRL_1333 = 0._dp
Complex(dp) :: BSRR_3111 = 0._dp
Complex(dp) :: BSRR_3122 = 0._dp
Complex(dp) :: BSRR_3133 = 0._dp
Complex(dp) :: BSRR_1311 = 0._dp
Complex(dp) :: BSRR_1322 = 0._dp
Complex(dp) :: BSRR_1333 = 0._dp
Complex(dp) :: BTRR_3111 = 0._dp
Complex(dp) :: BTRR_3122 = 0._dp
Complex(dp) :: BTRR_3133 = 0._dp
Complex(dp) :: BTRR_1311 = 0._dp
Complex(dp) :: BTRR_1322 = 0._dp
Complex(dp) :: BTRR_1333 = 0._dp
Complex(dp) :: EVLR_1131 = 0._dp
Complex(dp) :: EVLR_2231 = 0._dp
Complex(dp) :: EVLR_3331 = 0._dp
Complex(dp) :: CVLL_3111 = 0._dp
Complex(dp) :: CVLL_3122 = 0._dp
Complex(dp) :: CVRR_3111 = 0._dp
Complex(dp) :: CVRR_3122 = 0._dp
Complex(dp) :: CVLR_3111 = 0._dp
Complex(dp) :: CVLR_3122 = 0._dp
Complex(dp) :: CSRL_3111 = 0._dp
Complex(dp) :: CSRL_3122 = 0._dp
Complex(dp) :: CSRL_1311 = 0._dp
Complex(dp) :: CSRL_1322 = 0._dp
Complex(dp) :: CSRR_3111 = 0._dp
Complex(dp) :: CSRR_3122 = 0._dp
Complex(dp) :: CSRR_1311 = 0._dp
Complex(dp) :: CSRR_1322 = 0._dp
Complex(dp) :: CTRR_3111 = 0._dp
Complex(dp) :: CTRR_3122 = 0._dp
Complex(dp) :: CTRR_1311 = 0._dp
Complex(dp) :: CTRR_1322 = 0._dp
Complex(dp) :: K2R_23 = 0._dp
Complex(dp) :: K2R_32 = 0._dp
Complex(dp) :: AVLL_1123 = 0._dp
Complex(dp) :: AVLL_2223 = 0._dp
Complex(dp) :: AVLL_3323 = 0._dp
Complex(dp) :: AVRR_1123 = 0._dp
Complex(dp) :: AVRR_2223 = 0._dp
Complex(dp) :: AVRR_3323 = 0._dp
Complex(dp) :: AVLR_1123 = 0._dp
Complex(dp) :: AVLR_2223 = 0._dp
Complex(dp) :: AVLR_3323 = 0._dp
Complex(dp) :: AVLR_2311 = 0._dp
Complex(dp) :: AVLR_2322 = 0._dp
Complex(dp) :: AVLR_2333 = 0._dp
Complex(dp) :: AVLR_1231 = 0._dp
Complex(dp) :: AVLR_1321 = 0._dp
Complex(dp) :: ASRR_1123 = 0._dp
Complex(dp) :: ASRR_2223 = 0._dp
Complex(dp) :: ASRR_3323 = 0._dp
Complex(dp) :: ASRR_1132 = 0._dp
Complex(dp) :: ASRR_2232 = 0._dp
Complex(dp) :: ASRR_3332 = 0._dp
Complex(dp) :: ASRR_1231 = 0._dp
Complex(dp) :: ASRR_1321 = 0._dp
Complex(dp) :: BVLL_2311 = 0._dp
Complex(dp) :: BVLL_2322 = 0._dp
Complex(dp) :: BVLL_2333 = 0._dp
Complex(dp) :: BVRR_2311 = 0._dp
Complex(dp) :: BVRR_2322 = 0._dp
Complex(dp) :: BVRR_2333 = 0._dp
Complex(dp) :: BVLR_2311 = 0._dp
Complex(dp) :: BVLR_2322 = 0._dp
Complex(dp) :: BVLR_2333 = 0._dp
Complex(dp) :: BSRL_2311 = 0._dp
Complex(dp) :: BSRL_2322 = 0._dp
Complex(dp) :: BSRL_2333 = 0._dp
Complex(dp) :: BSRL_3211 = 0._dp
Complex(dp) :: BSRL_3222 = 0._dp
Complex(dp) :: BSRL_3233 = 0._dp
Complex(dp) :: BSRR_2311 = 0._dp
Complex(dp) :: BSRR_2322 = 0._dp
Complex(dp) :: BSRR_2333 = 0._dp
Complex(dp) :: BSRR_3211 = 0._dp
Complex(dp) :: BSRR_3222 = 0._dp
Complex(dp) :: BSRR_3233 = 0._dp
Complex(dp) :: BTRR_2311 = 0._dp
Complex(dp) :: BTRR_2322 = 0._dp
Complex(dp) :: BTRR_2333 = 0._dp
Complex(dp) :: BTRR_3211 = 0._dp
Complex(dp) :: BTRR_3222 = 0._dp
Complex(dp) :: BTRR_3233 = 0._dp
Complex(dp) :: EVLR_1123 = 0._dp
Complex(dp) :: EVLR_2223 = 0._dp
Complex(dp) :: EVLR_3323 = 0._dp
Complex(dp) :: CVLL_2311 = 0._dp
Complex(dp) :: CVLL_2322 = 0._dp
Complex(dp) :: CVRR_2311 = 0._dp
Complex(dp) :: CVRR_2322 = 0._dp
Complex(dp) :: CVLR_2311 = 0._dp
Complex(dp) :: CVLR_2322 = 0._dp
Complex(dp) :: CSRL_2311 = 0._dp
Complex(dp) :: CSRL_2322 = 0._dp
Complex(dp) :: CSRL_3211 = 0._dp
Complex(dp) :: CSRL_3222 = 0._dp
Complex(dp) :: CSRR_2311 = 0._dp
Complex(dp) :: CSRR_2322 = 0._dp
Complex(dp) :: CSRR_3211 = 0._dp
Complex(dp) :: CSRR_3222 = 0._dp
Complex(dp) :: CTRR_2311 = 0._dp
Complex(dp) :: CTRR_2322 = 0._dp
Complex(dp) :: CTRR_3211 = 0._dp
Complex(dp) :: CTRR_3222 = 0._dp
Complex(dp) :: AVLL_1313 = 0._dp
Complex(dp) :: AVRR_1313 = 0._dp
Complex(dp) :: AVLR_1313 = 0._dp
Complex(dp) :: ASRR_1313 = 0._dp
Complex(dp) :: ASRR_3131 = 0._dp
Complex(dp) :: AVLL_2323 = 0._dp
Complex(dp) :: AVRR_2323 = 0._dp
Complex(dp) :: AVLR_2323 = 0._dp
Complex(dp) :: ASRR_2323 = 0._dp
Complex(dp) :: ASRR_3232 = 0._dp
Complex(dp) :: AVLL_1212 = 0._dp
Complex(dp) :: AVRR_1212 = 0._dp
Complex(dp) :: AVLR_1212 = 0._dp
Complex(dp) :: ASRR_1212 = 0._dp
Complex(dp) :: ASRR_2121 = 0._dp
Complex(dp) :: AVLL_1232 = 0._dp
Complex(dp) :: AVRR_1232 = 0._dp
Complex(dp) :: AVLR_1232 = 0._dp
Complex(dp) :: AVLR_2321 = 0._dp
Complex(dp) :: ASRR_1232 = 0._dp
Complex(dp) :: ASRR_2123 = 0._dp
Complex(dp) :: AVLL_1213 = 0._dp
Complex(dp) :: AVRR_1213 = 0._dp
Complex(dp) :: AVLR_1213 = 0._dp
Complex(dp) :: AVLR_1312 = 0._dp
Complex(dp) :: ASRR_1213 = 0._dp
Complex(dp) :: ASRR_2131 = 0._dp
Complex(dp) :: AVLL_1323 = 0._dp
Complex(dp) :: AVRR_1323 = 0._dp
Complex(dp) :: AVLR_1323 = 0._dp
Complex(dp) :: AVLR_2313 = 0._dp
Complex(dp) :: ASRR_1323 = 0._dp
Complex(dp) :: ASRR_3132 = 0._dp
Real(dp) :: MW_SM 
Real(dp) :: Alpha_160, AlphaS_160, SinW2_160, sinW2_MZ 
Real(dp) :: mf_d_160(3), mf_u_160(3), mf_l_160(3), mf_d2_160(3), mf_u2_160(3), mf_l2_160(3) 
Real(dp) :: mf_d2_MZ(3), mf_u2_MZ(3), mf_l2_MZ(3) 
Complex(dp) :: CKM_160(3,3), CKM_MZ(3,3) 
Logical :: TransposedYukawa= .False. 
Logical :: KineticMixing = .True. 
Logical :: KineticMixingSave = .True. 
Logical :: TwoLoopMatching = .True., GuessTwoLoopMatchingBSM=.false. 
Logical :: OneLoopMatching = .True. 
Logical :: TreeLevelUnitarityLimits = .True. 
Real(dp) :: max_scattering_eigenvalue=0._dp
Real(dp) :: TreeUnitarity=1
Real(dp) :: CutSpole=0.25_dp 
Logical :: TrilinearUnitarity = .True. 
Logical :: RunRGEs_unitarity = .false. 
Real(dp) :: max_scattering_eigenvalue_trilinears=0._dp
Real(dp) :: TreeUnitarityTrilinear=1
Real(dp) :: unitarity_s_best=0._dp
Real(dp) :: unitarity_s_min=2000._dp
Real(dp) :: unitarity_s_max=3000._dp
Integer :: unitarity_steps=5
Integer :: TUcutLevel=2
Logical :: WriteTreeLevelTadpoleSolutions = .False. 
Logical :: WriteHiggsDiphotonLoopContributions = .False. 
Logical :: WriteEffHiggsCouplingRatios = .False. 
Real(dp) :: ZHOS_0(4, 4)
Real(dp) :: ZHOS_p2(4, 4)
Real(dp) :: UPOS_0(4, 4)
Real(dp) :: UPOS_p2(4, 4)
Real(dp) :: UCOS_0(4, 4)
Real(dp) :: UCOS_p2(4, 4)
Complex(dp) :: ZDLOS_0(3, 3)
Complex(dp) :: ZDLOS_p2(3, 3)
Complex(dp) :: ZDROS_0(3, 3)
Complex(dp) :: ZDROS_p2(3, 3)
Complex(dp) :: ZULOS_0(3, 3)
Complex(dp) :: ZULOS_p2(3, 3)
Complex(dp) :: ZUROS_0(3, 3)
Complex(dp) :: ZUROS_p2(3, 3)
Complex(dp) :: ZELOS_0(3, 3)
Complex(dp) :: ZELOS_p2(3, 3)
Complex(dp) :: ZEROS_0(3, 3)
Complex(dp) :: ZEROS_p2(3, 3)
Complex(dp) :: ZMOS_0(9, 9)
Complex(dp) :: ZMOS_p2(9, 9)
Real(dp) :: MU12Tree 
Real(dp) :: MU121L 
Real(dp) :: MU122L 
Real(dp) :: MU22Tree 
Real(dp) :: MU221L 
Real(dp) :: MU222L 
Real(dp) :: mass_uncertainty_Q(30), mass_uncertainty_Yt(30), g_SM_save(62) 
Logical :: GetMassUncertainty = .false. 
Integer :: SolutionTadpoleNr = 1 
Real(dp) :: gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,MU12,MU22

Complex(dp) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3),YL(3,3),YR(3,3),Mux(3,3)

Real(dp) :: gBLIN,g2IN,g3IN,LAM2IN,LAM1IN,RHO1IN,RHO2IN,ALP2IN,ALP1IN,ALP3IN,LAM5IN,              & 
& LAM6IN,LAM3IN,LAM4IN,MU12IN,MU22IN

Complex(dp) :: YIN(3,3),YQ1IN(3,3),YQ2IN(3,3),YtIN(3,3),YLIN(3,3),YRIN(3,3),MuxIN(3,3)

Real(dp) :: gBLMZ,g2MZ,g3MZ,LAM2MZ,LAM1MZ,RHO1MZ,RHO2MZ,ALP2MZ,ALP1MZ,ALP3MZ,LAM5MZ,              & 
& LAM6MZ,LAM3MZ,LAM4MZ,MU12MZ,MU22MZ

Complex(dp) :: YMZ(3,3),YQ1MZ(3,3),YQ2MZ(3,3),YtMZ(3,3),YLMZ(3,3),YRMZ(3,3),MuxMZ(3,3)

Real(dp) :: gBLGUT,g2GUT,g3GUT,LAM2GUT,LAM1GUT,RHO1GUT,RHO2GUT,ALP2GUT,ALP1GUT,ALP3GUT,           & 
& LAM5GUT,LAM6GUT,LAM3GUT,LAM4GUT,MU12GUT,MU22GUT

Complex(dp) :: YGUT(3,3),YQ1GUT(3,3),YQ2GUT(3,3),YtGUT(3,3),YLGUT(3,3),YRGUT(3,3),MuxGUT(3,3)

Real(dp) :: MAh(4),MAh2(4),MFd(3),MFd2(3),MFe(3),MFe2(3),MFu(3),MFu2(3),MFv(9),MFv2(9),           & 
& Mhh(4),Mhh2(4),MHpm(4),MHpm2(4),MVWLm,MVWLm2,MVWRm,MVWRm2,MVZ,MVZ2,MVZR,               & 
& MVZR2,PhiW,TW,UC(4,4),UP(4,4),ZH(4,4),ZZ(3,3)

Complex(dp) :: ZDR(3,3),ZER(3,3),ZUR(3,3),ZDL(3,3),ZEL(3,3),ZUL(3,3),ZM(9,9),ZW(4,4)

Real(dp) :: k1,vR

Real(dp) :: k1IN,vRIN

Real(dp) :: k1Fix,vRFix

Real(dp) :: gPFu(3,441),gTFu(3),BRFu(3,441),gPFe(3,465),gTFe(3),BRFe(3,465),gPFd(3,441),          & 
& gTFd(3),BRFd(3,441),gPhh(4,107),gThh(4),BRhh(4,107),gPFv(9,1083),gTFv(9),              & 
& BRFv(9,1083),gPVZ(1,99),gTVZ,BRVZ(1,99),gPVZR(1,99),gTVZR,BRVZR(1,99),gPHpm(4,68),     & 
& gTHpm(4),BRHpm(4,68),gPAh(4,99),gTAh(4),BRAh(4,99),gPVWLm(1,66),gTVWLm,BRVWLm(1,66),   & 
& gPVWRm(1,66),gTVWRm,BRVWRm(1,66)

Real(dp) :: gP1LFu(3,36),gT1LFu(3),BR1LFu(3,36),gP1LFe(3,60),gT1LFe(3),BR1LFe(3,60),              & 
& gP1LFd(3,36),gT1LFd(3),BR1LFd(3,36),gP1Lhh(4,107),gT1Lhh(4),BR1Lhh(4,107),             & 
& gP1LFv(9,84),gT1LFv(9),BR1LFv(9,84),gP1LVZ(1,99),gT1LVZ,BR1LVZ(1,99),gP1LVZR(1,99),    & 
& gT1LVZR,BR1LVZR(1,99),gP1LHpm(4,68),gT1LHpm(4),BR1LHpm(4,68),gP1LAh(4,99),             & 
& gT1LAh(4),BR1LAh(4,99),gP1LVWLm(1,66),gT1LVWLm,BR1LVWLm(1,66),gP1LVWRm(1,66),          & 
& gT1LVWRm,BR1LVWRm(1,66)

Real(dp) :: ratioFd(4,3),ratioFe(4,3),ratioFu(4,3),ratioHpm(4,4),ratioVWLm(4),ratioVWRm(4)

Complex(dp) :: ratioGG(4),ratioPP(4)

Real(dp) :: ratioPFd(4,3),ratioPFe(4,3),ratioPFu(4,3),ratioPHpm(4,4),ratioPVWLm(4),               & 
& ratioPVWRm(4)

Complex(dp) :: ratioPGG(4),ratioPPP(4)

Real(dp) :: gForTadpoles(144)
Complex(dp) :: tForTadpoles(2)
Real(dp) :: gBL_saveEP 
Real(dp) :: g2_saveEP 
Complex(dp) :: Y_saveEP(3,3) 
Complex(dp) :: YQ1_saveEP(3,3) 
Complex(dp) :: YQ2_saveEP(3,3) 
Complex(dp) :: Yt_saveEP(3,3) 
Complex(dp) :: YL_saveEP(3,3) 
Complex(dp) :: YR_saveEP(3,3) 
Complex(dp) :: Mux_saveEP(3,3) 
Logical :: RotateNegativeFermionMasses=.True. 
Logical,save::IgnoreNegativeMasses= .False.
Logical,save::IgnoreMuSignFlip= .False.
Logical,save::IgnoreNegativeMassesMZ= .False.
Logical,save::Write_WHIZARD= .False.
Integer,save::BoundaryCondition=1 
Logical,Save::MZ_input= .False. 
 
Real(dp) :: CS_Higgs_LHC(5,4,5) 
 
Real(dp) :: CS_PHiggs_LHC(5,4,5) 
 
Real (dp) :: MhhL(4), Mhh2L(4) 
Real (dp) :: Mhh_s(4), Mhh2_s(4) 
Real (dp) :: MAhL(4), MAh2L(4) 
Real (dp) :: MAh_s(4), MAh2_s(4) 
Real (dp) :: FineTuningResults(0) 
Real (dp) :: FineTuningResultsAllVEVs(0) 
Logical, Save :: OneLoopFT = .False. 
Logical, Save :: CalcFT = .True. 
Integer,save::YukawaScheme=1
Logical, save :: CheckSugraDetails(10) =.False. & 
                        &, SugraErrors(10) =.False. &
                        &, StrictUnification =.False. &
                        &, UseFixedScale =.False. &
                        &, UseFixedGUTScale =.False. 
Real(dp), save :: GUT_scale 
Real(dp) :: g3running 
Real(dp) :: gYaux 
Real(dp) :: gYauxMZ 
Logical, save :: InputValueforgBL =.False. 
Logical, save :: InputValueforg2 =.False. 
Logical, save :: InputValueforg3 =.False. 
Logical, save :: InputValueforLAM2 =.False. 
Logical, save :: InputValueforLAM1 =.False. 
Logical, save :: InputValueforRHO1 =.False. 
Logical, save :: InputValueforRHO2 =.False. 
Logical, save :: InputValueforALP2 =.False. 
Logical, save :: InputValueforALP1 =.False. 
Logical, save :: InputValueforALP3 =.False. 
Logical, save :: InputValueforLAM5 =.False. 
Logical, save :: InputValueforLAM6 =.False. 
Logical, save :: InputValueforLAM3 =.False. 
Logical, save :: InputValueforLAM4 =.False. 
Logical, save :: InputValueforY =.False. 
Logical, save :: InputValueforYQ1 =.False. 
Logical, save :: InputValueforYQ2 =.False. 
Logical, save :: InputValueforYt =.False. 
Logical, save :: InputValueforYL =.False. 
Logical, save :: InputValueforYR =.False. 
Logical, save :: InputValueforMux =.False. 
Logical, save :: InputValueforMU12 =.False. 
Logical, save :: InputValueforMU22 =.False. 
Logical, save :: InputValueforvR =.False. 
Real (dp) :: vSM_Q 
Real(dp), save :: RXiG = 1._dp 
Real(dp), save :: RXiP = 1._dp 
Real(dp), save :: RXiWLm = 1._dp 
Real(dp), save :: RXiWRm = 1._dp 
Real(dp), save :: RXiZ = 1._dp 
Real(dp), save :: RXiZR = 1._dp 
Real(dp) :: nuMasses(9) 
Complex(dp) :: nuMixing(9,9) 
Complex(dp) :: temporaryValue 
Real(dp) :: vRinput
Real(dp) :: lam1input
Real(dp) :: lam2input
Real(dp) :: lam3input
Real(dp) :: lam4input
Real(dp) :: lam5input
Real(dp) :: lam6input
Real(dp) :: rho1input
Real(dp) :: rho2input
Real(dp) :: alp1input
Real(dp) :: alp2input
Real(dp) :: alp3input
Real(dp) :: k1MZ 
Real(dp) :: k1SUSY 
Real(dp) :: vRMZ 
Real(dp) :: vRSUSY 
! For HiggsBounds 
Real(dp) :: BR_HpHW(4,4)  = 0._dp
Real(dp) :: BR_HpAW(4,4) = 0._dp
Real(dp) :: BR_HpTB(4) = 0._dp 
Real(dp) :: BR_HpWZ(4) = 0._dp
Real(dp) :: BR_tHb(4) = 0._dp
Real(dp) :: BR_Hcs(4)= 0._dp 
Real(dp) :: BR_Hcb(4)=0._dp 
Real(dp) :: BR_Htaunu(4)=0._dp 
Real(dp) :: BR_tWb = 0._dp
Real(dp) :: BRHll(4,3,3)  = 0._dp
Real(dp) :: BRAll(4,3,3)   = 0._dp 
 Real(dp) :: BRHHH(4,4)=0._dp
Real(dp) :: BRHAA(4,4)= 0._dp 
 Real(dp) :: BRAHH(4,4)=0._dp
Real(dp) :: BRAAA(4,4)  = 0._dp 
 Real(dp) :: BRHHHijk(4,4,4)=0._dp
Real(dp) :: BRHHAijk(4,4,4)=0._dp
Real(dp) :: BRHAAijk(4,4,4)  = 0._dp 
 Real(dp) :: BRAHHijk(4,4,4)=0._dp
Real(dp) :: BRAHAijk(4,4,4)=0._dp
Real(dp) ::  BRAAAijk(4,4,4)  = 0._dp 
 Real(dp) :: BRHHZ(4,4)=0._dp
Real(dp) :: BRHAZ(4,4)  = 0._dp 
 Real(dp) :: BRAHZ(4,4) =0._dp
Real(dp) :: BRAAZ(4,4)  = 0._dp 
 Real(dp) :: BRAHpW(4,4)=0._dp
Real(dp) :: BRHHpW(4,4)  = 0._dp 
 Real(dp) :: BRinvH(4), BRinvA(4)  = 0._dp 
Real(dp) :: rHB_P_P_Fd(4,3),rHB_P_S_Fd(4,3),rHB_S_S_Fd(4,3),rHB_S_P_Fd(4,3)
Real(dp) :: rHB_P_P_Fe(4,3),rHB_P_S_Fe(4,3),rHB_S_S_Fe(4,3),rHB_S_P_Fe(4,3)
Real(dp) :: rHB_P_P_Fu(4,3),rHB_P_S_Fu(4,3),rHB_S_S_Fu(4,3),rHB_S_P_Fu(4,3)
Real(dp) :: rHB_P_P_Fv(4,9),rHB_P_S_Fv(4,9),rHB_S_S_Fv(4,9),rHB_S_P_Fv(4,9)
Real(dp) :: rHB_P_VG(4),rHB_S_VG(4)
Real(dp) :: rHB_P_VP(4),rHB_S_VP(4)
Real(dp) :: rHB_P_VWLm(4),rHB_S_VWLm(4)
Real(dp) :: rHB_P_VZ(4),rHB_S_VZ(4)
Complex(dp) :: CPL_A_H_Z(4,4)  =0._dp 
 Complex(dp) :: CPL_H_H_Z(4,4) =0._dp 
 Complex(dp) :: CoupHPP(4), CoupHGG(4) =0._dp 
Complex(dp) :: CPL_A_A_Z(4,4) =0._dp 
 Complex(dp) :: CoupAPP(4), CoupAGG(4) =0._dp 
Real(dp) :: HPPloopVWLm(4)
Real(dp) :: HPPloopVWRm(4)
Real(dp) :: HPPloopHpm(4,4)
Real(dp) :: HPPloopFd(3,4)
Real(dp) :: HPPloopFu(3,4)
Real(dp) :: HPPloopFe(3,4)

 Real(dp) :: m32, tanbetaMZ 
Complex(dp),Dimension(3,3)::Y_l,Y_d,Y_u,Y_l_mZ,Y_d_mZ,Y_u_mZ&
&,Y_l_0,Y_d_0,Y_u_0
Real(dp),Dimension(3)::gauge,gauge_mZ,gauge_0 
Real(dp)::tanb,vevSM(2),tanb_mZ 
Contains 
 
Real(dp) Function Kronecker(t1,t2) Result(d) 
Implicit None 
Integer,Intent(in)::t1,t2 
If(t1.eq.t2) Then 
d=1. 
Else 
d=0. 
End If 
End Function Kronecker 

Real(dp) Function ThetaStep(t1,t2) Result(d) 
Implicit None 
Integer,Intent(in)::t1,t2 
If(t1.le.t2) Then 
d=1. 
Else 
d=0. 
End If 
End Function ThetaStep 

Real(dp) Function epsTensor(t1,t2,t3) Result(e)
Implicit None
Integer,Intent(in)::t1,t2,t3
If ((t1.eq.1).and.(t2.eq.2).and.(t3.eq.3)) Then
  e=1.
Else If ((t1.eq.2).and.(t2.eq.3).and.(t3.eq.1)) Then
  e=1.
Else If ((t1.eq.3).and.(t2.eq.1).and.(t3.eq.2)) Then
  e=1.
Else If ((t1.eq.3).and.(t2.eq.2).and.(t3.eq.1)) Then
  e=-1.
Else If ((t1.eq.2).and.(t2.eq.1).and.(t3.eq.3)) Then
  e=-1.
Else If ((t1.eq.1).and.(t2.eq.3).and.(t3.eq.2)) Then
  e=-1.
Else
  e=0.
End If
End Function epsTensor
Real(dp) Function gGMSB(ratio) 
Implicit None 
 Real(dp),Intent(in)::ratio 
 gGMSB=(1._dp+ratio)/ratio**2*Log(1._dp+ratio)& 
   &+(1._dp-ratio)/ratio**2*Log(1._dp-ratio) 
End Function gGMSB 
 
Real(dp) Function fGMSB(ratio) 
Implicit None 
Real(dp),Intent(in)::ratio 
If (ratio.lt.0.0001) Then 
 fGMSB = 1._dp 
Else 
 fGMSB=(1._dp+ratio)/ratio**2*(Log(1._dp+ratio)&
  & -2._dp*Li2(ratio/(1._dp+ratio))&
  & +0.5_dp*Li2(2._dp*ratio/(1._dp+ratio)))&
  & +(1._dp-ratio)/ratio**2*(Log(1._dp-ratio)&
  & -2._dp*Li2(ratio/(ratio-1._dp))&
  & +0.5_dp*Li2(2._dp*ratio/(ratio-1._dp)))
End If 
End Function fGMSB 
 
Complex(dp) Recursive Function h(a,b) 
Implicit None 
Real(dp),Intent(in)::a,b 
h=1._dp-(Log(a)*Log(b))/2._dp-&
& ((-(1._dp,-10D-12)+a+b)*(Pi2o6&
& +CLi2(-(((1._dp,-10D-12)-a+b-Sqrt((1._dp,-10.D-12)+(a-b)**2-&
& 2._dp*(a+b)))/&
& ((1._dp,-10D-12)+a-b+Sqrt((1._dp,-10D-12)+&
& (a-b)**2-2._dp*(a+b)))))&
& +CLi2(-((1._dp+a-b-Sqrt((1._dp,-10D-12)+&
& (a-b)**2-2._dp*(a+b)))/&
& ((1._dp,-10D-12)-a+b+Sqrt((1._dp,-10D-12)+&
& (a-b)**2-2._dp*(a+b)))))&
& -Log(((1._dp,-10D-12)-a+b-&
& Sqrt((1._dp,-10D-12)+(a-b)**2-2._dp*(a+b)))/&
& ((1._dp,-10D-12)+a-b-Sqrt((1._dp,-10D-12)+&
& (a-b)**2-2._dp*(a+b))))**2/4._dp&
& +Log(((1._dp,-10D-12)-a+b-&
& Sqrt((1._dp,-10D-12)+(a-b)**2-2._dp*(a+b)))/&
& ((1._dp,-10D-12)+a-b+Sqrt((1._dp,-10D-12)+&
& (a-b)**2-2._dp*(a+b))))**2/4._dp&
& +Log(((1._dp,10D-12)+a-b-&
& Sqrt((1._dp,10D-12)+(a-b)**2-2._dp*(a+b)))/&
& ((1._dp,10D-12)-a+b+Sqrt((1._dp,10D-12)+&
& (a-b)**2-2._dp*(a+b))))**2/4._dp&
& +Log(((1._dp,10D-12)-a+b+&
& Sqrt((1._dp,-10.D-12)+(a-b)**2-&
& (2._dp,10.D-12)*(a+b)))/((1._dp,-10D-12)+a-b+&
& Sqrt((1._dp,-10.D-12)+(a-b)**2-2._dp*(a+b))))**2/4._dp))/&
& Sqrt((1._dp,-10.D-12)+(a-b)**2-2._dp*(a+b))
End Function h 
 
Complex(dp) Function SQuiver(xQ,yQ) 
Implicit None 
Real(dp),Intent(in)::xQ,yQ 
SQuiver=(-8._dp*xQ**2+4._dp*xQ*yQ**2*atanh(xQ)&
 & -4._dp*(4._dp+yQ**2)*h(1._dp,yQ**2)+(-1._dp+xQ)*(-8._dp+8._dp*xQ+&
 & yQ**2)*h(1._dp,yQ**2/(1._dp-xQ))+8._dp*h(1._dp,yQ**2/(1._dp+xQ))+&
 & 16._dp*xQ*h(1._dp,yQ**2/(1._dp+xQ))+&
 & 8._dp*xQ**2*h(1._dp,yQ**2/(1._dp+xQ))-&
 & yQ**2*h(1._dp,yQ**2/(1._dp+xQ))-&
 & xQ*yQ**2*h(1._dp,yQ**2/(1._dp+xQ))&
 & +4._dp*xQ*h(1._dp/(1._dp-xQ),yQ**2/(1._dp-xQ))-&
 & 4._dp*xQ**2*h(1._dp/(1._dp-xQ),yQ**2/(1._dp-xQ))+&
 & 2._dp*yQ**2*h(1._dp/(1._dp-xQ),yQ**2/(1._dp-xQ))-&
 & 2._dp*xQ*yQ**2*h(1._dp/(1._dp-xQ),yQ**2/(1._dp-xQ))+&
 & 4._dp*xQ*h(1._dp-xQ,yQ**2)+2._dp*yQ**2*h(1._dp-xQ,yQ**2)-&
 & 4._dp*xQ*h(1._dp/(1._dp+xQ),yQ**2/(1._dp+xQ))-&
 & 4._dp*xQ**2*h(1._dp/(1._dp+xQ),yQ**2/(1._dp+xQ))+&
 & 2._dp*yQ**2*h(1._dp/(1._dp+xQ),yQ**2/(1._dp+xQ))+&
 & 2._dp*xQ*yQ**2*h(1._dp/(1._dp+xQ),yQ**2/(1._dp+xQ))-&
 & 4._dp*xQ*h(1._dp+xQ,yQ**2)+2._dp*yQ**2*h(1._dp+xQ,yQ**2)-&
 & yQ**2*h((1._dp+xQ)/(1._dp-xQ),yQ**2/(1._dp-xQ))+&
 & xQ*yQ**2*h((1._dp+xQ)/(1._dp-xQ),yQ**2/(1._dp-xQ))-&
 & yQ**2*h(-1._dp+2._dp/(1._dp+xQ),yQ**2/(1._dp+xQ))-&
 & xQ*yQ**2*h(-1._dp+2._dp/(1._dp+xQ),yQ**2/(1._dp+xQ))-&
 & 4._dp*yQ**2*h(yQ**(-2),yQ**(-2))+&
 & 2._dp*xQ*yQ**2*h((1._dp-xQ)/yQ**2,yQ**(-2))+&
 & 2._dp*yQ**2*h((1._dp-xQ)/yQ**2,(1._dp-xQ)/yQ**2)-&
 & 2._dp*xQ*yQ**2*h((1._dp-xQ)/yQ**2,(1._dp-xQ)/yQ**2)-&
 & 2._dp*xQ*yQ**2*h((1._dp+xQ)/yQ**2,yQ**(-2))+&
 & 2._dp*yQ**2*h((1._dp+xQ)/yQ**2,(1._dp+xQ)/yQ**2)+&
 & 2._dp*xQ*yQ**2*h((1._dp+xQ)/yQ**2,(1._dp+xQ)/yQ**2)-&
 & 8._dp*xQ*CLi2((1._dp,10D-12)*xQ)+&
 & 4._dp*(-1._dp+xQ)*(xQ+yQ**2)*CLi2(xQ/(-(1._dp,10D-12)+xQ))-&
 & (-1._dp+xQ)*yQ**2*CLi2((2._dp*xQ)/(-(1._dp,10D-12)+xQ))+&
 & 2._dp*xQ*CLi2((1._dp,10D-12)*xQ**2)+&
 & 4._dp*(1._dp+xQ)*(xQ-yQ**2)*CLi2(xQ/((1._dp,10D-12)+xQ))+&
 & (1._dp+xQ)*yQ**2*CLi2(((2._dp,10D-12)*xQ)/(1._dp+xQ))+&
 & 2._dp*yQ**2*Log(1._dp-xQ)+&
 & 2._dp*yQ**2*Log(1._dp+xQ))/(2._dp*xQ**2*yQ**2)
End Function SQuiver 
 
Subroutine RGE10_SMa(len,t,gy,f)
 !--------------------------------------------------------
 ! RGEs within the SM assuming the MSbar scheme
 ! 2-loop RGEs for e
 ! 4-loop RGEs for g_3
 ! 2-loop RGEs for lepton masses
 ! 4-loop QCD and 2-loop QED RGES for quark masses
 ! Assumption: the only threhold to be checked is m_b
 ! input: t = Log(Q^2)
 !        gy(i) ... i=1  -> e(Q)
 !                  i=2  -> g_3
 !                  i=3  -> m_e
 !                  i=4  -> m_mu
 !                  i=5  -> m_tau
 !                  i=6  -> m_u
 !                  i=7  -> m_c
 !                  i=8  -> m_d
 !                  i=9  -> m_s
 !                  i=10 -> m_b, is optional
 ! output:
 !   f = d(gy)/d(t)
 ! written by Werner Porod, 03.12.03
 !--------------------------------------------------------
 Implicit None

  Integer, Intent(in) :: len
  Real(dp), Intent(in) :: t, gy(len)
  Real(dp), Intent(out) :: f(len)

  Integer :: i1
  Real(dp) :: g32, g34, g36, g38, e2, e4, g32e2, q
  Real(dp), Parameter :: b_e1(2) = (/ 76._dp / 9._dp , 80._dp / 9._dp /)    &
       & , b_e2(2) = (/ 460._dp / 27._dp , 464._dp / 27._dp /)              & 
       & , b_e3(2) = (/ 160._dp / 9._dp , 176._dp / 9._dp  /)               & 
       & , b_g1(2) = (/ -25._dp / 3._dp, -23._dp/3._dp /)                   &
       & , b_g2(2) = (/ -154._dp / 3._dp, -116._dp/3._dp /)                 &
       & , b_g3(2) = (/ 20._dp / 3._dp, 22._dp/3._dp /)                     &
       & , b_g4(2) = (/ -21943._dp/54._dp, 9769._dp/54._dp /)               &
       & , b_g5(2) = (/ -4918247._dp/1458._dp-414140._dp*zeta3/81._dp       &
       &             , 598391._dp/1458._dp - 352864._dp*zeta3/81._dp /)     &
       & , g_el1(2) = (/ -6._dp, -6._dp /)                                  &
       & , g_el2(2) = (/ 353._dp / 9._dp,  373._dp / 9._dp /)               & 
       & , g_eu1(2) = (/ -8._dp/3._dp, -8._dp/3._dp /)                      &
       & , g_eu2(2) = (/ 1472._dp / 81._dp, 1552._dp / 81._dp/)             & 
       & , g_eu3(2) = (/ -32._dp / 9._dp,  -32._dp / 9._dp/)                & 
       & , g_ed1(2) = (/ -2._dp/3._dp, -2._dp/3._dp /)                      &
       & , g_ed2(2) = (/ 377._dp / 81._dp,  397._dp / 81._dp /)             & 
       & , g_ed3(2) = (/ -8._dp / 9._dp,  -8._dp / 9._dp /)                 & 
       & , g_q1(2) = (/ - 8._dp , -8._dp /)                                 &
       & , g_q2(2) = (/ -1052._dp / 9._dp ,  -1012._dp / 9._dp /)           &
       & , g_q3(2) = (/ -144674._dp/81._dp + 1280._dp * zeta3 / 3._dp       &
       &              , -128858._dp/81._dp + 1600._dp * zeta3 / 3._dp /)    &
       & , g_q4(2) = (/ -7330357._dp/243._dp + 51584._dp* zeta3/3._dp       &
       &                - 16000._dp*zeta4 / 3._dp + 11200._dp* zeta5 /9._dp &
       &             , -1911065._dp/81._dp + 618400._dp* zeta3/27._dp       &
       &                - 18400._dp*zeta4 / 3._dp - 25600._dp* zeta5 /9._dp  /)

       
  Iname = Iname + 1
  NameOfUnit(Iname) = 'RGE10_SMa'

  q = t

  If (len.Eq.9) Then ! check which beta function (anomalous dimension) to use
   i1 = 1
  Else If (len.Eq.10) Then
   i1 = 2
  Else
   Write(ErrCan,*) "Error in routine "//Trim(NameOfUnit(Iname))
   Write(ErrCan,*) "Length of the vector gy = ",len
   Call TerminateProgram
  End If

  g32 = gy(1)**2
  g34 = gy(1)**4
  g36 = gy(1)**6
  g38 = gy(1)**8
  e2 = gy(2)**2
  e4 = gy(2)**4
  g32e2 = g32 * e2 
 !--------
 ! g_3
 !--------
  f(1) = oo16pi2 * gy(1) * ( b_g1(i1)*g32                                     &
       &                   + oo16pi2 * ( b_g2(i1)*g34 + b_g3(i1)*g32e2        &
       &                               + oo16pi2 * ( b_g4(i1)*g36             &
       &                                           + oo16pi2 * b_g5(i1)*g38 )))
 !--------
 ! e
 !--------
  f(2) = oo16pi2 * gy(2) * ( b_e1(i1) * e2                                &
       &                   + oo16pi2 * (b_e2(i1) * e4 + b_e3(i1) * g32e2 ))
 !-----------------
 ! m_l, l=e,mu,tau
 !-----------------
  f(3:5) =  oo16pi2 * gy(3:5) * (g_el1(i1) * e2 + oo16pi2 *g_el2(i1) * e4)
 !---------
 ! m_u, m_c
 !---------
  f(6:7) = oo16pi2 * gy(6:7) * (g_eu1(i1) * e2 + g_q1(i1) * g32              &
         &                     + oo16pi2 * (g_eu2(i1)*e4 + g_eu3(i1) * g32e2 &
         &                                 + g_q2(i1) * g34                  &
         &                                 + oo16pi2 * (g_q3(i1) * g36       &
         &                                       + oo16pi2 * g_q4(i1) * g38 )))
 !---------------
 ! m_d, m_s, m_b
 !---------------
  f(8:len) = oo16pi2 * gy(8:len) * (g_ed1(i1) * e2 + g_q1(i1) * g32          &
         &                     + oo16pi2 * (g_ed2(i1)*e4 + g_ed3(i1) * g32e2 &
         &                                 + g_q2(i1) * g34                  &
         &                                 + oo16pi2 * (g_q3(i1) * g36       &
         &                                       + oo16pi2 * g_q4(i1) * g38 )))

  Iname = Iname - 1

 End Subroutine RGE10_SMa

Subroutine RGE11_SMa(len,t,gy,f)
  Implicit None
  Integer, Intent(in) :: len
  Real(dp), Intent(in) :: t, gy(len)
  Real(dp), Intent(out) :: f(len)

  Real(dp) :: g3, e, md, mu, ms, mc, mt, mb, ml, mmu, mtau
  Real(dp) :: g32, g34, g36, g38, e2, e4, g32e2
  Real(dp) :: nQuark
  Real(dp) :: gamma1, gamma3, gamma13, gamma11,  gamma33, gamma333

  nQuark = nUp + nDown

  g3  = gy(2)
  g32 = gy(2)**2
  g34 = gy(2)**4
  g36 = gy(2)**6
  g38 = gy(2)**8
  e  = gy(1)
  e2 = gy(1)**2
  e4 = gy(1)**4
  g32e2 = g32 * e2 


  ! g3
  f(2) = g3*((2._dp/3._dp*nQuark - 11._dp)*g32 + (38._dp/3._dp*nQuark - 102)*g34*oo16pi2 + &
         & (8._dp/9._dp*nUp + 2._dp/9._dp*nDown)*oo16pi2*g32e2 + &
         & (5033._dp/18._dp*nQuark - 325._dp/54._dp*nQuark**2 - 2857._dp/2._dp)*g36*oo16pi2*oo16pi2)

  ! e
  f(1) = e*((16._dp/9._dp*nUp+4._dp/9._dp*nDown+4._dp/3._dp*nLep)*e2 + &
          & (64._dp/27._dp*nUp + 4._dp/27._dp*nDown + 4._dp*nLep)*e4*oo16pi2 + &
          & (64._dp/9._dp*nUp + 16._dp/9._dp*nDown)*g32e2*oo16pi2*oo16pi2)

  gamma1 = -6._dp
  gamma11 = -3._dp + (80._dp/9._dp*nUp + 20._dp/9._dp*nDown + 20._dp/3._dp*nLep)

  ! m_e, m_mu, m_tau
  f(3:5) = gy(3:5)*(gamma1*e2 + oo16pi2*gamma11*e4)

  gamma1 = -6._dp*(2._dp/3._dp)
  gamma3 = -8._dp
  gamma11 = -3._dp*(2._dp/3._dp)**4 + (80._dp/9._dp*nUp + 20._dp/9._dp*nDown + 20._dp/3._dp*nLep)*(2._dp/3._dp)**2
  gamma13 = -4._dp*(2._dp/3._dp)**2
  gamma33 = -404._dp/3._dp + 40._dp/9._dp*nQuark
  gamma333 = 2._dp/3._dp*(140._dp/27._dp*nQuark**2 + (160._dp*Zeta3 + 2216._dp/9._dp)*nQuark - 3747._dp)  

  ! m_u, m_c, m_t
  f(6:8) = gy(6:8)*(gamma1*e2 +  gamma3*g32 +  &
           & oo16pi2*(gamma11*e4 + gamma33*g34 + 2._dp*gamma13*g32e2) + &
           & gamma333*g36*oo16pi2*oo16pi2)


  ! m_d, m_s, m_b
  gamma1 = -6._dp*(-1._dp/3._dp)
  gamma3 = -8._dp
  gamma11 = -3._dp*(1._dp/3._dp)**4 + (80._dp/9._dp*nUp + 20._dp/9._dp*nDown + 20._dp/3._dp*nLep)*(1._dp/3._dp)**2
  gamma13 = -4._dp*(1._dp/3._dp)**2
  gamma33 = -404._dp/3._dp + 40._dp/9._dp*nQuark
  gamma333 = 2._dp/3._dp*(140._dp/27._dp*nQuark**2 + (160._dp*Zeta3 + 2216._dp/9._dp)*nQuark - 3747._dp)  

  f(9:11) = gy(9:11)*(gamma1*e2 +  gamma3*g32 +  &
           & oo16pi2*(gamma11*e4 + gamma33*g34 + 2._dp*gamma13*g32e2) + &
           & gamma333*g36*oo16pi2*oo16pi2)

  If (nUp.lt.2.9_dp)  f(8) = 0._dp
  If (nDown.lt.2.9_dp)  f(12) = 0._dp

  f = oo16pi2*f


End Subroutine RGE11_SMa

Subroutine RGE11(len,t,gy,f)
  Implicit None
  Integer, Intent(in) :: len
  Real(dp), Intent(in) :: t, gy(len)
  Real(dp), Intent(out) :: f(len)

  Real(dp) :: g3, e, md, mu, ms, mc, mt, mb, ml, mmu, mtau
  Real(dp) :: g32, g34, g36, g38, e2, e4, g32e2
  Real(dp) :: nQuark, a1, a2, a3, nG
  Real(dp) :: gamma1, gamma3, gamma13, gamma11,  gamma33, gamma333

  nQuark = nUp + nDown

  g3  = gy(2)
  g32 = gy(2)**2
  g34 = gy(2)**4
  g36 = gy(2)**6
  g38 = gy(2)**8
  e  = gy(1)
  e2 = gy(1)**2
  e4 = gy(1)**4
  g32e2 = g32 * e2 

  nG = 3._dp
  a1 = gy(12)
  a2 = gy(13)
  a3 = gy(14)


  ! g3
  f(2) = g3*((2._dp/3._dp*nQuark - 11._dp)*g32 + (38._dp/3._dp*nQuark - 102)*g34*oo16pi2 + &
         & (8._dp/9._dp*nUp + 2._dp/9._dp*nDown)*oo16pi2*g32e2 + &
         & (5033._dp/18._dp*nQuark - 325._dp/54._dp*nQuark**2 - 2857._dp/2._dp)*g36*oo16pi2*oo16pi2)

  ! e
  f(1) = e*((16._dp/9._dp*nUp+4._dp/9._dp*nDown+4._dp/3._dp*nLep)*e2 + &
          & (64._dp/27._dp*nUp + 4._dp/27._dp*nDown + 4._dp*nLep)*e4*oo16pi2 + &
          & (64._dp/9._dp*nUp + 16._dp/9._dp*nDown)*g32e2*oo16pi2*oo16pi2)

  gamma1 = -6._dp
  gamma11 = -3._dp + (80._dp/9._dp*nUp + 20._dp/9._dp*nDown + 20._dp/3._dp*nLep)

  ! m_e, m_mu, m_tau
  f(3:5) = gy(3:5)*(gamma1*e2 + oo16pi2*gamma11*e4)

  gamma1 = -6._dp*(2._dp/3._dp)
  gamma3 = -8._dp
  gamma11 = -3._dp*(2._dp/3._dp)**4 + (80._dp/9._dp*nUp + 20._dp/9._dp*nDown + 20._dp/3._dp*nLep)*(2._dp/3._dp)**2
  gamma13 = -4._dp*(2._dp/3._dp)**2
  gamma33 = -404._dp/3._dp + 40._dp/9._dp*nQuark
  gamma333 = 2._dp/3._dp*(140._dp/27._dp*nQuark**2 + (160._dp*Zeta3 + 2216._dp/9._dp)*nQuark - 3747._dp)  

  ! m_u, m_c, m_t
  f(6:8) = gy(6:8)*(gamma1*e2 +  gamma3*g32 +  &
           & oo16pi2*(gamma11*e4 + gamma33*g34 + 2._dp*gamma13*g32e2) + &
           & gamma333*g36*oo16pi2*oo16pi2)


  ! m_d, m_s, m_b
  gamma1 = -6._dp*(-1._dp/3._dp)
  gamma3 = -8._dp
  gamma11 = -3._dp*(1._dp/3._dp)**4 + (80._dp/9._dp*nUp + 20._dp/9._dp*nDown + 20._dp/3._dp*nLep)*(1._dp/3._dp)**2
  gamma13 = -4._dp*(1._dp/3._dp)**2
  gamma33 = -404._dp/3._dp + 40._dp/9._dp*nQuark
  gamma333 = 2._dp/3._dp*(140._dp/27._dp*nQuark**2 + (160._dp*Zeta3 + 2216._dp/9._dp)*nQuark - 3747._dp)  

  f(9:11) = gy(9:11)*(gamma1*e2 +  gamma3*g32 +  &
           & oo16pi2*(gamma11*e4 + gamma33*g34 + 2._dp*gamma13*g32e2) + &
           & gamma333*g36*oo16pi2*oo16pi2)



!! running of alpha_i to calculate running sin(w2); equations by Steinhauser
  ! alpha_1
  f(12) = a1**2*(2._dp/5._dp + nG*16._dp/3._dp) + &
    & a1**2*oo4pi2*(18._dp/25._dp*a1 + 18._dp/5._dp*a2 + nG*(76._dp/15._dp*a1 + 12._dp/5._dp*a2 + 176._dp/15._dp*a3))

  ! alpha_2
  f(13) = a2**2*(-86._dp/3._dp + nG*16._dp/3._dp) + &
   & a2**2*oo4pi2*(6._dp/5._dp*a1 - 518._dp/3._dp*a2 + nG*(4._dp/3._dp + 196._dp/3._dp*a2 + 16._dp*a3))

  ! alpha_3
  f(14) = a3**2*(-44._dp + nG*16._dp/3._dp) + &
    & a3**2*oo4pi2*(-408._dp*a3 + nG*(22._dp/15._dp*a1 + 6._dp*a2 + 304._dp/3._dp*a3))

  f = oo16pi2*f


End Subroutine RGE11


Subroutine RGEAlphaS(len,t,gy,f)
  Implicit None
  Integer, Intent(in) :: len
  Real(dp), Intent(in) :: t, gy(len)
  Real(dp), Intent(out) :: f(len)

  Real(dp) :: g3, e, md, mu, ms, mc, mt, mb, ml, mmu, mtau
  Real(dp) :: g32, g34, g36, g38, e2, e4, g32e2
  Real(dp) :: nQuark
  Real(dp) :: gamma1, gamma3, gamma13, gamma11,  gamma33, gamma333

  nQuark = nUp + nDown

  g3  = gy(2)
  g32 = gy(2)**2
  g34 = gy(2)**4
  g36 = gy(2)**6
  g38 = gy(2)**8
  e  = gy(1)
  e2 = gy(1)**2
  e4 = gy(1)**4
  g32e2 = g32 * e2 


  ! g3
  f(2) = g3*((2._dp/3._dp*nQuark - 11._dp)*g32 + (38._dp/3._dp*nQuark - 102)*g34*oo16pi2 + &
         & (8._dp/9._dp*nUp + 2._dp/9._dp*nDown)*oo16pi2*g32e2 + &
         & (5033._dp/18._dp*nQuark - 325._dp/54._dp*nQuark**2 - 2857._dp/2._dp)*g36*oo16pi2*oo16pi2)

  ! e
  f(1) = e*((16._dp/9._dp*nUp+4._dp/9._dp*nDown+4._dp/3._dp*nLep)*e2 + &
          & (64._dp/27._dp*nUp + 4._dp/27._dp*nDown + 4._dp*nLep)*e4*oo16pi2 + &
          & (64._dp/9._dp*nUp + 16._dp/9._dp*nDown)*g32e2*oo16pi2*oo16pi2)


  f = oo16pi2*f


End Subroutine RGEAlphaS

Subroutine RGETop(len,t,gy,f)
  Implicit None
  Integer, Intent(in) :: len
  Real(dp), Intent(in) :: t, gy(len)
  Real(dp), Intent(out) :: f(len)

  Real(dp) :: g3, e, md, mu, ms, mc, mt, mb, ml, mmu, mtau
  Real(dp) :: g32, g34, g36, g38, e2, e4, g32e2
  Real(dp) :: nQuark
  Real(dp) :: gamma1, gamma3, gamma13, gamma11,  gamma33, gamma333

  nQuark = nUp + nDown

  g3  = gy(2)
  g32 = gy(2)**2
  g34 = gy(2)**4
  g36 = gy(2)**6
  g38 = gy(2)**8
  e  = gy(1)
  e2 = gy(1)**2
  e4 = gy(1)**4
  g32e2 = g32 * e2 


  ! g3
  f(2) = g3*((2._dp/3._dp*nQuark - 11._dp)*g32 + (38._dp/3._dp*nQuark - 102)*g34*oo16pi2 + &
         & (8._dp/9._dp*nUp + 2._dp/9._dp*nDown)*oo16pi2*g32e2 + &
         & (5033._dp/18._dp*nQuark - 325._dp/54._dp*nQuark**2 - 2857._dp/2._dp)*g36*oo16pi2*oo16pi2)

  ! e
  f(1) = e*((16._dp/9._dp*nUp+4._dp/9._dp*nDown+4._dp/3._dp*nLep)*e2 + &
          & (64._dp/27._dp*nUp + 4._dp/27._dp*nDown + 4._dp*nLep)*e4*oo16pi2 + &
          & (64._dp/9._dp*nUp + 16._dp/9._dp*nDown)*g32e2*oo16pi2*oo16pi2)


  gamma1 = -6._dp*(2._dp/3._dp)
  gamma3 = -8._dp
  gamma11 = -3._dp*(2._dp/3._dp)**4 + (80._dp/9._dp*nUp + 20._dp/9._dp*nDown + 20._dp/3._dp*nLep)*(2._dp/3._dp)**2
  gamma13 = -4._dp*(2._dp/3._dp)**2
  gamma33 = -404._dp/3._dp + 40._dp/9._dp*nQuark
  gamma333 = 2._dp/3._dp*(140._dp/27._dp*nQuark**2 + (160._dp*Zeta3 + 2216._dp/9._dp)*nQuark - 3747._dp)  

  ! m_u, m_c, m_t
  f(3) = gy(3)*(gamma1*e2 +  gamma3*g32 +  &
           & oo16pi2*(gamma11*e4 + gamma33*g34 + 2._dp*gamma13*g32e2) + &
           & gamma333*g36*oo16pi2*oo16pi2)


  f = oo16pi2*f


End Subroutine RGETop
Subroutine SetGUTScale(scale)
Implicit None
Real(dp),Intent(in)::scale
If (scale.Lt.0._dp) Then
UseFixedGUTScale= .False.
Else
UseFixedGUTScale= .True.
GUT_scale=scale
End If
End Subroutine SetGUTScale
 

Subroutine SetRGEScale(scale)
Implicit None
Real(dp),Intent(in)::scale
Real(dp)::old_scale
If (scale.Lt.0._dp) Then
UseFixedScale= .False.
Else
UseFixedScale= .True.
old_scale=SetRenormalizationScale(scale)
End If
End Subroutine SetRGEScale


Logical Function SetStrictUnification(V1)
Implicit None
Logical,Intent(in)::V1
SetStrictUnification= .False.
StrictUnification=V1
SetStrictUnification= .True.
End Function SetStrictUnification


Integer Function SetYukawaScheme(V1)
Implicit None
Integer,Intent(in)::V1
SetYukawaScheme=YukawaScheme
YukawaScheme=V1
End Function SetYukawaScheme


Subroutine Set_All_Parameters_0() 
Implicit None 
Y_l= 0._dp 
Y_d= 0._dp 
Y_u= 0._dp 
Y_l_mZ= 0._dp 
Y_d_mZ= 0._dp 
Y_u_mZ= 0._dp 
Y_l_0= 0._dp 
Y_d_0= 0._dp 
Y_u_0= 0._dp 
gauge= 0._dp 
gauge_mZ= 0._dp 
gauge_0 = 0._dp 
tanb= 0._dp 
vevSM= 0._dp 
tanb_mZ = 0._dp 
GUT_scale = 0._dp 
HPPloopVWLm = 0._dp 
HPPloopVWRm = 0._dp 
HPPloopHpm = 0._dp 
HPPloopFd = 0._dp 
HPPloopFu = 0._dp 
HPPloopFe = 0._dp 
gBLIN = 0._dp 
g2IN = 0._dp 
g3IN = 0._dp 
LAM2IN = 0._dp 
LAM1IN = 0._dp 
RHO1IN = 0._dp 
RHO2IN = 0._dp 
ALP2IN = 0._dp 
ALP1IN = 0._dp 
ALP3IN = 0._dp 
LAM5IN = 0._dp 
LAM6IN = 0._dp 
LAM3IN = 0._dp 
LAM4IN = 0._dp 
YIN = 0._dp 
YQ1IN = 0._dp 
YQ2IN = 0._dp 
YtIN = 0._dp 
YLIN = 0._dp 
YRIN = 0._dp 
MuxIN = 0._dp 
MU12IN = 0._dp 
MU22IN = 0._dp 
gBL = 0._dp 
gBLMZ = 0._dp 
g2 = 0._dp 
g2MZ = 0._dp 
g3 = 0._dp 
g3MZ = 0._dp 
LAM2 = 0._dp 
LAM2MZ = 0._dp 
LAM1 = 0._dp 
LAM1MZ = 0._dp 
RHO1 = 0._dp 
RHO1MZ = 0._dp 
RHO2 = 0._dp 
RHO2MZ = 0._dp 
ALP2 = 0._dp 
ALP2MZ = 0._dp 
ALP1 = 0._dp 
ALP1MZ = 0._dp 
ALP3 = 0._dp 
ALP3MZ = 0._dp 
LAM5 = 0._dp 
LAM5MZ = 0._dp 
LAM6 = 0._dp 
LAM6MZ = 0._dp 
LAM3 = 0._dp 
LAM3MZ = 0._dp 
LAM4 = 0._dp 
LAM4MZ = 0._dp 
Y = 0._dp 
YMZ = 0._dp 
YQ1 = 0._dp 
YQ1MZ = 0._dp 
YQ2 = 0._dp 
YQ2MZ = 0._dp 
Yt = 0._dp 
YtMZ = 0._dp 
YL = 0._dp 
YLMZ = 0._dp 
YR = 0._dp 
YRMZ = 0._dp 
Mux = 0._dp 
MuxMZ = 0._dp 
MU12 = 0._dp 
MU12MZ = 0._dp 
MU22 = 0._dp 
MU22MZ = 0._dp 
k1IN = 0._dp 
vRIN = 0._dp 
MAh = 0._dp 
MAh2 = 0._dp 
MFd = 0._dp 
MFd2 = 0._dp 
MFe = 0._dp 
MFe2 = 0._dp 
MFu = 0._dp 
MFu2 = 0._dp 
MFv = 0._dp 
MFv2 = 0._dp 
Mhh = 0._dp 
Mhh2 = 0._dp 
MHpm = 0._dp 
MHpm2 = 0._dp 
MVWLm = 0._dp 
MVWLm2 = 0._dp 
MVWRm = 0._dp 
MVWRm2 = 0._dp 
MVZ = 0._dp 
MVZ2 = 0._dp 
MVZR = 0._dp 
MVZR2 = 0._dp 
PhiW = 0._dp 
TW = 0._dp 
UC = 0._dp 
ZDR = 0._dp 
ZER = 0._dp 
UP = 0._dp 
ZUR = 0._dp 
ZDL = 0._dp 
ZEL = 0._dp 
ZUL = 0._dp 
ZH = 0._dp 
ZM = 0._dp 
ZW = 0._dp 
ZZ = 0._dp 
k1 = 0._dp 
vR = 0._dp 
gPFu = 0._dp 
gTFu = 0._dp 
BRFu = 0._dp 
gPFe = 0._dp 
gTFe = 0._dp 
BRFe = 0._dp 
gPFd = 0._dp 
gTFd = 0._dp 
BRFd = 0._dp 
gPhh = 0._dp 
gThh = 0._dp 
BRhh = 0._dp 
gPFv = 0._dp 
gTFv = 0._dp 
BRFv = 0._dp 
gPVZ = 0._dp 
gTVZ = 0._dp 
BRVZ = 0._dp 
gPVZR = 0._dp 
gTVZR = 0._dp 
BRVZR = 0._dp 
gPHpm = 0._dp 
gTHpm = 0._dp 
BRHpm = 0._dp 
gPAh = 0._dp 
gTAh = 0._dp 
BRAh = 0._dp 
gPVWLm = 0._dp 
gTVWLm = 0._dp 
BRVWLm = 0._dp 
gPVWRm = 0._dp 
gTVWRm = 0._dp 
BRVWRm = 0._dp 
ratioFd =  0._dp  
ratioFe =  0._dp  
ratioFu =  0._dp  
ratioHpm =  0._dp  
ratioVWLm =  0._dp  
ratioVWRm =  0._dp  
ratioGG =  0._dp  
ratioPP =  0._dp  
ratioPFd =  0._dp  
ratioPFe =  0._dp  
ratioPFu =  0._dp  
ratioPHpm =  0._dp  
ratioPVWLm =  0._dp  
ratioPVWRm =  0._dp  
ratioPGG =  0._dp  
ratioPPP =  0._dp  
vRinput= 0._dp 
lam1input= 0._dp 
lam2input= 0._dp 
lam3input= 0._dp 
lam4input= 0._dp 
lam5input= 0._dp 
lam6input= 0._dp 
rho1input= 0._dp 
rho2input= 0._dp 
alp1input= 0._dp 
alp2input= 0._dp 
alp3input= 0._dp 
End Subroutine Set_All_Parameters_0 
 


Subroutine SetMatchingConditions(g1SM,g2SM,g3SM,YuSM,YdSM,YeSM,vSM,k1,vR,             & 
& gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,Y,YQ1,YQ2,            & 
& Yt,YL,YR,Mux,MU12,MU22,MZsuffix)

Real(dp),Intent(inout) :: gBL,g2,g3,LAM2,LAM1,RHO1,RHO2,ALP2,ALP1,ALP3,LAM5,LAM6,LAM3,LAM4,MU12,MU22

Complex(dp),Intent(inout) :: Y(3,3),YQ1(3,3),YQ2(3,3),Yt(3,3),YL(3,3),YR(3,3),Mux(3,3)

Real(dp),Intent(inout) :: k1,vR

Logical,Intent(in)::MZsuffix 
Real(dp), Intent(in) :: g1SM, g2SM, g3SM, vSM 
Complex(dp),Intent(in) :: YuSM(3,3),YdSM(3,3),YeSM(3,3) 
If (MZsuffix) Then 
  g2MZ = g2SM 
  g3MZ = g3SM 
  gBLMZ = el/Sqrt(Cos(2._dp*(TW))) 
  k1MZ = vSM 
  YtMZ = YeSM 
  YQ2MZ = YdSM 
  YQ1MZ = YuSM 
Else 
  g2 = g2SM 
  g3 = g3SM 
  gBL = el/Sqrt(Cos(2._dp*(TW))) 
  k1 = vSM 
  Yt = YeSM 
  YQ2 = YdSM 
  YQ1 = YuSM 
End if 
End Subroutine SetMatchingConditions 
End Module Model_Data_DLRSM