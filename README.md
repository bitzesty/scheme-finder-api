Scheme finder api
======

## Hosted on Rackspace

## Deploy

### Staging

Deploys master branch

```
cap staging deploy
```

### Production

Deploys production branch

```
cap production deploy
```

### VAGRANT

Deploys master branch

```
cd <..>/scheme-finder-api/chef
v up
v provision

# bind domain name to vagrant VM ip
sudo vim /etc/hosts
10.0.100.15       schemer_vagrant.app

cd <..>/scheme-finder-api
cap vangrat deploy
```

## SSH

### Staging

```
ssh schemer@
```

### Production

```
ssh schemer@
```

## Rackspace API

### Staging

```
Username:  API.user
Api key:   31b6182d059a454a8aaf4890c914e8ba
```

### Production

```
Username:
Api key:  ask guys for the key
```

Servers are at the UK endpoint

### SMTP Authentication:

#### Staging

```
Hostname : smtp.mailgun.org
Login    : postmaster@
Password :
```

#### Production

```
Hostname : smtp.mailgun.org
Login    : postmaster@
Password :
```

## Provision

Please read
https://github.com/bitzesty/cookbooks#to-provision-a-real-server and
copy your ssh key

### Staging

```bash
bundle exec knife solo cook 162.13.95.69 nodes/staging.json -x root
todo
```

### Production

```bash
bundle exec knife solo cook 162.13.151.77 nodes/production.json -x root
ask guys for password
```
