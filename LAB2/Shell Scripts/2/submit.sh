#! /bin/bash
#SBATCH --partition=Centaurus
#SBATCH --job-name=basic_slurm_job
#SBATCH --nodes=5
#SBATCH --ntasks-per-node=1
#SBATCH --time=1:00:00
##SBATCH --mem=30gb
##SBATCH --exclusive
##SBATCH --nodelist=str-c60

### print some information about the job

echo "======================================================"
echo "Start Time : $(date)"
echo "Submit Dir : $SLURM_SUBMIT_DIR"
echo "Job ID/Name : $SLURM_JOBID / $SLURM_JOB_NAME"
echo "Num Tasks : $SLURM_NTASKS total [$SLURM_NNODES nodes @ $SLURM_CPUS_ON_NODE CPUs/node]"
echo "======================================================"
echo ""

### Here the script changes submission directory and printing information about nodes

cd $SLURM_SUBMIT_DIR
echo "Hi, I'm running my script on compute node $(/bin/hostname -s)"
echo ""
echo "======================================================"
echo "End Time : $(date)"
echo "======================================================"

# Main Program
srun -n 5 --time=1:00:00 --partition=Centaurus /users/tadnan/lab2/problems/problem_2/run.sh 5

wait
