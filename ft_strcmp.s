;int ft_strcmp(const char *s1, const char *s2);
section .text
	global _ft_strcmp

_ft_strcmp:					;rdi=s1, rsi=s2
	mov rax, 0              ;rax에 0저장(리턴값으로 쓸 것)
	mov rbx, 0              ;rbx에 0저장(인덱스로 쓸 것)
	jmp step                ;step함수로

step:
	mov	al, byte [rdi + rbx];al에 rdi+rbx주소의 값 저장
	mov	ah, byte [rsi + rbx];ah에 rsi+rbx주소의 값 저장
	cmp	al, ah              ;al과 ah 비교
	ja	big                 ;al이 클 경우 big함수로
	jb	small               ;ah가 클 경우 small함수로
	cmp	al, 0               ;al과 null비교
	je	done                ;al==0이면(둘 다 null) done함수로
	inc rbx                 ;rbx 1 증가
	jmp step                ;step함수로

big:
	mov rax , 1             ;rax에 1저장
	ret                     ;rax반환하고 종료

small:
	mov rax , -1            ;rax에 -1저장
	ret                     ;rax반환하고 종료
	
done:
	mov rax, 0              ;rax에 0저장
	ret                     ;rax반환하고 종료