#!/bin/bash

# Define the number of CPUs to use
n=5

# Calculate the number of folders each CPU should create
num_folders= 100 ## 500 / n folder in each cpu

# Define the function to create folders for a given range of indices

## start and end are two arguments. 

## call the start and end variable as local variable with local. 

## the current working directory has defined in pwd, mkdir for creating folder and t

create_folders() {
  local start=$1
  local end=$2
  for ((i=$start; i<=$end; i++))
  do
    echo "$(pwd)/$i"
    mkdir -p "$i"
    echo "$(pwd)" > "$i/text.txt"
  done
}


# Loop over the CPUs and submit jobs to create folders
for ((i=1; i<=n; i++))
do
  # assign each cpus numbers of folders to create
  start=$((num_folders*(i-1) + 1))
  end=$((num_folders*i))

  # Submit the job to create folders for the current range of indices
  create_folders "$start" "$end" &
done

# Wait for all jobs to finish
wait
