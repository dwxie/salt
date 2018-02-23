# -*-coding:utf-8 -*-
"""
   bill_syn
   ~~~~~~~
   同步账单数据
"""
from log_center.utils.time_utils import get_oclock_of_today
from log_center.model.finance import Bill
from log_center.model.app_statistics import AppDaily
from log_center.model.ly_statistics import LyDaily
from pandas import DataFrame


def platform_bill(bill, timestamp):
    data = DataFrame(bill).sum().to_dict()
    if 'timestamp' in data:
        data.pop('timestamp')
    print timestamp, data
    LyDaily.update_one({'timestamp': timestamp}, data, upsert=True)


def bill_syn(timestamp=None):
    if not timestamp:
        print timestamp
        today = get_oclock_of_today()
        timestamp = today - 24*60*60
    bill_data = Bill.get_daily_bill(timestamp)
    for d in bill_data:
        d['timestamp'] = timestamp
        print d
        AppDaily.update(
            {'app_id': d['app_id'], 'timestamp': timestamp}, d, upsert=True)
    platform_bill(bill_data, timestamp)


if __name__ == '__main__':
    bill_syn()
