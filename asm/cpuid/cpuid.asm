;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; SOURCE NAME:		cpuid.asm
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
; CPU Identification program
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
include '%DEV_INCLUDE_MACROS%/define_static_data.inc'


; Define local symbolic constants
; <const>	equ 0


; Define local macros
; macro <name_of_macro>	{}



; Define publically-available local procedures
; public name_of_procedure as 'alias_for_procedure'


; Define externally required procedures
; extrn 'name_of_external_procedure' as alias_for_procedure
extrn	nbtoa_nibble
extrn	nhtoa_nibble
extrn	nhtoa_byte



; Start of the text (code) section

section '.text' executable align 4



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 
; PROGRAM:
;
; cpuid
;
;
; PURPOSE:
;
; Identify the host system's CPU.
;
;
; PROGRAM DESCRIPTION:
;
; This program will attempt to determine as much information as is 
; available about the host CPU, using the cpuid instruction.
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

	; First, it is necessary to check whether the CPU supports 
	; the cpuid instruction-by proxy. This is done through the 
	; ID flag in the EFLAGS register. If the ID flag can be 
	; modified, the CPUID instruction is available.
	;
	; Get the current value of the EFLAGS register, and make a 
	; copy for later use
_set_id:
;	pushf
;	pop	eax
;	mov	edx, eax
;	test	eax, 0x00200000
;	jnz	_clear_id
;	xor	eax, 0x00200000
;	push	eax
;	popf
;
;	pushf
;	pop	eax
;	test	eax, 0x00200000
;	jz	_nocpuid
	
	; Unset the ID flag again, and check whether it has worked
_clear_id:
;	xor	eax, 0x00200000
;	push	eax
;	popf

;	pushf
;	pop	eax
;	test	eax, 0x00200000
;	jz	_cpuid

_nocpuid:
;	write_stdout	nocpuid, sizeof.nocpuid
;	mov	ebx, 0xff

	; Write new line so that the shell resumes from a new line on
	; the terminal
;	write_newline

;	jmp	_end

_cpuid:
;	write_stdout	supports_id, sizeof.supports_id

	; Write new line so that the shell resumes from a new line on
	; the terminal
;	write_newline



	; Perform basic cpuid - cpuid function 0
	;
	; CPUID returns maximum return value and and the vendor 
	; identification string
;	mov	eax, 00h
;	cpuid
	
	; Store returned vendor identification string
;	mov	[cpu_vendor_id_string], ebx
;	mov	[cpu_vendor_id_string + 4], edx
;	mov	[cpu_vendor_id_string + 8], ecx

	; Store maximum return value
;	mov	ecx, eax

;	write_stdout	cpu_vendor_msg, sizeof.cpu_vendor_msg
;	write_stdout	cpu_vendor_id_string, 12
;	write_newline



	; Perform cpuid function 1
	;
	; CPUID returns with the processor signature in eax, 
	; miscellaeous information in ebx and feature flags in 
	; edx

	; Check whether the cpuid will support the next function
	mov	[max_std_func_no], ecx
	cmp	ecx, 1
	jl	_end

	mov	eax, 01h
	cpuid

	; Store processor signature in memory
	mov	[processor_signature], eax
	mov	[misc_info], ebx
	mov	[feature_flags], edx
	mov	[feature_flags + 4], ecx
	mov	edi, eax


	; Extract the family code from eax
	;
	; The family code is stored in bits 8-11
	mov	esi, edi
	shr	esi, 8
	and	esi, 0fh
	mov	[family_code], esi
	mov	eax, esi
	call	nhtoa_byte
	mov	[family_code_hex], eax
	mov	eax, esi
	call	nbtoa_nibble
	mov	[family_code_binary], eax

	; Extract the extended family
	;
	; Extended family information is stored in bits 20-27
	mov	esi, edi
	shr	esi, 20 
	and	esi, 0ffh
	mov	[extended_family], esi
	mov	eax, esi
	call	nhtoa_byte

	shl	eax, 16
	bswap	eax
	mov	[extended_family_hex], eax

	mov	eax, esi
	and	eax, 0fh
	call	nbtoa_nibble
	mov	[extended_family_binary + 4], eax

	shr	esi, 4
	and	esi, 0fh
	mov	eax, esi

	call	nbtoa_nibble
	mov	[extended_family_binary], eax



	; Print the family code
;	write_stdout	family_code_msg, sizeof.family_code_msg
;	write_n_tabs	2
;	write_stdout	family_code_hex, 1
;	write_n_tabs	1
;	write_stdout	family_code_binary, 4
;	write_newline

	; Print the extended family code
