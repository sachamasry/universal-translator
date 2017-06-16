;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SOURCE NAME:		stdlib-driver.asm
; CREATED ON:		20100519
; LAST UPDATED ON:	20100519
; VERSION:		0.01
; AUTHOR:		Author
; CREATED BY:		DevilRay
; OTHER:		Assembly procedure driver
;			FASM assembler
;			Intel assembly syntax
;			i386 platform, 32-bit
;			Pentium III instruction set
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
; PROCEDURE DRIVER DESCRIPTION:
;
; Summary of procedure driver
;
;
; PROCEDURES TESTED LIST: 
;
; nhtoa_byte		Name of procedure tested
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;---------------------------------------------------------------------
;
; ASSEMBLER PREPROCESSOR DIRECTIVES
;
; Define executable format and mode
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
;include '%DEV_INCLUDE_DEFS%/<name_of_include_file>.inc'


; Include externally defined macros
include '%DEV_INCLUDE_MACROS%/stdio_macros.inc'
include '%DEV_INCLUDE_MACROS%/define_static_data.inc'


; Define local symbolic constants
; <const>	equ 0


; Define local macros
macro	check_bit_conversion	index*
{
	; Clear required registers
	xor 	ebx, ebx

	; Write expected result, followed by a tab
	add 	bl, byte [bit_ascii_rep + index]
	push	ebx
	mov	ebp, esp
	write_stdout	ebp, 1
	add	esp, 4
	write_n_tabs	2

	; Convert and write received result
	xor	eax, eax
	add	al, [bit_values + index]
	call	nbtoa_bit
	
	cmp	al, byte [bit_ascii_rep + index]
	jne	nbtoa_bit_error

	push 	eax
	mov	ebp, esp
	write_stdout	ebp, 1
	add	esp, 4
}

macro	check_nibble_conversion	index*
{
}


; Define publically-available local procedures
; public name_of_procedure as 'alias_for_procedure'


; Define externally required procedures
; extrn 'name_of_external_procedure' as alias_for_procedure
extrn nbtoa_bit
extrn nbtoa_nibble
extrn nhtoa_byte



; Start of the text (code) section

section '.text' executable



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; DRIVER:
;
; name_of_procedure_driver
;
;
; PURPOSE:
;
; Synopsis of driver and its purpose
;
;
; DRIVER FOR PROCEDURE: 
;
; procedure_name		library_name
;
;
; PROCEDURE DRIVER DESCRIPTION: 
; 
; Detailed procedure driver description.
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
; (ADDITIONAL) REGISTERS USED WITHIN DRIVER:
;
; Register			data description
;
;
; MEMORY AREAS DEFINED WITHIN DRIVER:
;
; Name of definition		data description
;
;
; COMMENTS:
;
; Additional driver usage comments, pitfalls to avoid and
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
; List of external calls made by the driver, or none if no calls 
; required.
; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

public _start
_start:

	; Keep as breakpoint for debugging in gdb
	nop

	; Write test initialisation message
;	write_stdout	bit_to_ascii_conv_msg, sizeof.bit_to_ascii_conv_msg
;	write_n_newlines	2



	; Test the nbtoa_bit procedure
	;
	; Write a user message
;	write_stdout	nbtoa_bit_conv_msg, sizeof.nbtoa_bit_conv_msg
;	write_n_newlines	2

;	write_stdout	header_expected, sizeof.header_expected
;	write_tab
;	write_stdout	header_received, sizeof.header_received
;	write_newline

	; Prepare ecx as counter of iterations of the conversion
;	xor	ecx, ecx

;iterate_through_values:
;	check_bit_conversion	ecx
;	write_newline
;	inc	ecx
;	cmp	cl, byte [no_of_bit_values]
;	jl	iterate_through_values

;	write_newline



	; Test the nbtoa_nibble procedure
	;
	;
	mov	eax, 0101b
	call nbtoa_nibble
	
	push 	eax
	mov	ebp, esp
	write_stdout	ebp, 4
	add	esp, 4
	write_newline


	;;;
	
	mov	byte [number], 00000000b

	; < driver instruction code here >
	mov	dl, [number]
	mov	al, dl
	call	nhtoa_byte
	shl	eax, 16
	bswap	eax
	mov	[hex_number_in_ascii], ax

	write_stdout	hex_number_in_ascii, 2
	write_newline

	mov	al, dl
	shr	eax, 4
	call	nbtoa_nibble
	mov	[bin_number_in_ascii], eax

	mov	al, dl
	and	eax, 000fh
	call	nbtoa_nibble
	mov	[bin_number_in_ascii + 4], eax

	write_stdout	bin_number_in_ascii, 8
	write_newline

	write_n_newlines	2
	write_stdout	test_success_msg, sizeof.test_success_msg
	write_newline
	xor	ebx, ebx

_end:
	

	; Terminate driver and return to the OS
	sys_exit	ebx

nbtoa_bit_error:
	add	ecx, 30h
	push	ecx
	push	02eh
	mov	ebp, esp
	write_stdout	ebp, 1
	add	esp, 4

	write_n_newlines	2
	write_stdout	conversion_error_msg, sizeof.conversion_error_msg
	mov	ebp, esp
	write_stdout	ebp, 1
	add	esp, 4

	write_stdout	conversion_error_msg_bit_conclusion, sizeof.conversion_error_msg_bit_conclusion

	write_newline
	jmp	testing_failure

testing_failure:
	write_newline
	write_stdout	test_failure_msg, sizeof.test_failure_msg
	write_newline

	mov	ebx, 255
	jmp	_end


;---------------------------------------------------------------------
;
; SECTION HEADER
;
; Define all required sections along with their attributes
;
;---------------------------------------------------------------------


; Start of the data section

section '.data' writeable

	; <--- initialised data here --->
number:
	db '?'

hex_number_in_ascii:
	;dw '?'
	;db 2 dup '?'
	db '7e' 

bin_number_in_ascii:
	dd 2 dup '?'


; Start of the read-only data section

section '.rodata'

	; <--- initialised read-only data here --->
no_of_bit_values:
	db 2
bit_values:
	db 0b, 01b
bit_ascii_rep:
	db 30h, 31h

no_of_nibble_values:
	db 16
nibble_values:
	db 0000b, 0001b, 0010b

	; UI messages
def_astring	header_expected, "Expected:"
def_astring	header_received, "Received:"

def_astring	bit_to_ascii_conv_msg, "Starting binary-to-ASCII conversion tests."

def_astring	nbtoa_bit_conv_msg, "Numeric single bit binary-to-ASCII conversion: "



def_astring	test_success_msg, "SUCCESS. All tests on the stdio.o procedure library have completed successfully."

def_astring	test_failure_msg, "ERROR. Some or all of the tests in this driver have failed. This likely indicates a problem with the procedure library. Correct the problem to the library file, then re-run these tests."

def_astring	conversion_error_msg, "STOP. There is a conversion error on bit "

def_astring	conversion_error_msg_bit_conclusion, " of the bit-input value."





; Start of the bss section

section '.bss' writeable

	; <--- uninitialised data here --->



