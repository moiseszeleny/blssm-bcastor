from hepaid.hep.read import SLHA

# Load the SLHA file containing particle physics parameters
slha_file = "/home/moises/blssm-bcastor/experiments_paper/dlrsm/hepstack/SPheno-4.0.4/DLRSM/Input_Files/LesHouches.in.DLRSM_low"
slha_data = SLHA(slha_file)

# Print the loaded SLHA data
print("SLHA Data Loaded:")
print(f"File: {slha_file}")
print(slha_data)

# Display the available parameter blocks in the SLHA file
parameter_blocks = slha_data.keys()
print("\nAvailable Parameter Blocks:")
for block in parameter_blocks:
    print(block)

# Access and display the 'MINPAR' block, which contain input parameters
minpar_block = slha_data['MINPAR']
print("\nMINPAR Block:")
print(minpar_block)