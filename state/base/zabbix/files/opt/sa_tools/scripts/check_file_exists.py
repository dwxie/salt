#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys

try:
    check_file=sys.argv[1]

    if os.path.exists(r"%s" % check_file):
        print "1"
    else:
        print "0"
except:
    print "0"
