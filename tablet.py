#!/usr/bin/python
import subprocess
import re

desired_output = "HDMI-1"

def get_stylus_id():
    data = subprocess.run(["xsetwacom", "--list", "devices"], capture_output=True,text=True)

    matches = re.findall("stylus.\sid: \d+", data.stdout)

    if len(matches) == 0:
        raise RuntimeError("No stylus found")

    if len(matches) > 1:
        raise RuntimeError("Too many styli found")
   
    return re.findall("\d+", matches[0])[0]

if __name__ == "__main__":
    subprocess.run(["xsetwacom", "--set", get_stylus_id(), "MapToOutput", desired_output])
