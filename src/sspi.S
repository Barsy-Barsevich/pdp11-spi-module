#
# Software spi module
#

.globl ___sys_sspiex
.globl ___sys_sspisend_arr

.type ___sys_sspiex, @function
.type ___sys_sspisend_arr, @function


#================================================
# C-prototype:
# char __sys_sspiex(char *mosiport, char value)
#
# MOSI-port:
# 1: SCK, 0: MOSI
# MISO-port:
# 0: MISO
#================================================

#
# internal_sspiex
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
internal_sspiex:
    swab    r0
    mov     8, r2                   # counter preset
    clc                             # clear carry
__sspiex_cycle:
    rol     r0
    clr     r1
    rol     r1
    movb    r1, (r3)                # sck:=0, mosi:=...
    add     2, r1
    movb    r1, (r3)                # sck:=1, mosi:=...
    movb    2(r3), r1               # r1[0]:=miso
    ror     r1
    sob     r2, __sspiex_cycle
    rol     r0
    rts     pc                      # return


#
# sspisend_arr
#
# Inputs:
# - R3: mosi-port address
# - R5: source array address
#
# Outputs: none
#
# Register usage: all
#
sspisend_arr:
    


# 
# C-callable __sys_sspiex
# 
___sys_sspiex:
    mov     r0, -(sp)               # save r0
    mov     r1, -(sp)               # save r1
    mov     r2, -(sp)               # save r2
    mov     r3, -(sp)               # save r3
    movb    12(sp), r0              # move argument to r0
    mov     10(sp), r3              # preset mosiport address
    jsr     pc, internal_sspiex
    mov     (sp)+, r3               # load r3
    mov     (sp)+, r2               # load r2
    mov     (sp)+, r1               # load r1
    add     2, sp                   # do not load r0
    rts     pc                      # result in r0


#
# C-callable __sys_sspisend_arr
#
___sys_sspisend_arr:
    mov     r0, -(sp)
    mov     r1, -(sp)
    mov     r2, -(sp)
    mov     r3, -(sp)
    mov     r4, -(sp)
    mov     r5, -(sp)
    mov     14(sp), r3              # preset mosiport address
    mov     18(sp), r4              # preset array length
    mov     16(sp), r5              # preset array startaddress
    jsr     pc, sspisend_arr
    mov     (sp)+, r5
    mov     (sp)+, r4
    mov     (sp)+, r3
    mov     (sp)+, r2
    mov     (sp)+, r1
    mov     (sp)+, r0
    rts     pc