;	write_stdout	extended_family_msg, sizeof.extended_family_msg
;	write_n_tabs	1
;	write_stdout	extended_family_hex, 2
;	write_n_tabs	1
;	write_stdout	extended_family_binary, 4
;	write_space
;	write_stdout	extended_family_binary + 4, 4
;	write_newline

;	write_newline


	; Compose the Family, Model and Stepping (FMS) values
	;
	; The processor family is an 8-bit value obtained by adding 
	; the extended family field of the processor signature 
	; returned by CPUID function 1 with the family field (4-bit 
	; value).
	xor	eax, eax
	mov	al, [extended_family]
	add	al, [family_code]
	mov	[compound_family_code], ax


	call	nhtoa_byte
	shl	eax, 16
	bswap	eax
	mov	[family_code_hex], eax

	mov	esi, [compound_family_code]
	mov	eax, esi
	and	eax, 0fh
	call	nbtoa_nibble
	mov	[family_code_binary + 4], eax

	shr	esi, 4
	mov	eax, esi
	and	esi, 0fh

	call	nbtoa_nibble
	mov	[family_code_binary], eax


	; Print compound family code
	write_stdout	family_code_msg, sizeof.family_code_msg
	write_n_tabs	2
	write_stdout	family_code_hex, 1
	write_n_tabs	1
	write_stdout	family_code_binary, 4
	write_newline




	; Extract stepping id from eax
	;
	; The stepping id is returned in bits 0-3
	mov	esi, edi
	and	esi, 0fh
	mov	[stepping_id], esi
	write_stdout	stepping_id_msg, sizeof.stepping_id_msg
	write_n_tabs	2
	mov	eax, esi
	call	nhtoa_byte
	mov	[stepping_id_hex], eax
	write_stdout	stepping_id_hex, 1
	mov	eax, esi
	call	nbtoa_nibble
	mov	[stepping_id_binary], eax
	write_n_tabs	1
	write_stdout	stepping_id_binary, 4
	write_newline

	; Extract the model number from eax
	;
	; The model number is stored in bits 4-7
	mov	esi, edi
	shr	esi, 4
	and	esi, 0fh
	mov	[model_number], esi
	write_stdout	model_number_msg, sizeof.model_number_msg
	write_n_tabs	2
	mov	eax, esi
	call	nhtoa_byte
	mov	[model_number_hex], eax
	write_stdout	model_number_hex, 1
	mov	eax, esi
	call	nbtoa_nibble
	mov	[model_number_binary], eax
	write_n_tabs	1
	write_stdout	model_number_binary, 4
	write_newline



	; Extract the processor type from eax
	;
	; The type is stored in bits 12-13
	mov	esi, edi
	shl	esi, 12
	and	esi, 03h
	mov	[processor_type], esi
	write_stdout	processor_type_msg, sizeof.processor_type_msg
	write_n_tabs	1
	mov	eax, esi
	call	nhtoa_nibble
	mov	[processor_type_hex], eax
	write_stdout	processor_type_hex, 1
	mov	eax, esi
	call	nbtoa_nibble
	mov	[processor_type_binary], eax
	write_n_tabs	1
	write_stdout	processor_type_binary, 4
	write_newline

	; Extract the extended model from eax
	;
	; Extended model information is stored in bits 16-19
	mov	esi, edi
	shr	esi, 16
	and	esi, 0fh
	mov	[extended_model], esi
	write_stdout	extended_model_msg, sizeof.extended_model_msg
	write_n_tabs	1
	mov	eax, esi
	call	nhtoa_byte
	mov	[extended_model_hex], eax
	write_stdout	extended_model_hex, 1
	mov	eax, esi
	call	nbtoa_nibble
	mov	[extended_model_binary], eax
	write_n_tabs	1
	write_stdout	extended_model_binary, 4
	write_newline







	; Perform cpuid extended function 80000000h
	;
	; When eax is initialised to a value of 80000000h, the cpuid 
	; function returns the largest extended function number 
	; supported by the processor in eax
	mov	eax, 80000000h
	cpuid

	; Store maximum extended function number in esi, a register 
	; that won't be touched during any cpuid operations
	mov	esi, eax
	mov	[max_ext_func_no], eax



	; Perform cpuid extended functions until the maximum extended
	; function number is reached
	;
	; Perform cpuid function 80000001h
	; This function returns the extended feature flags in register
	; edx
	;
	; The feature flags indicate what extended features the 
	; processor supports
	cmp	esi, 80000001h
	jb	_not_supported
	mov	eax, ecx
	cpuid
	mov	[ext_feat_flags], edx



	; Perform cpuid function 80000002h, 80000003h, 80000004h
	; These functions return the processor name and brand string
	; in eax, ebx, ecx and edx registers.
	;
	; Each function returns 16 ASCII bytes. The processor name
	; and other details is constructed by concatenating the 
	; four registers and each 16 bytes returned by the three
	; functions.
	;
	; The processor name is right-justified with leading space 
	; characters, returned in little-endian format and NULL
	; terminated. The processor name can be a maximum of 48 
	; bytes including the NULL terminator (3 * 16 bytes). In 
	; addition to the processor name, these functions return 
	; the maximum supported speed of the processor in ASCII.

	; Check if extended functions are supported
	cmp	esi, 80000004h
	jb	_not_supported

	mov	eax, 80000002h
	mov	edi, processor_name_raw
	cpuid

	mov	[edi], eax
	mov	[edi + 4], ebx
	mov	[edi + 8], ecx
	mov	[edi + 12], edx
	add 	edi, 16
	
	mov	eax, 80000003h
	cpuid

	mov	[edi], eax
	mov	[edi + 4], ebx
	mov	[edi + 8], ecx
	mov	[edi + 12], edx
	add 	edi, 16
	
	mov	eax, 80000004h
	cpuid

	mov	[edi], eax
	mov	[edi + 4], ebx
	mov	[edi + 8], ecx
	mov	[edi + 12], edx


	; As noted, the processor name string may contain space 
	; padding characters, followed by the actual processor name 
	; and terminated by a NULL character. Prior to printing this 
	; information on screen, the leading space characters should 
	; be stripped.
	cld
	mov 	esi, processor_name_raw
	mov 	edi, processor_name

