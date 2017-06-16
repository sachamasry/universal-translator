# printer.s
#
# Simple program that takes a pre-determined string from a memory location in 
# either the .data or .rodata section and prints it on screen.

.section .data

	#< initialised data here >

fox:
	.asciz "The quick brown fox jumped over the lazy dogs.\n"

.section .rodata

	#< initialised read-only data here >
quick:
	.ascii "The QUICK brown fox jumped over the lazy dogs.\n"

.section .bss

	#< uninitialised data here >

.section .text
.globl _start
_start:

	#< instruction code here >
	
	nop
	#mov 	$fox, %edi
	mov 	$quick, %edi
	#pushl	$47

	movl	$0xffff, %ecx
	movb	$0, %al
	cld
	repne	scasb
	jne	notfound
	subw	$0xffff, %cx
	neg	%cx
	dec	%cx
	pushl	%ecx

	#mov	$1, %eax
	#pushl	%eax
	#int	$0x80
	

	pushl	$quick
	pushl	$2
	movl	$4, %eax
	pushl	%eax	
	int	$0x80


notfound:
	#movl	$0, %eax
	movl	$1, %eax
	pushl	%eax
	int 	$0x80

