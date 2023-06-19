onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /programCounter_tb/uncondBr
add wave -noupdate /programCounter_tb/sub_control
add wave -noupdate -radix sfixed /programCounter_tb/nextPC
add wave -noupdate -radix sfixed /programCounter_tb/currPC
add wave -noupdate -radix sfixed /programCounter_tb/condAddr19
add wave -noupdate /programCounter_tb/brTaken
add wave -noupdate -radix sfixed /programCounter_tb/brAddr26
add wave -noupdate -radix sfixed /programCounter_tb/dut/shiftedBranch
add wave -noupdate -radix sfixed /programCounter_tb/dut/int2
add wave -noupdate -radix sfixed /programCounter_tb/dut/currentOut
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2834 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 247
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {3360 ps}
