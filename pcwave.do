onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /programCounter_tb/clk
add wave -noupdate /programCounter_tb/rst
add wave -noupdate -radix unsigned /programCounter_tb/currPC
add wave -noupdate -radix unsigned /programCounter_tb/pc_plus4
add wave -noupdate -radix unsigned /programCounter_tb/Rd
add wave -noupdate -radix unsigned /programCounter_tb/condAddr19
add wave -noupdate -radix unsigned /programCounter_tb/brAddr26
add wave -noupdate /programCounter_tb/uncondBr
add wave -noupdate /programCounter_tb/branchReg
add wave -noupdate /programCounter_tb/flagZero
add wave -noupdate /programCounter_tb/branch
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {9446 ps} 0}
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
WaveRestoreZoom {0 ps} {239400 ps}
