#!/bin/sh
set -e

if [ "$SERVER" = "$FASTDFS_TRACKER" ]; then
	/etc/init.d/fdfs_trackerd start
elif [ "$SERVER" = "$FASTDFS_STORAGE" ]; then
	/etc/init.d/fdfs_storaged start
else
	exit 1
fi

exec "$@"

while true;
do sleep 180
done
