# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.18

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_St_Error

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_St_Error/build

# Include any dependencies generated for this target.
include CMakeFiles/UnitTest_StError.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/UnitTest_StError.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/UnitTest_StError.dir/flags.make

CMakeFiles/UnitTest_StError.dir/UnitTest_StError.cpp.o: CMakeFiles/UnitTest_StError.dir/flags.make
CMakeFiles/UnitTest_StError.dir/UnitTest_StError.cpp.o: ../UnitTest_StError.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_St_Error/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/UnitTest_StError.dir/UnitTest_StError.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/UnitTest_StError.dir/UnitTest_StError.cpp.o -c /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_St_Error/UnitTest_StError.cpp

CMakeFiles/UnitTest_StError.dir/UnitTest_StError.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/UnitTest_StError.dir/UnitTest_StError.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_St_Error/UnitTest_StError.cpp > CMakeFiles/UnitTest_StError.dir/UnitTest_StError.cpp.i

CMakeFiles/UnitTest_StError.dir/UnitTest_StError.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/UnitTest_StError.dir/UnitTest_StError.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_St_Error/UnitTest_StError.cpp -o CMakeFiles/UnitTest_StError.dir/UnitTest_StError.cpp.s

# Object files for target UnitTest_StError
UnitTest_StError_OBJECTS = \
"CMakeFiles/UnitTest_StError.dir/UnitTest_StError.cpp.o"

# External object files for target UnitTest_StError
UnitTest_StError_EXTERNAL_OBJECTS = \
"/home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_St_Error/ValidatorNV10.o"

UnitTest_StError: CMakeFiles/UnitTest_StError.dir/UnitTest_StError.cpp.o
UnitTest_StError: ../ValidatorNV10.o
UnitTest_StError: CMakeFiles/UnitTest_StError.dir/build.make
UnitTest_StError: lib/libgtest_main.a
UnitTest_StError: lib/libgtest.a
UnitTest_StError: CMakeFiles/UnitTest_StError.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_St_Error/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable UnitTest_StError"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/UnitTest_StError.dir/link.txt --verbose=$(VERBOSE)
	/usr/bin/cmake -D TEST_TARGET=UnitTest_StError -D TEST_EXECUTABLE=/home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_St_Error/build/UnitTest_StError -D TEST_EXECUTOR= -D TEST_WORKING_DIR=/home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_St_Error/build -D TEST_EXTRA_ARGS= -D TEST_PROPERTIES= -D TEST_PREFIX= -D TEST_SUFFIX= -D NO_PRETTY_TYPES=FALSE -D NO_PRETTY_VALUES=FALSE -D TEST_LIST=UnitTest_StError_TESTS -D CTEST_FILE=/home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_St_Error/build/UnitTest_StError[1]_tests.cmake -D TEST_DISCOVERY_TIMEOUT=5 -D TEST_XML_OUTPUT_DIR= -P /usr/share/cmake-3.18/Modules/GoogleTestAddTests.cmake

# Rule to build all files generated by this target.
CMakeFiles/UnitTest_StError.dir/build: UnitTest_StError

.PHONY : CMakeFiles/UnitTest_StError.dir/build

CMakeFiles/UnitTest_StError.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/UnitTest_StError.dir/cmake_clean.cmake
.PHONY : CMakeFiles/UnitTest_StError.dir/clean

CMakeFiles/UnitTest_StError.dir/depend:
	cd /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_St_Error/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_St_Error /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_St_Error /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_St_Error/build /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_St_Error/build /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_St_Error/build/CMakeFiles/UnitTest_StError.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/UnitTest_StError.dir/depend

