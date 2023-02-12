.data
	sir: .space 2000
	x: .space 4
	y: .space 4
	
	//formatScanf1: .asciz ""
	formatScanf: .asciz "%[^\n]s "
	formatPrintf: .asciz "%s\n"
	intPrintf: .asciz "%d\n"
	
	res: .space 4
	
	mule: .asciz "mul"
	dive: .asciz "div"
	sube: .asciz "sub"
	adde: .asciz "add"
	
	chDelim: .asciz " "

.text


.global main

main:
	pushl $sir
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx
	
	pushl $chDelim
	pushl $sir
	call strtok
	popl %ebx
	popl %ebx
	
	movl %eax,res
	
	/*pushl res
	pushl %eax
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	popl %ebx*/
	
	jmp verifica_mule
	
et_for:

	pushl $chDelim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	
	cmp $0,%eax
	je exit
	
	movl %eax,res
	
	/*pushl res
	pushl %eax
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	popl %ebx*/
	
	jmp verifica_mule
	
verifica_mule:

	pushl res
	pushl $mule
	call strcmp
	popl %ebx
	popl %ebx
	
	cmp $0,%eax
	je call_mul
	
	jmp verifica_adde
	
verifica_adde:
	
	pushl res
	pushl $adde
	call strcmp
	popl %ebx
	popl %ebx
	
	cmp $0,%eax
	je call_add
	
	jmp verifica_sube
	
verifica_sube:

	pushl res
	pushl $sube
	call strcmp
	popl %ebx
	popl %ebx
	
	cmp $0,%eax
	je call_sub
	
	jmp verifica_dive
	
verifica_dive:
	
	pushl res
	pushl $dive
	call strcmp
	popl %ebx
	popl %ebx
	
	cmp $0,%eax
	je call_div
	
	jmp numar

numar:
	
	pushl res
	call atoi
	popl %ebx
	
	pushl %eax
	
	jmp et_for
	
call_mul:
	popl y
	popl x
	movl x,%eax
	mull y
	
	pushl %eax
	
	jmp et_for
	
call_add:
	popl y
	popl x
	movl x,%eax
	addl y,%eax
	
	pushl %eax
	
	jmp et_for

call_sub:
	popl y
	popl x
	movl x,%eax
	subl y,%eax
	
	pushl %eax
	
	jmp et_for
	
call_div:
	popl y
	popl x
	movl x,%eax
	movl $0,%edx
	divl y
	
	pushl %eax
	
	jmp et_for
	
exit:
	pushl $intPrintf
	call printf
	popl %ebx
	popl %ebx
	
	movl $1, %eax
	xorl %ebx,%ebx
	int $0x80
