g++ -c ../ValidatorNV10.cpp -o ValidatorNV10.o

cmake -S . -B build

cmake --build build

cd build && ctest