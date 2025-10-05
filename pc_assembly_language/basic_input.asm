section .text

extern print_buffer
extern read

global basic_input

basic_input:
    call print_buffer
    ; after this, the next instruction inside _start label is pushed to the stack (it is the return address)
    ; and then it jumps to print label
    call read 

