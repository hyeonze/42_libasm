;char *ft_strcpy(char * dst, const char * src);
section .text
	global _ft_strcpy

_ft_strcpy:					;rdi = dst, rsi = src
	mov rax, 0				;rax에 0저장(리턴값으로 쓸 것)
	mov rbx, 0				;rbx에 0저장(인덱스로 쓸 것)
	jmp step				;step함수로

step:
	mov al, byte [rsi + rbx];al(기본레지)에 rsi(src주소)의 값 저장, 바이트단위로(바이트단위로 비교하기 위해 1바이트=8비트 짜리 al사용)
	mov byte [rdi + rbx], al;rdi(dst주소)의 값에 al(소스주소의 값)저장, 바이트단위로
	cmp byte [rsi + rbx], 0	;rsi+rbx의 값을 null과 비교
	je	done				;두 값이 같으면(ZF==1) done함수로
	inc rbx					;아니면 rbx 1증가
	jmp step				;step함수로

done:
	mov rax, rdi			;rax에 rdi(데스티주소) 저장
	ret						;rax반환 및 종료