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

