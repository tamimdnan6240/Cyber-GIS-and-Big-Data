#! /bin/bash
for ((i=0;i<1000;i++ ))
do
cat submit_template.sh > submit$i.sh
echo "/users/tadnan/lab2/problems/problem_3/run.sh $i" >> submit$i.sh
done
