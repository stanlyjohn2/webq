#!/bin/bash

cd /home/${1}/webq/TokenCheck/lighttpd;
sudo lighttpd -f lighttpd.conf;
if (( "$?" == 0 ));
then
    echo "SUCCESSFULLY STARTED LIGHTTPD"
else
    echo "ERROR STARTING LIGHTTPD"
fi
