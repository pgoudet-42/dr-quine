char*f="char*f=%c%s%c;%c%c#include <stdio.h>%cvoid    print(){printf(f, 34, f, 34, 10, 10, 10);}/*1er*/int main(){/*2ieme*/print();}";

#include <stdio.h>
void    print(){printf(f, 34, f, 34, 10, 10, 10);}/*1er*/int main(){/*2ieme*/print();}