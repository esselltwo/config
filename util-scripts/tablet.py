#!/usr/bin/python
import subprocess
import re

desired_output = "HDMI-1"

def get_stylus_id():
    data = subprocess.run(["xsetwacom", "--list", "devices"], capture_output=True,text=True)

    ids = re.findall(r"stylus.*?id:\s*(\d+)", data.stdout)

    if len(ids) == 0:
        raise RuntimeError("No stylus found")
    if len(ids) > 1:
        raise RuntimeError("Too many styli found")

    return ids[0]

if __name__ == "__main__":
    subprocess.run(["xsetwacom", "--set", get_stylus_id(), "MapToOutput", desired_output])
