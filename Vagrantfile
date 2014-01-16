# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # config.vm.box = "saucy64"
  # config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/saucy/current/saucy-server-cloudimg-amd64-vagrant-disk1.box"

  # config.vm.box = "OmniOS_r151006p-r1"
  # config.vm.box_url = "http://omnios.omniti.com/media/OmniOS_r151006p-r1.box"

  config.vm.box = "precise64"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"

  config.berkshelf.enabled = true

  # This seems to end up being really fucking slow.
  # config.omnibus.chef_version = "11.4.0"
end
