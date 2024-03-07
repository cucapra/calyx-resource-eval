import os


def run_vitis_hls(subdirectory_name):
    # Change directory to the subdirectory
    os.chdir(subdirectory_name)

    # Run vitis_hls command
    command = (
        f"vitis_hls -f ../hls.tcl top kernel_{subdirectory_name} hls_prj benchmark.prj"
    )
    os.system(command)

    # Return to the parent directory
    os.chdir("..")


def main():
    # List all directories in the current directory
    directories = [d for d in os.listdir(".") if os.path.isdir(d)]

    # Iterate over each subdirectory
    for subdirectory_name in directories:
        # Check if the subdirectory contains 'hls_prj' directory (to avoid re-running)
        # if os.path.exists(os.path.join(subdirectory_name, f"{subdirectory_name}.prj")):
        #     print(f"Skipping {subdirectory_name}: Already processed.")
        #     continue

        # Run vitis_hls for the subdirectory
        print(f"Running vitis_hls for {subdirectory_name}...")
        run_vitis_hls(subdirectory_name)
        print(f"vitis_hls completed for {subdirectory_name}.")


if __name__ == "__main__":
    main()
