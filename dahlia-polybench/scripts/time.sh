#!/bin/bash

# Folder containing executables
EXECUTABLE_FOLDER="cpp_benchmarks"

# Loop through each executable ending in .o in the folder
for executable in "$EXECUTABLE_FOLDER"/*.o; do
    if [[ -x "$executable" && ! -d "$executable" ]]; then
        executable_name=$(basename "$executable" .o)

        # Create an empty string to hold all output
        all_output=""

        # Run the executable 10 times and capture the output
        for i in {1..10}; do
            output=$("$executable")
            all_output+="$output, "
        done

        # Remove the trailing comma and space
        all_output=${all_output%, }

        # Write the output to a CSV file (first row)
        echo "$all_output" > "$OUTPUT_FOLDER/${executable_name}.csv"
    fi
done