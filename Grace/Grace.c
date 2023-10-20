#define F "#define F %c%s%c%c#include <fcntl.h>%c#include <stdio.h>%c// #define main%c#define TM_PRINTF(x) int main(){ int fd = open(x, O_RDWR | O_CREAT, S_IWUSR | S_IRUSR);dprintf(fd, F, 34, F, 34, 10, 10, 10, 10, 10, 10, 34, 34);}%c%cTM_PRINTF(%c./Grace_kid.c%c);"
#include <fcntl.h>
#include <stdio.h>
// #define main
#define TM_PRINTF(x) int main(){ int fd = open(x, O_RDWR | O_CREAT, S_IWUSR | S_IRUSR);dprintf(fd, F, 34, F, 34, 10, 10, 10, 10, 10, 10, 34, 34);}

TM_PRINTF("./Grace_kid.c");