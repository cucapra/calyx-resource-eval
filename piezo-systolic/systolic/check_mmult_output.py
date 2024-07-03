import json
import argparse
import subprocess
import os
import numpy as np
from drive import check_output

if __name__ == "__main__":
    """
    Simulates systolic array based on input json settings.
    """
    parser = argparse.ArgumentParser(description="Process some json file names")
    parser.add_argument("-j", "--json", type=str)
    args = parser.parse_args()

    check_output(
        tl=16,
        td=16,
        ll=16,
        ld=16,
        post_op=None,
        json_file=args.json,
        flat=True,
    )
