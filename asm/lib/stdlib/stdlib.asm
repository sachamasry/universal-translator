;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SOURCE NAME:		stdlib.asm
; CREATED ON:		20100201
; LAST UPDATED ON:	20100201
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
; This is a general purpose standard library consisting of various 
; procedures, including conversions.
;
; PROCEDURE LIST: 
;
; name_of_procedure		Summary of procedure
;
; nhtoa_nibble			Converts any hex number to ASCII 
;				representation
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
include '%DEV_INCLUDE_MACROS%/type_conversion.inc'


; Define local symbolic constants
; <const>	equ 0


; Define local macros
; macro <name_of_macro>	{}



; Define publically-available local procedures
public nbtoa_bit
public nbtoa_nibble

public nhtoa_nibble
public nhtoa_byte


; Define externally required procedures
; extrn 'name_of_external_procedure' as alias_for_procedure



; Start of the text (code) section

section '.text' executable align 4


nbtoa_bit:
;	and	eax, 1h
	nbtoa_bit_macro eax

_end_nbtoa_bit:
	ret




nbtoa_nibble:

	; Keep as breakpoint for debugging in gdb
	;nop
	
	; Procedure prologue
	;push	ebp
	;mov	esp, ebp

	; Register protection
	; PUSH registers modified by the procedure
	; push	REGISTER

;	xor	ebx, ebx
;	mov	ecx, 4
;bit_to_ascii_loop:
;	shl	ebx, 7
;	rcr	eax, 1
;	rcl	ebx, 1
;	add	bl, 30h
;	loop	bit_to_ascii_loop

;	mov	eax, ebx

	nbtoa_nibble_macro eax

.end_nbtoa_nibble:
	; Register restoration
	; POP registers PUSHed at the beginning of the procedure
	; pop	REGISTER

	; Procedure epilogue
	;mov	ebp, esp
	;pop	ebp
	ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 
; PROCEDURE:
;
; nhtoa_nibble
;
;
; PURPOSE:
;
; Takes any nibble (4-bit number) and converts it to a number in 
; ASCII representation.
;
;
; PROCEDURE DESCRIPTION:
;
; Hex to ASCII takes a one-nibble (4-bit) input in al, and 
; converts the underlying hexadecimal (binary) value, converting 
; it to its equivalent in ASCII representation.
;
; It does this using only three instructions, not including the 
; loading and calling overhead, requiring approximately 4 clock 
; cycles.
;
;
; ALGORITHM DESCRIPTION:
;
; The principle of the conversion algorithm is very simple:
;
; 1. Is al less than 10?
; 2. If yes, add 0x30
; 3. If not, add 0x41
;
; In code this is done using trickery. The initial value is compared
; to 10, and if it is less, the carry flag will be set.
; Then a subtract with borrow instruction is used on al, and if the
; carry flag was set, an additional 0x1 is subtracted.
; Finally, a DAS instruction is performed on al, effectively 
; subtracting 0x66 if the value was less than 10, and 0x60 if it was
; greater, leaving 0x30-0x39 for 0x0-0x9 input nibble, and 0x41-0x46
;
;
; INPUT PARAMETERS:
;
; Input description		stack/register	input_type
;				input configuration file(s)
; 
; Input nibble			al	 	raw binary/hex
;
;
; OUTPUT PARAMETERS:
;
; Output description		stack/register	output_type
;				exit statuses
;				output file(s)
;
; ASCII representation of value	al		ascii
; Error condition (-1)		ax		word
;
;
; (ADDITIONAL) REGISTERS USED WITHIN PROCEDURE:
;
; Use for register		register
;
; Input nibble			eax
; Return code/error code	eax
;
;
; MEMORY AREAS DEFINED WITHIN PROCEDURE:
;
; Name of definition		data description
;
; - no memory areas defined -
;
;
; COMMENTS:
;
; Note that this function is suitable only for the conversion of 
; one nibble to ASCII. For any numerical sequences longer than one 
; nibble, use other numeric conversion functions.
;
;
; ERROR CONDITIONS, VALIDATION AND RECOVERY:
;
; The function is passed a value in one nibble. One nibble (4 bits) 
; allows for 16 (4^2) combinations-precisely the range of the 
; hexadecimal system within one digit. Thus, no matter what value 
; is passed, it can be converted to an ASCII representation of a 
; hexadecimal digit. No errors are possible in the input value.
;
; As a result, no validation needs to be performed on the input 
; value.
;
; No validation needs to be performed on the result of the function 
; and the value will always be passed back to the callee with the 
; carry flag cleared.
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
; - no external definitions used -
; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

nhtoa_nibble:

	; Keep as breakpoint for debugging in gdb
	;nop
	
	; Procedure prologue
	;push	ebp
	;mov	esp, ebp

	; Register protection
	; PUSH registers modified by the procedure
	; push	REGISTER

	cmp	al, 10
	sbb	al, 0x69
	das
	clc

.end_nhtoa_nibble:
	; Register restoration
	; POP registers PUSHed at the beginning of the procedure
	; pop	REGISTER

	; Procedure epilogue
	;mov	ebp, esp
	;pop	ebp
	ret


nhtoa_byte:

	; Keep as breakpoint for debugging in gdb
	;nop
	
	; Procedure prologue
	;push	ebp
	;mov	esp, ebp

	; Register protection
	; PUSH registers modified by the procedure
	; push	REGISTER

	mov	ebx, eax
	and	ebx, 000fh

	shr	eax, 4

	cmp	al, 10
	sbb	al, 0x69
	das
	clc

	shl	eax, 8
	;mov	ax, bx
	or	ax, bx

	cmp	al, 10
	sbb	al, 0x69
	das
	clc

.end_nhtoa_byte:
	; Register restoration
	; POP registers PUSHed at the beginning of the procedure
	; pop	REGISTER

	; Procedure epilogue
	;mov	ebp, esp
	;pop	ebp
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

;section '.rodata' align 4

	; <--- initialised read-only data here --->



; Start of the bss section

;section '.bss' writeable align 4

	; <--- uninitialised data here --->
