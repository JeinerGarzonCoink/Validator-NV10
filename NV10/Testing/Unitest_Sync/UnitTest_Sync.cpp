#include <gtest/gtest.h>
#include "../ValidatorNV10.hpp"

ValidatorNV10::NV10Class NV10Object;

int TestFunctionPass1(){

    int Response = -1;
    NV10Object.ConnectSerial(0);
    NV10Object.ScanPorts();
    Response = NV10Object.Sync();
    return Response;
}

int TestFunctionFail1(){

    int Response = -1;
    NV10Object.ConnectSerial(0);
    NV10Object.ScanPorts();
    Response = NV10Object.Sync();
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