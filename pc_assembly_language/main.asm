ST_CODE equ 1
; numeric constant 

section .data 
    ; data segment, for initialized data
    positions db 20, 25 ; label positions
    msg db "Hello from print", 10
    msg_len equ $ - msg ; $ points to the current point at the data segment

section .bss ; block start by symbols
    ; bss segment, for uninitialized data

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

    mov eax, 1 ; syscall 1 = exit
    mov ebx, ST_CODE
    int 80h ; a software interrupt. Uses eax value as the syscall

print:
    ; this is super important, so at the end of the function it is possible to reset the stack frame to this point
    ; this is called function prologue. Setup of the stack frame
    push ebp
    mov ebp, esp
    
    ; body
    mov eax, 4 ; syscall write
    mov ebx, 1 ; fd 1 = stdout
    mov ecx, msg ; buffer
    mov edx, msg_len ; bytes count
    int 80h

    ; this is called epilogue. Cleanup of the stack frame
    mov esp, ebp
    pop ebp
    ret
