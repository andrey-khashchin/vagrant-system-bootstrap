Vagrant.configure("2") do |config|

 config.vm.box = "ubuntu/xenial64"

 config.vm.hostname = "msdwebdemo.local"
 config.vm.provision :shell, path: "bootstrap.sh"

 config.vm.network "private_network", ip: "192.168.120.122"
 config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "192.168.120.122"
 config.vm.network "forwarded_port", guest: 443, host: 8443, host_ip: "192.168.120.122"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]   
  end

 config.vm.synced_folder ".", "/home/vagrant/shared"

end
