#!/usr/bin/env python3
""" This will be a quick demo of using python
    Search for domain names
    This program will perform the following:
     1) Fetch domain data from a public api 
     2) Write matched domains to a file
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


result = get(f'{API_URL}{args.domain}')

if result.status_code != 200:
    sys.exit("Something went wrong")

print(result.json())
with open(f'{args.domain}-list.txt', 'w+') as file_:
    for item in result.json()['domains']:
        file_.writelines(item['domain'] + '\n')
