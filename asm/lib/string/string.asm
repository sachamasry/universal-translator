;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SOURCE NAME:		string.asm
; CREATED ON:		20100719
; LAST UPDATED ON:	20100719
; VERSION:		0.01
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
; This library handles the general string-processing  and handling 
; tasks commonly required by most programs.
;
; PROCEDURE LIST: 
;
; strchar		Locates a character in a string, searching
;			from the beginning
; strlen		Calculates the length of a string in memory
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
;include '%DEV_INCLUDE_DEFS%/<name_of_include_file>.inc'


; Include externally defined macros
;include '%DEV_INCLUDE_MACROS%/<name_of_include_file>.inc'
include '%DEV_INCLUDE_MACROS%/string.inc'


; Define local symbolic constants
; <const>	equ 0


; Define local macros
; macro <name_of_macro>	{}



; Define publically-available local procedures
; public name_of_procedure as 'alias_for_procedure'
public	strchar
public	strlen


; Define externally required procedures
; extrn 'name_of_external_procedure' as alias_for_procedure



; Start of the text (code) section

section '.text' executable align 4



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 
; PROCEDURE:
;
; strchar
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
; Offset of string to be	edx
; searched
; 
;
; OUTPUT PARAMETERS:
;
; Output description		stack/register	output_type
;				exit statuses
;				output file(s)
; Character number where	cx
; character found
;
;
;
; (ADDITIONAL) REGISTERS USED WITHIN PROCEDURE:
;
; Use for register		register
; Pointer to the string		edi
; being scanned
; Counter			ecx
; Hold character to search 	eax
; for
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
; EXTERNAL MACROS USED:
;
; List of external macros used, their containing include files, and
; documentation outlining the use of the macro.
;
; macro                 => include file
;                               Synopsis of macro
;
;
; EXTERNAL DEFINITION FILES USED:
;
; List definition files externally referenced through include
; statements.
; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

strchar:
	; Keep as breakpoint for debugging in gdb
	nop

	; Procedure prologue
	push	ebp
	mov	ebp, esp

	; Register protection
	; PUSH registers modified by the procedure
	; push	REGISTER

	; < procedure code here >
	strchar_macro

.end:
	; Register restoration
	; POP registers PUSHed at the beginning of the procedure
	; pop	REGISTER

	; Procedure epilogue
	mov	esp, ebp
	pop	ebp
	ret



strlen:
	; Keep as breakpoint for debugging in gdb
	nop
	
	; Procedure prologue
	push	ebp
	mov	esp, ebp

	; Register protection
	; PUSH registers modified by the procedure
	; push	REGISTER

	; < procedure code here >

;.end:
	; Register restoration
	; POP registers PUSHed at the beginning of the procedure
	; pop	REGISTER

	; Procedure epilogue
	mov	ebp, esp
	pop	ebp
	ret



;name_of_procedure:

	; Keep as breakpoint for debugging in gdb
	;nop
	
	; Procedure prologue
	;push	ebp
	;mov	esp, ebp

	; Register protection
	; PUSH registers modified by the procedure
	; push	REGISTER

	; < procedure code here >

;.end:
	; Register restoration
	; POP registers PUSHed at the beginning of the procedure
	; pop	REGISTER

	; Procedure epilogue
	;mov	ebp, esp
	;pop	ebp
	;ret



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



; Start of the read-only data section

section '.rodata' align 4

	; <--- initialised read-only data here --->



; Start of the bss section

section '.bss' writeable align 4

	; <--- uninitialised data here --->



