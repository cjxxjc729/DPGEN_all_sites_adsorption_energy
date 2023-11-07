# DPGEN_all_sites_adsorption_energy

This project calculates the adsorption energy for all given sites through an active learning scheme. Initially, the adsorption energy of a subset of sites is computed to form an initial force field, and then data that needs to be labeled is identified by the force error. These data points are then marked. This iterative process continues until convergence is reached.

During the labeling process, the possibility that the structure optimization process might optimize to a nearby lattice site is considered. To address this, a 'constrained optimization' method is used to force the adsorbate back to the original lattice site if it optimizes to a nearby one. This ensures a good correspondence between the structure and the adsorption energy.

![fig4_test2](https://github.com/cjxxjc729/DPGEN_all_sites_adsorption_energy/assets/42018996/25a4b46f-73bd-4fee-a0a7-a03032037880)

Algorithm structure schematic.

# quick start

首先在00.fullsite_make中使用main.nano_cat_rea_no_grid.gen_input_pwinfile.sh < input 来构建n个以位点为中心的data文件(n为位点数). 而后使用next_iter.sh 进入主循环. 进入每一个iter0x, 执行workflow.sh. 执行完毕后, 进入bad_site_count.py直至所有的点的ae误差都低于一个设定值. 通常是0.1 eV 以内
