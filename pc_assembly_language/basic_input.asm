%define LF 0Ah

section .data
    prompt db "Enter some text: ", 0
    prompt_len equ $ - prompt

section .bss
    buffer resb 32

section .text

extern print_buffer
extern read

global basic_input

basic_input:
    push dword prompt
    push dword prompt_len
    call print_buffer
    add esp, 8 ; cleanup parameters

    push dword 32
    push dword buffer
    call read
    add esp, 8
    
    push dword buffer
    push dword 32
    call print_buffer
    add esp, 8

    ret
