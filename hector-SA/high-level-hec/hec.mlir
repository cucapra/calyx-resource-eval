module {
  hec.design @systolic_array {
    hec.component @PE(%A_in: f32, %C_in: f32) -> (%A_out: f32, %C_out: f32) {interface="wrapped", style="dummy"} {}
    hec.component @PE_line(%A: f32, %C_in0: f32, %C_in1: f32, %C_in2: f32, %C_in3: f32, %C_in4: f32, %C_in5: f32, %C_in6: f32, %C_in7: f32) -> (%C_out0: f32, %C_out1: f32, %C_out2: f32, %C_out3: f32, %C_out4: f32, %C_out5: f32, %C_out6: f32, %C_out7: f32) {interface="wrapped", style="handshake"} {
      %PE_0.A_in, %PE_0.C_in, %PE_0.A_out, %PE_0.C_out = hec.instance "PE_0" @PE: f32, f32, f32, f32
      %PE_1.A_in, %PE_1.C_in, %PE_1.A_out, %PE_1.C_out = hec.instance "PE_1" @PE: f32, f32, f32, f32
      %PE_2.A_in, %PE_2.C_in, %PE_2.A_out, %PE_2.C_out = hec.instance "PE_2" @PE: f32, f32, f32, f32
      %PE_3.A_in, %PE_3.C_in, %PE_3.A_out, %PE_3.C_out = hec.instance "PE_3" @PE: f32, f32, f32, f32
      %PE_4.A_in, %PE_4.C_in, %PE_4.A_out, %PE_4.C_out = hec.instance "PE_4" @PE: f32, f32, f32, f32
      %PE_5.A_in, %PE_5.C_in, %PE_5.A_out, %PE_5.C_out = hec.instance "PE_5" @PE: f32, f32, f32, f32
      %PE_6.A_in, %PE_6.C_in, %PE_6.A_out, %PE_6.C_out = hec.instance "PE_6" @PE: f32, f32, f32, f32
      %PE_7.A_in, %PE_7.C_in, %PE_7.A_out, %PE_7.C_out = hec.instance "PE_7" @PE: f32, f32, f32, f32
      hec.graph {
        hec.assign %PE_0.A_in = %A : f32 -> f32
        hec.assign %PE_0.C_in = %C_in0 : f32 -> f32
        hec.assign %C_out0 = %PE_0.C_out : f32 -> f32
        hec.assign %PE_1.A_in = %PE_0.A_out : f32 -> f32
        hec.assign %PE_1.C_in = %C_in1 : f32 -> f32
        hec.assign %C_out1 = %PE_1.C_out : f32 -> f32
        hec.assign %PE_2.A_in = %PE_1.A_out : f32 -> f32
        hec.assign %PE_2.C_in = %C_in2 : f32 -> f32
        hec.assign %C_out2 = %PE_2.C_out : f32 -> f32
        hec.assign %PE_3.A_in = %PE_2.A_out : f32 -> f32
        hec.assign %PE_3.C_in = %C_in3 : f32 -> f32
        hec.assign %C_out3 = %PE_3.C_out : f32 -> f32
        hec.assign %PE_4.A_in = %PE_3.A_out : f32 -> f32
        hec.assign %PE_4.C_in = %C_in4 : f32 -> f32
        hec.assign %C_out4 = %PE_4.C_out : f32 -> f32
        hec.assign %PE_5.A_in = %PE_4.A_out : f32 -> f32
        hec.assign %PE_5.C_in = %C_in5 : f32 -> f32
        hec.assign %C_out5 = %PE_5.C_out : f32 -> f32
        hec.assign %PE_6.A_in = %PE_5.A_out : f32 -> f32
        hec.assign %PE_6.C_in = %C_in6 : f32 -> f32
        hec.assign %C_out6 = %PE_6.C_out : f32 -> f32
        hec.assign %PE_7.A_in = %PE_6.A_out : f32 -> f32
        hec.assign %PE_7.C_in = %C_in7 : f32 -> f32
        hec.assign %C_out7 = %PE_7.C_out : f32 -> f32
      }
    }
    hec.component @main(%A0: f32, %A1: f32, %A2: f32, %A3: f32, %A4: f32, %A5: f32, %A6: f32, %A7: f32, %C_in0: f32, %C_in1: f32, %C_in2: f32, %C_in3: f32, %C_in4: f32, %C_in5: f32, %C_in6: f32, %C_in7: f32) -> (%C_out0: f32, %C_out1: f32, %C_out2: f32, %C_out3: f32, %C_out4: f32, %C_out5: f32, %C_out6: f32, %C_out7: f32) {interface="wrapped", style="handshake"} {
      %Line_0.A, %Line_0.C_in0, %Line_0.C_in1, %Line_0.C_in2, %Line_0.C_in3, %Line_0.C_in4, %Line_0.C_in5, %Line_0.C_in6, %Line_0.C_in7, %Line_0.C_out0, %Line_0.C_out1, %Line_0.C_out2, %Line_0.C_out3, %Line_0.C_out4, %Line_0.C_out5, %Line_0.C_out6, %Line_0.C_out7 = hec.instance "Line_0" @PE_line : f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32
      %Line_1.A, %Line_1.C_in0, %Line_1.C_in1, %Line_1.C_in2, %Line_1.C_in3, %Line_1.C_in4, %Line_1.C_in5, %Line_1.C_in6, %Line_1.C_in7, %Line_1.C_out0, %Line_1.C_out1, %Line_1.C_out2, %Line_1.C_out3, %Line_1.C_out4, %Line_1.C_out5, %Line_1.C_out6, %Line_1.C_out7 = hec.instance "Line_1" @PE_line : f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32
      %Line_2.A, %Line_2.C_in0, %Line_2.C_in1, %Line_2.C_in2, %Line_2.C_in3, %Line_2.C_in4, %Line_2.C_in5, %Line_2.C_in6, %Line_2.C_in7, %Line_2.C_out0, %Line_2.C_out1, %Line_2.C_out2, %Line_2.C_out3, %Line_2.C_out4, %Line_2.C_out5, %Line_2.C_out6, %Line_2.C_out7 = hec.instance "Line_2" @PE_line : f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32
      %Line_3.A, %Line_3.C_in0, %Line_3.C_in1, %Line_3.C_in2, %Line_3.C_in3, %Line_3.C_in4, %Line_3.C_in5, %Line_3.C_in6, %Line_3.C_in7, %Line_3.C_out0, %Line_3.C_out1, %Line_3.C_out2, %Line_3.C_out3, %Line_3.C_out4, %Line_3.C_out5, %Line_3.C_out6, %Line_3.C_out7 = hec.instance "Line_3" @PE_line : f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32
      %Line_4.A, %Line_4.C_in0, %Line_4.C_in1, %Line_4.C_in2, %Line_4.C_in3, %Line_4.C_in4, %Line_4.C_in5, %Line_4.C_in6, %Line_4.C_in7, %Line_4.C_out0, %Line_4.C_out1, %Line_4.C_out2, %Line_4.C_out3, %Line_4.C_out4, %Line_4.C_out5, %Line_4.C_out6, %Line_4.C_out7 = hec.instance "Line_4" @PE_line : f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32
      %Line_5.A, %Line_5.C_in0, %Line_5.C_in1, %Line_5.C_in2, %Line_5.C_in3, %Line_5.C_in4, %Line_5.C_in5, %Line_5.C_in6, %Line_5.C_in7, %Line_5.C_out0, %Line_5.C_out1, %Line_5.C_out2, %Line_5.C_out3, %Line_5.C_out4, %Line_5.C_out5, %Line_5.C_out6, %Line_5.C_out7 = hec.instance "Line_5" @PE_line : f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32
      %Line_6.A, %Line_6.C_in0, %Line_6.C_in1, %Line_6.C_in2, %Line_6.C_in3, %Line_6.C_in4, %Line_6.C_in5, %Line_6.C_in6, %Line_6.C_in7, %Line_6.C_out0, %Line_6.C_out1, %Line_6.C_out2, %Line_6.C_out3, %Line_6.C_out4, %Line_6.C_out5, %Line_6.C_out6, %Line_6.C_out7 = hec.instance "Line_6" @PE_line : f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32
      %Line_7.A, %Line_7.C_in0, %Line_7.C_in1, %Line_7.C_in2, %Line_7.C_in3, %Line_7.C_in4, %Line_7.C_in5, %Line_7.C_in6, %Line_7.C_in7, %Line_7.C_out0, %Line_7.C_out1, %Line_7.C_out2, %Line_7.C_out3, %Line_7.C_out4, %Line_7.C_out5, %Line_7.C_out6, %Line_7.C_out7 = hec.instance "Line_7" @PE_line : f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32
      hec.graph {
        hec.assign %Line_0.A = %A0 : f32 -> f32
        hec.assign %Line_1.A = %A1 : f32 -> f32
        hec.assign %Line_2.A = %A2 : f32 -> f32
        hec.assign %Line_3.A = %A3 : f32 -> f32
        hec.assign %Line_4.A = %A4 : f32 -> f32
        hec.assign %Line_5.A = %A5 : f32 -> f32
        hec.assign %Line_6.A = %A6 : f32 -> f32
        hec.assign %Line_7.A = %A7 : f32 -> f32
        hec.assign %Line_0.C_in0 = %C_in0 : f32 -> f32
        hec.assign %Line_0.C_in1 = %C_in1 : f32 -> f32
        hec.assign %Line_0.C_in2 = %C_in2 : f32 -> f32
        hec.assign %Line_0.C_in3 = %C_in3 : f32 -> f32
        hec.assign %Line_0.C_in4 = %C_in4 : f32 -> f32
        hec.assign %Line_0.C_in5 = %C_in5 : f32 -> f32
        hec.assign %Line_0.C_in6 = %C_in6 : f32 -> f32
        hec.assign %Line_0.C_in7 = %C_in7 : f32 -> f32
        hec.assign %Line_1.C_in0 = %Line_0.C_out0 : f32 -> f32
        hec.assign %Line_1.C_in1 = %Line_0.C_out1 : f32 -> f32
        hec.assign %Line_1.C_in2 = %Line_0.C_out2 : f32 -> f32
        hec.assign %Line_1.C_in3 = %Line_0.C_out3 : f32 -> f32
        hec.assign %Line_1.C_in4 = %Line_0.C_out4 : f32 -> f32
        hec.assign %Line_1.C_in5 = %Line_0.C_out5 : f32 -> f32
        hec.assign %Line_1.C_in6 = %Line_0.C_out6 : f32 -> f32
        hec.assign %Line_1.C_in7 = %Line_0.C_out7 : f32 -> f32
        hec.assign %Line_2.C_in0 = %Line_1.C_out0 : f32 -> f32
        hec.assign %Line_2.C_in1 = %Line_1.C_out1 : f32 -> f32
        hec.assign %Line_2.C_in2 = %Line_1.C_out2 : f32 -> f32
        hec.assign %Line_2.C_in3 = %Line_1.C_out3 : f32 -> f32
        hec.assign %Line_2.C_in4 = %Line_1.C_out4 : f32 -> f32
        hec.assign %Line_2.C_in5 = %Line_1.C_out5 : f32 -> f32
        hec.assign %Line_2.C_in6 = %Line_1.C_out6 : f32 -> f32
        hec.assign %Line_2.C_in7 = %Line_1.C_out7 : f32 -> f32
        hec.assign %Line_3.C_in0 = %Line_2.C_out0 : f32 -> f32
        hec.assign %Line_3.C_in1 = %Line_2.C_out1 : f32 -> f32
        hec.assign %Line_3.C_in2 = %Line_2.C_out2 : f32 -> f32
        hec.assign %Line_3.C_in3 = %Line_2.C_out3 : f32 -> f32
        hec.assign %Line_3.C_in4 = %Line_2.C_out4 : f32 -> f32
        hec.assign %Line_3.C_in5 = %Line_2.C_out5 : f32 -> f32
        hec.assign %Line_3.C_in6 = %Line_2.C_out6 : f32 -> f32
        hec.assign %Line_3.C_in7 = %Line_2.C_out7 : f32 -> f32
        hec.assign %Line_4.C_in0 = %Line_3.C_out0 : f32 -> f32
        hec.assign %Line_4.C_in1 = %Line_3.C_out1 : f32 -> f32
        hec.assign %Line_4.C_in2 = %Line_3.C_out2 : f32 -> f32
        hec.assign %Line_4.C_in3 = %Line_3.C_out3 : f32 -> f32
        hec.assign %Line_4.C_in4 = %Line_3.C_out4 : f32 -> f32
        hec.assign %Line_4.C_in5 = %Line_3.C_out5 : f32 -> f32
        hec.assign %Line_4.C_in6 = %Line_3.C_out6 : f32 -> f32
        hec.assign %Line_4.C_in7 = %Line_3.C_out7 : f32 -> f32
        hec.assign %Line_5.C_in0 = %Line_4.C_out0 : f32 -> f32
        hec.assign %Line_5.C_in1 = %Line_4.C_out1 : f32 -> f32
        hec.assign %Line_5.C_in2 = %Line_4.C_out2 : f32 -> f32
        hec.assign %Line_5.C_in3 = %Line_4.C_out3 : f32 -> f32
        hec.assign %Line_5.C_in4 = %Line_4.C_out4 : f32 -> f32
        hec.assign %Line_5.C_in5 = %Line_4.C_out5 : f32 -> f32
        hec.assign %Line_5.C_in6 = %Line_4.C_out6 : f32 -> f32
        hec.assign %Line_5.C_in7 = %Line_4.C_out7 : f32 -> f32
        hec.assign %Line_6.C_in0 = %Line_5.C_out0 : f32 -> f32
        hec.assign %Line_6.C_in1 = %Line_5.C_out1 : f32 -> f32
        hec.assign %Line_6.C_in2 = %Line_5.C_out2 : f32 -> f32
        hec.assign %Line_6.C_in3 = %Line_5.C_out3 : f32 -> f32
        hec.assign %Line_6.C_in4 = %Line_5.C_out4 : f32 -> f32
        hec.assign %Line_6.C_in5 = %Line_5.C_out5 : f32 -> f32
        hec.assign %Line_6.C_in6 = %Line_5.C_out6 : f32 -> f32
        hec.assign %Line_6.C_in7 = %Line_5.C_out7 : f32 -> f32
        hec.assign %Line_7.C_in0 = %Line_6.C_out0 : f32 -> f32
        hec.assign %Line_7.C_in1 = %Line_6.C_out1 : f32 -> f32
        hec.assign %Line_7.C_in2 = %Line_6.C_out2 : f32 -> f32
        hec.assign %Line_7.C_in3 = %Line_6.C_out3 : f32 -> f32
        hec.assign %Line_7.C_in4 = %Line_6.C_out4 : f32 -> f32
        hec.assign %Line_7.C_in5 = %Line_6.C_out5 : f32 -> f32
        hec.assign %Line_7.C_in6 = %Line_6.C_out6 : f32 -> f32
        hec.assign %Line_7.C_in7 = %Line_6.C_out7 : f32 -> f32
        hec.assign %C_out0 = %Line_7.C_out0 : f32 -> f32
        hec.assign %C_out1 = %Line_7.C_out1 : f32 -> f32
        hec.assign %C_out2 = %Line_7.C_out2 : f32 -> f32
        hec.assign %C_out3 = %Line_7.C_out3 : f32 -> f32
        hec.assign %C_out4 = %Line_7.C_out4 : f32 -> f32
        hec.assign %C_out5 = %Line_7.C_out5 : f32 -> f32
        hec.assign %C_out6 = %Line_7.C_out6 : f32 -> f32
        hec.assign %C_out7 = %Line_7.C_out7 : f32 -> f32
      }
    }
  }
}
