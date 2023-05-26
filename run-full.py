import subprocess
import json
import argparse


def main():
    with open("version-settings.json") as f:
        json_dict = json.load(f)
        calyx_version = json_dict.get("calyx_version", "master")
        dahlia_version = json_dict.get("dahlia_version", "master")
        subprocess.run(["./configure-fud.sh", calyx_version, dahlia_version])
        parser = argparse.ArgumentParser(
            description="Process args for resource estimates"
        )
        parser.add_argument("-s", "--sequential", action="store_true")
        parser.add_argument("-d", "--debug", action="store_true")
        parser.add_argument("-q", "--quick", action="store_true")
        args = parser.parse_args()
        # probably a better way to do this
        cmdline_args = ["python3", "estimates.py"]
        print(vars(args))
        for k, v in vars(args).items():
            if v is True:
                cmdline_args.append("--" + k)
        subprocess.run(cmdline_args)


if __name__ == "__main__":
    main()
