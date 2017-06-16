  %ifdef  NetBSD
  section .note.netbsd.ident
        dd      7,4,1
        db      "NetBSD",0,0
        dd      200000000
  %endif

  %ifdef  OpenBSD
  section .note.openbsd.ident
        align   2
        dd      8,4,1
        db      "OpenBSD",0
        dd      0
        align   2
  %endif

        section .text

  %ifidn __OUTPUT_FORMAT__, macho64       ; MacOS X
        %define SYS_exit        0x2000001
        %define SYS_write       0x2000004

        global  start
        start:
  %elifidn __OUTPUT_FORMAT__, elf64
        %ifdef  UNIX            ; Solaris/OI/FreeBSD/NetBSD/OpenBSD/DragonFly
                %define SYS_exit        1
                %define SYS_write       4
        %else                   ; Linux
                %define SYS_exit        60
                %define SYS_write       1
        %endif

        global  _start
        _start:
  %else
        %error  "Unsupported platform"
  %endif

        mov     rcx, 100
        mov     r8, 3
        mov     r9, 5
        mov     r10, 15
        finit
        fbld    [increment]

for_loop: 
        fbld    [temp_bcd]
        fadd    st0,st1
        fbstp   [temp_bcd]
        dec     r8
        dec     r9
        dec     r10

check_for_fifteen:  
        cmp     r10, 0
        je      write_fizzbuzz

check_for_five: 
        cmp     r9, 0
        je      write_buzz

check_for_three:  
        cmp     r8, 0
        je      write_fizz

else:
        lea     esi, [temp_bcd]
        lea     edi, [bcd_num]
        xor     eax, eax
        mov     al, [esi]
        mov     rbx, rax

ho_digit:
        shr     al, 4
        cmp     rax, 0
        je      lo_digit
        add     ax, 0x30

lo_digit:
        and     bl, 0xf
        add     bx, 0x30
        shl     bx, 8
        add     rax, rbx
        stosw

        push    rcx
        mov     rsi, bcd_num
        mov     rdx, 2
        call    _print

        mov     rsi, space
        mov     rdx, 1
        call    _print
        pop     rcx

continue_iteration: 
        dec     rcx
        cmp     rcx, 0
        jbe     exit
        jmp     for_loop

exit:
        mov     rsi, newline
        mov     rdx, 2
        call    _print

        mov     rax, SYS_exit
        xor     rbx, rbx
        syscall

write_fizz:
        push    rcx
        mov     rsi, fizz
        mov     rdx, 5
        call    _print
        pop     rcx
        mov     r8, 3
        jmp     continue_iteration

write_buzz:
        push    rcx
        mov     rsi, buzz
        mov     rdx, 5
        call    _print
        pop     rcx
        mov     r9, 5
        jmp     continue_iteration

write_fizzbuzz:
        push    rcx
        mov     rsi, fizzbuzz
        mov     rdx, 9
        call    _print
        pop     rcx
        mov     r8, 3
        mov     r9, 5
        mov     r10, 15
        jmp     continue_iteration

  global  _print
_print:
        mov     rax, SYS_write
        mov     rdi, 1
        syscall
        ret

section .data
        space   db  " "
        newline db  10,13
        fizz    db  "Fizz "
        buzz    db  "Buzz "
        fizzbuzz  db "FizzBuzz "
        increment db	0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
        temp_bcd  db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
        bcd_num   db	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
