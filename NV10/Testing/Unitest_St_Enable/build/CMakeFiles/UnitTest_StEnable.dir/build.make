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
CMAKE_SOURCE_DIR = /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_St_Enable

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_St_Enable/build

# Include any dependencies generated for this target.
include CMakeFiles/UnitTest_StEnable.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/UnitTest_StEnable.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/UnitTest_StEnable.dir/flags.make

CMakeFiles/UnitTest_StEnable.dir/UnitTest_StEnable.cpp.o: CMakeFiles/UnitTest_StEnable.dir/flags.make
CMakeFiles/UnitTest_StEnable.dir/UnitTest_StEnable.cpp.o: ../UnitTest_StEnable.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_St_Enable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/UnitTest_StEnable.dir/UnitTest_StEnable.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/UnitTest_StEnable.dir/UnitTest_StEnable.cpp.o -c /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_St_Enable/UnitTest_StEnable.cpp

CMakeFiles/UnitTest_StEnable.dir/UnitTest_StEnable.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/UnitTest_StEnable.dir/UnitTest_StEnable.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_St_Enable/UnitTest_StEnable.cpp > CMakeFiles/UnitTest_StEnable.dir/UnitTest_StEnable.cpp.i

CMakeFiles/UnitTest_StEnable.dir/UnitTest_StEnable.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/UnitTest_StEnable.dir/UnitTest_StEnable.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_St_Enable/UnitTest_StEnable.cpp -o CMakeFiles/UnitTest_StEnable.dir/UnitTest_StEnable.cpp.s

# Object files for target UnitTest_StEnable
UnitTest_StEnable_OBJECTS = \
"CMakeFiles/UnitTest_StEnable.dir/UnitTest_StEnable.cpp.o"

# External object files for target UnitTest_StEnable
UnitTest_StEnable_EXTERNAL_OBJECTS = \
"/home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_St_Enable/ValidatorNV10.o"

UnitTest_StEnable: CMakeFiles/UnitTest_StEnable.dir/UnitTest_StEnable.cpp.o
UnitTest_StEnable: ../ValidatorNV10.o
UnitTest_StEnable: CMakeFiles/UnitTest_StEnable.dir/build.make
UnitTest_StEnable: lib/libgtest_main.a
UnitTest_StEnable: lib/libgtest.a
UnitTest_StEnable: CMakeFiles/UnitTest_StEnable.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_St_Enable/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable UnitTest_StEnable"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/UnitTest_StEnable.dir/link.txt --verbose=$(VERBOSE)
	/usr/bin/cmake -D TEST_TARGET=UnitTest_StEnable -D TEST_EXECUTABLE=/home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_St_Enable/build/UnitTest_StEnable -D TEST_EXECUTOR= -D TEST_WORKING_DIR=/home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_St_Enable/build -D TEST_EXTRA_ARGS= -D TEST_PROPERTIES= -D TEST_PREFIX= -D TEST_SUFFIX= -D NO_PRETTY_TYPES=FALSE -D NO_PRETTY_VALUES=FALSE -D TEST_LIST=UnitTest_StEnable_TESTS -D CTEST_FILE=/home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_St_Enable/build/UnitTest_StEnable[1]_tests.cmake -D TEST_DISCOVERY_TIMEOUT=5 -D TEST_XML_OUTPUT_DIR= -P /usr/share/cmake-3.18/Modules/GoogleTestAddTests.cmake

# Rule to build all files generated by this target.
CMakeFiles/UnitTest_StEnable.dir/build: UnitTest_StEnable

.PHONY : CMakeFiles/UnitTest_StEnable.dir/build

CMakeFiles/UnitTest_StEnable.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/UnitTest_StEnable.dir/cmake_clean.cmake
.PHONY : CMakeFiles/UnitTest_StEnable.dir/clean

CMakeFiles/UnitTest_StEnable.dir/depend:
	cd /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_St_Enable/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_St_Enable /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_St_Enable /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_St_Enable/build /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_St_Enable/build /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_St_Enable/build/CMakeFiles/UnitTest_StEnable.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/UnitTest_StEnable.dir/depend