_spaces:
	lodsb
	cmp	al, ' '
	je	_spaces
	cmp	al, 0
	je	_done
	
_store_character:
	stosb
	lodsb
	cmp 	al, 0
	jne	_store_character

_done:
	write_stdout	processor_name_msg, sizeof.processor_name_msg
	write_stdout	processor_name, 48
	write_newline


_not_supported:

_end:
	; Terminate program and return to the OS
	sys_exit ebx




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
max_std_func_no:
	dd '?'
max_ext_func_no:
	dd '?'
ext_feat_flags:
	dd '?'

	; Function 01h
stepping_id:
	db '?'
stepping_id_hex:
	db '?'
stepping_id_binary:
	dd '?'
model_number:
	db '?'
model_number_hex:
	db '?'
model_number_binary:
	dd '?'

family_code:
	db '?'
family_code_hex:
	db 2 dup '?'
family_code_binary:
	dd 2 dup '?'
extended_family:
	db '?'
extended_family_hex:
	db 2 dup '?'
extended_family_binary:
	dd 2 dup '?'
compound_family_code:
	db '?'
compound_family_code_hex:
	db 2 dup '?'
compound_family_code_binary:
	db 2 dup '?'

processor_type:
	db '?'
processor_type_hex:
	db '?'
processor_type_binary:
	dd '?'
extended_model:
	db '?'
extended_model_hex:
	db '?'
extended_model_binary:
	dd '?'



; Start of the read-only data section

section '.rodata' align 4

	; <--- initialised read-only data here --->
def_astring 	nocpuid, "This processor does not support the CPUID instruction"
def_astring 	supports_id, "This processor supports the CPUID instruction"

	; Function 0h
def_astring	cpu_vendor_msg, "CPU vendor identification: "


	; Function 01h
def_astring	stepping_id_msg, "Stepping ID: "
def_astring	model_number_msg, "Model number: "
def_astring	family_code_msg, "Family code: "
def_astring	processor_type_msg, "Processor type: "
def_astring	extended_model_msg, "Extended model: "
def_astring	extended_family_msg, "Extended family: "

	; Extended function 80000002-80000004h
def_astring	processor_name_msg, "Processor name: "



; Start of the bss section

section '.bss' writeable align 4

	; <--- uninitialised data here --->
	; Function 0h
cpu_vendor_id_string:
	db 12 dup '*'

	; Function 01h
processor_signature:
	db 4 dup '*'
misc_info:
	db 4 dup '*'
feature_flags:	
	db 8 dup '*'

	; Function 02h
configuration_parameters:
	db 16 dup '*'

	; Function 03h
psn:
	db 8 dup '*'

	; Extended functions 80000002-80000004h
processor_name_raw:
	db 48 dup '*'
processor_name:
	db 48 dup ' '
