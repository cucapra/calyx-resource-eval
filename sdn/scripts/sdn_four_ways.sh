#!/bin/bash

# The unannotated code is in sdn.futil, and the annotated code is in sdn_static.futil.
# The data file is sdn.data.
code=benchmarks/sdn/sdn.futil
annotated_code=benchmarks/sdn/sdn_static.futil
data=benchmarks/sdn/sdn.data
# By default, the code is promoted to Piezo. To disable promotion, we pass the -d static-promotion flag.

# Unannotated code, not further promoted
fud e -q $code --to resource-estimate -s verilog.data $data -s calyx.flags ' -d static-promotion ' > results/no_ann_no_prom.json

# Unannotated code, further promoted to Piezo
fud e -q $code --to resource-estimate -s verilog.data $data > results/no_ann_yes_prom.json

# Annotated code, not further promoted
fud e -q $annotated_code --to resource-estimate -s verilog.data $data -s calyx.flags ' -d static-promotion ' > results/yes_ann_no_prom.json

# Annotated code, further promoted to Piezo
fud e -q $annotated_code --to resource-estimate -s verilog.data $data > results/yes_ann_yes_prom.json
