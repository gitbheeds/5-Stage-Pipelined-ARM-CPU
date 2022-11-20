transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/spbhi/OneDrive/Documents/SV\ files/EE469_Labs_correct {C:/Users/spbhi/OneDrive/Documents/SV files/EE469_Labs_correct/ALU_control_unit.sv}

