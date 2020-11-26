#!/bin/bash

mkdir out 2> /dev/null

ps -ef --sort=start_time | awk '{print $2}'
