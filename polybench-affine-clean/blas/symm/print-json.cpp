#include "../../../nlohmann/json.hpp"

#include "symm-init.c"
#include "symm.c"
#include "symm.h"
#include <iostream>
#include <stdio.h>
#include <string>

using json = nlohmann::json;

bool RUN = false;

json build_format(bool is_signed, std::string numeric_type, int width) {
  json j;
  j["is_signed"] = is_signed;
  j["numeric_type"] = numeric_type;
  j["width"] = width;
  return j;
}

json build_json_pre() {
  json j;
  json e1;
  e1["data"] = C;
  e1["format"] = build_format(true, "bitnum", 32);
  j["mem_0"] = e1;

  json e2;
  e2["data"] = B;
  e2["format"] = build_format(true, "bitnum", 32);
  j["mem_1"] = e2;

  json e3;
  e3["data"] = A;
  e3["format"] = build_format(true, "bitnum", 32);
  j["mem_2"] = e3;

  return j;
}

json build_json_post() {
  json j;
  json mems;
  mems["mem_0"] = C;
  mems["mem_1"] = B;
  mems["mem_2"] = A;

  j["cycles"] = "N/A";
  j["memories"] = mems;
  return j;
}

int main(int argc, char *argv[]) {
  for (int i = 0; i < argc; i++) {
    if (strcmp(argv[i], "run-op") == 0) {
      RUN = true;
    }
  }
  init_array(M, N, &alpha, &beta, A, B, C);
  if (RUN) {
    kernel_symm(alpha, beta, A, B, C);
  }
  json j;
  if (RUN) {
    j = build_json_post();
  } else {
    j = build_json_pre();
  }
  std::cout << j.dump(4) << std::endl;
  return 0;
}