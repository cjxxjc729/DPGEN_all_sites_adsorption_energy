#!/bin/bash 
#ls -l | grep 4096 | awk -F ' ' '{print $9}'> file.list

home_dir=$(pwd)
nfile=$(cat file.list | wc -l)


for i in `seq 1 $nfile`
do

file=$(cat file.list | head -$i | tail -1)
echo "-------------------$file begins ---------------------"
cd $file

  ~/script/gridy_opt_suite_V1021_with_adb_tags/gridyopt_to_dp.sh


cd $home_dir
echo "-------------------$file ends ---------------------"
done


