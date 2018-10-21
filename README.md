# Vagrant System Bootstrap

Automated bootstraping and deployment of Linux system including backend Python web application using Vagrant.

### Dependencies

System automatically deployed using Vagrant bootstrap script which is using main [ansible-nginx-webapp-deploy](https://github.com/andrey-khashchin/ansible-nginx-webapp-deploy) repository.

### Prerequisites

[Virtualbox](https://www.virtualbox.org/wiki/Downloads), [Vagrant](https://www.vagrantup.com/downloads.html) and 
[Git](https://git-scm.com/downloads) should be installed locally on host machine.

### Configuration

Modify ```/etc/hosts``` (Linux & MacOS) or ```C:\Windows\System32\drivers\etc\hosts``` (Windows) on host machine and 
add following line for server to be accessible via domain name **msdwebdemo.local** in your browser:

```
192.168.120.122 msdwebdemo.local
```

### Deployment

- Clone this repository to your home directory:

```
$ git clone https://github.com/andrey-khashchin/vagrant-system-bootstrap.git
```

- Change directory to cloned repository:

```
$ cd vagrant-system-bootstrap
```

- Run command:
```
$ vagrant up
```

- Wait for system to be fully provisioned and bootstrapped, all required components will be deployed automatically.

- Open your browser and type ```http://msdwebdemo.local``` in address bar. Accept insecure connection 
(http to https forwarding will be enabled) and ensure that web application is showing required system information.

### Running the tests

- Issue command ```vagrant ssh``` to enter the box and run ```stress --cpu 2 --io 4 --vm 4 --vm-bytes 102M --timeout 60s```
- Simulation of system load will be performed during next 60 secs, web application should track all the changes. 

