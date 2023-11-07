#!/bin/bash
home_dir=$(pwd)


cd 01.labelling
./main01.sh
holdon
./main02.sh
active_dir=$(lld | grep "^c" | tail -1 )
while [ ! -f ${active_dir}/H.pw.out ]
do
  echo "wait for H.pw.out done"
  sleep 20s
done

./main03.sh

while [ ! -d ${active_dir}/dp_to_coll ]
do
  echo "wait for main03.sh 03.FED_plot done"
  sleep 20s
done



cd $home_dir


cd 02.dp
./main.sh
holdon_wait_following_dir_done_new_V.sh << EOF
000 001 002 003
EOF


cd $home_dir

cd 03.bad_site_selection
./main.sh
while [ ! -f H.data_coll/max_std_e.txt ]
do
  echo "wait for H.data_coll to done"
  sleep 20s
done
./main03.sh
