#!/usr/bin/env python

import json
import sys

json_file, = sys.argv[1:]

with open(json_file, 'r') as f:
    json_dict = json.load(f)

cmd_str = ' '.join([f'--{k}' if v is True else ('' if (v is False or v is None) else f'--{k} {v}') for k, v in json_dict.items()])

print(cmd_str)
