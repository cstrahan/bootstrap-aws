vagrant plugin install vagrant-berkshelf


# First-time Setup

Install the berkshelf plugin via:

```bash
vagrant plugin install vagrant-berkshelf
vagrant plugin install vagrant-omnibus
```

Invoke `vagrant ssh` and run:

```bash
sudo apt-get -q -y update"
sudo apt-get -q -y install build-essential"
sudo apt-get -q -y install ruby1.9.1-dev --no-upgrade"
sudo gem install chef --version 11.4.2 --no-rdoc --no-ri --conservative"
```
