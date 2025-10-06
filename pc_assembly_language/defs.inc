; CONSTANTS
SYS_WRITE equ 4 ; sys_write
SYS_READ equ 3 ; sys_read
SYS_EXIT equ 1; sys_exit
STDIN equ 0 ; fd = stdin
STDOUT equ 1 ; fd = stdout

; DEFINES
%define syscall int 0x80 ; defined symbol

; MACROS
%macro PROLOGUE 0
    ; this is super important, so at the end of the function it is possible to reset the stack frame to this point
    ; this is called function prologue. Setup of the stack frame
    push ebp ; stores the base address of the last stack frame
    mov ebp, esp
%endmacro

%macro EPILOGUE 0
    ; this is called epilogue. Cleanup of the stack frame
    mov esp, ebp
    pop ebp
    ret
%endmacro


