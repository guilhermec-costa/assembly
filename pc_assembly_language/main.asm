%include "defs.inc"

section .data 
; data segment, for initialized data

section .bss ; block start by symbols
; bss segment, for uninitialized data

section .text 
; code segment. It is where the instruction are loaded in memory when the program starts

extern basic_input


global _start
; defines a global label. Gives external scope for the label. Allows other modules to access this label 
; labels are only nice names to reference the start of a memory location at ram 

; this main label points to the start of the instruction stored at ram
_start:
    call basic_input

    mov eax, SYS_EXIT ; syscall 1 = exit
    mov ebx, 1 
    syscall ; a software interrupt. Uses eax value as the syscall
