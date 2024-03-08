import os
import shutil


def delete_benchmark_prj():
    # Get the current directory
    current_dir = os.getcwd()

    # Get a list of all subdirectories
    subdirectories = [
        d
        for d in os.listdir(current_dir)
        if os.path.isdir(os.path.join(current_dir, d))
    ]

    # Iterate through each subdirectory
    for subdir in subdirectories:
        # Check if "benchmark.prj" directory exists
        benchmark_prj_path = os.path.join(current_dir, subdir, "benchmark.prj")
        if os.path.exists(benchmark_prj_path) and os.path.isdir(benchmark_prj_path):
            # Delete the directory
            try:
                shutil.rmtree(benchmark_prj_path)
                print(f"Deleted 'benchmark.prj' directory in {subdir}")
            except OSError as e:
                print(f"Error deleting 'benchmark.prj' directory in {subdir}: {e}")
        # estimates_path = os.path.join(current_dir, subdir, "estimate.json")
        # if os.path.exists(estimates_path):
        #     try:
        #         os.remove(estimates_path)
        #         print(f"Deleted 'estimate.json' directory in {subdir}")
        #     except OSError as e:
        #         print(f"Error deleting 'benchmark.prj' directory in {subdir}: {e}")


if __name__ == "__main__":
    delete_benchmark_prj()
