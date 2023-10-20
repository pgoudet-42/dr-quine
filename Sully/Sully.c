int i = -1;
char*f="int i = %1$d;%2$cchar*f=%3$c%4$s%3$c;%2$c%2$c#include <fcntl.h>%2$c#include <stdio.h>%2$c#include <stdlib.h>%2$c%2$cint main(){%2$c    char file[10];snprintf(file, 11, %3$c%5$cs%5$cd%5$cs%3$c, %3$cSully_%3$c, i, %3$c.c%3$c);%2$c    if (i > 0) {int fd = open(file, O_RDWR | O_CREAT, S_IWUSR | S_IRUSR);dprintf(fd, f, i - 1, 10, 34, f, 37, 92);%2$c    char cmd[30];snprintf(cmd, 31, %3$c%5$cs%5$cs%5$cs%6$cn%3$c, %3$cgcc %3$c, file, %3$c && ./a.out%3$c);system(cmd);}%2$c}";

#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>

int main(){
    char file[10];snprintf(file, 11, "%s%d%s", "Sully_", i, ".c");
    if (i > 0) {int fd = open(file, O_RDWR | O_CREAT, S_IWUSR | S_IRUSR);dprintf(fd, f, i - 1, 10, 34, f, 37, 92);
    char cmd[30];snprintf(cmd, 31, "%s%s%s\n", "gcc ", file, " && ./a.out");system(cmd);}
}