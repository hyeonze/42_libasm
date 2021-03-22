;size_t ft_strlen(const char *s);
section .text               ;text섹션 선언(소스코드)
    global _ft_strlen       ;_ft_strlen함수를 전역에서 접근가능 하도록

_ft_strlen:                 ;_ft_strlen함수, rdi=s
	mov rax, 0              ;rax에 0저장
	jmp count               ;count함수로

count:                      ;count함수
	cmp byte [rdi + rax], 0 ;byte단위로 rdi+rax값과 null 비교
	je	end                 ;두 값이 같으면(ZF==1) done함수로, 아니면(ZF==0) 통과
	inc rax                 ;rax 1 증가
	jmp count               ;count함수로

end:
	ret                     ;rax반환 및 종료