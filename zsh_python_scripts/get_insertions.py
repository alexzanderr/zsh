

import sys
import os

def get_formatted_hunks(args):
    # 3 files changed, 30 insertions(+), 9 deletions(-)
    # or
    # 3 files changed, 30 insertions(+)
    # or
    # 3 files changed
    git_hunks = args[1]

    if git_hunks == "":
        print("clean")
        return

    if git_hunks.__contains__(","):
        items = git_hunks.split(",")
        items = list(map(str.strip, items))

        if len(items) == 1:
            total_files_changed = items[0].split()[0]
            print("False")

        elif len(items) == 2:
            total_files_changed = items[0].split()[0]
            total_insertions = items[1].split()[0]
            print(f"+{total_insertions}")

        elif len(items) == 3:
            total_files_changed = items[0].split()[0]
            total_insertions = items[1].split()[0]
            total_deletions = items[2].split()[0]

            print(f"+{total_insertions}")


if __name__ == "__main__":
    args = sys.argv
    if len(args) == 2:
        get_formatted_hunks(args)




        # added more lines to test the hunks








