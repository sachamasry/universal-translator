#####################################################################
#
# Source name:		source_name.s
# Created on:		20100130
# Last updated on:	20100130
# Version:		0.01
# Author:		Sacha
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
no_of_parameters:
	.asciz	"Number of command-line parameters supplied to this program: "



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
# SYNOPSIS:
#
# Synopsis of program and its purpose
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
# Input description		stack/register	input_type
#				input configuration file(s)
# 
#
# OUTPUT PARAMETERS:
#
# Output description		stack/register	output_type
#				exit statuses
#				output file(s)
#
#
# REGISTERS USED:
#
# Register			data description
#
#
# DEFINED MEMORY AREAS:
#
# Name of definition		data description
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

	# < instruction code here >
	movl	(%esp), %ecx
	pushl	$1
	pushl	$no_of_parameters
	call 	stdout	

.end:

	# Terminate program and return to the OS
	pushl	$0
	movl	$1, %eax
	pushl	%eax
	int	$0x80
