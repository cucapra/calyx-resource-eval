# calyx-resource-eval
Resource Usage Evaluation for Calyx (&amp; its Frontends)

debug-results/ holds some early results that I got just to test the scripts. 

# Arguments for the Scripts (which are all optional) 
## `run-full.py` 
Builds Dahlia and 2 Versions of Calyx (one to run fud on, the other to run the Calyx compiler on) and gets resource numbers for the benchmarks. 

`-s --sequential` to get resource numbers for the benchmarks sequentially (the default is to run in parallel as to save time) 

`-d --debug` to just get the resource numbers for the benchmarks, but don't write them down into any files. This is mainly helpful if you want to make sure the scripts are working, but don't want to clutter up your results folder. 

`-j --json` is the settings json to take in (defaults to `settings/settings.json`): it should specify which benchmarks files to run, along with the other information about fud configuration that is necessary. To see exact details on what the json should look like, look into the `settings/` folder. 

`-v --version` is the path to json that should have "calyx_version" and "dahlia_version" entries for which commit hash to use (defaults to the most recent version of both), along with "calyx_extension": basically, whether fud should use `target/debug/calyx` or `target/debug/futil`. 

## `graph.py` 
Builds a graph for results in `debug-results/`. 

`-s --save`: whether to save the graphs in `graphs/` 

`-r --resource`: the name of a resource (e.g., `lut`), or a json file that has a "resources" entry with a list of resources to graph.

`-d --design`: the name of a design (e.g., `lenet.futil`), or a json file that has a "designs" entry with a list of designs to graph. 

## `version-log.py` (WIP)
Right now, it just prints out the which commits/versions of Calyx and Dahlia we've gathered resource data for. 
