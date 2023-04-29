#!/bin/bash
netlogo='/users/tadnan/lab2/problems/netlogo-6.2.0/app/netlogo-6.2.0.jar'
model='/users/tadnan/lab2/problems/problem_3/Fire.nlogo'
output='/users/tadnan/lab2/problems/problem_3/test.csv'
java -Xmx1024m -Dfile.encoding=UTF-8 -cp $netlogo org.nlogo.headless.Main --model $model --experiment experiment1 --table $output