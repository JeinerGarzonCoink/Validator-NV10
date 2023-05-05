#include <gtest/gtest.h>
#include "../ValidatorNV10.hpp"


//--------------CMDS----------//
std::vector<unsigned char> POLL                 = {0x07};

ValidatorNV10::NV10Class NV10Object;

int TestFunctionPass1(){

    int Response = -1;
    NV10Object.ConnectSerial(0);
    NV10Object.ScanPorts();
    NV10Object.Hold();
    NV10Object.SendingCommand(POLL = {0x07});
    Response = NV10Object.StPolling();
    return Response;
}

int TestFunctionFail1(){

    int Response = -3;
    NV10Object.ConnectSerial(0);
    NV10Object.ScanPorts();
    NV10Object.Hold();
    NV10Object.SendingCommand(POLL = {0x07});
    Response = NV10Object.StPolling();   
    return Response;
}

TEST(Unitest, TestPass1) {
  // Expect equality.
  EXPECT_EQ(TestFunctionPass1(), 0);
}

TEST(Unitest, TestFail1) {
  // Expect equality.
  EXPECT_EQ(TestFunctionFail1(), -2);
}