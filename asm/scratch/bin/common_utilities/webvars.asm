;;;;;;; webvars.asm ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Copyright (c) 2000 G. Adam Stanislav
; All rights reserved.
;
; Redistribution and use in source and binary forms, with or without
; modification, are permitted provided that the following conditions
; are met:
; 1. Redistributions of source code must retain the above copyright
;    notice, this list of conditions and the following disclaimer.
; 2. Redistributions in binary form must reproduce the above copyright
;    notice, this list of conditions and the following disclaimer in the
;    documentation and/or other materials provided with the distribution.
;
; THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS AS IS'' AND
; ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
; ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
; FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
; DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
; OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
; HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
; LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
; OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
; SUCH DAMAGE.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Version 1.0
;
; Started:	 8-Dec-2000
; Updated:	 8-Dec-2000
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


format elf
use32



include '%DEV_INCLUDE_MACROS%/portability/os/%OS%/system.inc'
include '%DEV_INCLUDE_MACROS%/stdio_macros.inc'

section '.data' writeable align 4
http	db	'Content-type: text/html', 0Ah, 0Ah
	db	'<?xml version="1.0" encoding="UTF-8"?>', 0Ah
	db	'<!DOCTYPE html PUBLIC "-//W3C/DTD XHTML Strict//EN" '
	db	'"DTD/xhtml1-strict.dtd">', 0Ah
	db	'<html xmlns="http://www.w3.org/1999/xhtml" '
	db	'xml.lang="en" lang="en">', 0Ah
	db	'<head>', 0Ah
	db	'<title>Web Environment</title>', 0Ah
	db	'<meta name="author" content="G. Adam Stanislav" />', 0Ah
	db	'</head>', 0Ah, 0Ah
	db	'<body bgcolor="#ffffff" text="#000000" link="#0000ff" '
	db	'vlink="#840084" alink="#0000ff">', 0Ah
	db	'<div class="webvars">', 0Ah
	db	'<h1>Web Environment</h1>', 0Ah
	db	'<p>The following <b>environment variables</b> are defined '
	db	'on this web server:</p>', 0Ah, 0Ah
	db	'<table align="center" width="80" border="0" cellpadding="10" '
	db	'cellspacing="0" class="webvars">', 0Ah
httplen	equ	http
left	db	'<tr>', 0Ah
	db	'<td class="name"><tt>'
leftlen	equ	left
middle	db	'</tt></td>', 0Ah
	db	'<td class="value"><tt><b>'
midlen	equ	middle
undef	db	'<i>(undefined)</i>'
undeflen	equ	undef
right	db	'</b></tt></td>', 0Ah
	db	'</tr>', 0Ah
rightlen	equ	right
wrap	db	'</table>', 0Ah
	db	'</div>', 0Ah
	db	'</body>', 0Ah
	db	'</html>', 0Ah, 0Ah
wraplen	equ	wrap



section '.rodata' align 4



section '.bss' writeable align 4





section '.text' executable align 4
public _start
_start:
	; First, send out all the http and xhtml stuff that is
	; needed before we start showing the environment
	;push	dword httplen
	;push	dword http
	;push	dword stdout
	;sys.write
	write_stdout	http, httplen

	; Now find how far on the stack the environment pointers
	; are. We have 12 bytes we have pushed before "argc"
	mov	eax, [esp+12]

	; We need to remove the following from the stack:
	;
	;	The 12 bytes we pushed for sys.write
	;	The  4 bytes of argc
	;	The EAX*4 bytes of argv
	;	The  4 bytes of the NULL after argv
	;
	; Total:
	;	20 + eax * 4
	;
	; Because stack grows down, we need to ADD that many bytes
	; to ESP.
	lea	esp, [esp+20+eax*4]
	cld		; This should already be the case, but let's be sure.

	; Loop through the environment, printing it out
.loop:
	pop	edi
	or	edi, edi	; Done yet?
	je	near .wrap

	; Print the left part of HTML
	;push	dword leftlen
	;push	dword left
	;push	dword stdout
	;sys.write
	write_stdout	left, leftlen

	; It may be tempting to search for the '=' in the env string next.
	; But it is possible there is no '=', so we search for the
	; terminating NUL first.
	mov	esi, edi	; Save start of string
	sub	ecx, ecx
	not	ecx		; ECX = FFFFFFFF
	sub	eax, eax
repne	scasb
	not	ecx		; ECX = string length + 1
	mov	ebx, ecx	; Save it in EBX

	; Now is the time to find '='
	mov	edi, esi	; Start of string
	mov	al, '='
repne	scasb
	not	ecx
	add	ecx, ebx	; Length of name

	;push	ecx
	;push	esi
	;push	dword stdout
	;sys.write
	write_stdout	esi, ecx

	; Print the middle part of HTML table code
	;push	dword midlen
	;push	dword middle
	;push	dword stdout
	;sys.write
	write_stdout	dword middle, dword midlen

	; Find the length of the value
	not	ecx
	lea	ebx, [ebx+ecx-1]

	; Print "undefined" if 0
	or	ebx, ebx
	jne	.value

	mov	ebx, undeflen
	mov	edi, undef

.value:
	;push	ebx
	;push	edi
	;push	dword stdout
	;sys.write
	write_stdout	edi, ebx

	; Print the right part of the table row
	;push	dword rightlen
	;push	dword right
	;push	dword stdout
	;sys.write
	write_stdout	dword right, dword rightlen

	; Get rid of the 60 bytes we have pushed
	;add	esp, byte 60
	add	esp, 60

	; Get the next variable
	jmp	.loop

.wrap:
	; Print the rest of HTML
	;push	dword wraplen
	;push	dword wrap
	;push	dword stdout
	;sys.write
	write_stdout	dword wrap, dword wraplen

	; Return success
	;push	dword 0
	;sys.exit
	terminate_program	0

