import os
import json
import argparse


def merge_json_files(input_dir, output_dir):
    # Ensure the output directory exists
    os.makedirs(output_dir, exist_ok=True)

    # Iterate over each subdirectory in the input directory
    for subdir in os.listdir(input_dir):
        subdir_path = os.path.join(input_dir, subdir)

        if os.path.isdir(subdir_path):
            # Dictionary to store merged JSON content
            merged_data = {}

            # Iterate over each file in the subdirectory
            for filename in os.listdir(subdir_path):
                file_path = os.path.join(subdir_path, filename)

                if file_path.endswith(".json"):
                    # Read the content of the JSON file
                    with open(file_path, "r") as json_file:
                        json_content = json.load(json_file)
                        merged_data[filename] = json_content

            # Create the large JSON file for the subdirectory
            output_file_path = os.path.join(output_dir, f"{subdir}.json")
            with open(output_file_path, "w") as output_file:
                json.dump(merged_data, output_file, indent=4)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Merge JSON files in subdirectories.")
    parser.add_argument(
        "input_dir",
        type=str,
        help="Input directory containing subdirectories with JSON files.",
    )
    parser.add_argument(
        "output_dir", type=str, help="Output directory for merged JSON files."
    )

    args = parser.parse_args()

    merge_json_files(args.input_dir, args.output_dir)
