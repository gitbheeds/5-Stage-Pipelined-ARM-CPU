onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /fwd_tb/EX_MEM_regWrite
add wave -noupdate -radix unsigned /fwd_tb/MEM_WB_regWrite
add wave -noupdate -radix unsigned /fwd_tb/EX_MEM_Rd
add wave -noupdate -radix unsigned /fwd_tb/MEM_WB_Rd
add wave -noupdate -radix unsigned /fwd_tb/ID_EX_Rn
add wave -noupdate -radix unsigned /fwd_tb/ID_EX_Rm
add wave -noupdate /fwd_tb/FWDA
add wave -noupdate /fwd_tb/FWDB
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 50
configure wave -gridperiod 100
configure wave -griddelta 2
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {105 ps}
