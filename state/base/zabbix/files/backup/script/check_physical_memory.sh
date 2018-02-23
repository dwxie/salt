#!/bin/bash

sudo dmidecode -t memory 2>/dev/null | grep Size | grep [G,M]B | wc -l
