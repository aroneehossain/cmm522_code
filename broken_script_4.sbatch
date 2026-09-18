#!/bin/bash -l
#SBATCH --job-name=errtest
#SBATCH --ntasks=1
#SBATCH --nodes=1             
#SBATCH --mem=100mb                    
#SBATCH --time=00:03:00   
#SBATCH --partition=windfall
#SBATCH --account=windfall
#SBATCH --mail-type=ALL
#SBATCH --mail-user=aroneehossain@arizona.edu

#I think this has to do with a broken e key or something
set -e

#Now, we want to "initialize" some things. That sounds official!
date
cd ~/ccbb_projects/
pwd
hostname
mkdir -p outputs
wget https://raw.githubusercontent.com/cusanovich/cmm522_code/main/gene_results.txt -O outputs/new_gene_results.txt
cat outputs/new_gene_results.txt

touch ./outputs/an_important_file.txt
touch ./outputs/we_might_need_this.txt

#Let's check if that all worked
for file in ./outputs/*;
	do echo "$file";
done

#Always good to check on my favorite program
target_string="puma"
piped_output=$(scontrol show config | grep ClusterName | cut -f2 -d"=")

if [[ "$piped_output" == "$target_string" ]]; then
  module load bedtools/2.31.1
else
  module load bedtools2/2.29.2
fi
bedtools -h

#We need a for loop to keep track of all the files in the working directory
x=1
for file in ./*
do
	echo "There are at least $x files in this directory"
	x=$(( x+1 ))
done

#This script just seems to work better if I let it sleep
sleep 2m


#After that, the script always seems a little groggy, so I like to give it a while loop to wake up
x=10
while  [ $x -ge 5 ]
do
	echo "Let me sleep $x more seconds..."
	x=$(( x-1 ))
done

#Cleaning up a little
rm -R outputs/

echo "The answer is: 42"