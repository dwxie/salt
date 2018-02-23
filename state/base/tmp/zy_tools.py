#!/usr/bin/env python
#coding:utf-8
#
import json
import subprocess
import re
import os,sys
import logging
import datetime,time
import ctypes

class Mylogging:
    '''
    记录日志内容
    '''
    def __init__(self,path,clevel = logging.DEBUG,flevel = logging.DEBUG):
        self.logger = logging.getLogger(path)
        self.logger.setLevel(logging.DEBUG)
        fmt = logging.Formatter('[%(asctime)s] [%(filename)s line:%(lineno)d] [%(levelname)s] %(message)s')
        '''
        StreamHandler is for output to the CMD line
        '''
        sh = logging.StreamHandler()
        sh.setFormatter(fmt)
        sh.setLevel(clevel)
        '''
        FileHandler is for output to the file
        '''
        fh = logging.FileHandler(path)
        fh.setFormatter(fmt)
        fh.setLevel(flevel)
        '''
        仅仅记录日志到文件
        '''
        # self.logger.addHandler(sh)
        self.logger.addHandler(fh)

    def debug(self,message,color='green'):
        self.logger.debug(color_print(message,color))

    def info(self,message,color='blue'):
        self.logger.info(color_print(message,color))

    def warning(self,message,color='yellow'):
        self.logger.warning(color_print(message,color))

    def error(self,message,color='red'):
        self.logger.error(color_print(message,color))

    def critical(self,message,color='red'):
        self.logger.critical(color_print(message,color))

def color_print(message,color='red',exits=False):
    '''
    打印颜色消息或者返回
    '''
    color_msg = {'blue': '\033[1;36m%s\033[0m',
                 'green': '\033[1;32m%s\033[0m',
                 'yellow': '\033[1;33m%s\033[0m',
                 'red': '\033[1;31m%s\033[0m'
                }
    message = color_msg.get(color) % message
    if exits:
        print message
        time.sleep(1)
    return message

def run_shell_command(command_string):
    from subprocess import Popen,PIPE
    cmd = "%s" % command_string.strip()
    p = Popen(cmd,shell=True,stdout=PIPE,stderr=PIPE)
    out,err = p.communicate()
    return (p.returncode,out.rstrip(),err.rstrip())


