#!/bin/bash

# Define the number of CPUs to use
n=5

# Calculate the number of folders each CPU should create
num_folders=$((500/n))

# Define the function to create folders for a given range of indices
create_folders() {
  local start=$1
  local end=$2
  for ((i=start; i<=end; i++))
  do
    mkdir "folder_$i"
  done
}

# Loop over the CPUs and submit jobs to create folders
for ((i=1; i<=n; i++))
do
  # Calculate the starting and ending indices for the current CPU
  start=$((num_folders*(i-1)))
  end=$((start+num_folders-1))

  # Submit the job to create folders for the current range of indices
  create_folders "$start" "$end" &
done

# Wait for all jobs to complete
wait

echo "Done."
