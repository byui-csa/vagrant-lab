# Vagrant Lab

__Kali__, __Ubuntu 18.04__, and __Metasploitable 3__ virtual machines to be 
used for practice and competition preparation.
Running all 4 machines will use 6 GB RAM and 5 CPUs/cores/processors.

## Dependencies

Install all of the following applications in order to run Vagrant.

- [VirtualBox](https://www.virtualbox.org/wiki/Downloads#VirtualBox7.0.6platformpackages): Virtualization platform
- [VirtualBox Extension Pack](https://www.virtualbox.org/wiki/Downloads#VirtualBox7.0.6OracleVMVirtualBoxExtensionPack): Extension that improve user experience
- [Vagrant](https://developer.hashicorp.com/vagrant/downloads): CLI automation of creating boxes AKA virtual machines
- [Git](https://git-scm.com/downloads): Optional, tool for downloading and collaborating on code

## Getting Started

Clone this repo, open it in a terminal, and run `vagrant up`:

```
git clone https://github.com/byui-soc/vagrant-lab.git
cd vagrant-lab
vagrant up
```

On first run, `vagrant up` will download the boxes.
Be patient, this may take several minutes.

### Alternative Setup

If you chose to not install Git, you may download the vagrantfile and run `vagrant up`:

```
mkdir vagrant-lab && cd vagrant-lab
wget https://raw.githubusercontent.com/byui-soc/vagrant-lab/main/Vagrantfile
vagrant up
```

## Essentials

It is recommended to only turn on the boxes you are using,
such as `vagrant up kali` and `vagrant up ub1804`.
This will preserve your computers processing power.

Always run `vagrant halt` when you are done.
Leaving virtual machines running will drastically
decrease your battery life.

### Credentials

- User: `vagrant`
- Password: `vagrant`

### Commands

- `vagrant up [<name>]`: Start boxes
- `vagrant ssh <name>`: SSH into a specific Linux box
- `vagrant halt [<name>]`: Stop boxes
- `vagrant destroy [<name>]`: Destroy boxes

## Boxes AKA Virtual Machines

|Box                     |Name    | Internal IP    |Connection          |
|:----------------------:|:------:|:--------------:|:------------------:|
|Kali                    |`kali`  |`192.168.50.101`|VirtualBox          |
|Ubuntu 18.04            |`ub1804`|`192.168.50.102`|`vagrant ssh <name>`|
|Metasploitable 3 Ubuntu |`ub1404`|`192.168.50.103`|`vagrant ssh <name>`|
|Metasploitable 3 Windows|`win2k8`|`192.168.50.104`|VirtualBox          |

## Troubleshooting

### Shared Clipboard

If your shared clipboard isn't working, poweroff and
launch Kali by double clicking on it in VirtualBox.

If still not working, run:

```
sudo apt install linux-headers-$(uname -r)
```

### Libvirt

Most users should be able to just start the machines with `vagrant up`,
but some Linux users may need to add `--provider virtualbox`
to each vagrant command. For example:

```
vagrant up --provider virtualbox
```

