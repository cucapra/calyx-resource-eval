#include "../../../nlohmann/json.hpp"

#include "atax-init.c"
#include "atax.h"
#include <iostream>
#include <stdio.h>

using json = nlohmann::json;
DATA_TYPE A[M][N];
DATA_TYPE x[N];
DATA_TYPE y[N];
DATA_TYPE tmp[M];

json build_json() {
  json j;
  j["A"] = A;
  j["x"] = x;
  j["y"] = y;
  j["tmp"] = tmp;
  return j;
}

int main(int argc, char *argv[]) {
  init_array(M, N, A, x);
  json j = build_json();
  std::cout << j.dump(4) << std::endl;
  return 0;
}