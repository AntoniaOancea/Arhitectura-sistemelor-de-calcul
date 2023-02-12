.data
	sirb16: .space 101
	sirb2: .space 401
	
	formatScanf: .asciz "%s"
	formatPrintf: .asciz "\n"
	formatPrintf1: .asciz "%s"
	formatPrintf2: .asciz "%s%s"
	
	formatnumar: .asciz "%d "
	
	indexSb2: .long 0
	indexSb10: .long 0
	sum: .long 0
	sum1: .long 0
	
	x: .asciz "x"
	ad_let:.asciz "let"
	ad_add:.asciz "add"
	ad_sub:.asciz "sub"
	ad_div:.asciz "div"
	ad_minus:.asciz "-"
	ad_space:.asciz " "
	ad_mul:.asciz "mul"
	
	bit: .long 12
	/*doi_la_sapte: .long 128
	doi_la_sase: .long 64
	doi_la_cinci: .long 32
	doi_la_patru: .long 16
	doi_la_trei: .long 8
	doi_la_doi: .long 4
	doi_la_unu: .long 2
	doi_la_zero: .long 1*/
.text

.global main

main:
	pushl $sirb16
	pushl $formatScanf
	call scanf 
	popl %ebx
	popl %ebx
	
	/*pushl $sirb16
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	pushl $0
	call fflush
	popl %ebx*/
	
	movl $sirb16,%edi
	movl $sirb2,%esi
	xorl %ecx,%ecx
	
	jmp et_for
et_for:
	movb (%edi,%ecx,1),%al
	cmp $0,%al
	je sir_final
	
	cmp $65,%al
	je cA
	
	cmp $66,%al
	je cB
	
	cmp $67,%al
	je cC
	
	cmp $68,%al
	je cD
	
	cmp $69,%al
	je cE
	
	cmp $70,%al
	je cF
	
	cmp $48,%al
	je c0
	
	cmp $49,%al
	je c1
	
	cmp $50,%al
	je c2
	
	cmp $51,%al
	je c3
	
	cmp $52,%al
	je c4
	
	cmp $53,%al
	je c5
	
	cmp $54,%al
	je c6
	
	cmp $55,%al
	je c7
	
	cmp $56,%al
	je c8
	
	cmp $57,%al
	je c9
	
cont:
	incl %ecx
	jmp et_for
	
cA:
	pushl %ecx
	
	movl indexSb2,%ecx
	movb $49,(%esi,%ecx,1)
	incl %ecx
	movb $48,(%esi,%ecx,1)
	incl %ecx
	movb $49,(%esi,%ecx,1)
	incl %ecx
	movb $48,(%esi,%ecx,1)
	incl %ecx
	
	addl $4,indexSb2 
	
	popl %ecx
	jmp cont

cB:
	pushl %ecx
	
	movl indexSb2,%ecx
	movb $49,(%esi,%ecx,1)
	incl %ecx
	movb $48,(%esi,%ecx,1)
	incl %ecx
	movb $49,(%esi,%ecx,1)
	incl %ecx
	movb $49,(%esi,%ecx,1)
	incl %ecx
	
	addl $4,indexSb2
	
	popl %ecx
	jmp cont
	
cC:
	pushl %ecx
	
	movl indexSb2,%ecx
	movb $49,(%esi,%ecx,1)
	incl %ecx
	movb $49,(%esi,%ecx,1)
	incl %ecx
	movb $48,(%esi,%ecx,1)
	incl %ecx
	movb $48,(%esi,%ecx,1)
	incl %ecx
	
	addl $4,indexSb2 
	
	popl %ecx
	jmp cont
	
cD:
	pushl %ecx
	
	movl indexSb2,%ecx
	movb $49,(%esi,%ecx,1)
	incl %ecx
	movb $49,(%esi,%ecx,1)
	incl %ecx
	movb $48,(%esi,%ecx,1)
	incl %ecx
	movb $49,(%esi,%ecx,1)
	incl %ecx
	
	addl $4,indexSb2  
	
	popl %ecx
	jmp cont
	
