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
CMAKE_SOURCE_DIR = /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_SetChannels

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_SetChannels/build

# Include any dependencies generated for this target.
include CMakeFiles/UnitTest_SetChannels.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/UnitTest_SetChannels.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/UnitTest_SetChannels.dir/flags.make

CMakeFiles/UnitTest_SetChannels.dir/UnitTest_SetChannels.cpp.o: CMakeFiles/UnitTest_SetChannels.dir/flags.make
CMakeFiles/UnitTest_SetChannels.dir/UnitTest_SetChannels.cpp.o: ../UnitTest_SetChannels.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_SetChannels/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/UnitTest_SetChannels.dir/UnitTest_SetChannels.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/UnitTest_SetChannels.dir/UnitTest_SetChannels.cpp.o -c /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_SetChannels/UnitTest_SetChannels.cpp

CMakeFiles/UnitTest_SetChannels.dir/UnitTest_SetChannels.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/UnitTest_SetChannels.dir/UnitTest_SetChannels.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_SetChannels/UnitTest_SetChannels.cpp > CMakeFiles/UnitTest_SetChannels.dir/UnitTest_SetChannels.cpp.i

CMakeFiles/UnitTest_SetChannels.dir/UnitTest_SetChannels.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/UnitTest_SetChannels.dir/UnitTest_SetChannels.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_SetChannels/UnitTest_SetChannels.cpp -o CMakeFiles/UnitTest_SetChannels.dir/UnitTest_SetChannels.cpp.s

# Object files for target UnitTest_SetChannels
UnitTest_SetChannels_OBJECTS = \
"CMakeFiles/UnitTest_SetChannels.dir/UnitTest_SetChannels.cpp.o"

# External object files for target UnitTest_SetChannels
UnitTest_SetChannels_EXTERNAL_OBJECTS = \
"/home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_SetChannels/ValidatorNV10.o"

UnitTest_SetChannels: CMakeFiles/UnitTest_SetChannels.dir/UnitTest_SetChannels.cpp.o
UnitTest_SetChannels: ../ValidatorNV10.o
UnitTest_SetChannels: CMakeFiles/UnitTest_SetChannels.dir/build.make
UnitTest_SetChannels: lib/libgtest_main.a
UnitTest_SetChannels: lib/libgtest.a
UnitTest_SetChannels: CMakeFiles/UnitTest_SetChannels.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_SetChannels/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable UnitTest_SetChannels"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/UnitTest_SetChannels.dir/link.txt --verbose=$(VERBOSE)
	/usr/bin/cmake -D TEST_TARGET=UnitTest_SetChannels -D TEST_EXECUTABLE=/home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_SetChannels/build/UnitTest_SetChannels -D TEST_EXECUTOR= -D TEST_WORKING_DIR=/home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_SetChannels/build -D TEST_EXTRA_ARGS= -D TEST_PROPERTIES= -D TEST_PREFIX= -D TEST_SUFFIX= -D NO_PRETTY_TYPES=FALSE -D NO_PRETTY_VALUES=FALSE -D TEST_LIST=UnitTest_SetChannels_TESTS -D CTEST_FILE=/home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_SetChannels/build/UnitTest_SetChannels[1]_tests.cmake -D TEST_DISCOVERY_TIMEOUT=5 -D TEST_XML_OUTPUT_DIR= -P /usr/share/cmake-3.18/Modules/GoogleTestAddTests.cmake

# Rule to build all files generated by this target.
CMakeFiles/UnitTest_SetChannels.dir/build: UnitTest_SetChannels

.PHONY : CMakeFiles/UnitTest_SetChannels.dir/build

CMakeFiles/UnitTest_SetChannels.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/UnitTest_SetChannels.dir/cmake_clean.cmake
.PHONY : CMakeFiles/UnitTest_SetChannels.dir/clean

CMakeFiles/UnitTest_SetChannels.dir/depend:
	cd /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_SetChannels/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_SetChannels /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_SetChannels /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_SetChannels/build /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_SetChannels/build /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_SetChannels/build/CMakeFiles/UnitTest_SetChannels.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/UnitTest_SetChannels.dir/depend

