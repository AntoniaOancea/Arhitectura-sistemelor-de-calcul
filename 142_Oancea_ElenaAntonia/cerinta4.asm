.data

.text

.global main

main:

exit:
	movl $1,%eax
	movl $0,%ebx
	int $0x80
