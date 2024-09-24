from hepaid.hep.install import install_hepstack

install_hepstack(
    spheno_url="https://spheno.hepforge.org/downloads?f=SPheno-4.0.4.tar.gz", 
    spheno_compiler='gfortran',
    spheno_on_mac =False,
    spheno_model_dir="BLSSM_SPheno",
    spheno_model_name="BLSSM",
    higgsbounds_url='https://gitlab.com/higgsbounds/higgsbounds/-/archive/master/higgsbounds-master.tar.gz',
    higgssignals_url='https://gitlab.com/higgsbounds/higgssignals/-/archive/master/higgssignals-master.tar.gz',
    madgraph_url = "https://launchpad.net/mg5amcnlo/3.0/3.5.x/+download/MG5_aMC_v3.5.5.tar.gz",
    madgraph_model_dir = 'BLSSM_UFO',
    madgraph_model_name = 'BLSSM'
)
