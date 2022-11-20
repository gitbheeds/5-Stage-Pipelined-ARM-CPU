onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /CPU_single_tb/clk
add wave -noupdate /CPU_single_tb/dut/ALU_cntrl
add wave -noupdate /CPU_single_tb/dut/compZero
add wave -noupdate /CPU_single_tb/dut/branchLink
add wave -noupdate /CPU_single_tb/dut/branchReg
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
add wave -noupdate /CPU_single_tb/dut/Rd
add wave -noupdate /CPU_single_tb/dut/Rm
add wave -noupdate /CPU_single_tb/dut/Rn
add wave -noupdate /CPU_single_tb/dut/opcode
add wave -noupdate /CPU_single_tb/dut/flagNeg
add wave -noupdate /CPU_single_tb/dut/flagOF
add wave -noupdate /CPU_single_tb/dut/flagCarry
add wave -noupdate /CPU_single_tb/dut/flagZero
add wave -noupdate /CPU_single_tb/dut/insts/address
add wave -noupdate /CPU_single_tb/dut/instruction
add wave -noupdate /CPU_single_tb/dut/currPC
add wave -noupdate /CPU_single_tb/dut/rd1
add wave -noupdate /CPU_single_tb/dut/rd2
add wave -noupdate /CPU_single_tb/dut/reggy/regOut
add wave -noupdate /CPU_single_tb/dut/wd
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {97173611 ps} 0}
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
WaveRestoreZoom {0 ps} {1049475 ns}
