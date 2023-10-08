# Create a library of peptides with known hot spots (Template-based Peptide Design)
# written by: Sara Zareei

# Define the tepmplate peptide sequence
template_sequence = "CGTVGTNTPCC"
len(template_sequence)

# Define the possible amino acids for each hot spot
p2 = ["C", "F", "Y"]
p3 = ["H", "M"]
p4 = ["H"]
p5 = ["L", "S", "W", "T", "Q", "E", "C", "D", "F", "I", "H", "N", "M", "Y", "K"]
p6 = ["W", "C", "F", "H", "M", "Y", "K"]
p7 = ["S", "T", "Q", "E", "C", "R", "D", "H", "M", "Y", "K"]
p8 = ["H", "M", "Y"]
p9 = ["H", "M", "Y"]

# Generate all possible combinations of amino acids for each position
import itertools
all_combinations = list(itertools.product(p2, p3, p4, p5, p6, p7, p8, p9))

# Combine the amino acids into peptide sequences for each combination
mutant_peptides = []
for combination in all_combinations:
    positions = [2, 3, 4, 5, 6, 7, 8, 9]
    mutant_seq = template_sequence
    for i, aa in enumerate(combination):
        pos = positions[i]
        mutant_seq = mutant_seq[:pos-1] + aa + mutant_seq[pos:]
    mutant_peptides.append(mutant_seq)

# Print the resulting library of mutant peptides
print(mutant_peptides)

# Write the mutant peptides to a FASTA file
file_path = "path/Mutants.fasta"
with open(file_path, "w") as file_conn:
    for i, mutant_seq in enumerate(mutant_peptides):
        file_conn.write(">seq" + str(i+1) + "\n" + mutant_seq + "\n")
