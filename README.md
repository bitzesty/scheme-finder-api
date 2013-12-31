Scheme finder api
======

## Configuration

* To use hipchat deploy notifications create a `.env` file in project
  root with the following content:

  ```
  HIPCHAT_TOKEN=<token>
  ```

## Code organization

* `app/searches` contains `Searchlight::Search` derivate classes.

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
Api key:   ask guys for the key
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
bundle exec knife solo cook 162.13.152.96 nodes/staging.json -x root
ask guys for password
```

### Production

```bash
bundle exec knife solo cook <ip> nodes/production.json -x root
ask guys for password
```
