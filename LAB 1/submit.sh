#!/bin/bash

#SBATCH--job-name=myjob
#SBATCH--partition=Centaurus
#SBATCH--time=00:50:00

#=====END SLURM OPTIONS =====

srun bash shellscript.sh
