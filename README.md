# Bayesian Active Search on Parameter Space: a 95 GeV Spin-0 Resonance in the (B−L)SSM

Code repository for https://arxiv.org/abs/2404.18653.

## Overview
In the attempt to explain possible data anomalies from collider experiments in terms of New Physics (NP) models, computationally expensive scans over their parameter spaces are typically required in order to match theoretical predictions to experimental observations. Assuming the anomalies observed at around 95 GeV by the Large Electron-Positron (LEP) and Large Hadron Collider (LHC) experiments signify an NP signal, we interpret it as a spin-0 resonance within the $(B-L)$ Supersymmetric Standard Model ($(B-L)$SSM). We introduce a novel Machine Learning (ML) approach, named b-CASTOR, to efficiently scan the parameter space. This method leverages Gaussian Processes surrogate to approximate multiple objectives constrained by experimental measurements and employs a volume-based acquisition function to ensure a comprehensive characterisation of the satisfactory region in the parameter space. Our method outperforms traditional competing algorithms, such as those based on Markov-Chain Monte Carlo (MCMC) methods, offering a more effective strategy for exploring parameter spaces in computationally expensive BSM scenarios.

## Requirements
The [`hep-aid`](https://github.com/mjadiaz/hep-aid) library is required. To install it, clone the `hep-aid` repository and run `pip install -e .`.

To run the experiments from the paper, the following HEP tools need to be installed: [SPheno](https://spheno.hepforge.org/), [MadGraph](https://launchpad.net/mg5amcnlo), [HiggsBounds](https://higgsbounds.hepforge.org/), and HiggsSignals.

If the HEP tools are not already installed, run the Python script `install_hepstack.py`, located in `experiments_paper/blssm/hepstack`. The code will install all necesary HEP Software using the SPheno and UFO files can be found in the `BLSSM_SPheno` and `BLSSM_UFO` folders, also located in `experiments_paper/blssm/hepstack`. 

Lastly modify the configuration file located `experiments_paper/blssm/configs/hep_stack_config.yaml` with this format:
```yml
model: 'BLSSM'
reference_slha: 'configs/hep_files/diphoton_paper_v2'        
directory: '/path/to/spheno_directory/'

higgsbounds:
    neutral_higgs: 6
    charged_higgs: 1
    directory: '/path/to/higgsbounds_directory/build'

higgssignals:
    neutral_higgs: 6
    charged_higgs: 1
    directory: '/path/to/higgssignals_directory/build'

madgraph:
    directory: '/path/to/madgraph_directory/'
    scripts: 
        gghaa: "configs/hep_files/mg5/blssm_pphaa_LHC13.txt"
hep_stack: 
    name: 'SPhenoHBHSMG5'
    scan_dir: '/path/to/scan_directory/'
    final_dataset: 'datasets'
    delete_on_exit: True
```
In this case we are using some relative paths to the `experiments_paper/blssm` directory. A manual for the [`hep-aid`](https://github.com/mjadiaz/hep-aid)  library is currently under development. 

#### Manual installation of HEP Software
The SPheno and UFO filese files can also be generated using [SARAH](https://sarah.hepforge.org/) by running it in a Mathematica notebook.

```mathematica
Needs["SARAH`","/SARAH-4.14.5/SARAH.m"]

Start["B-L-SSM"]
ModelOutput[EWSB]

MakeSPheno[]
MakeUFO[]

Quit[];
```

SPheno is set up following section 6.1.2 in [[1](https://arxiv.org/pdf/1503.04200.pdf)]. After downloading SPheno, copy the ouput of SARAH as follows,
```
mkdir $SPHENO_PATH/BLSSM/
cp $SARAH_PATH/SARAH/Output/B-L-SSM/EWSB/SPheno/* BLSSM/
```
and run 
```
make Model=BLSSM
```
an executable SPhenoBLSSM will be created which will be used by the script in this package.
[HiggsBounds](https://gitlab.com/higgsbounds/higgsbounds)and [HiggsSignals](https://gitlab.com/higgsbounds/higgssignals), which are part of [HiggsTools](https://gitlab.com/higgsbounds/higgstools) now, should installed. This code uses only HB and HS.
Finally [MadGraph](https://launchpad.net/mg5amcnlo) with the UFO model file copied in the models directory.



## Results
The main Python script for both case studies is located in `run_search.py` located in `experiments_paper/test_function/` and `experiments_paper/blssm/`. It defines a hyper-parameter sweep function that updates the configuration for the b-CASTOR algorithm based on a specified combination of the priority parameter $\alpha$, TPE trials $N_{TPE}$, and resolution $r$ as defined in the paper. The function can perform either a `sweep` for constant resolution or `sweep_decay` for decaying resolution. Each combination is accessed using the `--n` argument in the script for easier replication.

### 2D Double Objective Test Function
The working directory for the test funcion study is located in `experiments_paper/test_function`. Configuration files are in `experiments_paper/test_function/configs`. 

For the b-CASTOR algorithm run, 
```python
python run_search.py --method bcastor --n 8 --mode sweep_decay --config configs/bcastor_hyper_params.yaml --channels himboo
```
For the MCMC search,
```python
python run_search.py --method mcmc --config configs/mcmc.yaml --channels himboo
```

### $(B - L)SSM$ for a 95 GeV Higgs
The working directory for the B-L SSM model study case is located in `experiments_paper/blssm`. Configuration files are in `experiments_paper/blssm/configs/hep_files`, with the SPheno reference LHE file at `configs/hep_files/diphoton_paper_v2` and the Madgraph script files for calculating cross-sections of each channel located in  `experiments_paper/blssm/configs/hep_files/mg5`.

Modify the corresponding hyper-parameter configuration for `bcastor` in `experiments_paper/blssm/configs/bcastor*`, specifically for local runs depending on the number of cores of your machine. These scripts were run on a node of the Iridis5 cluster, which has 40 cores per node.

#### b-CASTOR

For the $\gamma\gamma$ case run, 
```python
python run_search.py --method bcastor --n 19 --mode sweep_decay --config configs/aa_obj_hep.yml --channels aa
```
For the search in $\gamma\gamma$ and $bb$,
```python
python run_search.py --method bcastor --n 19  --mode sweep_decay --config configs/aa_bb_obj_hep.yml --channels aabb
```
Finally, for the search in the three channels $\gamma\gamma$,$bb$ and $\tau\tau$,
```python
python run_search.py --method bcastor --n 19  --mode sweep_decay --config configs/aa_bb_tautau_obj_hep.yml --channels all
```
#### MCMC Metropolis Hastings

For the $\gamma\gamma$ case run, 
```python
python run_search.py --method mcmc  --config configs/aa_obj_hep.yml --channels aa
```
For the search in $\gamma\gamma$ and $bb$,
```python
python run_search.py --method mcmc --config configs/aa_bb_obj_hep.yml --channels aabb
```
Finally, for the search in the three channels $\gamma\gamma$,$bb$ and $\tau\tau$,
```python
python run_search.py --method mcmc  --config configs/aa_bb_tautau_obj_hep.yml --channels all
```
