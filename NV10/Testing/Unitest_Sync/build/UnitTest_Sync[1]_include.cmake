if(EXISTS "/home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_Sync/build/UnitTest_Sync[1]_tests.cmake")
  include("/home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_Sync/build/UnitTest_Sync[1]_tests.cmake")
else()
  add_test(UnitTest_Sync_NOT_BUILT UnitTest_Sync_NOT_BUILT)
endif()
