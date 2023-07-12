sh gen-calyx.sh trisolv > trisolv.futil 

sh print-json.sh > init.json 

fud e --to dat --from calyx --through verilog -s verilog.data init.json -o calyx-results.json -v trisolv.futil  

sh print-json.sh run-op > c-results.json 

python3 compare-out.py -f calyx-results.json -s c-results.json 

rm init.json c-results.json 