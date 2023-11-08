
# Create if do not exist

> touch /etc/docker/daemon.json

{
  "metrics-addr" : "0.0.0.0:9323",
  "experimental" : true
}

make readable
> chmod a+r daemon.json

restart docker : 
> service docker restart

