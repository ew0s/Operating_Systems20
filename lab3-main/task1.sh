#!/bin/bash
date=$(date +'%F_%H-%M-%S');

mkdir "$HOME/test" 2>/dev/null && 
{
    echo "catalog test was created successfully" > ~/report.txt;
    touch $HOME/test/$date;
};

ping www.net_nikogo.www 2>/dev/null || echo "$(date +'%F_%H-%M-%S') the host unreacheble" >> ~/report.txt
