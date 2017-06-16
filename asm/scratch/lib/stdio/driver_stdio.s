#####################################################################
#
# Source name:		test_write_stdout.s
# Created on:		20091027
# Last updated on:	10091029
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

	# Define various forms of test data to test for all possible conditions

	# Define test messages
start_message:
	.ascii	"Standard output test\n"
start_message_end:
	.equ	start_message_len, start_message_end - start_message

number:
	.byte	0x38
	.byte	0x8
	.byte	8

newline_sequence:
	.byte	0x0a, 0x0a, 0x0a, 0x0a, 0x0a

long_message:
	.ascii	"The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs.\n" 
long_message_end:
	.equ	long_message_len, long_message_end - long_message

paragraph_message:
	.ascii	"The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs.\nThe quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs.\n"
paragraph_message_end:
	.equ	paragraph_message_len, paragraph_message_end - paragraph_message

multi_screen_message:
	.ascii	"The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs.\nThe quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs.\nThe quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs.\nThe quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs.\nThe quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs.\nThe quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs.\nThe quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs.\nThe quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs.\nThe quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs.\nThe quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs.\nThe quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs.\nThe quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs.\nThe quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs.\nThe quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs.\nThe quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs.\nThe quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs.\nThe quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs.\nThe quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs.\nThe quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs.\nThe quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs. The quick brown fox jumped over the lazy dogs.\n"
multi_screen_message_end:
	.equ	multi_screen_message_len, multi_screen_message_end - multi_screen_message

zero_length_message:
	.ascii	"\n"
zero_length_message_end:
	.equ	zero_length_message_len, zero_length_message_end - zero_length_message

one_character_message:
	.ascii	"A\n"
one_character_message_end:
	.equ	one_character_message_len, one_character_message_end - one_character_message


	# Define positive numbers
zero:
	.ascii	"0\n"

one:
	.ascii	"1\n"

four:
	.ascii	"4\n"

eight:
	.ascii	"8\n"

four_bit_boundary:
	.ascii	"15\n"
four_bit_boundary_end:
	.equ four_bit_boundary_len, four_bit_boundary_end - four_bit_boundary

eight_bit_boundary:
	.ascii	"255\n"
eight_bit_boundary_end:
	.equ eight_bit_boundary_len, eight_bit_boundary_end - eight_bit_boundary

sixteen_bit_boundary:
	.ascii	"65536\n"
sixteen_bit_boundary_end:
	.equ sixteen_bit_boundary_len, sixteen_bit_boundary_end - sixteen_bit_boundary

thirty_two_bit_boundary:
	.ascii	"4294967296\n"
thirty_two_bit_boundary_end:
	.equ thirty_two_bit_boundary_len, thirty_two_bit_boundary_end - thirty_two_bit_boundary

sixty_four_bit_boundary:
	.ascii	"18446744073709551616\n"
sixty_four_bit_boundary_end:
	.equ sixty_four_bit_boundary_len, sixty_four_bit_boundary_end - sixty_four_bit_boundary



	# Define negative numbers
neg_one:
	.ascii	"-1\n"

neg_four:
	.ascii	"-4\n"

neg_eight:
	.ascii	"-8\n"


	.equ	int_eight, 8


# Start of the read-only data section

.section .rodata

	# <--- initialised read-only data here --->



# Start of the bss section

.section .bss

	# <--- uninitialised data here --->



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
#
#	movl	$0xffff, %eax
#	movl	$0xffff, %ebx
#	movl	$0xffff, %ecx
#	movl	$0xffff, %edx
#
#	# Print a simple 'starting' message, the basis of the first test
#	pushl	$start_message_len
#	pushl	$start_message
#	call	write_stdout
#	
#	# Print a message spanning multiple lines with one end-of-line character
#	# (wider than one screen width)
#	pushl	$long_message_len
#	pushl	$long_message
#	call	write_stdout
#	
#	# Print a message spanning multiple lines with many end-of-line characters
#	# (wider than one screen width)
#	pushl	$paragraph_message_len
#	pushl	$paragraph_message
#	call	write_stdout
#	
#	# Print a message spanning multiple visible screens
#	# (longer than one screen height)
#	pushl	$multi_screen_message_len
#	pushl	$multi_screen_message
#	call	write_stdout
#	
#	# Print a message of no length, with an end-of-line character
#	# (no content)
#	pushl	$zero_length_message_len
#	pushl	$zero_length_message
#	call	write_stdout
#	
#	# Print a message with a legth of exactly one
#	pushl	$one_character_message_len
#	pushl	$one_character_message
#	call	write_stdout
#	
#	pushl	$2
#	pushl	$zero
#	call	write_stdout
#
#	pushl	$2
#	pushl	$one
#	call	write_stdout
#	
#	pushl	$2
#	pushl	$four
#	call	write_stdout
#	
#	pushl	$2
#	pushl	$eight
#	call	write_stdout
#	
#	# Test other memory boundaries
#	pushl	$four_bit_boundary_len
#	pushl	$four_bit_boundary
#	call	write_stdout
#	
#	pushl	$eight_bit_boundary_len
#	pushl	$eight_bit_boundary
#	call	write_stdout
#	
#	pushl	$sixteen_bit_boundary_len
#	pushl	$sixteen_bit_boundary
#	call	write_stdout
#	
#	pushl	$thirty_two_bit_boundary_len
#	pushl	$thirty_two_bit_boundary
#	call	write_stdout
#	
#	pushl	$sixty_four_bit_boundary_len
#	pushl	$sixty_four_bit_boundary
#	call	write_stdout
#	
#	# Test with negative numbers
#	pushl	$3
#	pushl	$neg_one
#	call	write_stdout
#	
#	pushl	$3
#	pushl	$neg_four
#	call	write_stdout
#	
#	pushl	$3
#	pushl	$neg_eight
#	call	write_stdout
#	
#	pushl	$3
#	pushl	$number
#	call	write_stdout
#	
#	# Test with an ASCII sequence	

	# Test write_n_newlines
	movl	$16, %eax
	call	write_n_newlines

	#pushl	$16
	#pushl	$newline_sequence
	#call	write_stdout
	#addl	$8, %esp


.end:

	# Terminate program and return to the OS
	pushl	$0
	movl	$1, %eax
	pushl	%eax
	int	$0x80
