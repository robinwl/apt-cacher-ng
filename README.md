# sark/apt-cacher-ng

## What is it?

A caching proxy. Specialized for package files from Linux distributors, primarily for Debian (and Debian based) distributions but not limited to those. See documentation of Apt-Cacher to learn what it's good for.

[`https://www.unix-ag.uni-kl.de/~bloch/acng/`](/https://www.unix-ag.uni-kl.de/~bloch/acng/)

## How to use this image

### start a apt-cacher-ng instance

```
docker run -d --name apt-cacher-ng -e "AUTH_USERNAME=username" -e "AUTH_PASSWORD=password" -p sark/apt-cacher-ng 
```
This image includes `EXPOSE 3142` (the apt-cacher-ng port), so standard container linking will make it automatically available to the linked containers.

### start a publicly available apt-cacher-ng instance

```
docker run -d --name apt-cacher-ng -e "AUTH_USERNAME=username" -e "AUTH_PASSWORD=password" -p 3142:3142 sark/apt-cacher-ng 
```

## How to use the proxy

These are three methods of using apt-get with a http-proxy.

### APT configuration file method

```
echo 'Acquire::http { Proxy "http://dockerhost:3142"; };' >> /etc/apt/apt.conf.d/01proxy
```

### Environment variables method

```
export http_proxy=http://dockerhost:3142
```

```
docker run --rm -i -t -e "http_proxy=http://dockerhost:3142" debian:wheezy /bin/bash
```

### sources.list method

Edit the /etc/apt/sources.list file and edit the source lines therein, replacing the mirror hostname with the hostname of this server machine and the port with 3142 (adding a port if none specified). For example:

```
# Before
deb http://ftp.debian.org/debian stable main contrib non-free
deb-src http://ftp.debian.org/debian stable main contrib non-free
```

```
# After
deb http://dockerhost:3142/ftp.debian.org/debian stable main contrib non-free
deb-src http://dockerhost:3142/ftp.debian.org/debian stable main contrib non-free
```