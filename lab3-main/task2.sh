#/bin/bash
cp ./task1.sh ~/
./task1.sh
at -f /home/task1.sh now + 2 minutes 2>/dev/null
tail -n 0 -f ~/report.txt
