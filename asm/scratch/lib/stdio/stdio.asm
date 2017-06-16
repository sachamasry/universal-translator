;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SOURCE NAME:		stdio.asm
; CREATED ON:		20071018
; LAST UPDATED ON:	20100505
; VERSION:		0.02
; AUTHOR:		Sacha El Masry
; CREATED BY:		DevilRay
; OTHER:		Assembly library source file
;			FASM assembler
;			Intel assembly syntax
;			i386 platform, 32-bit
;			Pentium III-level instruction set
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;--------------------------------------------------------------------
;
; License:		BSD License
;
; Copyright (c) 2010, DevilRay (devilray.eu)
;
; All rights reserved
;
; Redistribution and use in source and binary forms, with or without
; modification, are permitted provided that the following conditions
; are met:
;
; - Redistributions of source code must retain the above copyright
;   notice, this list of conditions and the following disclaimer.
;
; - Redistribution in binary form must reproduce the above copyright
;   notice, this list of conditions and the following disclaimer in
;   the documentation and/or other materials provided with the 
;   distribution.
;
; - Neither the name DevilRay nor the names of its contributors
;   may be used to endorse or promote products derived from this
;   software without specific prior written permission.
;
; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND 
; CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, 
; INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
; MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE 
; DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR 
; CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
; SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
; LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
; USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
; AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
; LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
; IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
; THE POSSIBILITY OF SUCH DAMAGE.
;
;--------------------------------------------------------------------



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; LIBRARY DESCRIPTION:
;
; This library handles common input and output requirements. 
;
; In the first instance, this library is designed to handle most
; requirements in reading information from the keyboard, i.e. stdin,
; writing to the vdu, i.e. stdout, and displaying error messages on
; the terminal, i.e. stderr.
;
; Any complementary write to screen requirements are handled here, 
; allowing the writing of one character, or a sequence of one
; character, useful in presenting the user with visual feedback, 
; and in building simple user interfaces.
;
; PROCEDURE LIST: 
;
; read_stdin		Read input from stdin
; write_stdout		Write regular output to stdout
; write_stderr		Write error output to stderr
; write_space		Write a single blank character to stdout
; write_n_spaces	Write multiple blank characters to stdout
; write_tab		Write a single tab character to stdout
; write_n_tabs		Write multiple tab characters to stdout
; write_newline		Write a single line break to stdout
; write_n_newlines	Write multiple line breaks to stdout
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;---------------------------------------------------------------------
;
; ASSEMBLER PREPROCESSOR DIRECTIVES
;
; Include external files/macros/static definitions
;
; Define specific macros and static definitions
;
; Define procedures to be made publically available as well as 
; any external procedures required
;
;---------------------------------------------------------------------

format elf
use32


; Include symbolic constant definitions
;include '%DEV_INCLUDE_DEFS%/name_of_include_file.inc'


; Include externally defined macros
if defined os
  if os=0
    include '%DEV_INCLUDE_MACROS%/portability/os/bsd/system_call_macros.inc'
  else if os=1
  else if os=2
    include '%DEV_INCLUDE_MACROS%/portability/os/linux/system_call_macros.inc'
  end if
else
    include '%DEV_INCLUDE_MACROS%/portability/os/bsd/system_call_macros.inc'
end if


; Define local symbolic constants
; <const>	equ 0


; Define local macros
; macro <name_of_macro>	{}



; Define publically-available local procedures
public write_stdout


; Define externally required procedures
; extrn 'name_of_external_procedure' as alias_for_procedure



; Start of the text (code) section

section '.text' executable align 4



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 
; PROCEDURE:
;
; write_stdout
;
;
; PURPOSE:
;
; Writes supplied input to the stdout device
;
;
; PROCEDURE DESCRIPTION:
;
; This procedure opens the stdout special file handler for writing 
; to the standard output (usually the vdu), writes the length 
; specified by the calling procedure (passes as the first variable 
; on the stack), streaming the contents of the buffer at the memory 
; address specified by the calling procedure (as the last variable 
; on the stack).
;
;
; ALGORITHM DESCRIPTION:
;
; - none -
;
;
; INPUT PARAMETERS:
;
; String buffer			stack		.comm
; String length			stack		.int
;
;
; OUTPUT PARAMETERS:
;
; Output description		stack/register	output_type
;				exit statuses
;				output file(s)
;
;
;
; (ADDITIONAL) REGISTERS USED WITHIN PROCEDURE:
;
; Use for register		register
;
; - none -
;
;
; MEMORY AREAS DEFINED WITHIN PROCEDURE:
;
; Name of definition		data description
;
; - none -
;
;
; COMMENTS:
;
; Uses the write(2) system call, and writes to the stdout file handle.
;
;
; ERROR CONDITIONS, VALIDATION AND RECOVERY:
;
; List of known error conditions, boundary (or edge) problems,
; out-of-bounds value, unexpected value or unexpected data type,
; malicious parameter passing, etc.
;
; Validation rules and techniques for the above.
;
; Recovery from the above.
;
;
; EXTERNAL CALLS:
;
; - none -
;
; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

