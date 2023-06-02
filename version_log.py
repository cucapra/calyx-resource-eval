import os
from pathlib import Path
import json

directory = "debug-results"


class VersionInfo:
    """
    An object to store "version info" for a Calyx Resource Usage Run.
    calyx_hash: the Calyx Hash
    dahlia_hash: the Dahlia Hash
    calyx_flags: the flags, stored in a set of tuples (e.g., {("-d", "group2invoke")})
    """

    def __init__(self, calyx_hash, dahlia_hash, calyx_flags):
        self.calyx_hash = calyx_hash
        self.dahlia_hash = dahlia_hash
        self.calyx_flags = calyx_flags

    def __eq__(self, other):
        """
        Useful for testing redundant runs that we are storing
        """
        return (
            self.calyx_hash == other.calyx_hash
            and self.dahlia_hash == other.dahlia_hash
            and self.calyx_flags == other.calyx_flags
        )

    def __str__(self):
        return f"""====\ncalyx hash: {self.calyx_hash} \ndahlia hash: {self.dahlia_hash} \ncalyx flags: {self.calyx_flags}\n====\n"""


def calyx_flags_to_set(calyx_flags):
    """
    turns a string of `calyx_flags` into a set of tuples
    e.g., " -d  group2invoke " -> {("-d", "group2invoke")}
    returns None if `calyx_flags` is None
    """
    if calyx_flags is None:
        return None
    flags_list = calyx_flags.split()
    flags_set = set()
    for i in range(0, len(flags_list), 2):
        flags_set.add((flags_list[i], flags_list[i + 1]))
    return flags_set


def get_version_info(moment_dir):
    """
    Given a directory `moment_dir`, return an appropraite `VersionInfo` Object
    """
    info = VersionInfo(None, None, None)
    for fname in os.listdir(moment_dir):
        pname = os.path.join(moment_dir, fname)
        # get calyx/dahlia info from version_info.json
        if Path(pname).name == "version_info.json":
            with open(pname) as f:
                version_info = json.load(f)
                calyx_hash = version_info["calyx"].split("||")[0]
                dahlia_hash = version_info["dahlia"].split("||")[0]
                info.calyx_hash = calyx_hash
                info.dahlia_hash = dahlia_hash
        # get calyx flags from settings_ran.json
        if Path(pname).name == "settings_ran.json":
            with open(pname) as f:
                settings = json.load(f)
                universal_configs = settings.get("universal_configs", {})
                stage_dynamic_config = dict(
                    universal_configs.get("stage_dynamic_config", [])
                )
                calyx_flags = stage_dynamic_config.get("calyx.flags", None)
                info.calyx_flags = calyx_flags_to_set(calyx_flags)
    # should have calyx_hash and dahlia_hash. Doesn't necesarily need to have
    # calyx_flags (in that case we know it was just the default pass pipeline)
    if info.calyx_hash is None or info.dahlia_hash is None:
        raise Exception(f"""{moment_dir} does not have calyx/dahlia commit info""")
    # currently just allow copies
    return info


def get_commit_log():
    # all_versions is a list of VersionInfo Objects. Currently duplicates are allowed
    # and stored
    all_versions = []
    for filename in os.listdir(directory):
        # for each folder in directory (= "debug-results/" for now), build a VersionInfo object
        pathname = os.path.join(directory, filename)
        all_versions.append(get_version_info(pathname))
    return all_versions


if __name__ == "__main__":
    for info in get_commit_log():
        print(info)
