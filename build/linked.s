	.file	"linked.c"
	.section .rdata,"dr"
LC0:
	.ascii "%i,\0"
LC1:
	.ascii "%i\0"
	.text
	.globl	_printLL
	.def	_printLL;	.scl	2;	.type	32;	.endef
_printLL:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	$91, (%esp)
	call	_putchar
	jmp	L2
L3:
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
L2:
	movl	-12(%ebp), %eax
	movzbl	4(%eax), %eax
	xorl	$1, %eax
	testb	%al, %al
	jne	L3
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	movl	$93, (%esp)
	call	_putchar
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.globl	_appendToLL
	.def	_appendToLL;	.scl	2;	.type	32;	.endef
_appendToLL:
LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, -12(%ebp)
	jmp	L5
L6:
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
L5:
	movl	-12(%ebp), %eax
	movzbl	4(%eax), %eax
	xorl	$1, %eax
	testb	%al, %al
	jne	L6
	movl	-12(%ebp), %eax
	movb	$0, 4(%eax)
	movl	$12, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%edx, (%eax)
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	movb	$1, 4(%eax)
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	movl	12(%ebp), %edx
	movl	%edx, 8(%eax)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE16:
	.globl	_insertInLL
	.def	_insertInLL;	.scl	2;	.type	32;	.endef
_insertInLL:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, -16(%ebp)
	jmp	L8
L10:
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -16(%ebp)
	addl	$1, -12(%ebp)
L8:
	movl	-16(%ebp), %eax
	movzbl	4(%eax), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	L9
	movl	-12(%ebp), %eax
	cmpl	16(%ebp), %eax
	jl	L10
