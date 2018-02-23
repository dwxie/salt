#!/usr/bin/env python
# -*- coding: utf-8 -*-

import hmac
import struct
import functools
import random
import json
from hashlib import md5

pack_unsigned_int = functools.partial(struct.pack, 'I')


def gen_ly_app_id(app_num=6):
    app_list = []
    for i in range(app_num):
        app_id = ''
        for j in range(4):
            app_id += app_id.join(chr(random.randint(97, 122)))
        app_list.append(app_id)
    return app_list


def gen_ly_app_key(app_list):
    app_key_dict = {}
    for i in range(len(app_list)):
        app_key = ""
        for j in range(32):
            app_key += random.choice([str(random.randint(0, 9)),
                                      chr(random.randint(97, 122))])
        app_key_dict[app_list.pop()] = app_key
    return app_key_dict


def test_ly_token(app_key, cid, control, expire):
    parts = [cid, control, expire]
    data = ''.join(map(pack_unsigned_int, parts))
    hash_val = hmac.new(app_key, data, md5).hexdigest()
    return '_'.join(map(str, parts)+[hash_val])


if __name__ == '__main__':
    app_list = gen_ly_app_id()
    app_key_dict = gen_ly_app_key(app_list)
    third_party_app_key = random.choice(list(app_key_dict.values()))
    print(json.dumps(app_key_dict, indent=4))
    print("Third_Party_App_Key: {}".format(third_party_app_key))
    cid = 10001
    control = 3222274048
    expire = 1475031947
    print("Test_Token: {}".format(test_ly_token(third_party_app_key,
                                                cid, control, expire)))
