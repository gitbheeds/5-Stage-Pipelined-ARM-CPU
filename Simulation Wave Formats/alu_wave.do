onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /alustim/A
add wave -noupdate -radix hexadecimal /alustim/B
add wave -noupdate -radix hexadecimal /alustim/result
add wave -noupdate /alustim/cntrl
add wave -noupdate /alustim/negative
add wave -noupdate /alustim/zero
add wave -noupdate /alustim/overflow
add wave -noupdate /alustim/carry_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 2} {800476575 ps} 1} {{Cursor 3} {1605363489 ps} 1} {{Cursor 4} {1098174475 ps} 1} {{Cursor 5} {500000600 ps} 1} {{Cursor 5} {2103731826 ps} 1} {{Cursor 6} {747552504 ps} 0}
quietly wave cursor active 6
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
WaveRestoreZoom {0 ps} {2730 us}
