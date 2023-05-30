jal x1, MAIN
i:
data 0 * 1
io:
data 0 * 1
a:
data 0 * 1
ab:
data 0 * 1
MAIN:
addi x2, x0, 12
sub x1, x0, x2
sw x0, 1, x1
START_CYCLE_0:
lw x1, x0, 1
addi x2, x0, 10
bge x1, x2, END_CYCLE_0
beq x1, x2, END_CYCLE_0
lw x2, x0, 1
addi x4, x0, 1
xori x3, x4, 4095
sub x1, x2, x3
sw x0, 1, x1
jal x1, START_CYCLE_0
END_CYCLE_0:
ebreak
