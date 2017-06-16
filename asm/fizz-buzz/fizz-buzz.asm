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

        mov     rcx, 1
for:
        cmp     rcx, 10
        jl      forcode
        jmp     end

forcode:
        push    rcx
        call    _fizzbuzz
        pop     rcx
        inc     rcx
        jmp     for

end:
        call    _exit

        global _print
_print:
        push    rbp
        mov     rbp, rsp

        mov     rax, SYS_write
        mov     rdi, 1
        syscall
  
        leave
        ret  
        global _exit
_exit:
        mov     rax, SYS_exit
        xor     rdi, rdi
        syscall
        global  _fizzbuzz
_fizzbuzz:  
        push    rbp
        mov     rbp, rsp
        mov     rcx, [rbp+16]

if_div_by_15:
        xor     rax, rax
        xor     rdx, rdx
        mov     eax, ecx
        mov     r9, 15
        div     r9
        cmp     rdx, 0
        jz      div_by_15

if_div_by_5:
        xor     rax, rax
        xor     rdx, rdx
        mov     eax, ecx
        mov     r9, 5
        div     r9
        cmp     rdx, 0
        jz      div_by_5

if_div_by_3:
        xor     rax, rax
        xor     rdx, rdx
        mov     eax, ecx
        mov     r9, 3
        div     r9
        cmp     rdx, 0
        jz      div_by_3

else:
        lea     r8, [ascii_numbers + rcx]
        mov     rsi, r8
        mov     rdx, 1
        call    _print
        mov     rsi, space
        mov     rdx, 1
        call    _print

        jmp     end_if_div

end_if_div: 
        leave
        ret

div_by_15:  
        mov     rsi, fizz_buzz
        mov     rdx, 8
        call    _print
        mov     rsi, space
        mov     rdx, 1
        call    _print
        jmp     end_if_div

div_by_5:
        mov     rsi, buzz
        mov     rdx, 4
        call    _print
        mov     rsi, space
        mov     rdx, 1
        call    _print
        jmp     end_if_div

div_by_3:
        lea     rsi, [fizz]
        lea     rdi, [output_string]
        cld
        mov     rcx, 4
        rep     movsb

        mov     rsi, fizz
        mov     rdx, 4
        call    _print
        mov     rsi, space
        mov     rdx, 1
        call    _print
        jmp     end_if_div

        section .data

        ascii_numbers
                db  0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39
        fizz    db  "Fizz"
        buzz    db  "Buzz"
        fizz_buzz
                db  "FizzBuzz"
        space   db  " "
        comma   db  ","
        section .bss

        align 4
        output_string resb 400
