#!/bin/bash
if [ ! -d "$APACHE_RUN_DIR" ]; then
	mkdir "$APACHE_RUN_DIR"
	chown $APACHE_RUN_USER:$APACHE_RUN_GROUP "$APACHE_RUN_DIR"
fi
if [ -f "$APACHE_PID_FILE" ]; then
	rm "$APACHE_PID_FILE"
fi

/etc/init.d/postgresql start
service ssh restart

/usr/sbin/apache2ctl -D FOREGROUND

update-rc.d postgresql enable
