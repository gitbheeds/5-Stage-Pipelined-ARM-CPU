onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /CPU_single_tb/clk
add wave -noupdate /CPU_single_tb/rst
add wave -noupdate -label memAddress -radix ufixed /CPU_single_tb/dut/mems/address
add wave -noupdate -radix unsigned -childformat {{{/CPU_single_tb/dut/instruction[31]} -radix unsigned} {{/CPU_single_tb/dut/instruction[30]} -radix unsigned} {{/CPU_single_tb/dut/instruction[29]} -radix unsigned} {{/CPU_single_tb/dut/instruction[28]} -radix unsigned} {{/CPU_single_tb/dut/instruction[27]} -radix unsigned} {{/CPU_single_tb/dut/instruction[26]} -radix unsigned} {{/CPU_single_tb/dut/instruction[25]} -radix unsigned} {{/CPU_single_tb/dut/instruction[24]} -radix unsigned} {{/CPU_single_tb/dut/instruction[23]} -radix unsigned} {{/CPU_single_tb/dut/instruction[22]} -radix unsigned} {{/CPU_single_tb/dut/instruction[21]} -radix unsigned} {{/CPU_single_tb/dut/instruction[20]} -radix unsigned} {{/CPU_single_tb/dut/instruction[19]} -radix unsigned} {{/CPU_single_tb/dut/instruction[18]} -radix unsigned} {{/CPU_single_tb/dut/instruction[17]} -radix unsigned} {{/CPU_single_tb/dut/instruction[16]} -radix unsigned} {{/CPU_single_tb/dut/instruction[15]} -radix unsigned} {{/CPU_single_tb/dut/instruction[14]} -radix unsigned} {{/CPU_single_tb/dut/instruction[13]} -radix unsigned} {{/CPU_single_tb/dut/instruction[12]} -radix unsigned} {{/CPU_single_tb/dut/instruction[11]} -radix unsigned} {{/CPU_single_tb/dut/instruction[10]} -radix unsigned} {{/CPU_single_tb/dut/instruction[9]} -radix unsigned} {{/CPU_single_tb/dut/instruction[8]} -radix unsigned} {{/CPU_single_tb/dut/instruction[7]} -radix unsigned} {{/CPU_single_tb/dut/instruction[6]} -radix unsigned} {{/CPU_single_tb/dut/instruction[5]} -radix unsigned} {{/CPU_single_tb/dut/instruction[4]} -radix unsigned} {{/CPU_single_tb/dut/instruction[3]} -radix unsigned} {{/CPU_single_tb/dut/instruction[2]} -radix unsigned} {{/CPU_single_tb/dut/instruction[1]} -radix unsigned} {{/CPU_single_tb/dut/instruction[0]} -radix unsigned}} -radixshowbase 0 -subitemconfig {{/CPU_single_tb/dut/instruction[31]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/instruction[30]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/instruction[29]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/instruction[28]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/instruction[27]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/instruction[26]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/instruction[25]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/instruction[24]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/instruction[23]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/instruction[22]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/instruction[21]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/instruction[20]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/instruction[19]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/instruction[18]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/instruction[17]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/instruction[16]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/instruction[15]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/instruction[14]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/instruction[13]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/instruction[12]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/instruction[11]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/instruction[10]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/instruction[9]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/instruction[8]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/instruction[7]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/instruction[6]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/instruction[5]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/instruction[4]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/instruction[3]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/instruction[2]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/instruction[1]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/instruction[0]} {-height 15 -radix unsigned -radixshowbase 0}} /CPU_single_tb/dut/instruction
add wave -noupdate -radix unsigned -childformat {{{/CPU_single_tb/dut/insts/address[63]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[62]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[61]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[60]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[59]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[58]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[57]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[56]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[55]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[54]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[53]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[52]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[51]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[50]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[49]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[48]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[47]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[46]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[45]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[44]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[43]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[42]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[41]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[40]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[39]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[38]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[37]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[36]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[35]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[34]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[33]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[32]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[31]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[30]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[29]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[28]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[27]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[26]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[25]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[24]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[23]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[22]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[21]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[20]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[19]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[18]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[17]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[16]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[15]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[14]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[13]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[12]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[11]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[10]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[9]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[8]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[7]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[6]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[5]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[4]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[3]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[2]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[1]} -radix unsigned} {{/CPU_single_tb/dut/insts/address[0]} -radix unsigned}} -subitemconfig {{/CPU_single_tb/dut/insts/address[63]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[62]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[61]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[60]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[59]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[58]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[57]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[56]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[55]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[54]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[53]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[52]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[51]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[50]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[49]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[48]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[47]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[46]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[45]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[44]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[43]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[42]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[41]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[40]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[39]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[38]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[37]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[36]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[35]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[34]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[33]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[32]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[31]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[30]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[29]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[28]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[27]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[26]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[25]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[24]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[23]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[22]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[21]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[20]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[19]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[18]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[17]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[16]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[15]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[14]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[13]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[12]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[11]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[10]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[9]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[8]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[7]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[6]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[5]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[4]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[3]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[2]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[1]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/insts/address[0]} {-height 15 -radix unsigned}} /CPU_single_tb/dut/insts/address
add wave -noupdate /CPU_single_tb/dut/pc/Rd
add wave -noupdate -radix unsigned /CPU_single_tb/dut/currPC
add wave -noupdate -radix unsigned -childformat {{{/CPU_single_tb/dut/nextPC[63]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[62]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[61]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[60]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[59]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[58]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[57]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[56]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[55]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[54]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[53]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[52]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[51]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[50]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[49]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[48]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[47]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[46]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[45]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[44]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[43]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[42]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[41]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[40]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[39]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[38]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[37]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[36]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[35]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[34]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[33]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[32]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[31]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[30]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[29]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[28]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[27]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[26]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[25]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[24]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[23]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[22]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[21]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[20]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[19]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[18]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[17]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[16]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[15]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[14]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[13]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[12]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[11]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[10]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[9]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[8]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[7]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[6]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[5]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[4]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[3]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[2]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[1]} -radix unsigned} {{/CPU_single_tb/dut/nextPC[0]} -radix unsigned}} -radixshowbase 0 -subitemconfig {{/CPU_single_tb/dut/nextPC[63]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[62]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[61]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[60]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[59]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[58]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[57]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[56]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[55]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[54]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[53]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[52]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[51]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[50]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[49]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[48]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[47]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[46]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[45]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[44]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[43]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[42]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[41]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[40]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[39]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[38]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[37]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[36]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[35]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[34]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[33]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[32]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[31]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[30]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[29]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[28]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[27]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[26]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[25]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[24]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[23]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[22]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[21]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[20]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[19]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[18]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[17]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[16]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[15]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[14]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[13]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[12]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[11]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[10]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[9]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[8]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[7]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[6]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[5]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[4]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[3]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[2]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[1]} {-height 15 -radix unsigned -radixshowbase 0} {/CPU_single_tb/dut/nextPC[0]} {-height 15 -radix unsigned -radixshowbase 0}} /CPU_single_tb/dut/nextPC
add wave -noupdate /CPU_single_tb/dut/ALU_cntrl
add wave -noupdate /CPU_single_tb/dut/branchLink
add wave -noupdate /CPU_single_tb/dut/branchReg
add wave -noupdate /CPU_single_tb/dut/branch
add wave -noupdate /CPU_single_tb/dut/memRead
add wave -noupdate /CPU_single_tb/dut/set_flags
add wave -noupdate /CPU_single_tb/dut/ALU_on
add wave -noupdate /CPU_single_tb/dut/shiftDirn
add wave -noupdate /CPU_single_tb/dut/memWrite
add wave -noupdate /CPU_single_tb/dut/memToReg
add wave -noupdate /CPU_single_tb/dut/Imm
add wave -noupdate /CPU_single_tb/dut/ALU_SH
add wave -noupdate /CPU_single_tb/dut/RegWrite
add wave -noupdate /CPU_single_tb/dut/ALU_Src
add wave -noupdate /CPU_single_tb/dut/Reg2Loc
add wave -noupdate /CPU_single_tb/dut/brTaken
add wave -noupdate /CPU_single_tb/dut/uncondBr
add wave -noupdate -radix unsigned /CPU_single_tb/dut/Rd
add wave -noupdate /CPU_single_tb/dut/Rm
add wave -noupdate -radix unsigned /CPU_single_tb/dut/Rn
add wave -noupdate /CPU_single_tb/dut/ALU_Imm
add wave -noupdate -radix hexadecimal /CPU_single_tb/dut/opcode
add wave -noupdate -radix unsigned /CPU_single_tb/dut/reggy/WriteRegister
add wave -noupdate /CPU_single_tb/dut/reggy/write_en
add wave -noupdate /CPU_single_tb/dut/reggy/WriteData
add wave -noupdate /CPU_single_tb/dut/rd1
add wave -noupdate /CPU_single_tb/dut/rd2
add wave -noupdate -radix unsigned /CPU_single_tb/dut/wd
add wave -noupdate /CPU_single_tb/dut/flagZero
add wave -noupdate /CPU_single_tb/dut/flagCarry
add wave -noupdate /CPU_single_tb/dut/flagOF
add wave -noupdate /CPU_single_tb/dut/flagNeg
add wave -noupdate -childformat {{{/CPU_single_tb/dut/mems/mem[7]} -radix unsigned} {{/CPU_single_tb/dut/mems/mem[6]} -radix unsigned} {{/CPU_single_tb/dut/mems/mem[5]} -radix unsigned} {{/CPU_single_tb/dut/mems/mem[4]} -radix unsigned} {{/CPU_single_tb/dut/mems/mem[3]} -radix unsigned} {{/CPU_single_tb/dut/mems/mem[2]} -radix unsigned} {{/CPU_single_tb/dut/mems/mem[1]} -radix unsigned} {{/CPU_single_tb/dut/mems/mem[0]} -radix unsigned}} -subitemconfig {{/CPU_single_tb/dut/mems/mem[7]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/mems/mem[6]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/mems/mem[5]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/mems/mem[4]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/mems/mem[3]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/mems/mem[2]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/mems/mem[1]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/mems/mem[0]} {-height 15 -radix unsigned}} /CPU_single_tb/dut/mems/mem
add wave -noupdate -radix sfixed /CPU_single_tb/dut/daddrExtender/out
add wave -noupdate /CPU_single_tb/dut/mems/address
add wave -noupdate /CPU_single_tb/dut/pc/bigBranchSelect/in0
add wave -noupdate /CPU_single_tb/dut/pc/bigBranchSelect/in1
add wave -noupdate /CPU_single_tb/dut/pc/bigBranchSelect/in2
add wave -noupdate /CPU_single_tb/dut/pc/bigBranchSelect/in3
add wave -noupdate /CPU_single_tb/dut/pc/bigBranchSelect/out
add wave -noupdate /CPU_single_tb/dut/pc/bigBranchSelect/sel
add wave -noupdate /CPU_single_tb/dut/pc/bigBranchSelect/int1
add wave -noupdate /CPU_single_tb/dut/pc/bigBranchSelect/int2
add wave -noupdate -childformat {{{/CPU_single_tb/dut/reggy/regOut[31]} -radix unsigned} {{/CPU_single_tb/dut/reggy/regOut[30]} -radix sfixed} {{/CPU_single_tb/dut/reggy/regOut[29]} -radix sfixed} {{/CPU_single_tb/dut/reggy/regOut[28]} -radix sfixed} {{/CPU_single_tb/dut/reggy/regOut[27]} -radix sfixed} {{/CPU_single_tb/dut/reggy/regOut[26]} -radix sfixed} {{/CPU_single_tb/dut/reggy/regOut[25]} -radix sfixed} {{/CPU_single_tb/dut/reggy/regOut[24]} -radix sfixed} {{/CPU_single_tb/dut/reggy/regOut[23]} -radix sfixed} {{/CPU_single_tb/dut/reggy/regOut[22]} -radix sfixed} {{/CPU_single_tb/dut/reggy/regOut[21]} -radix sfixed} {{/CPU_single_tb/dut/reggy/regOut[20]} -radix sfixed} {{/CPU_single_tb/dut/reggy/regOut[19]} -radix sfixed} {{/CPU_single_tb/dut/reggy/regOut[18]} -radix sfixed} {{/CPU_single_tb/dut/reggy/regOut[17]} -radix sfixed} {{/CPU_single_tb/dut/reggy/regOut[16]} -radix sfixed} {{/CPU_single_tb/dut/reggy/regOut[15]} -radix sfixed} {{/CPU_single_tb/dut/reggy/regOut[14]} -radix sfixed} {{/CPU_single_tb/dut/reggy/regOut[13]} -radix sfixed} {{/CPU_single_tb/dut/reggy/regOut[12]} -radix sfixed} {{/CPU_single_tb/dut/reggy/regOut[11]} -radix sfixed} {{/CPU_single_tb/dut/reggy/regOut[10]} -radix sfixed} {{/CPU_single_tb/dut/reggy/regOut[9]} -radix sfixed} {{/CPU_single_tb/dut/reggy/regOut[8]} -radix sfixed} {{/CPU_single_tb/dut/reggy/regOut[7]} -radix sfixed} {{/CPU_single_tb/dut/reggy/regOut[6]} -radix sfixed} {{/CPU_single_tb/dut/reggy/regOut[5]} -radix sfixed} {{/CPU_single_tb/dut/reggy/regOut[4]} -radix sfixed} {{/CPU_single_tb/dut/reggy/regOut[3]} -radix sfixed} {{/CPU_single_tb/dut/reggy/regOut[2]} -radix sfixed} {{/CPU_single_tb/dut/reggy/regOut[1]} -radix sfixed} {{/CPU_single_tb/dut/reggy/regOut[0]} -radix sfixed}} -subitemconfig {{/CPU_single_tb/dut/reggy/regOut[31]} {-height 15 -radix unsigned} {/CPU_single_tb/dut/reggy/regOut[30]} {-height 15 -radix sfixed} {/CPU_single_tb/dut/reggy/regOut[29]} {-height 15 -radix sfixed} {/CPU_single_tb/dut/reggy/regOut[28]} {-height 15 -radix sfixed} {/CPU_single_tb/dut/reggy/regOut[27]} {-height 15 -radix sfixed} {/CPU_single_tb/dut/reggy/regOut[26]} {-height 15 -radix sfixed} {/CPU_single_tb/dut/reggy/regOut[25]} {-height 15 -radix sfixed} {/CPU_single_tb/dut/reggy/regOut[24]} {-height 15 -radix sfixed} {/CPU_single_tb/dut/reggy/regOut[23]} {-height 15 -radix sfixed} {/CPU_single_tb/dut/reggy/regOut[22]} {-height 15 -radix sfixed} {/CPU_single_tb/dut/reggy/regOut[21]} {-height 15 -radix sfixed} {/CPU_single_tb/dut/reggy/regOut[20]} {-height 15 -radix sfixed} {/CPU_single_tb/dut/reggy/regOut[19]} {-height 15 -radix sfixed} {/CPU_single_tb/dut/reggy/regOut[18]} {-height 15 -radix sfixed} {/CPU_single_tb/dut/reggy/regOut[17]} {-height 15 -radix sfixed} {/CPU_single_tb/dut/reggy/regOut[16]} {-height 15 -radix sfixed} {/CPU_single_tb/dut/reggy/regOut[15]} {-height 15 -radix sfixed} {/CPU_single_tb/dut/reggy/regOut[14]} {-height 15 -radix sfixed} {/CPU_single_tb/dut/reggy/regOut[13]} {-height 15 -radix sfixed} {/CPU_single_tb/dut/reggy/regOut[12]} {-height 15 -radix sfixed} {/CPU_single_tb/dut/reggy/regOut[11]} {-height 15 -radix sfixed} {/CPU_single_tb/dut/reggy/regOut[10]} {-height 15 -radix sfixed} {/CPU_single_tb/dut/reggy/regOut[9]} {-height 15 -radix sfixed} {/CPU_single_tb/dut/reggy/regOut[8]} {-height 15 -radix sfixed} {/CPU_single_tb/dut/reggy/regOut[7]} {-height 15 -radix sfixed} {/CPU_single_tb/dut/reggy/regOut[6]} {-height 15 -radix sfixed} {/CPU_single_tb/dut/reggy/regOut[5]} {-height 15 -radix sfixed} {/CPU_single_tb/dut/reggy/regOut[4]} {-height 15 -radix sfixed} {/CPU_single_tb/dut/reggy/regOut[3]} {-height 15 -radix sfixed} {/CPU_single_tb/dut/reggy/regOut[2]} {-height 15 -radix sfixed} {/CPU_single_tb/dut/reggy/regOut[1]} {-height 15 -radix sfixed} {/CPU_single_tb/dut/reggy/regOut[0]} {-height 15 -radix sfixed}} /CPU_single_tb/dut/reggy/regOut
add wave -noupdate -radix unsigned /CPU_single_tb/dut/targetReg
add wave -noupdate -radix unsigned /CPU_single_tb/dut/aloo/A
add wave -noupdate -radix unsigned /CPU_single_tb/dut/aloo/B
add wave -noupdate /CPU_single_tb/dut/aloo/cntrl
add wave -noupdate -radix sfixed /CPU_single_tb/dut/aloo/result
add wave -noupdate /CPU_single_tb/dut/aloo/overflow
add wave -noupdate /CPU_single_tb/dut/aloo/negative
add wave -noupdate /CPU_single_tb/dut/aloo/zero
add wave -noupdate /CPU_single_tb/dut/aloo/carry_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {70000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 342
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
WaveRestoreZoom {0 ps} {230672 ps}
