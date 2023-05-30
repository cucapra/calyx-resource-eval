import subprocess
import json
import argparse


def main():
    with open("version-settings.json") as f:
        json_dict = json.load(f)
        # calyx/dahlia commit to use
        calyx_version = json_dict.get("calyx_version", "master")
        dahlia_version = json_dict.get("dahlia_version", "master")
        # based on verison, fud should use either futil or calyx
        fud_calyx_extension = json_dict.get("calyx_extension", "calyx")

        subprocess.run(
            ["./configure-fud.sh", calyx_version, dahlia_version, fud_calyx_extension]
        )
        # probably a better way to do this, but want run-full.py to take some of
        # the same cmdline arguments that estimates.py uses
        parser = argparse.ArgumentParser(
            description="Process args for resource estimates"
        )
        parser.add_argument("-s", "--sequential", action="store_true")
        parser.add_argument("-d", "--debug", action="store_true")
        parser.add_argument("-j", "--json")
        args = parser.parse_args()
        cmdline_args = ["python3.9", "estimates.py"]
        for k, v in vars(args).items():
            if v is True:
                cmdline_args.append("--" + k)
            elif k == "json" and v is not None:
                print(v)
                cmdline_args.append("-j")
                cmdline_args.append(f"""{v}""")
        # run estimates.py
        subprocess.run(cmdline_args)


if __name__ == "__main__":
    main()
