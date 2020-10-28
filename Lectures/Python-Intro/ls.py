#! /usr/bin/env python3
"""
File: ls.py
Description: Simple implementation of ls unix command
"""

import os
import sys
from argparse import ArgumentParser
from pathlib import Path


def parse_arguments():
    parser = ArgumentParser()
    parser.add_argument("dir", nargs="?", default=os.getcwd())
    parser.add_argument("-a", action="store_true",
                        help="List all hidden files as well")
    args = parser.parse_args()
    return args


def dir_list(file_path, list_all=False):
    path = Path(file_path)
    if not path.exists():
        print("The provided file could not be located. Exiting")
        sys.exit(1)

    for item in path.iterdir():
        if list_all:
            print(item)
        else:
            if not item.name.startswith("."):
                print(item)


def main():
    args = parse_arguments()
    dir_list(args.dir, args.a)


if __name__ == "__main__":
    main()
