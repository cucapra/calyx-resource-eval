import os
import subprocess

# Get a list of directories in the current directory
directories = [d for d in os.listdir(".") if os.path.isdir(d)]

# Iterate over each directory
for directory in directories:
    # Form the command
    command = [
        "fud",
        "e",
        "--to",
        "hls-estimate",
        "--from",
        "hls-files",
        directory,
        "-s",
        "hls-files.top",
        f"kernel_{directory}",
        "-o",
        f"{directory}/estimate.json",
    ]

    # Run the command
    subprocess.run(command)
