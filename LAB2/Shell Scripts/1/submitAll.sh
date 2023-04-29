#!/bin/bash
for ((i=0;i<5;i++ ))
do
sbatch submit$i.sh
done
