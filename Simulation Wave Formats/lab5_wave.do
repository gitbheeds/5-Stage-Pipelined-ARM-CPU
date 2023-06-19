onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /lab5_testbench/USERID
add wave -noupdate /lab5_testbench/ADDRESS_WIDTH
add wave -noupdate /lab5_testbench/DATA_WIDTH
add wave -noupdate /lab5_testbench/CLOCK_PERIOD
add wave -noupdate -radix unsigned -childformat {{{/lab5_testbench/address[19]} -radix unsigned} {{/lab5_testbench/address[18]} -radix unsigned} {{/lab5_testbench/address[17]} -radix unsigned} {{/lab5_testbench/address[16]} -radix unsigned} {{/lab5_testbench/address[15]} -radix unsigned} {{/lab5_testbench/address[14]} -radix unsigned} {{/lab5_testbench/address[13]} -radix unsigned} {{/lab5_testbench/address[12]} -radix unsigned} {{/lab5_testbench/address[11]} -radix unsigned} {{/lab5_testbench/address[10]} -radix unsigned} {{/lab5_testbench/address[9]} -radix unsigned} {{/lab5_testbench/address[8]} -radix unsigned} {{/lab5_testbench/address[7]} -radix unsigned} {{/lab5_testbench/address[6]} -radix unsigned} {{/lab5_testbench/address[5]} -radix unsigned} {{/lab5_testbench/address[4]} -radix unsigned} {{/lab5_testbench/address[3]} -radix unsigned} {{/lab5_testbench/address[2]} -radix unsigned} {{/lab5_testbench/address[1]} -radix unsigned} {{/lab5_testbench/address[0]} -radix unsigned}} -expand -subitemconfig {{/lab5_testbench/address[19]} {-height 15 -radix unsigned} {/lab5_testbench/address[18]} {-height 15 -radix unsigned} {/lab5_testbench/address[17]} {-height 15 -radix unsigned} {/lab5_testbench/address[16]} {-height 15 -radix unsigned} {/lab5_testbench/address[15]} {-height 15 -radix unsigned} {/lab5_testbench/address[14]} {-height 15 -radix unsigned} {/lab5_testbench/address[13]} {-color Yellow -height 15 -radix unsigned} {/lab5_testbench/address[12]} {-color Yellow -height 15 -radix unsigned} {/lab5_testbench/address[11]} {-color Yellow -height 15 -radix unsigned} {/lab5_testbench/address[10]} {-color Yellow -height 15 -radix unsigned} {/lab5_testbench/address[9]} {-color Yellow -height 15 -radix unsigned} {/lab5_testbench/address[8]} {-color Yellow -height 15 -radix unsigned} {/lab5_testbench/address[7]} {-color Yellow -height 15 -radix unsigned} {/lab5_testbench/address[6]} {-color Yellow -height 15 -radix unsigned} {/lab5_testbench/address[5]} {-color Yellow -height 15 -radix unsigned} {/lab5_testbench/address[4]} {-color Yellow -height 15 -radix unsigned} {/lab5_testbench/address[3]} {-color Cyan -height 15 -radix unsigned} {/lab5_testbench/address[2]} {-color Cyan -height 15 -radix unsigned} {/lab5_testbench/address[1]} {-color Cyan -height 15 -radix unsigned} {/lab5_testbench/address[0]} {-color Cyan -height 15 -radix unsigned}} /lab5_testbench/address
add wave -noupdate -radix hexadecimal /lab5_testbench/data_in
add wave -noupdate -color Yellow -radix hexadecimal -childformat {{{/lab5_testbench/bytemask[7]} -radix hexadecimal} {{/lab5_testbench/bytemask[6]} -radix hexadecimal} {{/lab5_testbench/bytemask[5]} -radix hexadecimal} {{/lab5_testbench/bytemask[4]} -radix hexadecimal} {{/lab5_testbench/bytemask[3]} -radix hexadecimal} {{/lab5_testbench/bytemask[2]} -radix hexadecimal} {{/lab5_testbench/bytemask[1]} -radix hexadecimal} {{/lab5_testbench/bytemask[0]} -radix hexadecimal}} -subitemconfig {{/lab5_testbench/bytemask[7]} {-color Yellow -height 15 -radix hexadecimal} {/lab5_testbench/bytemask[6]} {-color Yellow -height 15 -radix hexadecimal} {/lab5_testbench/bytemask[5]} {-color Yellow -height 15 -radix hexadecimal} {/lab5_testbench/bytemask[4]} {-color Yellow -height 15 -radix hexadecimal} {/lab5_testbench/bytemask[3]} {-color Yellow -height 15 -radix hexadecimal} {/lab5_testbench/bytemask[2]} {-color Yellow -height 15 -radix hexadecimal} {/lab5_testbench/bytemask[1]} {-color Yellow -height 15 -radix hexadecimal} {/lab5_testbench/bytemask[0]} {-color Yellow -height 15 -radix hexadecimal}} /lab5_testbench/bytemask
add wave -noupdate -color Blue /lab5_testbench/write
add wave -noupdate -color Magenta /lab5_testbench/start_access
add wave -noupdate /lab5_testbench/access_done
add wave -noupdate /lab5_testbench/data_out
add wave -noupdate /lab5_testbench/clk
add wave -noupdate /lab5_testbench/reset
add wave -noupdate /lab5_testbench/cycles
add wave -noupdate -radix hexadecimal -childformat {{{/lab5_testbench/dummy_data[7]} -radix hexadecimal -childformat {{{[7]} -radix hexadecimal} {{[6]} -radix hexadecimal} {{[5]} -radix hexadecimal} {{[4]} -radix hexadecimal} {{[3]} -radix hexadecimal} {{[2]} -radix hexadecimal} {{[1]} -radix hexadecimal} {{[0]} -radix hexadecimal}}} {{/lab5_testbench/dummy_data[6]} -radix hexadecimal} {{/lab5_testbench/dummy_data[5]} -radix hexadecimal} {{/lab5_testbench/dummy_data[4]} -radix hexadecimal} {{/lab5_testbench/dummy_data[3]} -radix hexadecimal} {{/lab5_testbench/dummy_data[2]} -radix hexadecimal} {{/lab5_testbench/dummy_data[1]} -radix hexadecimal} {{/lab5_testbench/dummy_data[0]} -radix hexadecimal}} -expand -subitemconfig {{/lab5_testbench/dummy_data[7]} {-height 15 -radix hexadecimal -childformat {{{[7]} -radix hexadecimal} {{[6]} -radix hexadecimal} {{[5]} -radix hexadecimal} {{[4]} -radix hexadecimal} {{[3]} -radix hexadecimal} {{[2]} -radix hexadecimal} {{[1]} -radix hexadecimal} {{[0]} -radix hexadecimal}}} {/lab5_testbench/dummy_data[7][7]} {-radix hexadecimal} {/lab5_testbench/dummy_data[7][6]} {-radix hexadecimal} {/lab5_testbench/dummy_data[7][5]} {-radix hexadecimal} {/lab5_testbench/dummy_data[7][4]} {-radix hexadecimal} {/lab5_testbench/dummy_data[7][3]} {-radix hexadecimal} {/lab5_testbench/dummy_data[7][2]} {-radix hexadecimal} {/lab5_testbench/dummy_data[7][1]} {-radix hexadecimal} {/lab5_testbench/dummy_data[7][0]} {-radix hexadecimal} {/lab5_testbench/dummy_data[6]} {-height 15 -radix hexadecimal} {/lab5_testbench/dummy_data[5]} {-height 15 -radix hexadecimal} {/lab5_testbench/dummy_data[4]} {-height 15 -radix hexadecimal} {/lab5_testbench/dummy_data[3]} {-height 15 -radix hexadecimal} {/lab5_testbench/dummy_data[2]} {-height 15 -radix hexadecimal} {/lab5_testbench/dummy_data[1]} {-height 15 -radix hexadecimal} {/lab5_testbench/dummy_data[0]} {-height 15 -radix hexadecimal}} /lab5_testbench/dummy_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4115976 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 162
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 5000
configure wave -gridperiod 10000
configure wave -griddelta 4
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {147478 ps} {5493641 ps}
