#! /usr/local/bin/python3
import psutil
from argparse import ArgumentParser
import sys

parser = ArgumentParser(description="Tool")
parser.add_argument('process_name', type=str)
args = parser.parse_args()

# To access process_name argument use args.process_name
