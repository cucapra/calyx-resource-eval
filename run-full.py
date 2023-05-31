import subprocess
import json
import argparse


def main():
    parser = argparse.ArgumentParser(description="Process args for resource estimates")
    parser.add_argument("-s", "--sequential", action="store_true")
    parser.add_argument("-d", "--debug", action="store_true")
    parser.add_argument("-j", "--json")
    parser.add_argument("-v", "--version", default="version-settings/current.json")
    args = parser.parse_args()
    with open(args.version) as f:
        json_dict = json.load(f)
        # calyx/dahlia commit to use
        calyx_version = json_dict.get("calyx_version", "master")
        dahlia_version = json_dict.get("dahlia_version", "master")
        # based on verison, fud should use either futil or calyx
        fud_calyx_extension = json_dict.get("calyx_extension", "calyx")

        subprocess.run(
            ["./configure-fud.sh", calyx_version, dahlia_version, fud_calyx_extension]
        )

        cmdline_args = ["python3.9", "estimates.py"]
        # probably a better way to do this, but want run-full.py to take some of
        # the same cmdline arguments that estimates.py uses
        for k, v in vars(args).items():
            if k == "version":
                continue
            if v is True:
                cmdline_args.append("--" + k)
            elif k == "json" and v is not None:
                cmdline_args.append("-j")
                cmdline_args.append(f"""{v}""")
        # run estimates.py
        subprocess.run(cmdline_args)


if __name__ == "__main__":
    main()
