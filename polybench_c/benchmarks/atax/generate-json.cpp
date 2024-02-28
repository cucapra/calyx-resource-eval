#include "../../../nlohmann/json.hpp"

#include "atax-init.c"
#include "atax.c"
#include "atax.h"
#include <iostream>
#include <stdio.h>
#include <string>

using json = nlohmann::json;
DATA_TYPE A[M][N];
DATA_TYPE x[N];
DATA_TYPE y[N];
DATA_TYPE tmp[M];
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
  json A_entry;
  A_entry["data"] = A;
  A_entry["format"] = build_format(true, "bitnum", 32);
  j["mem_3"] = A_entry;

  json x_entry;
  x_entry["data"] = x;
  x_entry["format"] = build_format(true, "bitnum", 32);
  j["mem_2"] = x_entry;

  json y_entry;
  y_entry["data"] = y;
  y_entry["format"] = build_format(true, "bitnum", 32);
  j["mem_1"] = y_entry;

  json tmp_entry;
  tmp_entry["data"] = tmp;
  tmp_entry["format"] = build_format(true, "bitnum", 32);
  j["mem_0"] = tmp_entry;
  return j;
}

json build_json_post() {
  json j;
  json mems;
  mems["mem_3"] = A;
  mems["mem_2"] = x;
  mems["mem_1"] = y;
  mems["mem_0"] = tmp;

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
  init_array(M, N, A, x);
  if (RUN) {
    kernel_atax(A, x, y, tmp);
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