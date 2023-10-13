import argparse
import os
import json


# https://stackoverflow.com/questions/800197/how-to-get-all-of-the-immediate-subdirectories-in-python
def get_immediate_subdirectories(a_dir):
    return [
        name for name in os.listdir(a_dir) if os.path.isdir(os.path.join(a_dir, name))
    ]


if __name__ == "__main__":
    """ """
    parser = argparse.ArgumentParser(description="Process some json file names")
    parser.add_argument("-p", "--path", type=str)
    parser.add_argument("-o", "--output", type=str)
    # This argument is for if we only want to accumulate one key from the json,
    # not the entire json
    parser.add_argument("-k", "--key", type=str)
    args = parser.parse_args()
    assert (
        args.path is not None and args.output is not None
    ), "Need to provide both arguments"
    if not os.path.exists(args.output):
        os.makedirs(args.output)

    for directory in get_immediate_subdirectories(args.path):
        dirpath = os.path.join(args.path, directory)
        cur_dic = {}
        for file in os.listdir(dirpath):
            if file != "combined.json":
                filepath = os.path.join(dirpath, file)
                with open(os.path.join(dirpath, file)) as f:
                    dict = json.load(f)
                    if args.key is not None:
                        cur_dic[file] = dict[args.key]
                    else:
                        cur_dic[file] = dict
        with open(
            os.path.join(args.output, f"{directory}-combined.json"), "w"
        ) as outfile:
            json.dump(cur_dic, outfile)
