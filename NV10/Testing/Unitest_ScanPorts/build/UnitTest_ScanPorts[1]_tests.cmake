add_test( UnitTest.TestPass1 /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_ScanPorts/build/UnitTest_ScanPorts [==[--gtest_filter=UnitTest.TestPass1]==] --gtest_also_run_disabled_tests)
set_tests_properties( UnitTest.TestPass1 PROPERTIES WORKING_DIRECTORY /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_ScanPorts/build SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
add_test( UnitTest.TestFail1 /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_ScanPorts/build/UnitTest_ScanPorts [==[--gtest_filter=UnitTest.TestFail1]==] --gtest_also_run_disabled_tests)
set_tests_properties( UnitTest.TestFail1 PROPERTIES WORKING_DIRECTORY /home/coink/Documents/Oink-Validator-NV10-main/NV10/Testing/Unitest_ScanPorts/build SKIP_REGULAR_EXPRESSION [==[\[  SKIPPED \]]==])
set( UnitTest_ScanPorts_TESTS UnitTest.TestPass1 UnitTest.TestFail1)
