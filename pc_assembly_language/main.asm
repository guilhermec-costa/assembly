%include "defs.asm"

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
    call print
    ; after this, the next instruction inside _start label is pushed to the stack (it is the return address)
    ; and then it jumps to print label
    call read 
    
    mov eax, [positions] ; move 32 bits of data starting from the positions label

    mov eax, 1 ; syscall 1 = exit
    mov ebx, ST_CODE
    syscall ; a software interrupt. Uses eax value as the syscall

print_buffer:
    PROLOGUE
    EPILOGUE

print:
    PROLOGUE

    mov eax, SYS_WRITE ; syscall write
    mov ebx, STDOUT ; fd 1 = stdout
    mov ecx, prompt ; buffer to display
    mov edx, prompt_len ; bytes count of buffer to display
    syscall

    EPILOGUE

read:
    PROLOGUE
    
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, buffer ; buffer to read from
    mov edx, 32
    syscall

    mov [bytes_read], eax ; bytes read count goes for eax

    EPILOGUE
