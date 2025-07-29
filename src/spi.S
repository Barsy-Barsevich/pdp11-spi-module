
.equ mosiport, 0x1234
.equ misoport, 0x1236

.globl ___sys_spiex
.type ___sys_spiex, @function


#================================================
# C-prototype:
# char __sys_spiex(char value)
#
# MOSI-port:
# 1: SCK, 0: MOSI
# MISO-port:
# 0: MISO
#================================================

#
# internal_spiex
#
# Inputs:
# - R0: [15:8]=0; [7:0] - input byte
# - R3: mosi-port address
#
# Outputs:
# - R0: [15:8]=0; [7:0] - output byte
#
# Register usage: R1, R2
# 
.equ miso_rel_mosi, misoport-mosiport
internal_spiex:
    swab    r0
    mov     8, r2                   # counter preset
    clc                             # clear carry
__spiex_cycle:
    rol     r0
    clr     r1
    rol     r1
    movb    r1, (r3)                # sck:=0, mosi:=...
    add     2, r1
    movb    r1, (r3)                # sck:=1, mosi:=...
    movb    miso_rel_mosi(r3), r1   # r1[0]:=miso
    ror     r1
    sob     r2, __spiex_cycle
    rol     r0
    rts     pc                      # return

___sys_spiex:
    mov     r0, -(sp)               # save r0
    mov     r1, -(sp)               # save r1
    mov     r2, -(sp)               # save r2
    mov     r3, -(sp)               # save r3
    movb    10(sp), r0              # move argument to r0
    mov     mosiport, r3            # preset mosiport address
    jsr     pc, internal_spiex
    mov     (sp)+, r3               # load r3
    mov     (sp)+, r2               # load r2
    mov     (sp)+, r1               # load r1
    add     2, sp                   # do not load r0
    rts     pc                      # result in r0
