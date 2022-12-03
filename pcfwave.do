onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /PCF_tb/clk
add wave -noupdate /PCF_tb/rst
add wave -noupdate /PCF_tb/PCSrc
add wave -noupdate -radix unsigned /PCF_tb/calcBranch
add wave -noupdate -radix unsigned /PCF_tb/currPC
add wave -noupdate -radix unsigned /PCF_tb/pc_plus4
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
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
WaveRestoreZoom {0 ps} {1 ns}
