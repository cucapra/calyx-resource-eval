#include "../../../nlohmann/json.hpp"

#include "3mm-init.c"
#include "3mm.c"
#include "3mm.h"
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
  e1["data"] = G;
  e1["format"] = build_format(true, "bitnum", 32);
  j["mem_0"] = e1;

  json e2;
  e2["data"] = F;
  e2["format"] = build_format(true, "bitnum", 32);
  j["mem_1"] = e2;

  json e3;
  e3["data"] = E;
  e3["format"] = build_format(true, "bitnum", 32);
  j["mem_2"] = e3;

  json e4;
  e4["data"] = D;
  e4["format"] = build_format(true, "bitnum", 32);
  j["mem_3"] = e4;

  json e5;
  e5["data"] = C;
  e5["format"] = build_format(true, "bitnum", 32);
  j["mem_4"] = e5;

  json e6;
  e6["data"] = B;
  e6["format"] = build_format(true, "bitnum", 32);
  j["mem_5"] = e6;

  json e7;
  e7["data"] = A;
  e7["format"] = build_format(true, "bitnum", 32);
  j["mem_6"] = e7;

  return j;
}

json build_json_post() {
  json j;
  json mems;
  mems["mem_0"] = G;
  mems["mem_1"] = F;
  mems["mem_2"] = E;
  mems["mem_3"] = D;
  mems["mem_4"] = C;
  mems["mem_5"] = B;
  mems["mem_6"] = A;

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
  init_array(NI, NJ, NK, NL, NM, A, B, C, D);
  if (RUN) {
    kernel_3mm(A, B, C, D, E, F, G);
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