import numpy as np
from hepaid.hep.utils import resolve_key_chain
from hepaid.hep.utils import check_valid_sample_dict  
from hepaid.hep.utils import create_simple_dict  


from sm.standard_model import SM


import os

sm = SM('sm/sm_mg5_full_processes_lep_200.json.gz')

def mu_aa_spheno(sample_dict):
    if check_valid_sample_dict(sample_dict):
        cgg = resolve_key_chain(
            sample_dict,
            ['SLHA','HIGGSCOUPLINGSBOSONS','entries','3,25,21,21', 'value']
            )
        bsm_mh1 = resolve_key_chain(
            sample_dict,
            ['SLHA','MASS','entries','25', 'value']
        )
        bsm_br_h1_aa = resolve_key_chain(
            sample_dict,
            ['SLHA','DECAY 25','entries','2,22,22', 'value']
            )
        mu_aa = (cgg*bsm_br_h1_aa)/sm.pred_br_h_aa(bsm_mh1)
    else:
        mu_aa = None

    return mu_aa

def mu_aa_mg5(sample_dict):
    if not check_valid_sample_dict(sample_dict):
        return None
    bsm_mh1 = resolve_key_chain(
        sample_dict,
        ['SLHA','MASS','entries','25', 'value']
    )
    bsm_gghaa = resolve_key_chain(
        sample_dict,
        ['MG5', 'gghaa', 'cross_section_pb']
        )
    if not all([bsm_mh1, bsm_gghaa]):
        return None

    mu_aa = bsm_gghaa/sm.pred_cs_gg_h_aa(bsm_mh1)

    return mu_aa

def mu_tautau_mg5(sample_dict):
    if check_valid_sample_dict(sample_dict):
        bsm_mh1 = resolve_key_chain(
            sample_dict,
            ['SLHA','MASS','entries','25', 'value']
        )
        bsm_gghtautau = resolve_key_chain(
            sample_dict,
            ['MG5', 'gghtautau', 'cross_section_pb']
            )
        mu_tautau = bsm_gghtautau/sm.pred_cs_gg_h_tautau(bsm_mh1)
    else:
        mu_tautau = None
    return mu_tautau

def mu_bb_mg5(sample_dict):
    if check_valid_sample_dict(sample_dict):
        bsm_mh1 = resolve_key_chain(
            sample_dict,
            ['SLHA','MASS','entries','25', 'value']
        )
        bsm_eehzzbb = resolve_key_chain(
            sample_dict,
            ['MG5', 'eehzzbb', 'cross_section_pb']
            )
        try:
            mu_bb = bsm_eehzzbb/sm.pred_cs_ee_hz_zbb(bsm_mh1)
        except TypeError:
            mu_bb = None
    else:
        mu_bb = None
    return mu_bb


def mu_aa_tautau_masses_hbhs_mg5(sample_dict, obj_hep_config):
    mus = {
        'mu_aa': mu_aa_mg5(sample_dict), 
        'mu_tautau': mu_bb_mg5(sample_dict)
        }
    output_dict = create_simple_dict(obj_hep_config, sample_dict)
    output_dict = {**output_dict, **mus} 
    return output_dict
def mu_aa_bb_masses_hbhs_mg5(sample_dict, obj_hep_config):
    mus = {
        'mu_aa': mu_aa_mg5(sample_dict), 
        'mu_bb': mu_bb_mg5(sample_dict)
        }
    output_dict = create_simple_dict(obj_hep_config, sample_dict)
    output_dict = {**output_dict, **mus} 
    return output_dict

def mus_masses_hbhs_mg5(sample_dict, obj_hep_config):
    mus = {
        'mu_aa': mu_aa_mg5(sample_dict), 
        'mu_tautau': mu_tautau_mg5(sample_dict), 
        'mu_bb': mu_bb_mg5(sample_dict)
        }
    output_dict = create_simple_dict(obj_hep_config, sample_dict)
    output_dict = {**output_dict, **mus} 
    return output_dict

def mu_aa_masses_hbhs_spheno(sample_dict, parameters):
    mu_aa = {'mu_aa': mu_aa_spheno(sample_dict)}
    output_dict = create_simple_dict(parameters,sample_dict)
    output_dict = {**output_dict, **mu_aa} 
    return output_dict

def spheno_hbhs(sample_dict, parameters):
    output_dict = create_simple_dict(parameters,sample_dict)
    return output_dict

def mu_aa_masses_hbhs_mg5(sample_dict, obj_hep_config):
    mu_aa = {'mu_aa': mu_aa_mg5(sample_dict)}
    output_dict = create_simple_dict(obj_hep_config, sample_dict)
    output_dict = {**output_dict, **mu_aa} 
    return output_dict

def mus_masses_hbhs_mg5_hepdatapoint(sample_dict, obj_hep_config):
    mus = {
        'mu_aa': mu_aa_mg5(sample_dict), 
        'mu_tautau': mu_tautau_mg5(sample_dict), 
        'mu_bb': mu_bb_mg5(sample_dict)
        }
    #output_dict = create_simple_dict(obj_hep_config, sample_dict)
    #output_dict = {**output_dict, **mus} 
    output_dict = {**sample_dict, **mus}
    return output_dict

