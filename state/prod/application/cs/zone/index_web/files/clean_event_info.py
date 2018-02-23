#!/usr/bin/env python
# -*- coding: utf-8 -*-

from pymongo import MongoClient
import time

timestamp = int(time.time()) - 24 * 60 * 60 * 20

print("Start clean time less than %d record." % timestamp)
client = MongoClient('mongodb://topvdn:XwkqUz2a8cN8yAuHTMgXJAEC@1.mongodb.private:28017,2.mongodb.private:28017,3.mongodb.private:28017/?authSource=topvdn')
db = client['topvdn']
print("Run begin record count is %d." % db.event_info.count())
db.event_info.remove({"time": {"$lt": timestamp}})
print("Run end record count is %d." % db.event_info.count())
