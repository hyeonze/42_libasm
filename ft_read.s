;ssize_t ft_read(int fd, void *buff, size_t nbyte);
section	.text
global _ft_read
extern	___error

_ft_read:
	mov rax, 0x2000003  ;rax에 0x2000003저장(read호출대기)
	syscall             ;호출(정상일 시 출력후 rax에 바이트수 저장, 에러 시 rax에 작은 음수(int*errno)를 반환하고 carry flag==1이 됨)
	jc _err             ;jc는 carry flag==1일때 점프
    ;syscall함수가 rax에 errno를 리턴함. 오류가 있을 경우 작은 음수가 리턴됨.
    ;unsigned int이외의 값으로 carry flag가 참이됨. jc는 carry flag==1일 때 점프함.
	ret                 ;정상일 시 바이트 수(rax) 반환 후 종료

_err:					;에러주소에 errno저장하고 rax에 -1저장한 후 -1반환하며 종료하는 함수
	push rax            ;rax에 저장된 errno를 스택에 백업(push)
	call ___error       ;__error 함수를 호출해 에러 주소를 rax에 저장
	pop rbx             ;rbx에 스택에 백업되있던 errno저장(pop)
	mov [rax], rbx      ;rax의 주소에 rbx(errno)저장
	mov rax, -0x1       ;rax의 값에 -1저장
	ret                 ;rax(-1)반환 후 종료