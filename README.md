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