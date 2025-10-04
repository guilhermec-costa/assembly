ST_CODE equ 1 ; numeric constant 

section .data: ; data segment, for initialized data
    positions db 20, 25 ; label positions

section .text: ; code segment. It is where the instruction are loaded in memory when the program starts

global _start; defines a global label. Gives external scope for the label. Allows other modules to access this label 
; labels are only nice names to reference the start of a memory location at ram 

; this main label points to the start of the instruction stored at ram
_start:
    mov eax, 1 ; syscall 1 = exit
    mov ebx, ST_CODE
    int 80h ; a software interrupt. Uses eax value as the syscall


