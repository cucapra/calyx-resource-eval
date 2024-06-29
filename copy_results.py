import os
import json
import sys


def combine_json_files(input_dir, output_dir):
    # Create the output directory if it doesn't exist
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    # Iterate through each subdirectory in the input directory
    for subdir in os.listdir(input_dir):
        subdir_path = os.path.join(input_dir, subdir)
        if os.path.isdir(subdir_path):
            combined_json = {}

            # Iterate through each file in the subdirectory
            for filename in os.listdir(subdir_path):
                file_path = os.path.join(subdir_path, filename)
                if filename.endswith(".json") and os.path.isfile(file_path):
                    with open(file_path, "r", encoding="utf-8") as file:
                        try:
                            file_contents = json.load(file)
                            combined_json[filename] = file_contents
                        except json.JSONDecodeError:
                            print(f"Error decoding JSON from file: {file_path}")

            # Write the combined JSON to a new file in the output directory
            output_file_path = os.path.join(output_dir, f"{subdir}.json")
            with open(output_file_path, "w", encoding="utf-8") as output_file:
                json.dump(combined_json, output_file, indent=4)


if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python combine_json.py <input_directory> <output_directory>")
        sys.exit(1)

    input_directory = sys.argv[1]
    output_directory = sys.argv[2]

    combine_json_files(input_directory, output_directory)
    print("JSON files combined successfully.")
