#!/bin/bash
#SBATCH --job-name=grepawk
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --mem=1gb
#SBATCH --time=00:03:00
#SBATCH --partition=standard
#SBATCH --account=cusanovichlab

grep -w "coding" gene_results.txt | awk '$3 > 300 {print $0}' > coding_results.txt;
cat coding_results.txt

