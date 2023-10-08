

#Create a library of peptides with known hot spots (Template-based Peptide Design)
#written by : Sara Zareei

# Define the template peptide sequence
template_sequence <- "CGTVGTNTPCC"
nchar(template_sequence)

# Define the possible amino acids for each hot spot
p2 <- c("C", "F", "Y")
p3 <- c("H", "M")
p4 <- c("H")
p5 <- c("L", "S", "W", "T", "Q", "E", "C", "D", "F", "I", "H", "N", "M", "Y", "K")
p6 <- c("W", "C", "F", "H", "M", "Y", "K")
p7 <- c("S", "T", "Q", "E", "C", "R", "D", "H", "M", "Y", "K")
p8 <- c("H", "M", "Y")
p9 <- c("H", "M", "Y")


# Generate all possible combinations of amino acids for each position
all_combinations <- expand.grid(p2, p3, p4, p5, p6, p7, p8, p9 )

# Combine the amino acids into peptide sequences for each combination
mutant_peptides <- apply(all_combinations, 1, function(x) {
  positions <- c(2, 3, 4, 5, 6, 7, 8, 9)
  mutant_seq <- template_sequence
  for (i in seq_along(positions)) {
    aa <- x[i]
    pos <- positions[i]
    mutant_seq <- paste0(substr(mutant_seq, 1, pos-1), aa, substr(mutant_seq, pos+1, nchar(mutant_seq)))
  }
  mutant_seq
})

# Print the resulting library of mutant peptides
print(mutant_peptides)


# Write the mutant peptides to a FASTA file
file_path <- "path/Mutants.fasta"
file_conn <- file(file_path, open = "wt")
for (i in seq_along(mutant_peptides)) {
  writeLines(paste0(">seq", i, "\n", mutant_peptides[i]), file_conn)
}
close(file_conn)









