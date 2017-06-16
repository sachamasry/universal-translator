;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SOURCE NAME:		driver-string.asm
; CREATED ON:		20100719
; LAST UPDATED ON:	20100719
; VERSION:		0.01
; AUTHOR:		Sacha El Masry
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


; Define local symbolic constants
; <const>	equ 0


; Define local macros
; macro <name_of_macro>	{}



; Define publically-available local procedures
; public name_of_procedure as 'alias_for_procedure'


; Define externally required procedures
; extrn 'name_of_external_procedure' as alias_for_procedure
extrn	strchar



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
	mov	ax, '='
	mov	edx, ascii_table
	call	strchar

.end:
	movzx	ebx, cx
	; Terminate program and return to the OS
	exit_program ebx



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

	; Define ascii reference table as lookup for strchar function-
	; the result of a character lookup should be the character's
	; hex value
ascii_table:
	db 00h, 01h, 02h, 03h, 04h, 05h, 06h, 07h, 08h, 09h, 0Ah, 0Bh, 0Ch, 0Dh, 0Eh, 0Fh, 010h, 011h, 012h, 013h, 014h, 015h, 016h, 017h, 018h, 019h, 01Ah, 01Bh, 01Ch, 01Dh, 01Eh, 01Fh, 020h, 021h, 022h, 023h, 024h, 025h, 026h, 027h, 028h, 029h, 02Ah, 02Bh, 02Ch, 02Dh, 02Eh, 02Fh, 030h, 031h, 032h, 033h, 034h, 035h, 036h, 037h, 038h, 039h, 03Ah, 03Bh, 03Ch, 03Dh, 03Eh, 03Fh, 040h, 041h, 042h, 043h, 044h, 045h, 046h, 047h, 048h, 049h, 04Ah, 04Bh, 04Ch, 04Dh, 04Eh, 04Fh, 050h, 051h, 052h, 053h, 054h, 055h, 056h, 057h, 058h, 059h, 05Ah, 05Bh, 05Ch, 05Dh, 05Eh, 05Fh, 060h, 061h, 062h, 063h, 064h, 065h, 066h, 067h, 068h, 069h, 06Ah, 06Bh, 06Ch, 06Dh, 06Eh, 06Fh, 070h, 071h, 072h, 073h, 074h, 075h, 076h, 077h, 078h, 079h, 07Ah, 07Bh, 07Ch, 07Dh, 07Eh, 07Fh, 080h, 081h, 082h, 083h, 084h, 085h, 086h, 087h, 088h, 089h, 08Ah, 08Bh, 08Ch, 08Dh, 08Eh, 08Fh, 090h, 091h, 092h, 093h, 094h, 095h, 096h, 097h, 098h, 099h, 09Ah, 09Bh, 09Ch, 09Dh, 09Eh, 09Fh, 0A0h, 0A1h, 0A2h, 0A3h, 0A4h, 0A5h, 0A6h, 0A7h, 0A8h, 0A9h, 0AAh, 0ABh, 0ACh, 0ADh, 0AEh, 0AFh, 0B0h, 0B1h, 0B2h, 0B3h, 0B4h, 0B5h, 0B6h, 0B7h, 0B8h, 0B9h, 0BAh, 0BBh, 0BCh, 0BDh, 0BEh, 0BFh, 0C0h, 0C1h, 0C2h, 0C3h, 0C4h, 0C5h, 0C6h, 0C7h, 0C8h, 0C9h, 0CAh, 0CBh, 0CCh, 0CDh, 0CEh, 0CFh, 0D0h, 0D1h, 0D2h, 0D3h, 0D4h, 0D5h, 0D6h, 0D7h, 0D8h, 0D9h, 0DAh, 0DBh, 0DCh, 0DDh, 0DEh, 0DFh, 0E0h, 0E1h, 0E2h, 0E3h, 0E4h, 0E5h, 0E6h, 0E7h, 0E8h, 0E9h, 0EAh, 0EBh, 0ECh, 0EDh, 0EEh, 0EFh, 0F0h, 0F1h, 0F2h, 0F3h, 0F4h, 0F5h, 0F6h, 0F7h, 0F8h, 0F9h, 0FAh, 0FBh, 0FCh, 0FDh, 0FEh, 0FFh



; Start of the bss section

section '.bss' writeable align 4

	; <--- uninitialised data here --->



