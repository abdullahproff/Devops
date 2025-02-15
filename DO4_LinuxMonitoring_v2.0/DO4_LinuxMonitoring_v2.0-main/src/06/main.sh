#!/bin/bash

goaccess *.log --log-format='%h - %^[%d:%t %^] "%r" %s "%u"' -o ./report.html