#/bin/bash

cd ./core/App && gcc -o MonitoringDeamon MonitoringDeamon.c >> /dev/null && cd ../../
cd ./core/Client/ && gcc -o Client Client.c >> /dev/null && cd ../../
cd ./core/Server && gcc -o Server Server.c >> /dev/null && cd ../../

mv ./core/app/MonitoringDeamon ./MakeFiles
mv ./core/Server/Server ./MakeFiles
mv ./core/Client/Client ./MakeFiles

./MakeFiles/Server
