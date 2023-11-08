# Refresh VPS :

```bash
# ssh -l ubuntu vps-b844c848.vps.ovh.net
ssh -l guillaume host.oups.net
```

```bash
sudo apt update
sudo apt upgrade
sudo apt install git
sudo apt install docker.io
sudo apt install docker docker-compose
sudo apt install cron

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
docker run hello-world

sudo systemctl enable docker.service
sudo systemctl enable containerd.service
```

Configure swap usage
```bash
# check swapiness expect few
cat /proc/sys/vm/swappiness
# sudo sysctl vm.swappiness=10
sudo vi /etc/sysctl.conf
# add or update vm.swappiness=10
sudo sysctl --load=/etc/sysctl.conf
```

Remove Apparmor :
```bash
sudo apt-get purge --auto-remove apparmor
sudo service docker restart
docker system prune --all --volumes
```

# Install

-- generate password-less ssh key

```bash
ssh-keygen -t rsa -C "guillaume.jambet@gmail.com"
```

-- add ssh key to github

```bash
cat /home/ubuntu/.ssh/id_rsa.pub
```

-- clone repository
```bash
git -c core.sshCommand="ssh -i .ssh/id_rsa" clone git@github.com:univ-smb-m1-isc-2022/hosting-infra.git
cd hosting-infra
git config pull.ff only
```

# Configure smtp password
-- .env 
MAIL_TOKEN=XXXX
``` 
How do I get my Gmail SMTP password?
IMAP/SMTP password in Gmail
Go to the Google account.
On the left navigation panel, click Security .
On the "Signing in to Google" panel, click App passwords . ...
Make sure Mail or Other (custom name) is selected in the Select app drop-down menu. ...
Click Generate .
```
# MAIL_TOKEN 
in hosting-infra
add a .env containing :
MAIL_TOKEN=xxx

then run chgrp docker .env


# Configure auto refresh
# https://www.looklinux.com/bash-crontab-command-not-found/#Install_or_Setup_Cron_on_UbuntuDebian_System
```bash
crontab -e
# Restart every 5 minutes : */5 * * * *
*/5 * * * * (cd /home/guillaume/hosting-infra && ./refresh-vps-infra.sh) 2>&1 | logger -t refresh
```

# Generate PAT token on github : https://github.com/settings/tokens
1. Generate PAT token on github : (read:packages)
2. give package read
3. add to .bashrc 
export github_token=...
4. create a 'github_token' file readeable by docker user containing : 
export github_token=...


# Check : 

http://78.241.22.193/chuck-facts


# Configure your DB 

* Beware data are not persisted

## Declare your schema : 
in the directory postgres-init, add a file to create your root user + schema.

## Let your application know the db connection : 
pass the following vars to your container :
- SPRING_DATASOURCE_URL=jdbc:postgresql://postgres:5432/db_***
- SPRING_DATASOURCE_USERNAME=****
- SPRING_DATASOURCE_PASSWORD=****
- SPRING_JPA_HIBERNATE_DDL_AUTO=update

## on VPS : 
Kill local volume

## In pg admin : 
Find the ip of postgres instance : 
docker ps -> get <container-id> of postgresSQL
docker inspect <container-id> | grep IPAddress

## Clean Infra : 
docker system prune --volumes -f


