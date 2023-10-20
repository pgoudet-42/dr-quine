SRCS = Colleen.c
SRCS_ASM = Colleen.s

NAME = Colleen
NAME_ASM = Colleen_asm

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
	rm $(NAME)

clean_bonus :
	rm $(OBJS_ASM)

fclean_bonus :        clean
	rm $(NAME_ASM)

re: fclean all
re_bonus: fclean_bonus

.PHONY: all fclean clean re fclean_bonus clean_bonus re_bonus bonus
