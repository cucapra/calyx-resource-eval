#include "../../../../nlohmann/json.hpp"

#include "gramschmidt-init.c"
#include "gramschmidt.c"
#include "gramschmidt.h"
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
  e1["data"] = R;
  e1["format"] = build_format(true, "bitnum", 32);
  j["mem_0"] = e1;

  json e2;
  e2["data"] = Q;
  e2["format"] = build_format(true, "bitnum", 32);
  j["mem_1"] = e2;

  json e3;
  e3["data"] = A;
  e3["format"] = build_format(true, "bitnum", 32);
  j["mem_2"] = e3;

  json e4;
  e4["data"] = {nrm};
  e4["format"] = build_format(true, "bitnum", 32);
  j["mem_3"] = e4;

  return j;
}

json build_json_post() {
  json j;
  json mems;
  mems["mem_0"] = R;
  mems["mem_1"] = Q;
  mems["mem_2"] = A;
  mems["mem_3"] = {nrm};

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
  init_array(M, N, A, Q, R, &nrm);
  if (RUN) {
    kernel_gramschmidt(M, N, A, Q, R, &nrm);
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