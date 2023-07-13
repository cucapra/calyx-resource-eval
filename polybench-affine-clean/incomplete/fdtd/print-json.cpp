#include "../../../../nlohmann/json.hpp"

#include "fdtd-init.c"
#include "fdtd.c"
#include "fdtd.h"
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
  e1["data"] = _fict_;
  e1["format"] = build_format(true, "bitnum", 32);
  j["mem_0"] = e1;

  json e2;
  e2["data"] = hz;
  e2["format"] = build_format(true, "bitnum", 32);
  j["mem_1"] = e2;

  json e3;
  e3["data"] = ey;
  e3["format"] = build_format(true, "bitnum", 32);
  j["mem_2"] = e3;

  json e4;
  e4["data"] = ex;
  e4["format"] = build_format(true, "bitnum", 32);
  j["mem_3"] = e4;

  return j;
}

json build_json_post() {
  json j;
  json mems;
  mems["mem_0"] = _fict_;
  mems["mem_1"] = hz;
  mems["mem_2"] = ey;
  mems["mem_3"] = ex;

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
  init_array(TMAX, NX, NY, ex, ey, hz, _fict_);
  if (RUN) {
    kernel_fdtd_2d(TMAX, NX, NY, ex, ey, hz, _fict_);
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