#include "../../../nlohmann/json.hpp"

#include "trmm-init.c"
#include "trmm.c"
#include "trmm.h"
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
  e1["data"] = B;
  e1["format"] = build_format(true, "bitnum", 32);
  j["mem_0"] = e1;

  json e2;
  e2["data"] = A;
  e2["format"] = build_format(true, "bitnum", 32);
  j["mem_1"] = e2;

  return j;
}

json build_json_post() {
  json j;
  json mems;
  mems["mem_0"] = B;
  mems["mem_1"] = A;

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
  init_array(M, N, &alpha, A, B);
  if (RUN) {
    kernel_trmm(alpha, A, B);
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