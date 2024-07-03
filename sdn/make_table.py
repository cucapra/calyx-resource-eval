import os
import json
import csv

# Define the directory and output file
directory = "results"
output_file = "table.csv"

# Open the CSV file for writing
with open(output_file, mode="w", newline="") as file:
    writer = csv.writer(file)

    # Write the header row
    writer.writerow(["Configuration", "LUTs", "Register", "Cycles per Push"])

    files = ["no_ann_no_prom", "no_ann_yes_prom", "yes_ann_no_prom", "yes_ann_yes_prom"]
    row_names = [
        "Calyx",
        "Promoted to Piezo",
        "Annotated Piezo",
        "Annotated, Promoted Piezo",
    ]
    # Iterate over each file in the directory
    for i, filename in enumerate(files):
        resource_file = os.path.join(directory, filename + "_resources.json")
        cycles_file = os.path.join(directory, filename + "_cycles.json")

        row = []
        # Open and read the JSON file
        with open(resource_file, "r") as json_file:
            data = json.load(json_file)

            # Extract the required entries
            lut = data.get("lut", "N/A")  # Default to 'N/A' if the key doesn't exist
            registers = data.get(
                "registers", "N/A"
            )  # Default to 'N/A' if the key doesn't exist

            row += [row_names[i], lut, registers]

        with open(cycles_file, "r") as json_file:
            data = json.load(json_file)
            cycles = data.get(
                "latency", "N/A"
            )  # Default to 'N/A' if the key doesn't exist
            row += [cycles / 10000]

        # Write the row to the CSV file
        writer.writerow(row)

print(f"Data has been written to {output_file}")
