#####################################################################
#
# Source name:		string.s
# Created on:		20100130
# Last updated on:	20100131
# Version:		0.01
# Author:		Sacha El Masry
# Created by:		DevilRay
# Other:		Assembly library source file
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
# LIBRARY DESCRIPTION:
#
# The string library contains common string-handling functions.
#
# FUNCTION LIST: 
#
# name_of_function		Summary of function
# strlen			Finds the length of null-terminated 
#				strings (0x0)
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



# Start of the bss section

.section .bss

	# <--- uninitialised data here --->



# Start of the text section

.section .text



#####################################################################
# 
# strlen
#
#
# SYNOPSIS:
#
# strlen finds the length of null-terminated source strings
#
#
# FUNCTION DESCRIPTION:
#
# This function searches through the supplied string, looking for 
# the null-terminating character (0x0). As it traverses the string 
# byte-by-byte, it decrements the %ecx register, which is set 
# to 0xffff initially. Once the null character is found, %ecx 
# holds the remainder of the starting value. The initial value is  
# subtracted from %ecx, which is then negated for the byte position
# of the null-terminating character, which is passed back to the 
# calling procedure.
#
# Since the highest value %ecx can hold is 0xffff, the longest 
# string that may be passed to the function for consideration is 
# 65,535 characters.
#
#
# ALGORITHM DESCRIPTION:
#
# Detailed algorithm description.
#
#
# INPUT PARAMETERS:
#
# Input description		stack/register	input_type
# 
#
# OUTPUT PARAMETERS:
#
# Output description		stack/register	output_type
#				exit statuses
#
#
#
# REGISTERS USED WITHIN FUNCTION:
#
# Use for register		register
# Count-down value		%ecx
#
#
# MEMORY AREAS DEFINED WITHIN FUNCTION:
#
# Name of definition		data description
# -n/a-
#
#
# COMMENTS:
#
# Remember that this function will not return string lengths for 
# any strings longer than 65,535 characters.
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



.type strlen @function
.globl strlen
strlen:

	# Keep as breakpoint for debugging in gdb
	nop
	
	# Function prologue
	pushl	%ebp
	movl	%esp, %ebp

	# Register protection
	# PUSH registers modified by the function
	#pushl	REGISTER

	# <--- function code --->
	movl	%ebx, %edi
	movl	$0xffff, %ecx
	xorb 	%al, %al
	cld
	repne scasb
	jne unsuccessful
	subl	$0xffff, %ecx
	neg	%ecx
	dec	%ecx
	movl	%ecx, %edx
	xorl	%eax, %eax
	jmp	.end	

unsuccessful:
	stc
	movb	$0xff, %al

.end:
	# Register restoration
	# POP registers PUSHed at the beginning of the function
	#popl	REGISTER

	# Function epilogue
	movl	%ebp, %esp
	popl	%ebp
	ret
