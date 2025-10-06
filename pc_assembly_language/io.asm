%include "defs.inc"

global print_buffer

print_buffer:
    PROLOGUE
    
    ; prompt, prompt_len, ret,   ebp
    ; ebp+12, ebp+8     , ebp+4, ebp
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, [ebp+12] ; msg 
    mov edx, [ebp+8] ; msg len 
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
