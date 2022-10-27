onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /ALUmini/A
add wave -noupdate -radix decimal /ALUmini/B
add wave -noupdate /ALUmini/cntrl
add wave -noupdate -radix decimal /ALUmini/result
add wave -noupdate /ALUmini/negative
add wave -noupdate /ALUmini/zero
add wave -noupdate /ALUmini/overflow
add wave -noupdate /ALUmini/carry_out
add wave -noupdate -childformat {{{/ALUmini/dut/ALU_inputs[3]} -radix decimal} {{/ALUmini/dut/ALU_inputs[2]} -radix decimal}} -expand -subitemconfig {{/ALUmini/dut/ALU_inputs[3]} {-radix decimal} {/ALUmini/dut/ALU_inputs[2]} {-radix decimal}} /ALUmini/dut/ALU_inputs
add wave -noupdate /ALUmini/dut/ALU_opSel/in
add wave -noupdate /ALUmini/dut/ALU_opSel/temp
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 2} {261434 ps} 0} {{Cursor 3} {260196 ps} 0} {{Cursor 4} {466094 ps} 0} {{Cursor 5} {460190 ps} 0}
quietly wave cursor active 4
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
WaveRestoreZoom {458486 ps} {468519 ps}
