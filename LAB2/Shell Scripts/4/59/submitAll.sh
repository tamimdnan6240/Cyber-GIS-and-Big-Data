#!/bin/bash
for ((i=0;i<10;i++ ))
do
sbatch submit$i.sh
done