L9:
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -20(%ebp)
	movl	$12, (%esp)
	call	_malloc
	movl	%eax, %edx
	movl	-16(%ebp), %eax
	movl	%edx, (%eax)
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	movl	-20(%ebp), %edx
	movl	%edx, (%eax)
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	movl	-16(%ebp), %edx
	movzbl	4(%edx), %edx
	movb	%dl, 4(%eax)
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	movl	12(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	-16(%ebp), %eax
	movb	$0, 4(%eax)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.globl	_popFromLL
	.def	_popFromLL;	.scl	2;	.type	32;	.endef
_popFromLL:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movzbl	4(%eax), %eax
	testb	%al, %al
	je	L14
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	jmp	L13
L15:
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
L14:
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	movzbl	4(%eax), %eax
	xorl	$1, %eax
	testb	%al, %al
	jne	L15
	movl	-12(%ebp), %eax
	movb	$1, 4(%eax)
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	movl	8(%eax), %eax
	movl	%eax, -16(%ebp)
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_free
	movl	-16(%ebp), %eax
L13:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.globl	_summonLL
	.def	_summonLL;	.scl	2;	.type	32;	.endef
_summonLL:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$12, (%esp)
	call	_malloc
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movb	$1, 4(%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.globl	_freeLL
	.def	_freeLL;	.scl	2;	.type	32;	.endef
_freeLL:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, -12(%ebp)
	jmp	L19
L21:
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -16(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_free
	movl	-16(%ebp), %eax
	movl	%eax, -12(%ebp)
L19:
	movl	-12(%ebp), %eax
	movzbl	4(%eax), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	L22
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L21
L22:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.globl	_setElementLL
	.def	_setElementLL;	.scl	2;	.type	32;	.endef
_setElementLL:
LFB21:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, -4(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, -8(%ebp)
	jmp	L24
L26:
	movl	-8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -8(%ebp)
	addl	$1, -4(%ebp)
L24:
	movl	-8(%ebp), %eax
	movzbl	4(%eax), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	L25
	movl	-4(%ebp), %eax
	cmpl	16(%ebp), %eax
	jl	L26
L25:
	movl	-8(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 8(%eax)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.globl	_getElementLL
	.def	_getElementLL;	.scl	2;	.type	32;	.endef
_getElementLL:
LFB22:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, -4(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, -8(%ebp)
	jmp	L28
L30:
	movl	-8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -8(%ebp)
	addl	$1, -4(%ebp)
L28:
	movl	-8(%ebp), %eax
	movzbl	4(%eax), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	L29
	movl	-4(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	L30
L29:
	movl	-8(%ebp), %eax
	movl	8(%eax), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.globl	_removefromLL
	.def	_removefromLL;	.scl	2;	.type	32;	.endef
_removefromLL:
LFB23:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	movl	$0, -20(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	movzbl	4(%eax), %eax
	testb	%al, %al
	je	L35
	movl	-16(%ebp), %eax
	movl	8(%eax), %eax
	jmp	L34
L37:
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -16(%ebp)
	addl	$1, -12(%ebp)
L35:
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	movzbl	4(%eax), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	L36
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	L37
L36:
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	L38
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	movl	8(%eax), %eax
	movl	%eax, -20(%ebp)
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	movl	(%eax), %eax
	movl	%eax, -24(%ebp)
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	movzbl	4(%eax), %edx
	movl	-16(%ebp), %eax
	movb	%dl, 4(%eax)
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_free
	movl	-16(%ebp), %eax
	movl	-24(%ebp), %edx
	movl	%edx, (%eax)
	movl	-20(%ebp), %eax
	jmp	L34
L38:
	movl	-16(%ebp), %eax
	movl	8(%eax), %eax
L34:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE23:
	.globl	_elementGetLHT
	.def	_elementGetLHT;	.scl	2;	.type	32;	.endef
_elementGetLHT:
LFB24:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	8(%ebp), %eax
	movl	%eax, -4(%ebp)
	jmp	L40
L42:
	movl	-4(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -4(%ebp)
L40:
	movl	-4(%ebp), %eax
	movzbl	4(%eax), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	L41
	movl	-4(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	12(%ebp), %eax
	jl	L42
L41:
	movl	-4(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	12(%ebp), %eax
	jne	L43
	movl	-4(%ebp), %eax
	jmp	L44
L43:
	movl	$0, %eax
L44:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE24:
	.globl	_getElementLHT
	.def	_getElementLHT;	.scl	2;	.type	32;	.endef
_getElementLHT:
LFB25:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_elementGetLHT
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	movl	12(%eax), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.globl	_setElementLHT
	.def	_setElementLHT;	.scl	2;	.type	32;	.endef
_setElementLHT:
LFB26:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_elementGetLHT
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 12(%eax)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.globl	_summonLHT
	.def	_summonLHT;	.scl	2;	.type	32;	.endef
_summonLHT:
LFB27:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$16, (%esp)
	call	_malloc
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movb	$1, 4(%eax)
	movl	-12(%ebp), %eax
	movl	$-2147483648, 8(%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
	.globl	_insertInLHT
	.def	_insertInLHT;	.scl	2;	.type	32;	.endef
_insertInLHT:
LFB28:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, -12(%ebp)
	jmp	L51
L53:
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
L51:
	movl	-12(%ebp), %eax
	movzbl	4(%eax), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	L52
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	movl	8(%eax), %eax
	cmpl	16(%ebp), %eax
	jl	L53
L52:
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	movl	8(%eax), %eax
	cmpl	16(%ebp), %eax
	je	L54
	movl	$16, (%esp)
	call	_malloc
	movl	%eax, -16(%ebp)
	movl	-12(%ebp), %eax
	movzbl	4(%eax), %edx
	movl	-16(%ebp), %eax
	movb	%dl, 4(%eax)
	movl	-12(%ebp), %eax
	movb	$0, 4(%eax)
	movl	-12(%ebp), %eax
	movl	(%eax), %edx
	movl	-16(%ebp), %eax
	movl	%edx, (%eax)
	movl	-12(%ebp), %eax
	movl	-16(%ebp), %edx
	movl	%edx, (%eax)
	movl	-16(%ebp), %eax
	movl	16(%ebp), %edx
	movl	%edx, 8(%eax)
L54:
	movl	-16(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 12(%eax)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE28:
	.globl	_removeFromLHT
	.def	_removeFromLHT;	.scl	2;	.type	32;	.endef
_removeFromLHT:
LFB29:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	8(%ebp), %eax
	movl	%eax, -4(%ebp)
	jmp	L56
L58:
	movl	-4(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -4(%ebp)
L56:
	movl	-4(%ebp), %eax
	movzbl	4(%eax), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	L57
	movl	-4(%ebp), %eax
	movl	(%eax), %eax
	movl	8(%eax), %eax
	cmpl	12(%ebp), %eax
	jg	L58
L57:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE29:
	.globl	_freeLHT
	.def	_freeLHT;	.scl	2;	.type	32;	.endef
_freeLHT:
LFB30:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, -12(%ebp)
	jmp	L60
L62:
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -16(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_free
	movl	-16(%ebp), %eax
	movl	%eax, -12(%ebp)
L60:
	movl	-12(%ebp), %eax
	movzbl	4(%eax), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	L63
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	L62
L63:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE30:
	.section .rdata,"dr"
LC2:
	.ascii "%i=%i,\0"
LC3:
	.ascii "%i=%i\0"
	.text
	.globl	_printLHT
	.def	_printLHT;	.scl	2;	.type	32;	.endef
_printLHT:
LFB31:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	$91, (%esp)
	call	_putchar
	jmp	L65
L66:
	movl	-12(%ebp), %eax
	movl	12(%eax), %edx
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
L65:
	movl	-12(%ebp), %eax
	movzbl	4(%eax), %eax
	xorl	$1, %eax
	testb	%al, %al
	jne	L66
	movl	-12(%ebp), %eax
	movl	12(%eax), %edx
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_printf
	movl	$93, (%esp)
	call	_putchar
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE31:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_malloc;	.scl	2;	.type	32;	.endef
	.def	_free;	.scl	2;	.type	32;	.endef
