#include "../../../../nlohmann/json.hpp"

#include "gemver-init.c"
#include "gemver.c"
#include "gemver.h"
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
  e1["data"] = z;
  e1["format"] = build_format(true, "bitnum", 32);
  j["mem_0"] = e1;

  json e2;
  e2["data"] = y;
  e2["format"] = build_format(true, "bitnum", 32);
  j["mem_1"] = e2;

  json e3;
  e3["data"] = x;
  e3["format"] = build_format(true, "bitnum", 32);
  j["mem_2"] = e3;

  json e4;
  e4["data"] = w;
  e4["format"] = build_format(true, "bitnum", 32);
  j["mem_3"] = e4;

  json e5;
  e5["data"] = v2;
  e5["format"] = build_format(true, "bitnum", 32);
  j["mem_4"] = e5;

  json e6;
  e6["data"] = u2;
  e6["format"] = build_format(true, "bitnum", 32);
  j["mem_5"] = e6;

  json e7;
  e7["data"] = v1;
  e7["format"] = build_format(true, "bitnum", 32);
  j["mem_6"] = e7;

  json e8;
  e8["data"] = u1;
  e8["format"] = build_format(true, "bitnum", 32);
  j["mem_7"] = e8;

  json e9;
  e9["data"] = A;
  e9["format"] = build_format(true, "bitnum", 32);
  j["mem_8"] = e9;

  return j;
}

json build_json_post() {
  json j;
  json mems;
  mems["mem_0"] = z;
  mems["mem_1"] = y;
  mems["mem_2"] = x;
  mems["mem_3"] = w;
  mems["mem_4"] = v2;
  mems["mem_5"] = u2;
  mems["mem_6"] = v1;
  mems["mem_7"] = u1;
  mems["mem_8"] = A;

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
  init_array(N, &alpha, &beta, A, u1, v1, u2, v2, w, x, y, z);
  if (RUN) {
    kernel_gemver(alpha, beta, A, u1, v1, u2, v2, w, x, y, z);
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