# DPGEN_all_sites_adsorption_energy

This project calculates the adsorption energy for all given sites through an active learning scheme. Initially, the adsorption energy of a subset of sites is computed to form an initial force field, and then data that needs to be labeled is identified by the force error. These data points are then marked. This iterative process continues until convergence is reached.

During the labeling process, the possibility that the structure optimization process might optimize to a nearby lattice site is considered. To address this, a 'constrained optimization' method is used to force the adsorbate back to the original lattice site if it optimizes to a nearby one. This ensures a good correspondence between the structure and the adsorption energy.

![fig4_test2](https://github.com/cjxxjc729/DPGEN_all_sites_adsorption_energy/assets/42018996/25a4b46f-73bd-4fee-a0a7-a03032037880)

Algorithm structure schematic.

# quick start

main.nano_cat_rea_no_grid.gen_input_pwinfile.sh < input in the 00.fullsite_make directory to build n data files centered around sites, with n being the number of sites. Then use next_iter.sh to enter the main loop. Enter each iter0x and execute workflow.sh. After completion, run bad_site_count.py until the activation energy (ae) error of all points is below a set value, usually within 0.1 eV.
