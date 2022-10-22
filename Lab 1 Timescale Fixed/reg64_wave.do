onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /regstim/dut/ReadData1
add wave -noupdate -radix hexadecimal /regstim/dut/ReadData2
add wave -noupdate -radix unsigned /regstim/dut/ReadRegister1
add wave -noupdate -radix unsigned /regstim/dut/ReadRegister2
add wave -noupdate -radix unsigned /regstim/dut/WriteRegister
add wave -noupdate -radix hexadecimal /regstim/dut/WriteData
add wave -noupdate /regstim/dut/clk
add wave -noupdate /regstim/dut/RegWrite
add wave -noupdate /regstim/dut/regOut
add wave -noupdate /regstim/dut/write_en
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {317500000 ps} 0} {{Cursor 2} {322500500 ps} 0}
quietly wave cursor active 2
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
WaveRestoreZoom {312817656 ps} {480161406 ps}
