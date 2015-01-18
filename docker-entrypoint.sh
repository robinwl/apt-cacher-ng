#!/bin/bash
set -e

if [ "$1" = '/usr/sbin/apt-cacher-ng' ]; then
	if [ -z "$AUTH_USERNAME" ] || [ -z "$AUTH_PASSWORD" ]; then
		echo >&2 'error: missing AUTH_USERNAME and/or AUTH_PASSWORD environment variable'
		echo >&2 '  Did you forget tp -e "AUTH_USERNAME=...." -e "AUTH_PASSWORD=..." ?'
		exit 1
	fi

	# Basic authentication with username and password, required to
	# visit pages with administrative functionality. Format: username:password
	set -- "$@" AdminAuth=$AUTH_USERNAME:$AUTH_PASSWORD
fi

chown -R apt-cacher-ng:apt-cacher-ng /var/cache/apt-cacher-ng

exec "$@"