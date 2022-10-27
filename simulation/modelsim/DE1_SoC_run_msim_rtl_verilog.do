transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/Gerin/Documents/GitHub/EE469_Labs {C:/Users/Gerin/Documents/GitHub/EE469_Labs/xor_64_bit.sv}
vlog -sv -work work +incdir+C:/Users/Gerin/Documents/GitHub/EE469_Labs {C:/Users/Gerin/Documents/GitHub/EE469_Labs/or_64_bit.sv}
vlog -sv -work work +incdir+C:/Users/Gerin/Documents/GitHub/EE469_Labs {C:/Users/Gerin/Documents/GitHub/EE469_Labs/and_64_bit.sv}
vlog -sv -work work +incdir+C:/Users/Gerin/Documents/GitHub/EE469_Labs {C:/Users/Gerin/Documents/GitHub/EE469_Labs/mux2_1.sv}
vlog -sv -work work +incdir+C:/Users/Gerin/Documents/GitHub/EE469_Labs {C:/Users/Gerin/Documents/GitHub/EE469_Labs/fullAdder.sv}
vlog -sv -work work +incdir+C:/Users/Gerin/Documents/GitHub/EE469_Labs {C:/Users/Gerin/Documents/GitHub/EE469_Labs/adder64_bit.sv}
vlog -sv -work work +incdir+C:/Users/Gerin/Documents/GitHub/EE469_Labs {C:/Users/Gerin/Documents/GitHub/EE469_Labs/mux4_1.sv}
vlog -sv -work work +incdir+C:/Users/Gerin/Documents/GitHub/EE469_Labs {C:/Users/Gerin/Documents/GitHub/EE469_Labs/mux8_1.sv}
vlog -sv -work work +incdir+C:/Users/Gerin/Documents/GitHub/EE469_Labs {C:/Users/Gerin/Documents/GitHub/EE469_Labs/mux64x8_1.sv}
vlog -sv -work work +incdir+C:/Users/Gerin/Documents/GitHub/EE469_Labs {C:/Users/Gerin/Documents/GitHub/EE469_Labs/zeroCheck.sv}
vlog -sv -work work +incdir+C:/Users/Gerin/Documents/GitHub/EE469_Labs {C:/Users/Gerin/Documents/GitHub/EE469_Labs/mux64x2_1.sv}
vlog -sv -work work +incdir+C:/Users/Gerin/Documents/GitHub/EE469_Labs {C:/Users/Gerin/Documents/GitHub/EE469_Labs/ALU.sv}

