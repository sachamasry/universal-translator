#####################################################################
#
# Source name:		driver_stdlib-nhtoa_nibble.s
# Created on:		20100201
# Last updated on:	20100202
# Version:		0.02
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
# Copyright (c) 2010, DevilRay (devilray.eu)
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
# DRIVER SUMMARY:
#
# This driver tests the nhtoa_nibble function.
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

	# Define an array of expected ASCII values for every 
	# possible binary value in a 4-bit nibble.
	.align	4
ascii_hex_values:
	.short 	0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46


	# Define all necessary user messages

	.align	4
confirmation:
	.asciz 	"PASSED" 
confirmation_len:
	.int	. - confirmation - 1

	.align	4
failure:
	.asciz 	"FAILED"
failure_len:
	.int	. - failure - 1

	.align	4
initialisation_msg:
	.asciz	"Testing the nhtoa_nibble function library, please wait..."
initialisation_msg_len:
	.int	. - initialisation_msg - 1

	.align	4
heading:
	.asciz 	"Testing conversion of all 4-bit values to hex."
heading_len:
	.int	. - heading - 1

	.align	4
columns:
	.asciz 	"Expected:	Received:"
columns_len:
	.int	. - columns - 1

	.align	4
spacing:
	.asciz 	" 		"
spacing_len:
	.int	. - spacing - 1

	.align	4
success_msg:
	.asciz 	"PASSED: All tests on the nhtoa_nibble function have completed successfully."
success_msg_len:
	.int	. - success_msg - 1

	.align	4
general_error_msg:
	.asciz 	"FAILED: Tests on the nhtoa_nibble function have terminated-the function has returned a general error. Debug the function to find the cause of the error."
general_error_msg_len:
	.int	. - general_error_msg - 1

	.align	4
function_error_msg:
	.asciz 	"FAILED: There is a discrepancy between the expected and received values. Correct the function algorithm."
function_error_msg_len:
	.int	. - function_error_msg - 1



# Start of the bss section

.section .bss

	# <--- uninitialised data here --->



# Start of the text section

.section .text



#####################################################################
# 
# driver_stdlib-nhtoa_nibble.s
#
#
# SYNOPSIS:
#
# This driver tests the nhtoa_nibble function, and whether it 
# is able to return a general error condition, as well as a correct
# result for a conversion of a nibble to a number in the ASCII 
# representation
#
#
# DRIVER FOR FUNCTION: 
#
# nhtoa_nibble			stdlib.o
#
#
# FUNCTION DRIVER DESCRIPTION: 
#
# The nhtoa_nibble function is called repeatedly, supplied with 
# different input values in %al, testing all 16 possible inputs
# that can be represented by one nibble (4 bits), and testing the 
# returned values against an array of expected return ASCII values,
# defined in the ascii_hex_values array.
#
#
# ALGORITHM DESCRIPTION:
#
# n/a
#
#
# INPUT PARAMETERS:
#
# none
# 
#
# OUTPUT PARAMETERS:
#
# Error condition
# General error (-1)		%ebx		.int (signed)
# Function error (-2)		%ebx		.int (signed)
#
#
# REGISTERS USED:
#
# Register			data description
# %eax				Pass nibble to convert
# %ebx				General-purpose
# %ecx				Count increment
#
#
# DEFINED MEMORY AREAS:
#
# Name of definition		data description
# ascii_hex_values		Array of expected conversion values
# ...				Miscellaneous messages for 
#				interaction with user
#
#
# COMMENTS:
#
# To simulate a function failure, change any value in the array of
# expected ascii values.
#
# To simulate a general failure, set the carry flag in nhtoa_nibble 
# to simulate an error. 
#
#
# ERROR CONDITIONS, VALIDATION AND RECOVERY:
#
# The driver tests for two possible error conditions:
# - a general error produced by the nhtoa_nibble function
# - a function error caused by a mismatch between the returned and
#   expected values
#
# A general error is detected when the function returns with the 
# carry flag set. This will be reflected in a program return value 
# of -1.
#
# A function error is detected when the function returns a different
# value from the one expected, as listed in the ascii_hex_values 
# array.
#
#
# EXTERNAL CALLS:
#
# nhtoa_nibble			stdlib.s
# write_stdout			stdio.s
# write_space			stdio.s
# write_n_spaces		stdio.s
# write_tab			stdio.s
# write_n_tabs			stdio.s
# write_newline			stdio.s
# write_n_newlines		stdio.s
# 
#####################################################################