cE:
	pushl %ecx
	
	movl indexSb2,%ecx
	movb $49,(%esi,%ecx,1)
	incl %ecx
	movb $49,(%esi,%ecx,1)
	incl %ecx
	movb $49,(%esi,%ecx,1)
	incl %ecx
	movb $48,(%esi,%ecx,1)
	incl %ecx
	
	addl $4,indexSb2  
	
	popl %ecx
	jmp cont
	
cF:
	pushl %ecx
	
	movl indexSb2,%ecx
	movb $49,(%esi,%ecx,1)
	incl %ecx
	movb $49,(%esi,%ecx,1)
	incl %ecx
	movb $49,(%esi,%ecx,1)
	incl %ecx
	movb $49,(%esi,%ecx,1)
	incl %ecx
	
	addl $4,indexSb2 
	
	popl %ecx
	jmp cont
	
c0:
	pushl %ecx
	
	movl indexSb2,%ecx
	movb $48,(%esi,%ecx,1)
	incl %ecx
	movb $48,(%esi,%ecx,1)
	incl %ecx
	movb $48,(%esi,%ecx,1)
	incl %ecx
	movb $48,(%esi,%ecx,1)
	incl %ecx
	
	addl $4,indexSb2  
	
	popl %ecx
	jmp cont
	
c1:
	pushl %ecx
	
	movl indexSb2,%ecx
	movb $48,(%esi,%ecx,1)
	incl %ecx
	movb $48,(%esi,%ecx,1)
	incl %ecx
	movb $48,(%esi,%ecx,1)
	incl %ecx
	movb $49,(%esi,%ecx,1)
	incl %ecx
	
	addl $4,indexSb2
	
	popl %ecx
	jmp cont
	
c2:
	pushl %ecx
	
	movl indexSb2,%ecx
	movb $48,(%esi,%ecx,1)
	incl %ecx
	movb $48,(%esi,%ecx,1)
	incl %ecx
	movb $49,(%esi,%ecx,1)
	incl %ecx
	movb $48,(%esi,%ecx,1)
	incl %ecx

	addl $4,indexSb2 
	
	popl %ecx
	jmp cont
	
c3:
	pushl %ecx
	
	movl indexSb2,%ecx
	movb $48,(%esi,%ecx,1)
	incl %ecx
	movb $48,(%esi,%ecx,1)
	incl %ecx
	movb $49,(%esi,%ecx,1)
	incl %ecx
	movb $49,(%esi,%ecx,1)
	incl %ecx
	
	addl $4,indexSb2 
	
	popl %ecx
	jmp cont
	
c4:
	pushl %ecx
	
	movl indexSb2,%ecx
	movb $48,(%esi,%ecx,1)
	incl %ecx
	movb $49,(%esi,%ecx,1)
	incl %ecx
	movb $48,(%esi,%ecx,1)
	incl %ecx
	movb $48,(%esi,%ecx,1)
	incl %ecx
	
	addl $4,indexSb2  
	
	popl %ecx
	jmp cont
	
c5:
	pushl %ecx
	
	movl indexSb2,%ecx
	movb $48,(%esi,%ecx,1)
	incl %ecx
	movb $49,(%esi,%ecx,1)
	incl %ecx
	movb $48,(%esi,%ecx,1)
	incl %ecx
	movb $49,(%esi,%ecx,1)
	incl %ecx

	addl $4,indexSb2  
	
	popl %ecx
	jmp cont
	
c6:
	pushl %ecx
	
	movl indexSb2,%ecx
	movb $48,(%esi,%ecx,1)
	incl %ecx
	movb $49,(%esi,%ecx,1)
	incl %ecx
	movb $49,(%esi,%ecx,1)
	incl %ecx
	movb $48,(%esi,%ecx,1)
	incl %ecx

	addl $4,indexSb2  
	
	popl %ecx
	jmp cont
	
c7:
	pushl %ecx
	
	movl indexSb2,%ecx
	movb $48,(%esi,%ecx,1)
	incl %ecx
	movb $49,(%esi,%ecx,1)
	incl %ecx
	movb $49,(%esi,%ecx,1)
	incl %ecx
	movb $49,(%esi,%ecx,1)
	incl %ecx
	
	addl $4,indexSb2 
	
	popl %ecx
	jmp cont
	
