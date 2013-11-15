docker-freeciv
==============

Docker image for a private [freeciv](http://freeciv.org) 2.4 server.

Installation
============

To fetch from Docker index:

`docker pull niallo/freeciv`

To build from source, run the following from the root of this repo:

`docker build -t niallo/freeciv .`

Usage
=====

Freeciv [exposes a sever on port 5556](http://docs.docker.io/en/latest/use/port_redirection/#binding-a-port-to-an-host-interface) and uses an [external volume](http://docs.docker.io/en/latest/use/working_with_volumes/) for savegame data (/freeciv).

For the simple scenario that you wish to have savegame data stored in /freeciv on the host and map port 5556 in the container to port 5556 on the host, use the command:

`docker run -d -p 5556:5556 niallo/freeciv`

Clients should now be able to connect to your freeciv server!

OS X Client
===========

Semi-related: getting a Freeciv 2.4.x client on OS X is non-trivial.

- Install Homebrew from http://brew.sh
- Install XQuartz from http://xquartz.macosforge.org/landing/
- Install freeciv library dependenceis: `brew install pkg-config sdl jpeg libpng libtiff webp sdl_image sdl_mixer gettext freetype`
- Download, compile & install freeciv 2.4.0:
```bash
wget http://downloads.sourceforge.net/project/freeciv/Freeciv%202.4/2.4.0/freeciv-2.4.0.tar.bz2
tar xfj freeciv-2.4.0.tar.bz2
cd freeciv-2.4.0
./configure --without-readline \
            --enable-client=sdl \
            --disable-debug \
            --disable-dependency-tracking
            --prefix=/usr/local/freeciv-2.4.0 CFLAGS=-I/usr/local/Cellar/gettext/0.18.3.1/include LDFLAGS=-L/usr/local/Cellar/gettext/0.18.3.1/lib
make
sudo make install
```
- Run freeciv-sdl: `/usr/local/freeciv-2.4.0/bin/freeciv-sdl`

