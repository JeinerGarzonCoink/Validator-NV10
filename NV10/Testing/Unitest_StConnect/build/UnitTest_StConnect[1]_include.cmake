if(EXISTS "/home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_StConnect/build/UnitTest_StConnect[1]_tests.cmake")
  include("/home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_StConnect/build/UnitTest_StConnect[1]_tests.cmake")
else()
  add_test(UnitTest_StConnect_NOT_BUILT UnitTest_StConnect_NOT_BUILT)
endif()
