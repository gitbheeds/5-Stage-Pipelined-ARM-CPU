onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /IF_ID_Reg_tb/clk
add wave -noupdate /IF_ID_Reg_tb/IF_ID_flush
add wave -noupdate /IF_ID_Reg_tb/instruction
add wave -noupdate /IF_ID_Reg_tb/currPC
add wave -noupdate /IF_ID_Reg_tb/pc_plus4
add wave -noupdate /IF_ID_Reg_tb/opcode
add wave -noupdate /IF_ID_Reg_tb/Rn
add wave -noupdate /IF_ID_Reg_tb/Rm
add wave -noupdate /IF_ID_Reg_tb/Rd
add wave -noupdate /IF_ID_Reg_tb/shamt
add wave -noupdate /IF_ID_Reg_tb/dAddr9
add wave -noupdate /IF_ID_Reg_tb/ALU_Imm
add wave -noupdate /IF_ID_Reg_tb/condAddr19
add wave -noupdate /IF_ID_Reg_tb/brAddr26
add wave -noupdate /IF_ID_Reg_tb/currPC_out
add wave -noupdate /IF_ID_Reg_tb/pc_plus4_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {559 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {3675 ps}
