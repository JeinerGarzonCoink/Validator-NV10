#include <gtest/gtest.h>
#include "../ValidatorNV10.hpp"

ValidatorNV10::NV10Class NV10Object;

int TestFunctionPass1(){

    int Response = -1;
    NV10Object.ConnectSerial(0);
    NV10Object.ScanPorts();
    Response = NV10Object.ExecuteCommand(std::vector<unsigned char> {0x01});
    return Response;
}

int TestFunctionFail1(){

    int Response = -1;
    NV10Object.ConnectSerial(0);
    NV10Object.ScanPorts();
    Response = NV10Object.ExecuteCommand(std::vector<unsigned char> {0x01});
    return Response;
}

int TestFunctionFail2(){

    int Response = -1;
    NV10Object.ConnectSerial(0);
    NV10Object.ScanPorts();
    Response = NV10Object.ExecuteCommand(std::vector<unsigned char> {0x01});
    return Response;
}

int TestFunctionFail3(){

    int Response = -1;
    NV10Object.ConnectSerial(0);
    NV10Object.ScanPorts();
    Response = NV10Object.ExecuteCommand(std::vector<unsigned char> {0x0});
    return Response;
}

int TestFunctionFail4(){

    int Response = -1;
    NV10Object.ConnectSerial(0);
    NV10Object.ScanPorts();
    Response = NV10Object.ExecuteCommand(std::vector<unsigned char> {0x01});
    return Response;
}

int TestFunctionFail5(){

    int Response = -1;
    NV10Object.ConnectSerial(0);
    NV10Object.ScanPorts();
    Response = NV10Object.ExecuteCommand(std::vector<unsigned char> {0x01});
    return Response;
}

int TestFunctionFail6(){

    int Response = -1;
    NV10Object.ConnectSerial(0);
    NV10Object.ScanPorts();
    Response = NV10Object.ExecuteCommand(std::vector<unsigned char> {0x01});
    return Response;
}

int TestFunctionFail7(){

    int Response = -1;
    NV10Object.ConnectSerial(0);
    NV10Object.ScanPorts();
    Response = NV10Object.ExecuteCommand(std::vector<unsigned char> {0x01});
    return Response;
}

int TestFunctionFail8(){

    int Response = -1;
    NV10Object.ConnectSerial(0);
    NV10Object.ScanPorts();
    Response = NV10Object.ExecuteCommand(std::vector<unsigned char> {0x01});
    return Response;
}

int TestFunctionFail9(){

    int Response = -1;
    NV10Object.ConnectSerial(0);
    NV10Object.ScanPorts();
    Response = NV10Object.ExecuteCommand(std::vector<unsigned char> {0x01});
    return Response;
}

TEST(UnitTest, TestPass1) {
  // Expect equality.
  EXPECT_EQ(TestFunctionPass1(), 0);
}

TEST(UnitTest, TestFail1) {
  // Expect equality.
  EXPECT_EQ(TestFunctionFail1(), -5);
}

TEST(UnitTest, TestFail2) {
  // Expect equality.
  EXPECT_EQ(TestFunctionFail1(), -4);
}

TEST(UnitTest, TestFail3) {
  // Expect equality.
  EXPECT_EQ(TestFunctionFail1(), -3);
}

TEST(UnitTest, TestFail4) {
  // Expect equality.
  EXPECT_EQ(TestFunctionFail1(), -2);
}

TEST(UnitTest, TestFail5) {
  // Expect equality.
  EXPECT_EQ(TestFunctionFail1(), -1);
}

TEST(UnitTest, TestFail6) {
  // Expect equality.
  EXPECT_EQ(TestFunctionFail1(), 1);
}

TEST(UnitTest, TestFail7) {
  // Expect equality.
  EXPECT_EQ(TestFunctionFail1(), 2);
}

TEST(UnitTest, TestFail8) {
  // Expect equality.
  EXPECT_EQ(TestFunctionFail1(), 3);
}

TEST(UnitTest, TestFail9) {
  // Expect equality.
  EXPECT_EQ(TestFunctionFail1(), 4);
}