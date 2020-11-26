#!/bin/bash

mkdir out 2> /dev/null

ps aux | awk '{if ($(11)~"^/sbin/?") print($2)}' > out/task2.out
