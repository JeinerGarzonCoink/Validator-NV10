#include <gtest/gtest.h>
#include "../ValidatorNV10.hpp"

ValidatorNV10::NV10Class NV10Object;

int TestFunctionPass1(){

    int Response = -1;
    NV10Object.ConnectSerial(0);
    NV10Object.ScanPorts();
    std::vector<unsigned char> RESPUESTABILLETERO  = {0x7F, 0x00, 0x04, 0xF0, 0xEE, 0x02, 0xEB, 0x32, 0xC2};    
    Response = NV10Object.HandleChannel(RESPUESTABILLETERO);
    return Response;
}

int TestFunctionFail1(){

    int Response = -1;
    NV10Object.ConnectSerial(0);
    NV10Object.ScanPorts();
    std::vector<unsigned char> RESPUESTABILLETERO  = {0x7F, 0x00, 0x04, 0xF0, 0xEE};    
    Response = NV10Object.HandleChannel(RESPUESTABILLETERO);
    return Response;
}

TEST(UnitTest, TestPass1) {
  // Expect equality.
  EXPECT_EQ(TestFunctionPass1(), 0);
}

TEST(UnitTest, TestFail1) {
  // Expect equality.
  EXPECT_EQ(TestFunctionFail1(), 1);
}