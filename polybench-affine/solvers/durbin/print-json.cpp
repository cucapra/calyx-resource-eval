#include "../../../nlohmann/json.hpp"

#include "durbin-init.c"
#include "durbin.c"
#include "durbin.h"
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
  e3["data"] = r;
  e3["format"] = build_format(true, "bitnum", 32);
  j["mem_2"] = e3;

  json e4;
  e4["data"] = {sum};
  e4["format"] = build_format(true, "bitnum", 32);
  j["mem_3"] = e4;

  json e5;
  e5["data"] = {beta};
  e5["format"] = build_format(true, "bitnum", 32);
  j["mem_4"] = e5;

  json e6;
  e6["data"] = {alpha};
  e6["format"] = build_format(true, "bitnum", 32);
  j["mem_5"] = e6;

  return j;
}

json build_json_post() {
  json j;
  json mems;
  mems["mem_0"] = z;
  mems["mem_1"] = y;
  mems["mem_2"] = r;
  mems["mem_3"] = {sum};
  mems["mem_4"] = {beta};
  mems["mem_5"] = {alpha};

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
  init_array(N, r, &alpha, &beta, &sum);
  if (RUN) {
    kernel_durbin(N, r, y, z, alpha, beta, sum);
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