#
# Hardware spi module
#

.globl ___sys_hspiex
.type ___sys_hspiex, @function


#================================================
# C-prototype:
# char __sys_hspiex(void *spidomain, char value)
#
#================================================

#
# internal_hspiex
#
# Inputs:
# - R0: [15:8]=0; [7:0] - input byte
# - R3: mosi-port address
#
# Outputs:
# - R0: [15:8]=0; [7:0] - output byte
#
# Register usage: none
#
internal_hspiex:
    movb    r0, (r3)                #
    movb    1, 1(r3)                #
    nop                             # delay
    nop
    nop
    nop
    movb    2(r3), r0               #
    rts     pc                      # return

___sys_hspiex:
    mov     r0, -(sp)               # save r0
    mov     r3, -(sp)               # save r3
    movb    12(sp), r0              # move argument to r0
    mov     10(sp), r3              # preset mosiport address
    jsr     pc, internal_hspiex
    mov     (sp)+, r3               # load r3
    add     2, sp                   # do not load r0
    rts     pc                      # result in r0
