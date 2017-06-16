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
include '%DEV_INCLUDE_MACROS%/portability/os/%OS%/system.inc'
include '%DEV_INCLUDE_MACROS%/stdio_macros.inc'
include '%DEV_INCLUDE_MACROS%/type_conversion.inc'


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

	; < instruction code here >

	mov	ebp, esp
	add	ebp, 12

env_lookup_loop:
	cmp	dword [ebp], 0
	je	_end
	
	mov	edx, dword [ebp]
	call	string_length
	write_stdout	dword [ebp], ecx
	write_newline
	add	ebp, 4
	loop	env_lookup_loop


test_string_length:
;	mov	ebp, string
;	call	string_length
;	mov	edx,ecx
;	nbtoau_word	print

	;mov	eax, ecx
	;mov	eax, 337
	;num_to_ascii	eax

	;mov	edx,350
	
	;push	edx
	;push	edi
	;lea	esi, [esp+4]
	;write_stdout	esi, 1
	;lea	esi, [esp]
	;write_stdout	esi, 4
	write_newline
	

	;mov	eax, 31
	;push	eax
	;mov	byte [number], 31
	;push	number

	;mov	eax, 21
	;mov	edx, 31
	;mov	ecx, 16
	;div	ecx

	xor	ebx, ebx
	;add	bx, cx
	;add	bx, dx
	;add	bx, ax
notfound:
	;mov	ebx, 255
_end:

	; Terminate program and return to the OS
	exit_program ebx

	



string_length:
	mov	edi, edx
	mov	ecx, 0ffffh
	xor	ax, ax
	cld
	repne	scasb
	jne 	notfound
	sub	cx, 0ffffh
	neg	cx
	dec 	cx
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
string	db "tim is a dog. And, like a dog he barks more than he is able to bite, so to speak. It was ona day like this that he happened to stand in Mary's shadow. It was Mary's first visit to the big city, and she glowed with the radiance of an innocent and transplanted bystander, in this din of cars, horns and barking. To a dog, she was angellic.", 0


number:
	db 2 dup 0

; Start of the read-only data section

section '.rodata' align 4

	; <--- initialised read-only data here --->



; Start of the bss section

section '.bss' writeable align 4

	; <--- uninitialised data here --->



