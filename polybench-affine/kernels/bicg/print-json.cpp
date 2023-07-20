#include "../../../nlohmann/json.hpp"

#include "bicg-init.c"
#include "bicg.c"
#include "bicg.h"
#include <cinttypes>
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
  e1["data"] = r;
  e1["format"] = build_format(true, "bitnum", 32);
  j["mem_0"] = e1;

  json e2;
  e2["data"] = p;
  e2["format"] = build_format(true, "bitnum", 32);
  j["mem_1"] = e2;

  json e3;
  e3["data"] = q;
  e3["format"] = build_format(true, "bitnum", 32);
  j["mem_2"] = e3;

  json e4;
  e4["data"] = s;
  e4["format"] = build_format(true, "bitnum", 32);
  j["mem_3"] = e4;

  json e5;
  e5["data"] = A;
  e5["format"] = build_format(true, "bitnum", 32);
  j["mem_4"] = e5;

  return j;
}

json build_json_post() {
  json j;
  json mems;
  mems["mem_0"] = r;
  mems["mem_1"] = p;
  mems["mem_2"] = q;
  mems["mem_3"] = s;
  mems["mem_4"] = A;

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
  init_array(A, r, p);
  if (RUN) {
    kernel_bicg(A, s, q, p, r);
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