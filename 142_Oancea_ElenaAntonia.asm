.data
	n:.space 4
	m:.space 4
	p:.long 3
	v:.space 400
	v_aux:.space 400
	v_frecventa:.space 160
	elemCurent:.space 4
	stop:.long 0
	i:.long 1
	j:.long 1
	
	formatPrintf:.asciz "%d "
	formatScanf: .asciz "%d"
	endl:.asciz "\n"
	nu_exista:.asciz "-1\n"
	
.text

.global main

read:
	xorl %ecx,%ecx
	movl $v,%edi
	
	pushl %edi
	pushl %esi
	pushl %ebx

	jmp read_for
	
read_for:
	cmp p,%ecx
	je read_exit
	
	movl $v_aux,%esi
	
	pushl %ecx
	
	pushl $elemCurent
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx
	
	popl %ecx
	
	movl elemCurent,%eax
	movl %eax,(%edi,%ecx,4)
	movl %eax,(%esi,%ecx,4)
	jmp frecventa

frecventa:
	movl $v_frecventa,%esi
	pushl %ecx
	
	movl %eax,%ecx
	incl (%esi,%ecx,4)
	
	popl %ecx
	
	incl %ecx
	jmp read_for
	
read_exit:
	popl %edi
	popl %esi
	popl %ebx
	ret
	
write:
	movl $v,%edi
	xorl %ecx,%ecx
	pushl %edi
	pushl %esi
	pushl %ebx
	
	jmp write_for
	
write_for:
	cmp p,%ecx
	je write_exit
	
	movl (%edi,%ecx,4),%eax
	
	pushl %ecx
	
	pushl %eax
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	popl %ecx
	
	incl %ecx
	jmp write_for
	
write_exit:
	pushl $endl
	call printf
	popl %ebx
	popl %edi
	popl %esi
	popl %ebx
	ret
back:
	pushl %ebp
	movl %esp,%ebp
	
	pushl %edi
	pushl %esi
	pushl %ebx
	
	movl $v_frecventa,%edi
	movl $v,%esi
	
	movl 8(%ebp),%eax
	
	cmp p,%eax
	je exit
	
	movl %eax,%ecx
	movl (%esi,%ecx,4),%ebx
	
	cmp $0,%ebx
	jg call_back
	
	movl $1,i
	pushl i
	jmp back_for
	
call_back:
	incl %eax
	
	pushl %eax
	call back
	popl %ebx

	
back_for:
	popl i
	movl i,%ecx

	cmp n,%ecx
	jg intoarce_back

	movl (%edi,%ecx,4),%ebx
	cmp $3,%ebx
	je back_cont
	
	movl $1,%ebx
	movl %ebx,j
	
	back_for_j:
		cmp m,%ebx
		jg back_add
		
		movl %eax,%ecx
		addl j,%ecx
		
		cmp p,%ecx
		jl verifica_dupa
		
		movl %eax,%ecx
		subl j,%ecx
		
		cmp $0,%ecx
		jge verifica_inainte
		
		jmp cont_j
		
	cont_j:
		incl j
		movl j,%ebx
		jmp back_for_j
		
	verifica_dupa:
		movl (%esi,%ecx,4),%ebx
		cmp i,%ebx
		je ok_fals
		
		movl %eax,%ecx
		subl j,%ecx
		
		cmp $0,%ecx
		jge verifica_inainte
		
		jmp cont_j
		
	verifica_inainte:
		movl (%esi,%ecx,4),%ebx
		cmp i,%ebx
		je ok_fals
		
		jmp cont_j
		
ok_fals:
	incl i
	pushl i 
	jmp back_for
	

back_cont:
	incl i
	
	pushl i
	jmp back_for
	
back_add:
	movl i,%ecx
	incl (%edi,%ecx,4)
	
	movl %eax,%ecx
	
	movl i,%ebx
	movl %ebx,(%esi,%ecx,4)
	
	jmp call_back
	
intoarce_back:
	
	movl %eax,%ecx
	movl $0,(%esi,%ecx,4)
	
	jmp intoarce_back_for
	
intoarce_back_for:

	movl $v_frecventa,%edi
	movl $v,%esi
	
	movl $v_frecventa,%edi
	movl $v,%esi
	
	cmp $0,%eax
	je print_nu_exista
	
	subl $1,%eax
	
	movl $v_aux,%edi
	
	movl %eax,%ecx
	movl (%edi,%ecx,4),%ebx
	cmp $0,%ebx
	je cont_intoarcere
	
	jmp intoarce_back_for
	
cont_intoarcere:
	
	movl $v_frecventa,%edi
	movl $v,%esi

	movl %eax,%ecx
	movl (%esi,%ecx,4),%ecx

	subl $1,(%edi,%ecx,4)
	
	movl %ecx,i
	jmp back_cont
	
back_exit:
	popl %ebp
	popl %edi
	popl %esi
	popl %ebx
	ret
	
print_nu_exista:
	pushl $nu_exista
	call printf
	popl %ebx
	
	jmp et_exit

main:
	pushl $n
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx
	
	pushl $m
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx
	
	movl n,%eax
	mull p
	movl %eax,p
	
	call read
	
	pushl $0
	call back
	popl %ebx

exit:
	call write
	
	movl $1,%eax
	xorl %ebx,%ebx
	int $0x80
	
et_exit:
	movl $1,%eax
	xorl %ebx,%ebx
	int $0x80
	
	
