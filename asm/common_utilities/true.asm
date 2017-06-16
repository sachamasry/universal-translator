;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SOURCE NAME:		true.asm
; CREATED ON:		20100505
; LAST UPDATED ON:	20100505
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
; The true program, merely exiting with a zero return value.
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


; Include macros
include '%DEV_INCLUDE_MACROS%/program_control.inc'



; Start of the text (code) section

section '.text' executable align 4



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 
; FUNCTION:
;
; true
;
;
; PURPOSE:
;
; The true utility always returns with exit code 0.
;
;
; PROGRAM DESCRIPTION:
;
; This program merely runs to call the program tear-down macro, with 
; the simple aim of returning a zero return value.
;
;
; ALGORITHM DESCRIPTION:
;
; - none -
;
;
; INPUT PARAMETERS:
;
; Input description		stack/register	input_type
;
; - no input parameters -
; 
;
; OUTPUT PARAMETERS:
;
; Output description		stack/register	output_type
;
; - no outputs -
;
;
; [ADDITIONAL] REGISTERS USED WITHIN PROGRAM:
;
; Register			data description
;
; - no registers used -
;
;
; MEMORY AREAS DEFINED WITHIN PROGRAM:
;
; Name of definition		data description
;
; - no memory areas used -
;
;
; COMMENTS:
;
; n/a
;
;
; ERROR CONDITIONS, VALIDATION AND RECOVERY:
;
; n/a
;
;
; EXTERNAL CALLS:
;
; - no external calls made -
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
; terminate_program     => program_control.inc
;                               Cleanly terminate runing program
;
;                          stdio_macros.inc
;
; EXTERNAL DEFINITION FILES USED:
;
; List definition files externally referenced through include
; statements.
; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

public _start
_start:

.end:

	; Terminate program and return to the OS with zero return 
	; value
	terminate_program	0
