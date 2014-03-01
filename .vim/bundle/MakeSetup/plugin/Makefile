NAME = main

CPP_FILES := $(wildcard src/*.cpp)
OBJ_FILES := $(addprefix obj/,$(notdir $(CPP_FILES:.cpp=.o)))

ifeq ($(shell sh -c 'uname -s'),Linux)
	ARCH := $(shell getconf LONG_BIT)
	
	LIB_DIR_32 = -L lib_linux_32 
	LIB_DIR_64 = -L lib_linux_64
	
	LIBFLAGS= $(LIB_DIR_$(ARCH)) -ltcod_debug -ltcodxx_debug -Wl,-rpath=. 
else
	LIBFLAGS=-Llib -ltcod-mingw-debug -static-libgcc -static-libstdc++
endif

INCLUDE_DIR = include
INCLUDE = -I $(INCLUDE_DIR)

LD_FLAGS := -Wall
CC_FLAGS := -MMD -Wall  

debug: CC_FLAGS += -g -ggdb
debug: NAME = MAIN_DEBUG
debug: $(NAME)

release: CC_FLAGS += -O3
release: NAME = MAIN_RELEASE
release: $(NAME)

$(NAME): $(OBJ_FILES)
	g++ $(LD_FLAGS) $(LIBFLAGS) -o $@ $^

obj/%.o: src/%.cpp
	g++ $(CC_FLAGS)  $(INCLUDE) -c -o $@ $<

clean:
	rm -rf obj/*.o obj/*.d