write_stdout:
	; Keep as breakpoint for debugging in gdb
	nop

	; Procedure prologue
	push	ebp
	mov	ebp, esp

	; Register protection
	; PUSH registers modified by the function
	;push	REGISTER

;	push	12(ebp)
;	push	8(ebp)
;	push	1
;	movl	eax, 4
;	push	eax
;	int	$0x80
;	addl	esp, 16


	sys_write stdout, dword [ebp + 8], dword [ebp + 12]

.end_write_stdout:
	; Register restoration
	; POP registers PUSHed at the beginning of the function
	;pop	REGISTER

	; Procedure epilogue
	mov	esp, ebp
	pop	ebp
	ret



;---------------------------------------------------------------------
;
; SECTION HEADER
;
; Define all required sections along with their attributes
;
;---------------------------------------------------------------------


; Start of the data section

;section '.data' writeable align 4

	; <--- initialised data here --->



; Start of the read-only data section

section '.rodata' align 4

	; Define reqularly required constants

space:
	db 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20 

newline:
	db 0x0a, 0x0a, 0x0a, 0x0a, 0x0a, 0x0a, 0x0a, 0x0a, 0x0a, 0x0a, 0x0a, 0x0a, 0x0a, 0x0a, 0x0a, 0x0a 

tab:
	db 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09, 0x09 



; Start of the bss section

;section '.bss' writeable align 4

	; <--- uninitialised data here --->




