from hepaid.hep.tools import SPheno

# Define paths and model name
model_name = "DLRSM"
spheno_dir = "/home/moises/blssm-bcastor/experiments_paper/dlrsm/hepstack/SPheno-4.0.4"
output_dir = "/home/moises/blssm-bcastor/experiments_paper/dlrsm/hepstack/output"
input_file = "/home/moises/blssm-bcastor/experiments_paper/dlrsm/hepstack/SPheno-4.0.4/DLRSM/Input_Files/LesHouches.in.DLRSM_low"

# Initialise the SPheno tool
spheno = SPheno(spheno_dir, output_dir, model_name)

# Run SPheno
spheno.run(input_file)

output_slha_file = spheno.results

# Print the output SLHA file path
print(f"Output SLHA file: {output_slha_file}")