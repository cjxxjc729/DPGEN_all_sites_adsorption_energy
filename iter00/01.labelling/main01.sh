#!/bin/bash
home_dir=$(pwd)
root_dir=../../
cat_rea=HER
#script_dir=
#tmp_dir=
#mkdir 

#read -p "enter the prefix: " prefix
#read -p "enter the ref pwin file: " f_ref

#--------------------------------------------------------
curr_iter=$(pwd | sed "s#/#\n#g" | tail -2 | head -1)
curr_iter_id=$(echo $curr_iter | awk -F 'iter' '{print $2}')
last_iter_id=$(echo $curr_iter_id-1 | bc -l | awk {printf'("%02d\n",$0)'})


if [ -f ${root_dir}/iter${last_iter_id}/03.bad_site_selection/grid_id_70.txt ]
then
  cp ${root_dir}/iter${last_iter_id}/03.bad_site_selection/grid_id_70.txt ./
  echo "got grid_id_70.txt, enter the custom mode"
  mode=custom
  mode_spcific=$(cat grid_id_70.txt | xargs)
else
  echo "no grid_id_70, should enter the random mode"
  mode=random
  mode_spcific=70
fi

echo "make main.cut_genadb_gentg.input as :"
echo "blank_with_grid.cif
${cat_rea}
$mode
$mode_spcific" > main.cut_genadb_gentg.input

hpc_sub "~/script/add_by_grid_suite/main.cut_genadb_gentg.sh < main.cut_genadb_gentg.input"

