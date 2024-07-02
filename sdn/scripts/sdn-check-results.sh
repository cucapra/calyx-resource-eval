#!/bin/bash

# The unannotated code is in sdn.futil, and the annotated code is in sdn_static.futil.
# The data file is sdn.data.
code=benchmarks/sdn/sdn.futil
annotated_code=benchmarks/sdn/sdn_static.futil
data=benchmarks/sdn/sdn.data
# By default, the code is promoted to Piezo. To disable promotion, we pass the -d static-promotion flag.

# Unannotated code, not further promoted
fud e -q $code --to dat --from calyx --through verilog -s verilog.data $data -s calyx.flags ' -d static-promotion ' | diff -q <(jq .memories) benchmarks/sdn.expect >> results-diff.txt

# Unannotated code, further promoted to Piezo
fud e -q $code --to dat --from calyx --through verilog -s verilog.data $data | diff -q <(jq .memories) benchmarks/sdn.expect >> results-diff.txt

# Annotated code, not further promoted
fud e -q $annotated_code --to dat --from calyx --through verilog -s verilog.data $data -s calyx.flags ' -d static-promotion ' | diff -q <(jq .memories) benchmarks/sdn.expect >> results-diff.txt
# Annotated code, further promoted to Piezo
fud e -q $annotated_code --to dat --from calyx --through verilog -s verilog.data $data | jq '{ "latency": .cycles }'| diff -q <(jq .memories) benchmarks/sdn.expect >> results-diff.txt
