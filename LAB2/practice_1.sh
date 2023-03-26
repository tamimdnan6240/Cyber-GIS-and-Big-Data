#!/bin/bash

# Steps by tamim:
# 1. Define the number of cpu to use,
# 2. then make loop to create 500 folders,
# 3. then make loop to the cpus to assign 500/n tasks and submit job one by one

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
for ((i=1; i<=5; i++))
do
  # Calculate the starting and ending index for the current CPU
  start=$((num_folders*(i-1)))
  end=$((start+num_folders-1))

  # Submit the job to create folders for the current range of indices
  create_folders "$start" "$end" &


# Wait for all jobs to complete
wait

# Create a submission file for the current job
  echo "#!/bin/bash" > submit$i.sh
  echo "#SBATCH --partition=Centaurus" >> submit$i.sh
  echo "#SBATCH --time=1:00:00" >> submit$i.sh
  echo "#SBATCH --job-name=create_folders_$i" >> submit$i.sh
  echo "create_folders $start $end" >> submit$i.sh
  echo "#SBATCH --cpus-per-task=1" >> submit$i.sh
  echo "" >> submit$i.sh

  # Submit the job
  sbatch submit$i.sh
done
