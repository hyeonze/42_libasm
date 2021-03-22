#include "libasm.h"

int     main(void)
{
    //size_t ft_strlen(const char *s);
    printf("NO 1. ft_strcpy test, put string in s7\n");
    const char *s7 = "abcd";
    size_t r2 = ft_strlen(s7);
    printf("result of ft_strlen here -> %zu\n\n", r2);

    //char *ft_strcpy(char * dst, const char * src);
    printf("NO 2. ft_strcpy test, put src in s6\n");
    char s6[100] = "aabc";
    const char s5[100] = "a";
    ft_strcpy(s5, s6);
    printf("check dest(s5) here, -> %s\n\n", s5);

    //int ft_strcmp(const char *s1, const char *s2);
    printf("NO 3. ft_strcmp test, put string in s3 and s4\n");
    const char *s3 = "a";
    const char *s4 = "aa";
    int r1 = ft_strcmp(s3, s4);
    printf("result of ft_strcmp here -> %d\n\n", r1);

    //ssize_t ft_write(int fildes, const void *buf, size_t nbyte);
    printf("NO 4. ft_write test, put string in s8\n");
    printf("check s8 below\n");
    char *s8 = "sdfsdfsdf";
    ft_write(1, s8, sizeof(s8));

    //ssize_t ft_read(int fd, void *buff, size_t nbyte);
    printf("\n\nNO 5. ft_read test, put contents in ""text.txt""\n");
    int fd;
    char buf[100];
    fd = open("test.txt", O_RDONLY);
    ft_read(fd, buf, sizeof(buf));
    printf("contents of ""test.txt"" here -> %s\n", buf);
    close(fd);

    //char *strdup(const char *s1);
    printf("NO 6. ft_strdup test, put string in s1\n");
    const char *s1;
    s1 = "input";
    char *s2;
    s2 = strdup(s1);
    printf("check s2 here -> %s\n\n", s2);

    return(0);
}