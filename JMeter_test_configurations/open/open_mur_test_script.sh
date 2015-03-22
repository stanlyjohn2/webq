#!/bin/bash

if [ -z "$1"  ]; then
    # variable not passed
    echo "usage: pass password as argument "
else
    for threadno in {1..200..10}
    do
        sed -i 's/threads">\([0-9]\+\)/threads">'$(( $threadno * 10  ))'/' open_tstMarch09.jmx
        sed -i 's/14-\([0-9]\+\)/14-'$threadno'/' open_tstMarch09.jmx
        git --no-pager diff open_tstMarch09.jmx
        jmeter -n -t open_tstMarch09.jmx
    done
    ./open_load_analyse.sh
    # alram on my machine when all this is over !! ;)
    sshpass -p "$1" ssh murali@10.16.35.52 'paplay /usr/share/sounds/freedesktop/stereo/complete.oga'
fi

