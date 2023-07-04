sh gen-calyx.sh > atax.futil 

sh print-json.sh > init.json 

fud e --to dat --from calyx --through icarus-verilog -s verilog.data init.json -o calyx-results.json atax.futil 

sh print-json.sh run-op > c-results.json 

python3 compare-out.py -f calyx-results.json -s c-results.json 

rm init.json calyx-results.json c-results.json 