#!/public1/home/sch0149/deepmd-kit/bin/python




fid=open('H.data_coll/max_std_e.txt')
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
print('totally get '+str(len(grid_id_chosen))+' bad sites')

