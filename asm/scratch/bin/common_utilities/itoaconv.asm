;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SOURCE NAME:		source_name.asm
; CREATED ON:		yyyymmdd
; LAST UPDATED ON:	yyyymmdd
; VERSION:		0.01
; AUTHOR:		Author
; CREATED BY:		DevilRay
; OTHER:		Assembly program source
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
; PROGRAM SUMMARY:
;
; Summary description of program, its purpose and functioning
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
;include '%DEV_INCLUDE_MACROS%/<name_of_include_file>.inc'
include '%DEV_INCLUDE_MACROS%/portability/os/%OS%/system.inc'
include '%DEV_INCLUDE_MACROS%/stdio_macros.inc'


; Define local symbolic constants
; <const>	equ 0


; Define local macros
; macro <name_of_macro>	{}



; Define publically-available local procedures
; public name_of_procedure as 'alias_for_procedure'


; Define externally required procedures
; extrn 'name_of_external_procedure' as alias_for_procedure



; Start of the text (code) section

section '.text' executable align 4



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 
; PROGRAM:
;
; name_of_program
;
;
; PURPOSE:
;
; Synopsis of program and its purpose
;
;
; PROGRAM DESCRIPTION:
;
; Detailed program description.
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
; (ADDITIONAL) REGISTERS USED WITHIN PROGRAM:
;
; Register			data description
;
;
; MEMORY AREAS DEFINED WITHIN PROGRAM:
;
; Name of definition		data description
;
;
; COMMENTS:
;
; Additional program comments, pitfalls to avoid and 
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
; EXTERNAL MACROS USED:
;
; List of external macros used, their containing include files, and
; documentation outlining the use of the macro.
;
; macro                 => include file
;                               Synopsis of macro
;
; terminate_program	=> program_control.inc
;				Cleanly terminate runing program
;
;
; EXTERNAL DEFINITION FILES USED:
;
; List definition files externally referenced through include
; statements.
; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

public _start
_start:

	; Keep as breakpoint for debugging in gdb
	nop
	
	call	ascii_gen

recycle:
	; automatically feed data
	;rdtsc

	; manually feed data
	mov	edx, 0000008fh
	mov	eax, 966f3f3ch


	mov	edx, 0
	;mov	eax, 0fh
	mov	eax, [number_to_convert]

	mov	[bignum_hex], edx
	mov	[bignum_hex+4], eax

	xor	edx, edx
	xor	eax, eax

	call	bignum_divisor


	; bignum processing first
	mov	edx, [bignum_hex]
	mov	eax, [bignum_hex+4]

	; divide and store remainder
	div	ebx
	push	eax


	; clear edx and concentrate on the first remainder
	mov	eax, edx
	xor	edx, edx


	mov	ebx, 10
	mov	edi, bignum_ascii

	mov	ecx, 20

	call	div_by_base

	pop	eax


	test	eax,eax
	jz	skip

	xor	edx, edx

	dec	ecx

	call	div_by_base

skip:
	xor	edx, edx
	lea	esi, [bignum_ascii+ecx-1]
	or	edx, esi
	
	and	edx, 2h
	mov	eax, esi
	sub	eax, edx
	mov	eax, [eax]

	mov	ebx, [number_to_convert]

	mov	edx,[receiver+ebx*4]
	and	eax, 0ffffh
	and	edx, 0ffffh
	cmp	eax,edx
	je	skip_over
	exit_program ebx
skip_over:

	mov	[receiver], eax

	write_stdout	esi,20
	write_newline

	; loop conversion
	;mov	ecx,0ffh
	;jmp	recycle

	; < instruction code here >

.end:

	; Terminate program and return to the OS
	exit_program ebx


ascii_gen:
	; Start ascii number generation
	xor	eax, eax
	xor	ebx, ebx
	mov	ecx, 20
	lea	edi, [receiver]

loop_gen:
	mov	edx, eax
	or	edx, 030303030h

	bswap	edx

	mov	[edi+ebx*4],edx
;	lea	esi, [edi+ebx*4]
	;pusha
	;write_stdout	esi,4
	;write_space
	;popa

	inc	ebx
	inc	eax
	aaa
	loop	loop_gen
	;write_newline
	
	;lea	edi, [receiver]
	;write_stdout	edi,80
	;write_newline
	ret


bignum_divisor:
	; divisor ^ 9
	xor	edx,edx
	mov	eax,10
	mov	ebx,10
	mul	ebx
	mul	ebx
	mul	ebx
	mul	ebx
	mul	ebx
	mul	ebx
	mul	ebx
	mul	ebx
	mov	ebx, eax
	ret



div_by_base:
	div	ebx
	add	dx, 30h
	mov	byte [edi+ecx-1], dl

	test	eax, eax
	je 	done

	xor	edx, edx
	loop	div_by_base

done:
	ret




;---------------------------------------------------------------------
;
; SECTION HEADER
;
; Define all required sections along with their attributes
;
;---------------------------------------------------------------------


; Start of the data section

section '.data' writeable align 4

	; <--- initialised data here --->

bignum_hex:
	db '0' dup 8	

number_to_convert:
	db	0fh


; Start of the read-only data section

section '.rodata' align 4

	; <--- initialised read-only data here --->

; Start of the bss section

section '.bss' writeable align 4

	; <--- uninitialised data here --->

bignum_ascii:
	db 100 dup '0'

receiver:
	db 100 dup ' '
