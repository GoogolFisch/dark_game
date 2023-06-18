	.file	"crypt.c"
	.text
	.globl	_memRandom
	.def	_memRandom;	.scl	2;	.type	32;	.endef
_memRandom:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$16, (%esp)
	call	_malloc
	movl	%eax, -20(%ebp)
	movl	$0, -16(%ebp)
	jmp	L2
L3:
	movl	-16(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-20(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	xorl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_setrand
	movl	%eax, -12(%ebp)
	addl	$1, -16(%ebp)
L2:
	cmpl	$3, -16(%ebp)
	jle	L3
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	_free
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.globl	_setrand
	.def	_setrand;	.scl	2;	.type	32;	.endef
_setrand:
LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	movl	8(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%eax, %edx
	movl	8(%ebp), %eax
	sarl	%eax
	xorl	%edx, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE16:
	.globl	_createPrivateKey
	.def	_createPrivateKey;	.scl	2;	.type	32;	.endef
_createPrivateKey:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$12, (%esp)
	call	_malloc
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, (%eax)
	call	_memRandom
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	$0, -24(%ebp)
	movl	-20(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	$0, -16(%ebp)
	jmp	L8
L11:
	movl	-20(%ebp), %eax
	movl	8(%eax), %eax
	imull	-12(%ebp), %eax
	cltd
	idivl	8(%ebp)
	movl	%edx, -24(%ebp)
	cmpl	$1, -24(%ebp)
	jne	L9
	movl	-20(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%eax)
	jmp	L10
L9:
	movl	-24(%ebp), %eax
	movl	%eax, -12(%ebp)
	addl	$1, -16(%ebp)
L8:
	movl	-16(%ebp), %eax
	cmpl	8(%ebp), %eax
	jl	L11
L10:
	movl	-20(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.def	___moddi3;	.scl	2;	.type	32;	.endef
	.globl	_privateGenPublic
	.def	_privateGenPublic;	.scl	2;	.type	32;	.endef
_privateGenPublic:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	movl	$16, (%esp)
	call	_malloc
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	imull	16(%ebp), %eax
	cltd
	movl	-12(%ebp), %ecx
	movl	%eax, (%ecx)
	movl	%edx, 4(%ecx)
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	imull	12(%ebp), %eax
	addl	%edx, %eax
	cltd
	movl	-12(%ebp), %ecx
	movl	4(%ecx), %ebx
	movl	(%ecx), %ecx
	movl	%ecx, 8(%esp)
	movl	%ebx, 12(%esp)
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	___moddi3
	movl	-12(%ebp), %ecx
	movl	%eax, 8(%ecx)
	movl	%edx, 12(%ecx)
	movl	-12(%ebp), %eax
	addl	$36, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.globl	_createPublicKey
	.def	_createPublicKey;	.scl	2;	.type	32;	.endef
_createPublicKey:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	8(%ebp), %eax
	movl	%eax, -32(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, -28(%ebp)
	movl	16(%ebp), %eax
	movl	%eax, -40(%ebp)
	movl	20(%ebp), %eax
	movl	%eax, -36(%ebp)
	movl	$16, (%esp)
	call	_malloc
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %ecx
	movl	-32(%ebp), %eax
	movl	-28(%ebp), %edx
	movl	%eax, 8(%ecx)
	movl	%edx, 12(%ecx)
	movl	-12(%ebp), %ecx
	movl	-40(%ebp), %eax
	movl	-36(%ebp), %edx
	movl	%eax, (%ecx)
	movl	%edx, 4(%ecx)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.globl	_encriptMessage
	.def	_encriptMessage;	.scl	2;	.type	32;	.endef
_encriptMessage:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$28, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	12(%ebp), %eax
	movl	%eax, %ecx
	movl	%eax, %ebx
	sarl	$31, %ebx
	movl	8(%ebp), %eax
	movl	12(%eax), %edx
	movl	8(%eax), %eax
	movl	%ebx, %edi
	imull	%eax, %edi
	movl	%edx, %esi
	imull	%ecx, %esi
	addl	%edi, %esi
	mull	%ecx
	leal	(%esi,%edx), %ecx
	movl	%ecx, %edx
	movl	8(%ebp), %ecx
	movl	4(%ecx), %ebx
	movl	(%ecx), %ecx
	movl	%ecx, 8(%esp)
	movl	%ebx, 12(%esp)
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	___moddi3
	addl	$28, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.globl	_decriptMessage
	.def	_decriptMessage;	.scl	2;	.type	32;	.endef
_decriptMessage:
LFB21:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	movl	12(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	16(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, %ecx
	movl	%eax, %ebx
	sarl	$31, %ebx
	movl	-16(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%ecx, 8(%esp)
	movl	%ebx, 12(%esp)
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	call	___moddi3
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	imull	%edx, %eax
	movl	8(%ebp), %edx
	movl	(%edx), %ecx
	cltd
	idivl	%ecx
	movl	%edx, %eax
	addl	$36, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_malloc;	.scl	2;	.type	32;	.endef
	.def	_free;	.scl	2;	.type	32;	.endef
