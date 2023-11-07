#!/bin/bash 
lld | grep "^c" | grep -v c1002 | grep -v c1012  | grep -v c1013 > file.list

home_dir=$(pwd)
nfile=$(cat file.list | wc -l)


for i in `seq 1 $nfile`
do

file=$(cat file.list | head -$i | tail -1)
echo "-------------------$file begins ---------------------"

job_num_control

cd $file
#remove_all_and_keep.sh << EOF
#pw.in
#EOF
#cp ../../03.new_OER_from_grid/${file}/O*.pw.in ./
#sed -i "s/ecutrho = 300,/!ecutrho = 300,/g" *pw.in
#sed -i "s/nspin = 2,/nspin = 1,/g" *pw.in
sed -i "s/^Ar/C/g" ref.pw.in

modify_all

~/script/gridy_opt_suite_V1021_with_adb_tags/main_multi.sh << EOF
blank.pw.in H.pw.in
ref.pw.in
EOF



#sleep 2m
cd $home_dir
echo "-------------------$file ends ---------------------"
done


