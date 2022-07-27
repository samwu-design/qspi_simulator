gui_open_window Wave
gui_sg_create clk_gen_cyp_group
gui_list_add_group -id Wave.1 {clk_gen_cyp_group}
gui_sg_addsignal -group clk_gen_cyp_group {clk_gen_cyp_tb.test_phase}
gui_set_radix -radix {ascii} -signals {clk_gen_cyp_tb.test_phase}
gui_sg_addsignal -group clk_gen_cyp_group {{Input_clocks}} -divider
gui_sg_addsignal -group clk_gen_cyp_group {clk_gen_cyp_tb.CLK_IN1}
gui_sg_addsignal -group clk_gen_cyp_group {{Output_clocks}} -divider
gui_sg_addsignal -group clk_gen_cyp_group {clk_gen_cyp_tb.dut.clk}
gui_list_expand -id Wave.1 clk_gen_cyp_tb.dut.clk
gui_sg_addsignal -group clk_gen_cyp_group {{Status_control}} -divider
gui_sg_addsignal -group clk_gen_cyp_group {clk_gen_cyp_tb.RESET}
gui_sg_addsignal -group clk_gen_cyp_group {clk_gen_cyp_tb.LOCKED}
gui_sg_addsignal -group clk_gen_cyp_group {{Counters}} -divider
gui_sg_addsignal -group clk_gen_cyp_group {clk_gen_cyp_tb.COUNT}
gui_sg_addsignal -group clk_gen_cyp_group {clk_gen_cyp_tb.dut.counter}
gui_list_expand -id Wave.1 clk_gen_cyp_tb.dut.counter
gui_zoom -window Wave.1 -full
