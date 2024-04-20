#include "../../../nlohmann/json.hpp"

#include "doitgen-init.c"
#include "doitgen.c"
#include "doitgen.h"
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
  e1["data"] = sum;
  e1["format"] = build_format(true, "bitnum", 32);
  j["mem_0"] = e1;

  json e2;
  e2["data"] = C4;
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
  mems["mem_0"] = sum;
  mems["mem_1"] = C4;
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
  init_array(NR, NQ, NP, A, C4);
  if (RUN) {
    kernel_doitgen(A, C4, sum);
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