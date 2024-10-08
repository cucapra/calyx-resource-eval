#!/bin/bash

# The unannotated code is in sdn.futil, and the annotated code is in sdn_static.futil.
# The data file is sdn.data.
code=benchmarks/sdn/sdn.futil
annotated_code=benchmarks/sdn/sdn_static.futil
data=benchmarks/sdn/sdn.data
# By default, the code is promoted to Piezo. To disable promotion, we pass the -d static-promotion flag.

# Unannotated code, not further promoted
# Resource estimates
fud e -q $code --to resource-estimate --from calyx -s calyx.flags ' -d static-promotion ' > results/no_ann_no_prom_resources.json

# Unannotated code, further promoted to Piezo
# Resource estimates
fud e -q $code --to resource-estimate --from calyx > results/no_ann_yes_prom_resources.json

# Annotated code, not further promoted
# Resource estimates
fud e -q $annotated_code --to resource-estimate --from calyx -s calyx.flags ' -d static-promotion ' > results/yes_ann_no_prom_resources.json

# Annotated code, further promoted to Piezo
# Resource estimates
fud e -q $annotated_code --to resource-estimate --from calyx > results/yes_ann_yes_prom_resources.json