;#####################################################################
;
;
;
;
;######################################################################
;# read_stdin
;#
;# FUNCTION DESCRIPTION: 
;# 
;# This function opens stdin for reading standard input (i.e. from 
;# the keyboard), to the length specified by the calling procedure, 
;# saving it into the supplied buffer at the memory address 
;# specified by the calling procedure.
;#
;# ALGORITHM DESCRIPTION:
;#
;# n/a
;#
;# INPUT PARAMETERS:
;#
;# String buffer		stack		.comm
;# String length		stack		.int
;# 
;# OUTPUT PARAMETERS:
;#
;# none
;#
;# REGISTERS USED:
;#
;# none
;#
;# COMMENTS:
;#
;# Uses the read(2) system call, syscall 3 and reads from file 
;# handle 0, stdin.
;#
;# EXTERNAL CALLS:
;#
;# none
;# 
;#####################################################################
;
;.type read_stdin, @function
;.globl read_stdin
;read_stdin:
;
;	nop
;	
;	pushl	%ebp
;	movl	%esp, %ebp
;	
;	pushl	12(%ebp)
;	pushl	8(%ebp)
;	pushl	$0
;	movl	$3, %eax
;	pushl	%eax
;	int	$0x80
;	addl	$16, %esp
;
;	movl	%ebp, %esp
;	popl	%ebp
;	ret
;
;#####################################################################
;# 
;# write_stderr
;#
;# FUNCTION DESCRIPTION: 
;# 
;# This function opens stderr for writing error output to stderr, 
;# to the length specified by the calling procedure, streaming the  
;# contents of the buffer at the memory address specified by the 
;# calling procedure.
;#
;# ALGORITHM DESCRIPTION:
;#
;# n/a
;#
;# INPUT PARAMETERS:
;#
;# String buffer		stack		.comm
;# String length		stack		.int
;# 
;# OUTPUT PARAMETERS:
;#
;# none
;#
;# REGISTERS USED:
;#
;# none
;#
;# COMMENTS:
;#
;# Uses the write(2) system call, syscall 4 and writes to file handle
;# 2, stderr.
;#
;# EXTERNAL CALLS: 
;# 
;# none
;# 
;#####################################################################
;
;.type write_stderr, @function
;.globl write_stderr
;write_stderr:
;
;	nop
;
;	pushl	%ebp
;	movl	%esp, %ebp
;
;	pushl	12(%ebp)
;	pushl	8(%ebp)
;	pushl	$2
;	movl	$4, %eax
;	pushl	%eax
;	int	$0x80
;	addl	$16, %esp
;
;	movl	%ebp, %esp
;	popl	%ebp
;	ret
;
;#####################################################################
;# 
;# write_space
;#
;# FUNCTION DESCRIPTION:
;#
;# This function opens stdout and writes one blank character to it.
;#
;# ALGORITHM DESCRIPTION:
;#
;# n/a
;#
;# INPUT PARAMETERS: 
;# 
;# none
;# 
;# OUTPUT PARAMETERS:
;#
;# none
;#
;# REGISTERS USED:
;#
;# none
;#
;# COMMENTS:
;#
;# Uses the write(2) system call, syscall 4 and writes to file handle
;# 1, stdout. 
;#
;# Function stdout is not called, instead the write to 
;# stdout code is replicated. This is a sacrifice to gain speed by
;# cutting down on function calls, memory access, prologue and 
;# epilogue code, at the expense of a loss of modularity.
;#
;# EXTERNAL CALLS:
;#
;# none
;# 
;#####################################################################
;
;.type write_space, @function
;.globl write_space
;write_space:
;
;	nop
;
;	pushl	%ebp
;	movl	%esp, %ebp
;
;	pushl	$1
;	pushl	$space
;	pushl	$1
;	movl	$4, %eax
;	pushl	%eax
;	int	$0x80
;	addl	$16, %esp
;
;	movl	%ebp, %esp
;	popl	%ebp
;	ret
;
;
;#####################################################################
;# 
;# write_n_spaces
;#
;# FUNCTION DESCRIPTION:
;#
;# This function opens stdout and writes n blank characters to it,
;# where n is the parameter passed to the function, and must be a 
;# valid, unsigned integer.
;#
;# ALGORITHM DESCRIPTION:
;#
;# n/a
;#
;# INPUT PARAMETERS: 
;# 
;# Number of spaces to write	stack		.int
;# 
;# OUTPUT PARAMETERS:
;#
;# none
;#
;# REGISTERS USED:
;#
;# %ecx			Running count of number of spaces
;#
;# COMMENTS:
;#
;# Uses the write(2) system call, syscall 4 and writes to file handle
;# 1, stdout. 
;#
;# Function stdout is not called, instead the write to 
;# stdout code is replicated. Furthermore, even the write_space
;# function is not used for avoidance of clock cycles associated
;# with the additional baggage of checking the validity of the
;# passed parameter, n, merely to write one space.
;#
;# This is a sacrifice to gain speed by
;# cutting down on function calls, memory access, prologue and 
;# epilogue code, at the expense of a loss of modularity.
;#
;# ERROR CONDITIONS, VALIDATION AND RECOVERY:
;#
;# List of known error conditions, boundary (or edge) problems,
;# out-of-bounds value, unexpected value or unexpected data type,
;# malicious parameter passing, etc.
;#
;# Validation rules and techniques for the above.
;#
;# Recovery from the above.
;#
;# EXTERNAL CALLS:
;#
;# none
;# 
;#####################################################################
;
;.type write_n_spaces, @function
;.globl write_n_spaces
;write_n_spaces:
;
;	nop
;
;	pushl	%ebp
;	movl	%esp, %ebp
;
;	# Save affected register
;	pushl	%ecx
;
;	movl	8(%ebp), %ecx
;	orl	%ecx, %ecx
;	jz	.end_write_n_spaces
;
;	# Write spaces by looping through the write space routine,
;	# writing an extra space with every iteration
;
;write_space_loop:
;	pushl	$1
;	pushl	$space
;	pushl	$1
;	movl	$4, %eax
;	pushl	%eax
;	int	$0x80
;	addl	$16, %esp
;	decl	%ecx
;	orl	%ecx, %ecx
;	jnz	write_space_loop
;	
;.end_write_n_spaces:
;	# Restore affected register
;	popl	%ecx
;
;	movl	%ebp, %esp
;	popl	%ebp
;	ret
;
;
;#####################################################################
;# 
;# write_tab
;#
;# FUNCTION DESCRIPTION:
;#
;# This function opens stdout and writes one tab character to it.
;#
;# ALGORITHM DESCRIPTION:
;#
;# n/a
;#
;# INPUT PARAMETERS: 
;# 
;# none
;# 
;# OUTPUT PARAMETERS:
;#
;# none
;#
;# REGISTERS USED:
;#
;# none
;#
;# COMMENTS:
;#
;# Uses the write(2) system call, syscall 4 and writes to file handle
;# 1, stdout. 
;#
;# Function stdout is not called, instead the write to 
;# stdout code is replicated. This is a sacrifice to gain speed by
;# cutting down on function calls, memory access, prologue and 
;# epilogue code, at the expense of a loss of modularity.
;#
;# EXTERNAL CALLS:
;#
;# none
;# 
;#####################################################################
;
;.type write_tab, @function
;.globl write_tab
;write_tab:
;
;	nop
;
;	# Function prologue
;	pushl	%ebp
;	movl	%esp, %ebp
;
;	# Register protection
;	# PUSH registers modified by the function
;	#pushl	REGISTER
;
;	pushl	$1
;	pushl	$tab
;	pushl	$1
;	movl	$4, %eax
;	pushl	%eax
;	int	$0x80
;	addl	$16, %esp
;
;.end_write_tab:
;	# Register restoration
;	# POP registers PUSHed at the beginning of the function
;	#popl	REGISTER
;
;	# Function epilogue
;	movl	%ebp, %esp
;	popl	%ebp
;	ret
;
;
;
;#####################################################################
;# 
;# write_n_tabs
;#
;# FUNCTION DESCRIPTION:
;#
;# This function opens stdout and writes n tab characters to it,
;# where n is the parameter passed to the function, and must be a 
;# valid, unsigned integer.
;#
;# ALGORITHM DESCRIPTION:
;#
;# n/a
;#
;# INPUT PARAMETERS: 
;# 
;# Number of tabs to write	stack		.int
;# 
;# OUTPUT PARAMETERS:
;#
;# none
;#
;# REGISTERS USED:
;#
;# %ecx			Running count of number of spaces
;#
;# COMMENTS:
;#
;# Uses the write(2) system call, syscall 4 and writes to file handle
;# 1, stdout. 
;#
;# Function stdout is not called, instead the write to 
;# stdout code is replicated. Furthermore, even the write_tab
;# function is not used for avoidance of clock cycles associated
;# with the additional baggage of checking the validity of the
;# passed parameter, n, merely to write one space.
;#
;# This is a sacrifice to gain speed by
;# cutting down on function calls, memory access, prologue and 
;# epilogue code, at the expense of a loss of modularity.
;#
;# EXTERNAL CALLS:
;#
;# none
;# 
;#####################################################################
;
;.type write_n_tabs, @function
;.globl write_n_tabs
;write_n_tabs:
;
;	nop
;
;	pushl	%ebp
;	movl	%esp, %ebp
;
;	# Save affected register
;	pushl	%ecx
;
;	movl	8(%ebp), %ecx
;	orl	%ecx, %ecx
;	jz	.end_write_n_tabs
;
;	# Write tabs by looping through the write tab routine,
;	# writing an extra tab with every iteration
;
;write_tab_loop:
;	pushl	$1
;	pushl	$tab
;	pushl	$1
;	movl	$4, %eax
;	pushl	%eax
;	int	$0x80
;	addl	$16, %esp
;	decl	%ecx
;	orl	%ecx, %ecx
;	jnz	write_tab_loop
;	
;.end_write_n_tabs:
;	# Restore affected register
;	popl	%ecx
;
;	movl	%ebp, %esp
;	popl	%ebp
;	ret
;
;
;#####################################################################
;# 
;# write_newline
;#
;# FUNCTION DESCRIPTION:
;#
;# This function opens stdout and writes one line break character 
;# to it.
;#
;# ALGORITHM DESCRIPTION:
;#
;# n/a
;#
;# INPUT PARAMETERS: 
;# 
;# none
;# 
;# OUTPUT PARAMETERS:
;#
;# none
;#
;# REGISTERS USED:
;#
;# none
;#
;# COMMENTS:
;#
;# Uses the write(2) system call, syscall 4 and writes to file handle
;# 1, stdout. 
;#
;# Function stdout is not called, instead the write to 
;# stdout code is replicated. This is a sacrifice to gain speed by
;# cutting down on function calls, memory access, prologue and 
;# epilogue code, at the expense of a loss of modularity.
;#
;# EXTERNAL CALLS:
;#
;# none
;# 
;#####################################################################
;
;.type write_newline, @function
;.globl write_newline
;write_newline:
;
;	nop
;
;	pushl	%ebp
;	movl	%esp, %ebp
;
;	pushl	$1
;	pushl	$newline
;	pushl	$1
;	movl	$4, %eax
;	pushl	%eax
;	int	$0x80
;	addl	$16, %esp
;
;	movl	%ebp, %esp
;	popl	%ebp
;	ret
;
;
;#####################################################################
;# 
;# write_n_newlines
;#
;# FUNCTION DESCRIPTION:
;#
;# This function opens stdout and writes n newline characters to it,
;# where n is the parameter passed to the function, and must be a 
;# valid, unsigned integer.
;#
;#
;# ALGORITHM DESCRIPTION:
;#
;# n/a
;#
;#
;# INPUT PARAMETERS: 
;# 
;# Number of newlines to write	%eax		.int
;# 
;#
;# OUTPUT PARAMETERS:
;#
;# none
;#
;#
;# REGISTERS USED:
;#
;# Count of number of newlines 	%eax		.int
;# System call number		%eax		.int
;#
;#
;# COMMENTS:
;#
;# Uses the write(2) system call, syscall 4 and writes to file handle
;# 1, stdout. 
;#
;# Function stdout is not called, instead the write to 
;# stdout code is replicated. Furthermore, even the write_newline
;# function is not used for avoidance of clock cycles associated
;# with the additional baggage of checking the validity of the
;# passed parameter, n, merely to write one newline.
;#
;# This is a sacrifice to gain speed by
;# cutting down on function calls, memory access, prologue and 
;# epilogue code, at the expense of a loss of modularity.
;#
;#
;# EXTERNAL CALLS:
;#
;# none
;# 
;#####################################################################
;
;.type write_n_newlines, @function
;.globl write_n_newlines
;write_n_newlines:
;
;	nop
;
;	pushl	%ebp
;	movl	%esp, %ebp
;
;	# Save affected register
;	#pushl	%ecx
;
;	# Before proceeding, check that the %ecx register contains 
;	# a non-zero value
;	orl	%eax, %eax
;	jz	zero_n_value
;
;	cmpl	$0xf, %eax
;	jg	error_write_n_newlines
;
;
;	# Prepare for the write system call; push the desired length
;	# i.e. number of newlines to write, the newline address 
;	# and the file descriptor-stdout, write the string then 
;	# reset the esp pointer
;	pushl	%eax
;	pushl	$newline
;	pushl	$1
;	movl	$4, %eax
;	pushl	%eax
;	int	$0x80
;	addl	$16, %esp
;
;	# Clear the carry flag to return no error
;	clc
;
;
;.end_write_n_newlines:
;	# Restore affected register
;	#popl	%ecx
;
;	movl	%ebp, %esp
;	popl	%ebp
;	ret
;
;zero_n_value:
;	stc
;	movl	$-1, %eax
;	jmp	.end_write_n_newlines
;
;error_write_n_newlines:
;	stc
;	movl	$-2, %eax
;	jmp	.end_write_n_newlines
;	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 
; PROCEDURE:
;
; name_of_procedure
;
;
; PURPOSE:
;
; Synopsis of procedure and its purpose
;
;
; PROCEDURE DESCRIPTION:
;
; Detailed procedure description.
;
;
; ALGORITHM DESCRIPTION:
;
; Detailed algorithm description.
;
;
; INPUT PARAMETERS:
;
; Input description		stack/register	input_type
;				input configuration file(s)
; 
;
; OUTPUT PARAMETERS:
;
; Output description		stack/register	output_type
;				exit statuses
;				output file(s)
;
;
;
; (ADDITIONAL) REGISTERS USED WITHIN PROCEDURE:
;
; Use for register		register
;
;
; MEMORY AREAS DEFINED WITHIN PROCEDURE:
;
; Name of definition		data description
;
;
; COMMENTS:
;
; Additional procedure usage comments, pitfalls to avoid and 
; requirements to follow.
;
;
; ERROR CONDITIONS, VALIDATION AND RECOVERY:
;
; List of known error conditions, boundary (or edge) problems,
; out-of-bounds value, unexpected value or unexpected data type,
; malicious parameter passing, etc.
;
; Validation rules and techniques for the above.
;
; Recovery from the above.
;
;
; EXTERNAL CALLS:
;
; List of external calls made, or none if no calls required.
;
; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