c8:
	pushl %ecx
	
	movl indexSb2,%ecx
	movb $49,(%esi,%ecx,1)
	incl %ecx
	movb $48,(%esi,%ecx,1)
	incl %ecx
	movb $48,(%esi,%ecx,1)
	incl %ecx
	movb $48,(%esi,%ecx,1)
	incl %ecx
	
	addl $4,indexSb2  
	
	popl %ecx
	jmp cont


c9:
	pushl %ecx
	
	movl indexSb2,%ecx
	movb $49,(%esi,%ecx,1)
	incl %ecx
	movb $48,(%esi,%ecx,1)
	incl %ecx
	movb $48,(%esi,%ecx,1)
	incl %ecx
	movb $49,(%esi,%ecx,1)
	incl %ecx
	
	addl $4,indexSb2 
	
	popl %ecx
	jmp cont
	
adauga_div:
	pushl %ecx
	
	pushl $ad_space
	pushl $ad_div
	pushl $formatPrintf2
	call printf
	popl %ebx
	popl %ebx
	popl %ebx
	
	popl %ecx
	
	/*pushl $0
	call fflush
	popl %ebx*/
	
	addl $3,%ecx #ecx=11
	
	addl $1,indexSb10
	
	jmp for_b2 


adauga_x:
	
	jmp adauga_numar1
	
adauga_numar1:
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_opt1
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_sapte1
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_sase1
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_cinci1
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_patru1
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_trei1
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_doi1
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_unu1
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_zero1
	
	jmp print_suma1

ad_doi_la_opt1:
	addl $256,sum1
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_sapte1
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_sase1
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_cinci1
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_patru1
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_trei1
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_doi1
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_unu1
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_zero1
	
	jmp print_suma1

ad_doi_la_sapte1:
	addl $128,sum1
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_sase1
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_cinci1
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_patru1
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_trei1
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_doi1
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_unu1
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_zero1
	
	jmp print_suma1
ad_doi_la_sase1:
	addl $64,sum1

	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_cinci1
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_patru1
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_trei1
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_doi1
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_unu1
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_zero1
	
	jmp print_suma1
	
ad_doi_la_cinci1:
	addl $32,sum1

	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_patru1
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_trei1
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_doi1
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_unu1
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_zero1
	
	jmp print_suma1
ad_doi_la_patru1:
	addl $16,sum1
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_trei1
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_doi1
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_unu1
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_zero1
	
	jmp print_suma1
ad_doi_la_trei1:
	addl $8,sum1

	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_doi1
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_unu1
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_zero1
	
	jmp print_suma1
ad_doi_la_doi1:
	addl $4,sum1

	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_unu1
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_zero1
	
	jmp print_suma1
ad_doi_la_unu1:
	addl $2,sum1

	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_zero1
	
	jmp print_suma1
ad_doi_la_zero1:
	addl $1,sum1
	jmp print_suma1

print_suma1:
	pushl %ecx
	
	pushl $ad_space
	pushl $sum1
	pushl $formatPrintf2
	call printf
	popl %ebx
	popl %ebx
	popl %ebx
	
	popl %ecx
	
	incl %ecx
	
	movl $0,sum1
	
	addl $1,indexSb10
	
	jmp for_b2


adauga_minus:
	pushl %ecx

	pushl $ad_minus
	pushl $formatPrintf1
	call printf
	popl %ebx
	popl %ebx
	
	popl %ecx
	jmp adauga_numar

adauga_numar:

	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_sapte
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_sase
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_cinci
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_patru
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_trei
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_doi
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_unu
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_zero
	
	jmp print_suma

ad_doi_la_sapte:
	addl $128,sum
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_sase
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_cinci
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_patru
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_trei
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_doi
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_unu
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_zero
	
	jmp print_suma
ad_doi_la_sase:
	addl $64,sum

	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_cinci
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_patru
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_trei
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_doi
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_unu
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_zero
	
	jmp print_suma
	
ad_doi_la_cinci:
	addl $32,sum

	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_patru
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_trei
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_doi
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_unu
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_zero
	
	jmp print_suma
