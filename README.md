# MIPS registers

register | assembly name | Comment
---------|---------------|------
r0       | $zero         | always 0
r1       | $at           | reserved for assembler
r2-r3    | $v0-$v1       | results
r4-r7    | $a0-$a3       | args
r8-r15   | $t0-$t7       | temporaries
r16-r23  | $s0-$s7       | saved
r24-r25  | $t8-$t9       | more temporaries
r26-r27  | $k0-$k1       | reserved by OS
r28      | $gp           | global pointer
r29      | $sp           | stack pointer
r30      | $fp           | frame pointer
r31      | $ra           | return address
f0-f31   | $f0-$f31      | floating point


# System Calls for SPIM

Service          | System Call | Arguments             | Result
-----------------|-------------|-----------------------|---------------
print\_int       | 1           | $a0 = integer         |
print\_float     | 2           | $f12 = float          |
print\_double    | 3           | $f12 = double         |
print\_string    | 4           | $a0 = string          |
read\_int        | 5           |                       | integer (in $v0)
read\_float      | 6           |                       | float (in $f0)
read\_double     | 7           |                       | double (in $f0)
read\_string     | 8           | $a0 = buffer          |
&nbsp;           |             | $a1 = length          |
sbrk             | 9           | $a0 = amount          | address (in $v0)
exit             | 10          |                       |
print\_character | 11          | $a0 = character       |
read\_character  | 12          | character (in $v0)    |
open             | 13          | $a0 = filename        | file descript (in $v0)
&nbsp;           |             | $a1 = flags           |
&nbsp;           |             | $a2 = mode            |
read             | 14          | $a0 = file descriptor | bytes read (in $v0)
&nbsp;           |             | $a1 = buffer          |
&nbsp;           |             | $a2 = count           |
write            | 15          | $a0 = file descriptor | bytes written (in $v0)
&nbsp;           |             | $a1 = buffer          |
&nbsp;           |             | $a2 = count           |
close            | 16          | $a0 = file descriptor | 0 (in $v0)
exit2            | 17          | $a0 = value           |
