import numpy as np
from hepaid.hep.utils import resolve_key_chain
from hepaid.hep.utils import check_valid_sample_dict  
from hepaid.hep.utils import create_simple_dict  


from sm.standard_model import SM


import os

sm = SM('sm/sm_mg5_full_processes_lep_200.json.gz')

def mu_aa_spheno(sample_dict):
    """
    Calculates the gamma-gamma signal strength modifier from the HEPStack output.
    This calculation is done with the SPheno data, using the narrow width approximation.
    
    NOTE: This is not used in the final version!

    Parameters:
    sample_dict (dict): A dictionary containing the sample data from HEPStack.

    Returns:
    float or None: The gamma-gamma signal strength modifier. Returns None if the sample dictionary is invalid.

    Details:
    1. Validation: The function first checks if the sample_dict is valid using check_valid_sample_dict(sample_dict).
    2. Extract Values:
       - cgg: Extracts the coupling constant for the Higgs to gamma-gamma from the sample dictionary.
       - bsm_mh1: Extracts the mass of the Higgs boson.
       - bsm_br_h1_aa: Extracts the branching ratio of the Higgs boson decaying to two photons.
    3. Calculation: Computes the signal strength modifier mu_aa using the formula:
       mu_aa = (cgg * bsm_br_h1_aa) / sm.pred_br_h_aa(bsm_mh1)
    4. Return: Returns the computed mu_aa or None if the sample dictionary is invalid.
    """
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
    """
    Calculates the gamma-gamma signal strength modifier from the MG5 output and adds it to objectives.

    Parameters:
    sample_dict (dict): A dictionary containing the sample data from MG5.

    Returns:
    float or None: The gamma-gamma signal strength modifier. Returns None if the sample dictionary is invalid or required values are missing.

    Details:
    1. Validation: The function first checks if the sample_dict is valid using check_valid_sample_dict(sample_dict).
    2. Extract Values:
       - bsm_mh1: Extracts the mass of the Higgs boson.
       - bsm_gghaa: Extracts the cross-section for the process gg -> H -> aa.
    3. Check Values: Ensures that both bsm_mh1 and bsm_gghaa are present.
    4. Calculation: Computes the signal strength modifier mu_aa using the formula:
       mu_aa = bsm_gghaa / sm.pred_cs_gg_h_aa(bsm_mh1)
    5. Return: Returns the computed mu_aa or None if the sample dictionary is invalid or required values are missing.
    """
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
    """
    Calculates the tau-tau signal strength modifier from the MG5 output and adds it to objectives.

    Parameters:
    sample_dict (dict): A dictionary containing the sample data from MG5.

    Returns:
    float or None: The tau-tau signal strength modifier. Returns None if the sample dictionary is invalid or required values are missing.

    Details:
    1. Validation: The function first checks if the sample_dict is valid using check_valid_sample_dict(sample_dict).
    2. Extract Values:
       - bsm_mh1: Extracts the mass of the Higgs boson.
       - bsm_gghtautau: Extracts the cross-section for the process gg -> H -> tau tau.
    3. Check Values: Ensures that both bsm_mh1 and bsm_gghtautau are present.
    4. Calculation: Computes the signal strength modifier mu_tautau using the formula:
       mu_tautau = bsm_gghtautau / sm.pred_cs_gg_h_tautau(bsm_mh1)
    5. Return: Returns the computed mu_tautau or None if the sample dictionary is invalid or required values are missing.
    """
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
    """
    Calculates the bb signal strength modifier from the MG5 output and adds it to objectives.

    Parameters:
    sample_dict (dict): A dictionary containing the sample data from MG5.

    Returns:
    float or None: The bb signal strength modifier. Returns None if the sample dictionary is invalid or required values are missing.

    Details:
    1. Validation: The function first checks if the sample_dict is valid using check_valid_sample_dict(sample_dict).
    2. Extract Values:
       - bsm_mh1: Extracts the mass of the Higgs boson.
       - bsm_eehzzbb: Extracts the cross-section for the process ee -> H -> Z -> bb.
    3. Calculation: Computes the signal strength modifier mu_bb using the formula:
       mu_bb = bsm_eehzzbb / sm.pred_cs_ee_hz_zbb(bsm_mh1)
    4. Exception Handling: Catches TypeError and sets mu_bb to None if an error occurs during calculation.
    5. Return: Returns the computed mu_bb or None if the sample dictionary is invalid or required values are missing.
    """
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



def mu_aa_masses_hbhs_spheno(sample_dict, parameters):
    """
    Extracts the required parameters from the HEPStack and creates a non-nested dictionary for the objective function, with all the required objectives.

    NOTE: This function is not used in the paper.

    Parameters:
    sample_dict (dict): A dictionary containing the sample data from HEPStack.
    obj_hep_config (dict): A dictionary containing the configuration for the HEP objectives.

    Returns:
    dict: A non-nested dictionary containing the required objectives only from the HEPStack.
    """
    mu_aa = {'mu_aa': mu_aa_spheno(sample_dict)}
    output_dict = create_simple_dict(parameters,sample_dict)
    output_dict = {**output_dict, **mu_aa} 
    return output_dict

