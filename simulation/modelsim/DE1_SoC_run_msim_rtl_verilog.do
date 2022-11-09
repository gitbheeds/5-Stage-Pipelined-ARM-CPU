transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/Gerin/Documents/GitHub/EE469_Labs {C:/Users/Gerin/Documents/GitHub/EE469_Labs/zero_extender.sv}

