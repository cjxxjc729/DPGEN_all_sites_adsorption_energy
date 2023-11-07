#!/bin/bash
home_dir=$(pwd)
#script_dir=
#tmp_dir=
#mkdir 

#read -p "enter the prefix: " prefix
#read -p "enter the ref pwin file: " f_ref

#--------------------------------------------------------

check_file_list=""

for check_file in $check_file_list
do
  file_exit_sig=$(whether_files_exists.sh $check_file)

  if [ ${file_exit_sig} -eq 0 ]
  then
    echo "missing files"
    echo "check $check_file_list"
    exit 5
  fi
done

#dig_all_the_file_that_has_the_fkey << EOF
#H.data
#-1
#EOF

#sed -i "s/Ar/C/g" *data

cd H.data_coll
  connect_to_group_dp.sh << EOF 
../../02.dp/
EOF
  hpc_ae_back.sh
