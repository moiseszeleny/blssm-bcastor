# Import the HEP-Stack module
from hepaid.hep.stack import HEPSTACK
import numpy as np

# Initialise the HEP-Stack with a configuration file
hep_config = "/home/moises/blssm-bcastor/experiments_paper/dlrsm/hepstack/hepstack_config.yaml"
hepstack = HEPSTACK['SPhenoStack'](hep_config=hep_config)


def print_result(result):
    # Check if SLHA block exists and is not None
    slha = result.get('SLHA') if result else None
    if not slha:
        print("No SLHA block found in result. Exiting.")
        exit(1)

    print('*'*100)
    print("Gauge Couplings:")
    print('*'*100)

    gauge = slha.get('GAUGE')
    if gauge and gauge.get('entries'):
        for id in gauge['entries'].keys():
            comment = gauge['entries'][id].get('comment', '')
            comment = comment.split(' ')[1] if comment else ''
            if id == '':
                continue
            else:
                print(f"{id}, {comment}, {gauge['entries'][id]['value'][0]}")
    else:
        print("No GAUGE block found in SLHA output.")

    print('*'*100)
    print("Masses:")
    print('*'*100)

    mass = slha.get('MASS')
    if mass and mass.get('entries'):
        for id in mass['entries'].keys():
            comment = mass['entries'][id].get('comment', '')
            comment = comment.split(' ')[1] if comment else ''
            if id == '':
                continue
            else:
                print(f"ID: {id}, Particle: {comment}, Mass: {mass['entries'][id]['value'][0]}")
    else:
        print("No MASS block found in SLHA output.")

    print('*'*100)
    print('FlavorKitLFV Observables:')
    print('*'*100)

    flavorkitlfv = slha.get('FLAVORKITLFV')
    if flavorkitlfv and flavorkitlfv.get('entries'):
        for id in flavorkitlfv['entries'].keys():
            comment = flavorkitlfv['entries'][id].get('comment', '')
            if id == '':
                continue
            else:
                print(f"ID: {id}, {comment} = {flavorkitlfv['entries'][id]['value'][0]}")
    else:
        print("No FLAVORKITLFV block found in SLHA output.")


# Define a benchmark for sampling
benchmark_point = [
    -4.0, # lam1input
    -4.0, # lam2input
    -4.0, # lam3input
    -4.0, # lam4input
    -4.0, # lam5input
    -4.0, # lam6input
    0.0, # rho1input
    0.0, # rho2input
    3.0, # alp1input
    -4.0, # alp2input
    -3.0 # alp3input
]

try:
    result = hepstack.sample(benchmark_point)
    print_result(result)
except Exception as e:
    print(f"Error during sampling: {e}")
    exit(1)
