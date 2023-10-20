SRCS = Grace.c
SRCS_ASM = Grace.s

NAME = Grace
NAME_ASM = Grace_asm

OBJS = ${SRCS:.c=.o}
OBJS_ASM = ${SRCS_ASM:.s=.o}

%.o : %.c
	gcc -c $< -o $@

%.o : %.s
	nasm -f elf64 $< -o $@

${NAME}: ${OBJS}
		gcc $(OBJS) -o ${NAME}

${NAME_ASM}: ${OBJS_ASM}
	nasm -f elf64 ${SRCS_ASM} -o ${OBJS_ASM}
	gcc -no-pie -nostartfiles ${OBJS_ASM} -o ${NAME_ASM} 

all: $(NAME)

bonus: ${NAME_ASM}

clean :
	rm $(OBJS)

fclean :        clean
	rm $(NAME) Grace_kids.c

clean_bonus :
	rm $(OBJS_ASM)

fclean_bonus :        clean
	rm $(NAME_ASM) Grace_kids.s

re: fclean all
re_bonus: fclean_bonus

.PHONY: all fclean clean re fclean_bonus clean_bonus re_bonus bonus
