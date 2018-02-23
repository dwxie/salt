#!/usr/bin/env python
# -*- coding: utf-8 -*-

import json
import os
import sys

reload(sys)
sys.setdefaultencoding('utf-8')

# [global]
SCRIPT_PATH = os.path.dirname(os.path.abspath(__file__))
SCRIPT_NAME = os.path.basename(__file__)

class JsonFormat(object):
    """Serialize obj to a JSON formatted str."""
    def __init__(self, **kwarg):
        self.obj = kwarg

    def dumps(self):
        json_data = self.loads(self.read(self.obj['input_file']))
        self.json_format_data = json.dumps(json_data, ensure_ascii=False, indent=4) + "\n"
        return self

    def loads(self, str):
        return json.loads(str)

    def read(self, file):
        fd = open(file)
        data = fd.read()
        fd.close()
        return data

    def write(self, file):
        fd = open(file, 'w')
        fd.write(self.json_format_data)
        fd.close()

    def get(self):
        return self.json_format_data

def usage():
    print "Usage:"
    print "    python " + SCRIPT_NAME + ' [<input_file>] [<output_file>]'
    sys.exit(2)

if __name__ == '__main__':
    config = {
        'input_file' : SCRIPT_PATH + '/config.json.origin',
        'output_file' : SCRIPT_PATH + '/config.json',
    }
    try:
        args_len = len(sys.argv)
        if args_len >= 2:
            config['input_file'] = sys.argv[1]
        if args_len >= 3:
            config['output_file'] = sys.argv[2]

        ins = JsonFormat(input_file=config['input_file'])
        ins.dumps().write(config['output_file'])
        print "successfully"
    except Exception,e:
        # when exception, print default value
        print "failed"
        print e
        sys.exit(255)
