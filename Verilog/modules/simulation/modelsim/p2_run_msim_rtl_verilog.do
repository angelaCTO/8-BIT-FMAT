transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Administrator/Desktop/8-BIT-FMAT/Verilog/modules {C:/Users/Administrator/Desktop/8-BIT-FMAT/Verilog/modules/instrROM.v}
vlog -vlog01compat -work work +incdir+C:/Users/Administrator/Desktop/8-BIT-FMAT/Verilog/modules {C:/Users/Administrator/Desktop/8-BIT-FMAT/Verilog/modules/fetchUnit.v}
vlog -vlog01compat -work work +incdir+C:/Users/Administrator/Desktop/8-BIT-FMAT/Verilog/modules {C:/Users/Administrator/Desktop/8-BIT-FMAT/Verilog/modules/regfile.v}
vlog -vlog01compat -work work +incdir+C:/Users/Administrator/Desktop/8-BIT-FMAT/Verilog/modules {C:/Users/Administrator/Desktop/8-BIT-FMAT/Verilog/modules/fmat_alu_testbench.v}
vlog -vlog01compat -work work +incdir+C:/Users/Administrator/Desktop/8-BIT-FMAT/Verilog/modules {C:/Users/Administrator/Desktop/8-BIT-FMAT/Verilog/modules/datamem.v}
vlog -vlog01compat -work work +incdir+C:/Users/Administrator/Desktop/8-BIT-FMAT/Verilog/modules {C:/Users/Administrator/Desktop/8-BIT-FMAT/Verilog/modules/mux4_1.v}
vlog -vlog01compat -work work +incdir+C:/Users/Administrator/Desktop/8-BIT-FMAT/Verilog/modules {C:/Users/Administrator/Desktop/8-BIT-FMAT/Verilog/modules/to_flag.v}
vlog -vlog01compat -work work +incdir+C:/Users/Administrator/Desktop/8-BIT-FMAT/Verilog/modules {C:/Users/Administrator/Desktop/8-BIT-FMAT/Verilog/modules/control.v}
vlog -vlog01compat -work work +incdir+C:/Users/Administrator/Desktop/8-BIT-FMAT/Verilog/modules {C:/Users/Administrator/Desktop/8-BIT-FMAT/Verilog/modules/fmat_alu.v}

