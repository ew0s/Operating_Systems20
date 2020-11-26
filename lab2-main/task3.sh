#!/bin/bash

mkdir out 2> /dev/null

ps -ef --sort=start_time | tail -n 1 | awk '{print $2}'
