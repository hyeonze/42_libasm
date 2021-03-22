;char *strdup(const char *s1);
section.text:
	global _ft_strdup
	extern _ft_strlen
	extern _malloc
	extern _ft_strcpy

_ft_strdup:				;rdi = s1
	call	_ft_strlen	;rax에 길이저장
	inc		rax			;rax 1증가('\0'감안)
	push	rdi			;스텍에 s1주소저장
	mov		rdi, rax	;rdi에 길이+1저장(_malloc의 매개변수)
	call	_malloc		;rax에 길이+1만큼 할당하고 주소 저장(dest주소)
	cmp		rax, 0		;rax와 NULL비교
	je		_error		;rax==0이면 _error로(스택비운 후 NULL반환 후 종료)
	pop		rsi			;rsi에 s1주소저장(_ft_strcpy의 매개변수2)
	mov		rdi, rax	;rdi에 dest주소 저장(_ft_strcpy의 매개변수1)
	call	_ft_strcpy	;rdi(dest)값에 rsi(s1)값 저장, rax에 dest주소저장
	ret					;rax(dest주소)반환 후 종료

_error:
	pop		rdi			;rdi에 s1주소 저장(스택비우기)
	ret					;rax(NULL)반환 후 종료