ad_doi_la_patru:
	addl $16,sum
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_trei
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_doi
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_unu
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_zero
	
	jmp print_suma
ad_doi_la_trei:
	addl $8,sum

	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_doi
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_unu
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_zero
	
	jmp print_suma
ad_doi_la_doi:
	addl $4,sum

	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_unu
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_zero
	
	jmp print_suma
ad_doi_la_unu:
	addl $2,sum

	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je ad_doi_la_zero
	
	jmp print_suma
ad_doi_la_zero:
	addl $1,sum
	jmp print_suma

print_suma:
	pushl %ecx
	
	pushl sum
	pushl $formatnumar
	call printf
	popl %ebx
	popl %ebx
	
	popl %ecx
	
	incl %ecx
	
	movl $0,sum
	
	addl $1,indexSb10
	
	jmp for_b2

	
adauga_let_add:
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $48,%al
	je adauga_let
	
	cmp $49,%al
	je adauga_add

adauga_sub_mul:
	incl %ecx
	movb (%edi,%ecx,1),%al
	cmp $48,%al
	je adauga_sub
	
	cmp $49,%al
	je adauga_mul

adauga_add:
	pushl %ecx
	
	pushl $ad_space
	pushl $ad_add
	pushl $formatPrintf2
	call printf
	popl %ebx
	popl %ebx
	popl %ebx
	
	popl %ecx
	
	incl %ecx
	
	addl $1,indexSb10
	
	jmp for_b2 
	
adauga_let:
	pushl %ecx
	
	pushl $ad_space
	pushl $ad_let
	pushl $formatPrintf2
	call printf
	popl %ebx
	popl %ebx
	popl %ebx
	
	popl %ecx
	
	incl %ecx
	
	addl $1,indexSb10
	
	jmp for_b2 
	
adauga_sub:
	pushl %ecx
	
	pushl $ad_space
	pushl $ad_sub
	pushl $formatPrintf2
	call printf
	popl %ebx
	popl %ebx
	popl %ebx
	
	popl %ecx
	
	incl %ecx
	
	addl $1,indexSb10
	
	jmp for_b2 

adauga_mul:
	pushl %ecx
	
	pushl $ad_space
	pushl $ad_mul
	pushl $formatPrintf2
	call printf
	popl %ebx
	popl %ebx
	popl %ebx
	
	popl %ecx
	
	incl %ecx
	
	addl $1, indexSb10 
	
	jmp for_b2
		
adauga_operatie:
	//xorl %ecx,%ecx
	//movl %ecx,%eax
	//mull bit
	addl $8,%ecx #ecx=9
	movb (%edi,%ecx,1),%al
	cmp $49,%al
	je adauga_div
	
	incl %ecx
	movb (%edi,%ecx,1),%al
	
	cmp $48,%al
	je adauga_let_add
	
	cmp $49,%al
	je adauga_sub_mul
	
sir_final:
	movl $sirb2,%edi
	xorl %ecx,%ecx
	jmp for_b2

for_b2:
	xorl %ecx,%ecx
	movl indexSb10,%eax
	mull bit
	movl %eax,%ecx
	incl %ecx #ecx=1 #ecx=13
	
	cmp indexSb2,%ecx
	je exit
	
	
	movb (%edi,%ecx,1),%al
	
	cmp $49,%al #ecx=1
	je adauga_operatie
	
	incl %ecx #ecx=2
	movb (%edi,%ecx,1),%al
	
	cmp $49,%al
	je adauga_x
	
	incl %ecx #ecx=3
	movb (%edi,%ecx,1),%al
	
	cmp $49,%al
	je adauga_minus
	
	cmp $48,%al
	je adauga_numar
	

exit:
	/*pushl indexSb10
	pushl $formatnumar
	call printf
	popl %ebx
	popl %ebx*/
	
	/*pushl $sirb2
	pushl $formatPrintf1
	call printf
	popl %ebx
	popl %ebx
	*/
	pushl $formatPrintf
	call printf
	popl %ebx
	
	pushl $0
	call fflush
	popl %ebx
	
	movl $1,%eax
	xorl %ebx,%ebx
	int $0x80
