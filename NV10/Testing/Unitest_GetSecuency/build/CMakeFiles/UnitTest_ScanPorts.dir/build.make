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
CMAKE_SOURCE_DIR = /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_ScanPorts

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_ScanPorts/build

# Include any dependencies generated for this target.
include CMakeFiles/UnitTest_ScanPorts.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/UnitTest_ScanPorts.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/UnitTest_ScanPorts.dir/flags.make

CMakeFiles/UnitTest_ScanPorts.dir/UnitTest_ScanPorts.cpp.o: CMakeFiles/UnitTest_ScanPorts.dir/flags.make
CMakeFiles/UnitTest_ScanPorts.dir/UnitTest_ScanPorts.cpp.o: ../UnitTest_ScanPorts.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_ScanPorts/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/UnitTest_ScanPorts.dir/UnitTest_ScanPorts.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/UnitTest_ScanPorts.dir/UnitTest_ScanPorts.cpp.o -c /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_ScanPorts/UnitTest_ScanPorts.cpp

CMakeFiles/UnitTest_ScanPorts.dir/UnitTest_ScanPorts.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/UnitTest_ScanPorts.dir/UnitTest_ScanPorts.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_ScanPorts/UnitTest_ScanPorts.cpp > CMakeFiles/UnitTest_ScanPorts.dir/UnitTest_ScanPorts.cpp.i

CMakeFiles/UnitTest_ScanPorts.dir/UnitTest_ScanPorts.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/UnitTest_ScanPorts.dir/UnitTest_ScanPorts.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_ScanPorts/UnitTest_ScanPorts.cpp -o CMakeFiles/UnitTest_ScanPorts.dir/UnitTest_ScanPorts.cpp.s

# Object files for target UnitTest_ScanPorts
UnitTest_ScanPorts_OBJECTS = \
"CMakeFiles/UnitTest_ScanPorts.dir/UnitTest_ScanPorts.cpp.o"

# External object files for target UnitTest_ScanPorts
UnitTest_ScanPorts_EXTERNAL_OBJECTS = \
"/home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_ScanPorts/ValidatorNV10.o"

UnitTest_ScanPorts: CMakeFiles/UnitTest_ScanPorts.dir/UnitTest_ScanPorts.cpp.o
UnitTest_ScanPorts: ../ValidatorNV10.o
UnitTest_ScanPorts: CMakeFiles/UnitTest_ScanPorts.dir/build.make
UnitTest_ScanPorts: lib/libgtest_main.a
UnitTest_ScanPorts: lib/libgtest.a
UnitTest_ScanPorts: CMakeFiles/UnitTest_ScanPorts.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_ScanPorts/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable UnitTest_ScanPorts"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/UnitTest_ScanPorts.dir/link.txt --verbose=$(VERBOSE)
	/usr/bin/cmake -D TEST_TARGET=UnitTest_ScanPorts -D TEST_EXECUTABLE=/home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_ScanPorts/build/UnitTest_ScanPorts -D TEST_EXECUTOR= -D TEST_WORKING_DIR=/home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_ScanPorts/build -D TEST_EXTRA_ARGS= -D TEST_PROPERTIES= -D TEST_PREFIX= -D TEST_SUFFIX= -D NO_PRETTY_TYPES=FALSE -D NO_PRETTY_VALUES=FALSE -D TEST_LIST=UnitTest_ScanPorts_TESTS -D CTEST_FILE=/home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_ScanPorts/build/UnitTest_ScanPorts[1]_tests.cmake -D TEST_DISCOVERY_TIMEOUT=5 -D TEST_XML_OUTPUT_DIR= -P /usr/share/cmake-3.18/Modules/GoogleTestAddTests.cmake

# Rule to build all files generated by this target.
CMakeFiles/UnitTest_ScanPorts.dir/build: UnitTest_ScanPorts

.PHONY : CMakeFiles/UnitTest_ScanPorts.dir/build

CMakeFiles/UnitTest_ScanPorts.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/UnitTest_ScanPorts.dir/cmake_clean.cmake
.PHONY : CMakeFiles/UnitTest_ScanPorts.dir/clean

CMakeFiles/UnitTest_ScanPorts.dir/depend:
	cd /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_ScanPorts/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_ScanPorts /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_ScanPorts /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_ScanPorts/build /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_ScanPorts/build /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_ScanPorts/build/CMakeFiles/UnitTest_ScanPorts.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/UnitTest_ScanPorts.dir/depend

