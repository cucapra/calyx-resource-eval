#!/bin/bash

# The unannotated code is in sdn.futil, and the annotated code is in sdn_static.futil.
# The data file is sdn.data.
code=benchmarks/sdn/sdn.futil
annotated_code=benchmarks/sdn/sdn_static.futil
data=benchmarks/sdn/sdn.data
# By default, the code is promoted to Piezo. To disable promotion, we pass the -d static-promotion flag.

# Unannotated code, not further promoted
# Cycle counts
fud e -q $code --to dat --from calyx --through verilog -s verilog.data $data -s calyx.flags ' -d static-promotion ' | jq '{ "latency": .cycles }'  > results/no_ann_no_prom_cycles.json

# Unannotated code, further promoted to Piezo
# Cycle counts
fud e -q $code --to dat --from calyx --through verilog -s verilog.data $data | jq '{ "latency": .cycles }'  > results/no_ann_yes_prom_cycles.json

# Annotated code, not further promoted
# Cycle counts
fud e -q $annotated_code --to dat --from calyx --through verilog -s verilog.data $data -s calyx.flags ' -d static-promotion '  | jq '{ "latency": .cycles }' > results/yes_ann_no_prom_cycles.json

# Annotated code, further promoted to Piezo
# Cycle counts
fud e -q $annotated_code --to dat --from calyx --through verilog -s verilog.data $data | jq '{ "latency": .cycles }' > results/yes_ann_yes_prom_cycles.json