.globl _start
_start:

	# Keep as breakpoint for debugging in gdb
	nop

	# < instruction code here >
	# Save value of %ebp
	pushl	%ebp
	
	# Prepare user interface with initial messages and headings
	pushl	initialisation_msg_len
	pushl	$initialisation_msg
	call	write_stdout
	addl	$8, %esp

	pushl	$2
	call	write_n_newlines
	addl	$4, %esp

	pushl	heading_len
	pushl	$heading
	call	write_stdout
	addl	$8, %esp

	call	write_newline

	# Write column headings
	pushl	columns_len
	pushl	$columns
	call	write_stdout
	addl	$8, %esp

	call	write_newline

	# Prepare registers: %ecx as count register, %eax as value-
	# passing register
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	
next_iteration:
	# Start the loop to send the value in %al to the 
	# nhtoa_nibble function, incrementing %ecx until it reaches 
	# $0xf, the maximum range permitted by 4 bits (one nibble)
	addb	%cl, %al
	call	nhtoa_nibble

	# If the nhtoa_nibble function returns with the carry flag 
	# set, exit the loop, signal the user and terminate all 
	# further tests.
	jc	general_error

	pushl 	%eax
	movl	%esp, %ebp


	# Print the status of the test iteration; print the received
	# and expected value, as well as a passed/failed message
	# Reset %esp by adding 8 (for the two pushes) + 4 (for the 
	# previous %eax push) => 12 
	pushl	$1
	leal	ascii_hex_values(, %ecx, 2), %ebx
	pushl	%ebx
	call	write_stdout
	addl	$8, %esp

	pushl	$2
	call	write_n_tabs
	addl	$4, %esp

	pushl	$1
	pushl	%ebp
	call	write_stdout
	addl	$8, %esp

	pushl	$2
	call	write_n_tabs
	addl	$4, %esp

	movl	(%ebp), %eax
	addl	$4, %esp

	# Compare the return value against the value expected, 
	# based on the array of return values, if they do not match 
	# exit the loop, signal the user and terminate all further 
	# tests.
	cmpb	ascii_hex_values(, %ecx, 2), %al
	jne	function_error

	pushl	confirmation_len
	pushl	$confirmation
	call	write_stdout
	addl	$8, %esp

	call	write_newline

	# Reset the register %eax for the next iteration, increment 
	# the %ecx register to check for the next value in the array
	# and compare %ecx to the boundary condition of $0xf-if it 
	# is less than or equal to the boundary, jump to the 
	# beginning of the loop for one more iteration
	xorl	%eax, %eax
	inc	%cx
	cmpw	$0xf, %cx
	jle	next_iteration
	
	call	write_newline

	# Write a success message to the user, signalling the end of
	# the function tests
	pushl	success_msg_len
	pushl	$success_msg
	call	write_stdout
	addl	$8, %esp

	call	write_newline

	# Tests have completed successfully. Clear the carry flag 
	# and return a zero value in the %ebx register.
	clc
	xorl	%ebx, %ebx

	# Restore %ebx register
	popl	%ebx

	jmp 	.end



general_error:
	# If the called nhtoa_nibble function returns an error at 
	# any point, inform the user of the result of the test and 
	# terminate the driver.
	# Set the carry flag and signal general error with a value
	# of -1 in the %ebx register.

	stc
	movl	$-1, %ebx

	call	write_newline

	# Write a message informing the user of the general error 
	# and the failing of the function tests
	pushl	general_error_msg_len
	pushl	$general_error_msg
	call	write_stdout
	addl	$8, %esp

	call	write_newline
	
	jmp 	.end

function_error:
	# If the called nhtoa_nibble function returns an unexpeced  
	# value, inform the user of the discrepancy and terminate 
	# the driver.
	# Set the carry flag and signal general error with a value
	# of -2 in the %ebx register.

	stc
	movl	$-2, %ebx
	
	# Write a message informing the user of the function error
	# and the failing of the function tests
	pushl	failure_len
	pushl	$failure
	call	write_stdout
	addl	$8, %esp
	
	pushl	$2
	call	write_n_newlines
	addl	$4, %esp

	pushl	function_error_msg_len
	pushl	$function_error_msg
	call	write_stdout
	addl	$8, %esp

	call	write_newline
	call	write_stdout
	addl	$8, %esp

	jmp	.end


.end:

	# Terminate program and return control to the OS
	pushl	%ebx
	movl	$1, %eax
	pushl	%eax
	int	$0x80
