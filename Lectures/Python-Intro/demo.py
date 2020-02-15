#!/usr/bin/env python3
""" This will be a quick demo of using python
    Search for domain names
    This program will have the following task:
     1) 
     2) 
"""
import os
from requests import get
import sys
from argparse import ArgumentParser
# GLOBALS
API_URL = 'https://api.domainsdb.info/v1/domains/search?domain='
parser = ArgumentParser("Get information about a domain name")
parser.add_argument('domain', help='The domain name to get the query for')
args = parser.parse_args()
