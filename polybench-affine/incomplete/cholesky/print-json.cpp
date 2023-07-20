#include "../../../../nlohmann/json.hpp"

#include "cholesky-init.c"
#include "cholesky.c"
#include "cholesky.h"
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
  e1["data"] = A;
  e1["format"] = build_format(true, "bitnum", 32);
  j["mem_0"] = e1;

  return j;
}

json build_json_post() {
  json j;
  json mems;
  mems["mem_0"] = A;
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
  init_array(N, A);
  if (RUN) {
    kernel_cholesky(N, A);
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