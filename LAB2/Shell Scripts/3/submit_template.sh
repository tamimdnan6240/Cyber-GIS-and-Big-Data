#! /bin/bash
#SBATCH --partition=Centaurus
#SBATCH --job-name=basic_slurm_job
#SBATCH --nodes=3
#SBATCH --ntasks-per-node=10
#SBATCH --time=1:00:00
##SBATCH --mem=30gb
##SBATCH --exclusive
##SBATCH --nodelist=str-c60
echo "======================================================" 
echo "Start Time : $(date)"
echo "Submit Dir : $SLURM_SUBMIT_DIR"
echo "Job ID/Name : $SLURM_JOBID / $SLURM_JOB_NAME"
echo "Num Tasks : $SLURM_NTASKS total [$SLURM_NNODES nodes @  $SLURM_CPUS_ON_NODE CPUs/node]"
echo "======================================================" echo ""
cd $SLURM_SUBMIT_DIR
echo "Hello World! I ran on compute node $(/bin/hostname -s)"
echo ""
echo "======================================================" echo "End Time : $(date)"
echo "======================================================"

# Main program 
