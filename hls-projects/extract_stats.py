import os
import subprocess


def generate_command(src: str, dst: str, directory_name: str, dst_name: str):
    modified_name = directory_name.replace("-", "_")
    return [
        "fud",
        "e",
        "--to",
        dst,
        "--from",
        src,
        directory,
        "-s",
        "hls-files.top",
        f"kernel_{modified_name}",
        "-o",
        f"{directory_name}/{dst_name}.json",
    ]


# Get a list of directories in the current directory
directories = [d for d in os.listdir(".") if os.path.isdir(d)]

# Iterate over each directory
for directory in directories:
    if directory != "seidel-2d":
        continue
    # seidel-2d -> seidel_2d
    get_resource_estimates = generate_command(
        "hls-files-routed",
        "hls-detailed-estimate",
        directory,
        "resource_estimates",
    )
    get_cycles_estimates = generate_command(
        "hls-files",
        "hls-cycles-estimate",
        directory,
        "cycle_estimates",
    )
    # Run the command
    # subprocess.run(get_resource_estimates)
    try:
        subprocess.run(get_cycles_estimates)
    except:
        print(f"Error when extracting: {directory}")
