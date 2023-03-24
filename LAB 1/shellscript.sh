#!/bin/bash

## create a loop for 1 to 500
## after the loop, mkdir $i for creating fodelrs with name 1 to 500. 
## pwd > $i/text.txt for printing every folder directory. 

for i in {1..500}
do 
	mkdir $i
	pwd > $i/text.txt
done