def spheno_hbhs(sample_dict, parameters):
    """
    Extracts the required parameters from the HEPStack and creates a non-nested dictionary for the objective function, with all the required objectives.

    Parameters:
    sample_dict (dict): A dictionary containing the sample data from HEPStack.
    obj_hep_config (dict): A dictionary containing the configuration for the HEP objectives.

    Returns:
    dict: A non-nested dictionary containing the required objectives only from the HEPStack.
    """
    output_dict = create_simple_dict(parameters,sample_dict)
    return output_dict

def mu_aa_masses_hbhs_mg5(sample_dict, obj_hep_config):
    """
    Extracts the required parameters from the HEPStack and creates a non-nested dictionary for the objective function, with all the required objectives.

    Parameters:
    sample_dict (dict): A dictionary containing the sample data from HEPStack.
    obj_hep_config (dict): A dictionary containing the configuration for the HEP objectives.

    Returns:
    dict: A non-nested dictionary containing the required objectives, including the gamma-gamma signal strength modifier.
    """
    mu_aa = {'mu_aa': mu_aa_mg5(sample_dict)}
    output_dict = create_simple_dict(obj_hep_config, sample_dict)
    output_dict = {**output_dict, **mu_aa} 
    return output_dict

def mu_aa_tautau_masses_hbhs_mg5(sample_dict, obj_hep_config):
    """
    Extracts the required parameters from the HEPStack and creates a non-nested dictionary for the objective function, with all the required objectives.

    Parameters:
    sample_dict (dict): A dictionary containing the sample data from HEPStack.
    obj_hep_config (dict): A dictionary containing the configuration for the HEP objectives.

    Returns:
    dict: A non-nested dictionary containing the required objectives, including the gamma-gamma and tau-tau signal strength modifiers.
    """
    mus = {
        'mu_aa': mu_aa_mg5(sample_dict), 
        'mu_tautau': mu_bb_mg5(sample_dict)
        }
    output_dict = create_simple_dict(obj_hep_config, sample_dict)
    output_dict = {**output_dict, **mus} 
    return output_dict
def mu_aa_bb_masses_hbhs_mg5(sample_dict, obj_hep_config):
    """
    Extracts the required parameters from the HEPStack and creates a non-nested dictionary for the objective function, with all the required objectives.

    Parameters:
    sample_dict (dict): A dictionary containing the sample data from HEPStack.
    obj_hep_config (dict): A dictionary containing the configuration for the HEP objectives.

    Returns:
    dict: A non-nested dictionary containing the required objectives, including the gamma-gamma and bb signal strength modifiers.
    """
    mus = {
        'mu_aa': mu_aa_mg5(sample_dict), 
        'mu_bb': mu_bb_mg5(sample_dict)
        }
    output_dict = create_simple_dict(obj_hep_config, sample_dict)
    output_dict = {**output_dict, **mus} 
    return output_dict

def mus_masses_hbhs_mg5(sample_dict, obj_hep_config):
    """
    Extracts the required parameters from the HEPStack and creates a non-nested dictionary for the objective function, with all the required objectives.

    Parameters:
    sample_dict (dict): A dictionary containing the sample data from HEPStack.
    obj_hep_config (dict): A dictionary containing the configuration for the HEP objectives.

    Returns:
    dict: A non-nested dictionary containing the required objectives, including the gamma-gamma, tau-tau, and bb signal strength modifiers.
    """
    mus = {
        'mu_aa': mu_aa_mg5(sample_dict), 
        'mu_tautau': mu_tautau_mg5(sample_dict), 
        'mu_bb': mu_bb_mg5(sample_dict)
        }
    output_dict = create_simple_dict(obj_hep_config, sample_dict)
    output_dict = {**output_dict, **mus} 
    print(output_dict)
    return output_dict

if __name__ == "__main__":
    # Example usage
    sample_dict = {
        'SLHA': {
            'HIGGSCOUPLINGSBOSONS': {
                'entries': {
                    '3,25,21,21': {'value': 1.0}
                }
            },
            'MASS': {
                'entries': {
                    '25': {'value': 125.0}
                }
            },
            'DECAY 25': {
                'entries': {
                    '2,22,22': {'value': 0.001}
                }
            }
        },
        'MG5': {
            'gghaa': {'cross_section_pb': 0.1},
            'gghtautau': {'cross_section_pb': 0.2},
            'eehzzbb': {'cross_section_pb': 0.3}
        }
    }
    
    #print(mu_aa_spheno(sample_dict))
    print(mu_aa_mg5(sample_dict))
    print(mu_tautau_mg5(sample_dict))
    print(mu_bb_mg5(sample_dict))


