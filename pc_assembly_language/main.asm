%include "defs.inc"

extern basic_input

section .data 
    ; data segment, for initialized data
    positions db 20, 25, 30, 35 ; label positions

    prompt db "Enter some text: ", 0
    prompt_len equ $ - prompt ;$ points to the current point at the data segment


section .bss ; block start by symbols
; bss segment, for uninitialized data
    buffer resb 32
    bytes_read resb 1

section .text 
; code segment. It is where the instruction are loaded in memory when the program starts

global _start
; defines a global label. Gives external scope for the label. Allows other modules to access this label 
; labels are only nice names to reference the start of a memory location at ram 

; this main label points to the start of the instruction stored at ram
_start:
    call basic_input
    
    mov eax, [positions] ; move 32 bits of data starting from the positions label

    mov eax, SYS_EXIT ; syscall 1 = exit
    mov ebx, 1 
    syscall ; a software interrupt. Uses eax value as the syscall
