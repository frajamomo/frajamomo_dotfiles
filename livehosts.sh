#!/bin/bash
nmap 192.168.1.0/24 -n -sP | grep report | awk '{print $5}'
