

import os
import sys
import subprocess
from core.aesthetics import *


if __name__ == "__main__":

    program_arguments = sys.argv
    #  print(program_arguments)
    if len(program_arguments) == 2:
        # then we have a url
        hl = program_arguments[1]
        if hl.startswith("https://") or hl.startswith("http://"):
            subprocess.call(f"firefox {hl} &", shell=1)

            print("\nURL")
            print_green_bold_underlined(hl)
            print(f"opened in default {yellow_bold('browser')}\n")

        elif os.path.isfile(hl) or os.path.isdir(hl):
            if "." not in hl or hl.endswith(".sh"):
                pass
            else:
                subprocess.call(f"thunar {hl} &", shell=1)

                print("\nPATH")
                print_blue_bold_underlined(hl)
                print(f"opened in default {yellow_bold('file explorer')}\n")
