## EPITECH PROJECT, 2024
## Makefile
## File description:
## makefile
##

AS = nasm
ASFLAGS = -f elf64

LD = ld
LDFLAGS = -fPIC -shared

SRC =	strlen.asm	\
		strchr.asm	\
		strrchr.asm	\
		memset.asm	\
		memcpy.asm	\
		strcmp.asm	\
		memmove.asm	\
		strncmp.asm	\
		strcasecmp.asm	\
		strstr.asm	\
		strpbrk.asm	\
		strcspn.asm	\

OBJ = $(SRC:.asm=.o)

NAME = libasm.so

all: $(NAME)

$(NAME): $(OBJ)
	$(LD) $(LDFLAGS) -o $(NAME) $(OBJ)

%.o: %.asm
	$(AS) $(ASFLAGS) -o $@ $<

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re