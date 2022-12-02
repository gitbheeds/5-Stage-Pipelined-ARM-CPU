onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix sfixed /bc_tb/branchSE_EX
add wave -noupdate -radix unsigned /bc_tb/resultALU
add wave -noupdate -radix unsigned /bc_tb/currPC_reg_EX
add wave -noupdate /bc_tb/uncondBr_EX
add wave -noupdate /bc_tb/branchReg_EX
add wave -noupdate /bc_tb/branch_EX
add wave -noupdate /bc_tb/zeroFlag
add wave -noupdate /bc_tb/negFlag
add wave -noupdate /bc_tb/opcode
add wave -noupdate /bc_tb/PCSrc
add wave -noupdate -radix unsigned /bc_tb/dut/pcBranch
add wave -noupdate -radix unsigned -childformat {{{/bc_tb/calcBranch[63]} -radix unsigned} {{/bc_tb/calcBranch[62]} -radix unsigned} {{/bc_tb/calcBranch[61]} -radix unsigned} {{/bc_tb/calcBranch[60]} -radix unsigned} {{/bc_tb/calcBranch[59]} -radix unsigned} {{/bc_tb/calcBranch[58]} -radix unsigned} {{/bc_tb/calcBranch[57]} -radix unsigned} {{/bc_tb/calcBranch[56]} -radix unsigned} {{/bc_tb/calcBranch[55]} -radix unsigned} {{/bc_tb/calcBranch[54]} -radix unsigned} {{/bc_tb/calcBranch[53]} -radix unsigned} {{/bc_tb/calcBranch[52]} -radix unsigned} {{/bc_tb/calcBranch[51]} -radix unsigned} {{/bc_tb/calcBranch[50]} -radix unsigned} {{/bc_tb/calcBranch[49]} -radix unsigned} {{/bc_tb/calcBranch[48]} -radix unsigned} {{/bc_tb/calcBranch[47]} -radix unsigned} {{/bc_tb/calcBranch[46]} -radix unsigned} {{/bc_tb/calcBranch[45]} -radix unsigned} {{/bc_tb/calcBranch[44]} -radix unsigned} {{/bc_tb/calcBranch[43]} -radix unsigned} {{/bc_tb/calcBranch[42]} -radix unsigned} {{/bc_tb/calcBranch[41]} -radix unsigned} {{/bc_tb/calcBranch[40]} -radix unsigned} {{/bc_tb/calcBranch[39]} -radix unsigned} {{/bc_tb/calcBranch[38]} -radix unsigned} {{/bc_tb/calcBranch[37]} -radix unsigned} {{/bc_tb/calcBranch[36]} -radix unsigned} {{/bc_tb/calcBranch[35]} -radix unsigned} {{/bc_tb/calcBranch[34]} -radix unsigned} {{/bc_tb/calcBranch[33]} -radix unsigned} {{/bc_tb/calcBranch[32]} -radix unsigned} {{/bc_tb/calcBranch[31]} -radix unsigned} {{/bc_tb/calcBranch[30]} -radix unsigned} {{/bc_tb/calcBranch[29]} -radix unsigned} {{/bc_tb/calcBranch[28]} -radix unsigned} {{/bc_tb/calcBranch[27]} -radix unsigned} {{/bc_tb/calcBranch[26]} -radix unsigned} {{/bc_tb/calcBranch[25]} -radix unsigned} {{/bc_tb/calcBranch[24]} -radix unsigned} {{/bc_tb/calcBranch[23]} -radix unsigned} {{/bc_tb/calcBranch[22]} -radix unsigned} {{/bc_tb/calcBranch[21]} -radix unsigned} {{/bc_tb/calcBranch[20]} -radix unsigned} {{/bc_tb/calcBranch[19]} -radix unsigned} {{/bc_tb/calcBranch[18]} -radix unsigned} {{/bc_tb/calcBranch[17]} -radix unsigned} {{/bc_tb/calcBranch[16]} -radix unsigned} {{/bc_tb/calcBranch[15]} -radix unsigned} {{/bc_tb/calcBranch[14]} -radix unsigned} {{/bc_tb/calcBranch[13]} -radix unsigned} {{/bc_tb/calcBranch[12]} -radix unsigned} {{/bc_tb/calcBranch[11]} -radix unsigned} {{/bc_tb/calcBranch[10]} -radix unsigned} {{/bc_tb/calcBranch[9]} -radix unsigned} {{/bc_tb/calcBranch[8]} -radix unsigned} {{/bc_tb/calcBranch[7]} -radix unsigned} {{/bc_tb/calcBranch[6]} -radix unsigned} {{/bc_tb/calcBranch[5]} -radix unsigned} {{/bc_tb/calcBranch[4]} -radix unsigned} {{/bc_tb/calcBranch[3]} -radix unsigned} {{/bc_tb/calcBranch[2]} -radix unsigned} {{/bc_tb/calcBranch[1]} -radix unsigned} {{/bc_tb/calcBranch[0]} -radix unsigned}} -subitemconfig {{/bc_tb/calcBranch[63]} {-radix unsigned} {/bc_tb/calcBranch[62]} {-radix unsigned} {/bc_tb/calcBranch[61]} {-radix unsigned} {/bc_tb/calcBranch[60]} {-radix unsigned} {/bc_tb/calcBranch[59]} {-radix unsigned} {/bc_tb/calcBranch[58]} {-radix unsigned} {/bc_tb/calcBranch[57]} {-radix unsigned} {/bc_tb/calcBranch[56]} {-radix unsigned} {/bc_tb/calcBranch[55]} {-radix unsigned} {/bc_tb/calcBranch[54]} {-radix unsigned} {/bc_tb/calcBranch[53]} {-radix unsigned} {/bc_tb/calcBranch[52]} {-radix unsigned} {/bc_tb/calcBranch[51]} {-radix unsigned} {/bc_tb/calcBranch[50]} {-radix unsigned} {/bc_tb/calcBranch[49]} {-radix unsigned} {/bc_tb/calcBranch[48]} {-radix unsigned} {/bc_tb/calcBranch[47]} {-radix unsigned} {/bc_tb/calcBranch[46]} {-radix unsigned} {/bc_tb/calcBranch[45]} {-radix unsigned} {/bc_tb/calcBranch[44]} {-radix unsigned} {/bc_tb/calcBranch[43]} {-radix unsigned} {/bc_tb/calcBranch[42]} {-radix unsigned} {/bc_tb/calcBranch[41]} {-radix unsigned} {/bc_tb/calcBranch[40]} {-radix unsigned} {/bc_tb/calcBranch[39]} {-radix unsigned} {/bc_tb/calcBranch[38]} {-radix unsigned} {/bc_tb/calcBranch[37]} {-radix unsigned} {/bc_tb/calcBranch[36]} {-radix unsigned} {/bc_tb/calcBranch[35]} {-radix unsigned} {/bc_tb/calcBranch[34]} {-radix unsigned} {/bc_tb/calcBranch[33]} {-radix unsigned} {/bc_tb/calcBranch[32]} {-radix unsigned} {/bc_tb/calcBranch[31]} {-radix unsigned} {/bc_tb/calcBranch[30]} {-radix unsigned} {/bc_tb/calcBranch[29]} {-radix unsigned} {/bc_tb/calcBranch[28]} {-radix unsigned} {/bc_tb/calcBranch[27]} {-radix unsigned} {/bc_tb/calcBranch[26]} {-radix unsigned} {/bc_tb/calcBranch[25]} {-radix unsigned} {/bc_tb/calcBranch[24]} {-radix unsigned} {/bc_tb/calcBranch[23]} {-radix unsigned} {/bc_tb/calcBranch[22]} {-radix unsigned} {/bc_tb/calcBranch[21]} {-radix unsigned} {/bc_tb/calcBranch[20]} {-radix unsigned} {/bc_tb/calcBranch[19]} {-radix unsigned} {/bc_tb/calcBranch[18]} {-radix unsigned} {/bc_tb/calcBranch[17]} {-radix unsigned} {/bc_tb/calcBranch[16]} {-radix unsigned} {/bc_tb/calcBranch[15]} {-radix unsigned} {/bc_tb/calcBranch[14]} {-radix unsigned} {/bc_tb/calcBranch[13]} {-radix unsigned} {/bc_tb/calcBranch[12]} {-radix unsigned} {/bc_tb/calcBranch[11]} {-radix unsigned} {/bc_tb/calcBranch[10]} {-radix unsigned} {/bc_tb/calcBranch[9]} {-radix unsigned} {/bc_tb/calcBranch[8]} {-radix unsigned} {/bc_tb/calcBranch[7]} {-radix unsigned} {/bc_tb/calcBranch[6]} {-radix unsigned} {/bc_tb/calcBranch[5]} {-radix unsigned} {/bc_tb/calcBranch[4]} {-radix unsigned} {/bc_tb/calcBranch[3]} {-radix unsigned} {/bc_tb/calcBranch[2]} {-radix unsigned} {/bc_tb/calcBranch[1]} {-radix unsigned} {/bc_tb/calcBranch[0]} {-radix unsigned}} /bc_tb/calcBranch
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2627 ps} 0}
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
WaveRestoreZoom {0 ps} {11025 ps}