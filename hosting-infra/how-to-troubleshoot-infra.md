# How to troubleshoot infra




## Docker Image build

If your docker image is successfully build you should see it appear there : 

https://github.com/orgs/univ-smb-m1-isc-2022/packages

if not present (or not recent) : 
- Check your build GitHub Action


## DNS :

    nslookup pingo.oups.net

    Serveur :   UnKnown
    Address:  192.168.158.92

    Réponse ne faisant pas autorité :
    Nom :    pingo.oups.net
    Address:  78.241.22.193

-> Successfully configured

if no non-local address (192.168.x.x) found 
- Ask teacher to add your url mapping to the domain DNS

