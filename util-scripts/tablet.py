#!/usr/bin/python
import subprocess
import re
import socket

outputs_by_hostname = {
    "tree": "HDMI-1",
    "sl2-laptop": "HDMI-2",
}


def get_desired_output():
    hostname = socket.gethostname()
    try:
        return outputs_by_hostname[hostname]
    except KeyError:
        raise RuntimeError(f"No tablet output configured for hostname: {hostname}")

def get_stylus_id():
    data = subprocess.run(["xsetwacom", "--list", "devices"], capture_output=True,text=True)

    ids = re.findall(r"stylus.*?id:\s*(\d+)", data.stdout)

    if len(ids) == 0:
        raise RuntimeError("No stylus found")
    if len(ids) > 1:
        raise RuntimeError("Too many styli found")

    return ids[0]

if __name__ == "__main__":
    subprocess.run(["xsetwacom", "--set", get_stylus_id(), "MapToOutput", get_desired_output()])
