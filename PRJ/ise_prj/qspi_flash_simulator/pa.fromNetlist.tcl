
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name qspi_flash_simulator -dir "/home/ise/88-ISE_share/GIT_QSPI_SIMULATOR_V30/PRJ/ise_prj/qspi_flash_simulator/planAhead_run_3" -part xc6slx16ftg256-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/home/ise/88-ISE_share/GIT_QSPI_SIMULATOR_V30/PRJ/ise_prj/qspi_flash_simulator/fpga_qspi_simulator_top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/ise/88-ISE_share/GIT_QSPI_SIMULATOR_V30/PRJ/ise_prj/qspi_flash_simulator} {ipcore_dir} }
add_files [list {ipcore_dir/chipscope_icon.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/chipscope_ila_0.ncf}] -fileset [get_property constrset [current_run]]
set_param project.pinAheadLayout  yes
set_property target_constrs_file "qspi_simulator.ucf" [current_fileset -constrset]
add_files [list {qspi_simulator.ucf}] -fileset [get_property constrset [current_run]]
link_design
