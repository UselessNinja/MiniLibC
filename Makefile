##
## EPITECH PROJECT, 2019
## ASM_minilibc_2018
## File description:
## Makefile
##

ASMC = 			nasm
ASMCFLAGS =		-f elf64
LIB =			ld
LIBFLAGS =		-fPIC -shared
LIBNAME =		libasm.so
RM =			rm -f
SRC =			src/strlen.asm	\
				src/strchr.asm	\
				src/memset.asm	\
				src/memcpy.asm	\
				src/strcmp.asm	\
				src/memmove.asm	\
				src/strncmp.asm	\
				src/rindex.asm	\
				src/strpbrk.asm	\
				src/strcspn.asm

all: $(LIBNAME)

$(LIBNAME): $(SRC:.asm=.o)
		$(LIB) $(LIBFLAGS) -o $(LIBNAME) $(SRC:.asm=.o)

%.o: %.asm
	$(ASMC) $(ASMCFLAGS) $< -o $@

clean:
	$(RM) $(SRC:.asm=.o)

fclean: clean
	$(RM) $(LIBNAME)

re:	fclean all

.PHONY: all clean fclean re