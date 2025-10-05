%include "defs.inc"

global print_buffer

print_buffer:
    PROLOGUE

    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, [ebp+8] ; buf 
    mov edx, [ebp+12] ; buf len 
    syscall

    EPILOGUE

global read

read:
    PROLOGUE
    
    mov eax, SYS_READ
    mov ebx, STDIN
    mov ecx, [ebp+8]; buffer to store the value read 
    mov edx, 32 ; length
    syscall

    EPILOGUE
