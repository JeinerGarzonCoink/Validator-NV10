if(EXISTS "/home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_SendingCommand/build/UnitTest_SendingCommand[1]_tests.cmake")
  include("/home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_SendingCommand/build/UnitTest_SendingCommand[1]_tests.cmake")
else()
  add_test(UnitTest_SendingCommand_NOT_BUILT UnitTest_SendingCommand_NOT_BUILT)
endif()
