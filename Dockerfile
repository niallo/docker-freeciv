# docker-version 0.6.6
from        ubuntu:12.04
maintainer  Niall O'Higgins "n@niallo.me"

run     apt-get update
run     apt-get install -y wget
# use this PPA to get freeciv 2.4.x
run     wget -q -O - http://archive.getdeb.net/getdeb-archive.key | apt-key add -
run     echo "deb http://archive.getdeb.net/ubuntu precise-getdeb games" >> /etc/apt/sources.list
run     apt-get update
run     apt-get install -y freeciv-server
run     useradd freeciv
volume ["/freeciv"]
run     chown -R freeciv /freeciv
user    freeciv
entrypoint ["/usr/games/freeciv-server"]
cmd ["--saves", "/freeciv", "--port", "5556"]
expose ["5556"]
