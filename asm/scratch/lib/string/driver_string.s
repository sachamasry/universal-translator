#####################################################################
#
# Source name:		test_write_stdout.s
# Created on:		20100130
# Last updated on:	20100130
# Version:		0.01
# Author:		Sacha El Masry
# Created by:		DevilRay
# Other:		Assembly program source
#			gas assembler
#			AT&T assembly syntax
#			i386 platform, 32-bit
#			Pentium III instruction set
#			OpenBSD-specific, BSD-style system calls
#
#####################################################################



#--------------------------------------------------------------------
#
# License:		BSD License
#
# Copyright (c) 2007, DevilRay (devilray.eu)
#
# All rights reserved
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
# - Redistributions of source code must retain the above copyright
#   notice, this list of conditions and the following disclaimer.
#
# - Redistribution in binary form must reproduce the above copyright
#   notice, this list of conditions and the following disclaimer in
#   the documentation and/or other materials provided with the 
#   distribution.
#
# - Neither the name DevilRay nor the names of its contributors
#   may be used to endorse or promote products derived from this
#   software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND 
# CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, 
# INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE 
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR 
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
# USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
# AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
# IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
# THE POSSIBILITY OF SUCH DAMAGE.
#
#--------------------------------------------------------------------



#####################################################################
#
# PROGRAM SUMMARY:
#
# Summary description of program, its purpose and functioning
#
#####################################################################



# OpenBSD-specific program segment prefix

.section	".note.openbsd.ident", "a"
	.p2align	2
	.long		8
	.long		4
	.long		1
	.ascii		"OpenBSD\0"
	.long		0
	.p2align	2



# Start of the data section

.section .data

	# <--- initialised data here --->


# Start of the read-only data section

.section .rodata

	# <--- initialised read-only data here --->

input_request:
	.ascii	"Please enter some text:\n"
input_request_end:
	.equ	input_request_len, input_request_end - input_request

no_of_chars:
	.ascii 	"The user-entered string length in characters, is: "
no_of_chars_end:
	.equ 	no_of_chars_len, no_of_chars_end - no_of_chars

input_feedback:
	.ascii	"You entered:\n"
input_feedback_end:
	.equ	input_feedback_len, input_feedback_end - input_feedback


# Start of the bss section

.section .bss

	# <--- uninitialised data here --->

	.lcomm  user_input, 1024
	.lcomm	user_input_len, 4



# Start of the text section

.section .text



#####################################################################
# 
# name_of_program
#
#
# PROGRAM DESCRIPTION:
#
# Detailed program description.
#
#
# ALGORITHM DESCRIPTION:
#
# Detailed algorithm description.
#
#
# INPUT PARAMETERS:
#
# Input description		
#				arguments	argument order
#				input configuration file(s)
# 
#
# OUTPUT PARAMETERS:
#
# Output description
#				exit statuses
#				output file(s)
#
#
# COMMENTS:
#
# Additional program comments, pitfalls to avoid and 
# requirements to follow.
#
#
# ERROR CONDITIONS, VALIDATION AND RECOVERY:
#
# List of known error conditions, boundary (or edge) problems,
# out-of-bounds value, unexpected value or unexpected data type,
# malicious parameter passing, etc.
#
# Validation rules and techniques for the above.
#
# Recovery from the above.
#
#
# EXTERNAL CALLS:
#
# List of external calls made, or none if no calls required.
# 
#####################################################################



.globl _start
_start:

	# Keep as breakpoint for debugging in gdb
	nop

	# Prompt user to enter a string
	pushl	$input_request_len
	pushl	$input_request
	call	write_stdout

	# Get string from user and write it in user_input buffer
	pushl	$1024
	pushl	$user_input
	call	read_stdin

	# Find actual length of user input
	movl	$user_input, %ebx
	call	strlen

	movl	%ebx, user_input_len

	call	write_newline


	# Print the calculated length of the string
	pushl	$no_of_chars_len
	pushl	$no_of_chars
	call	write_stdout

	movl	user_input_len, %eax
	call	nhtoa_nibble
	
	#jc

	pushl	$1
	push	%eax
	call	write_stdout

	call	write_newline
	call	write_newline


	# Prepare the user for feedback on the entered string
	pushl	$input_feedback_len
	pushl	$input_feedback
	call	write_stdout

	# Print the string stored in the user_input buffer
	pushl	$1024
	pushl	$user_input
	call	write_stdout
	
.end:

	# Terminate program and return to the OS
	pushl	$0
	movl	$1, %eax
	pushl	%eax
	int	$0x80
