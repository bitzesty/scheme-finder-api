## Server provisioning with Chef

### Staging with Vagrant

Please refer to [chef cookbooks](https://github.com/bitzesty/cookbooks)
for general vagrant setup instructions.

For new staging server bringing Chef node up (run from chef dir)

    ````
    vagrant up --provider=rackspace
    ````

    This might take around 10-20 minutes to spin up VM node.
    The first time the initial VM image will be downloaded.

Deploy Rails app to the VM host (run from application root dir):


    ````
    bundle exec cap staging deploy
    ````

### Real production servers

Please refer to [chef cookbooks](https://github.com/bitzesty/cookbooks)
for general information.

Currently there are no production servers
