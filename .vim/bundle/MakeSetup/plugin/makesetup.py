import os
import vim


def main():
	Makefile = open('MakeFile', 'w+')
	Makefile.write("NAME = main")
	makeLocalDirectory('src')
	makeLocalDirectory('obj')
	MakeFile.write("CPP_FILES := $(wildcard src/*.cpp)")
	Makefile.write("OBJ_FILES := $(addprefix obj/,$(notdir $(CPP_FILES:.cpp=.o)))")
	if directoryExists('include'):
		MakeFile.write("INCLUDE_DIR = include")
		MakeFile.write("INCLUDE = -I $(INCLUDE_DIR)")
	MakeFile.write("LD_FLAGS := -Wall)")
	Makefile.write("CC_FLAGS := -MMD -Wall")


def writeDebug():
	Makefile.write("debug: CC_FLAGS += -g -ggdb")
	Makefile.write("debug: NAME = MAIN_DEBUG")
	Makefile.write("debug: $(NAME)")
	
	
def writeRelease():
	Makefile.write("release: CC_FLAGS += -O3")
	Makefile.write("release: NAME = MAIN_RELEASE")
	Makefile.write("release: $(NAME)")

def writeMainRule():
	Makefile.write("$(NAME): $(OBJ_FILES)")
	Makefile.write("\t g++ $(LD_FLAGS) $(LIBFLAGS) -o $@ $^")
	Makefile.write("obj/%.o: src/%.cpp")
	Makefile.write("\t g++ $(CC_FLAGS)  $(INCLUDE) -c -o $@ $<")
def writeClean():
	Makefile.write("clean:")
	Makefile.write("	rm -rf obj/*.o obj/*.d")








		



def makeLocalDirectory(local_name):
	directory = os.getcwd() + "/" + local_name
	if not os.acess(directory, os.F_OK):
		os.mkdir(directory)
	
	if not os.access(directory, os.W_OK):
		raise Exception("Error: source directory not found or not writable")


def directoryExists(local_name):
	directory = os.getcwd() + "/" + local_name
	
	if not os.access(directory, os.W_OK):
		return False
	else:
		return True


