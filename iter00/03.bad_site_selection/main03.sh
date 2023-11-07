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

cd H.data_coll

python -c "fid=open('max_std_e.txt')
import random
contents=fid.readlines()
grid_id_chosen=[]
for content in contents:
  value_str=content.split(' ')[1].split('\n')[0]
  value=float(value_str)
  if value > 0.1:
    grid_id=content.split(' ')[0].split('.')[1].split('c')[1].split('_')[0]
    grid_id=float(grid_id)
    grid_id_chosen.append(grid_id)
print(grid_id_chosen)
if len(grid_id_chosen) > 70:
  grid_id_chosen_70=random.sample(grid_id_chosen,70)
  grid_id_chosen=grid_id_chosen_70

import numpy as np
np.savetxt('grid_id_70.txt',grid_id_chosen,fmt='%d')"

cp grid_id_70.txt ../

