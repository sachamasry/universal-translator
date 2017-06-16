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
include '%DEV_INCLUDE_MACROS%/portability/os/%OS%/environment.inc'
include '%DEV_INCLUDE_MACROS%/define_static_data.inc'
include '%DEV_INCLUDE_MACROS%/stdio_macros.inc'
include '%DEV_INCLUDE_MACROS%/string.inc'



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
	write_stdout	http_header, sizeof.http_header
	write_newline
	write_newline
	
	write_stdout	html_xml_decl, sizeof.html_xml_decl
	write_newline
	write_newline

	write_stdout	html_doctype_decl, sizeof.html_doctype_decl
	write_newline
	write_newline
	
	write_stdout	html_open, sizeof.html_open
	write_newline

	write_stdout	html_head_open, sizeof.html_head_open
	write_newline

	write_stdout	html_meta_content_type, sizeof.html_meta_content_type
	write_newline
	write_stdout	html_meta_http_equiv, sizeof.html_meta_http_equiv
	write_newline
	write_stdout	html_meta_language, sizeof.html_meta_language
	write_newline

	write_stdout	html_document_title_open, sizeof.html_document_title_open
	write_stdout	html_document_title_close, sizeof.html_document_title_close
	write_newline

	write_stdout	html_head_close, sizeof.html_head_close
	write_newline

	write_stdout	html_body_open, sizeof.html_body_open
	write_newline

	write_stdout	html_div_open, sizeof.html_div_open
	write_newline

	write_stdout	html_table_open, sizeof.html_table_open
	write_newline

	write_stdout	html_tr_open, sizeof.html_tr_open
	write_newline

	write_stdout	html_th_open, sizeof.html_th_open

	write_stdout	col_one_head, sizeof.col_one_head

	write_stdout	html_th_close, sizeof.html_th_close
	write_newline

	write_stdout	html_th_open, sizeof.html_th_open

	write_stdout	col_two_head, sizeof.col_two_head

	write_stdout	html_th_close, sizeof.html_th_close
	write_newline

	write_stdout	html_tr_close, sizeof.html_tr_close
	write_newline

	;*************** Body **************


	get_environment_variables


	;*************** Body **************

	write_stdout	html_table_close, sizeof.html_table_close
	write_newline

	write_stdout	html_div_close, sizeof.html_div_close
	write_newline

	write_stdout	html_body_close, sizeof.html_body_close
	write_newline

	write_stdout	html_close, sizeof.html_close
	write_newline

.end:

	; Terminate program and return to the OS
	xor	ebx, ebx
	exit_program ebx



open_data_row:
	write_stdout	html_tr_open, sizeof.html_tr_open
	write_newline
	ret

close_data_row:
	write_stdout	html_tr_close, sizeof.html_tr_close
	write_newline
	ret

write_data_cell:
	write_stdout	html_td_open, sizeof.html_td_open

	;write_stdout	dword [ebp], ecx
	write_stdout	dword edx, ecx

	write_stdout	html_td_close, sizeof.html_td_close
	write_newline

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



; Start of the read-only data section

section '.rodata' align 4

	; <--- initialised read-only data here --->

	def_astring	http_header, 'Content-type: text/html'			;, 0Ah, 0Ah

	def_astring	html_xml_decl, '<?xml version="1.0" encoding="UTF-8"?>'
	def_astring	html_doctype_decl, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">'

	def_astring	html_open, '<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">'
	def_astring	html_close, '</html>'

	def_astring	html_head_open, '<head>'
	def_astring	html_head_close, '</head>'

	def_astring	html_meta_content_type, '<meta http-equiv="content-type" content="application/xhtml+xml" />'
	def_astring	html_meta_http_equiv, '<meta http-equiv="X-UA-Compatible" content="IE=8" />'
	def_astring	html_meta_language, '<meta name="language" content="en" />'

	def_astring	html_document_title_open, '<title>'
	def_astring	html_document_title_close, '</title>'

	def_astring	html_body_open, '<body>'
	def_astring	html_body_close, '</body>'

	def_astring	html_div_open, '<div>'
	def_astring	html_div_close, '</div>'

	def_astring	html_p_open, '<p>'
	def_astring	html_p_close, '</p>'

	def_astring	html_table_open, '<table>'
	def_astring	html_table_close, '</table>'

	def_astring	html_tr_open, '<tr>'
	def_astring	html_tr_close, '</tr>'

	def_astring	html_th_open, '<th>'
	def_astring	html_th_close, '</th>'

	def_astring	html_td_open, '<td>'
	def_astring	html_td_close, '</td>'



	def_astring	col_one_head, 'Environment variable'
	def_astring	col_two_head, 'Variable value'

ascii_equals:
	db '='
ascii_space:
	db ' '


; Start of the bss section

section '.bss' writeable align 4

	; <--- uninitialised data here --->



