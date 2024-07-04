import json

# Define the file paths
max_freq_filepaths = [
    "resources/max-freq-calyx/16.systolic.json",
    "resources/max-freq-piezo/16.systolic.json",
]

resource_filepaths = [
    "simulation/calyx-mmult/16-compute.json",
    "simulation/static-mmult/16.systolic.json",
]

for file_path in max_freq_filepaths:
    # Open and read the JSON file
    with open(file_path, "r") as file:
        data = json.load(file)

    # Extract the necessary information
    frequency = data.get("frequency")
    worst_slack = data.get("worst_slack")

    # Hacky way to determine design name
    design_name = "Calyx" if "calyx" in file_path else "Piezo"

    # Print the desired output
    print(
        f"{design_name} meets frequency at {frequency} MHz with a worst slack of {worst_slack}"
    )

for file_path in resource_filepaths:
    # Open and read the JSON file
    with open(file_path, "r") as file:
        data = json.load(file)

    # Extract the necessary information
    latency = data.get("cycles")

    # Hacky way to determine design name
    design_name = "Calyx" if "calyx" in file_path else "Piezo"

    # Print the desired output
    print(f"{design_name} takes {latency} cycles to compute output")
