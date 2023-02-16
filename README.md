# Vagrant PRCCDC

__Metasploitable 3__ virtual machines to be used for preparing for PRCCDC (or any defense competion).

## Dependencies

Install all of the following applications in order to run Vagrant.

- [VirtualBox](https://www.virtualbox.org/wiki/Downloads#VirtualBox7.0.6platformpackages): Virtualization platform
- [VirtualBox Extension Pack](https://www.virtualbox.org/wiki/Downloads#VirtualBox7.0.6OracleVMVirtualBoxExtensionPack): Extension that improve user experience
- [Vagrant](https://developer.hashicorp.com/vagrant/downloads): CLI automation of creating boxes AKA virtual machines
- [Git](https://git-scm.com/downloads): Optional, tool for downloading and collaborating on code

## Getting Started

Clone this repo, open it in a terminal, and run `vagrant up`:

```bash
git clone https://github.com/byui-csa/vagrant-prccdc.git
cd vagrant-prccdc
vagrant up
```

On first run, `vagrant up` will download the boxes.
Be patient, this may take several minutes.

### Alternative Setup

If you chose to not install Git, you may download the vagrantfile and run `vagrant up`:

```bash
mkdir vagrant-prccdc
cd vagrant-prccdc
wget https://raw.githubusercontent.com/byui-csa/vagrant-prccdc/main/Vagrantfile
vagrant up
```

### Troubleshooting

Most users should be able to just start the machines with `vagrant up`,
but some users may need to add `--provider virtualbox`
to each vagrant command. For example:

```bash
vagrant up --provider virtualbox
```

## Boxes AKA Virtual Machines

### Default Credentials

- User: `vagrant`
- Password: `vagrant`

### Ubuntu 14.04

If you just want to start this box, you can start it with:

```bash
vagrant up ubu
```

Connect to this box with SSH:

```bash
vagrant ssh ubu
```

### Windows Server 2008

If you just want to start this box, you can start it with:

```bash
vagrant up win
```

Connect to this box by opening up it's GUI through VirtualBox.

## Additional Commands

- `vagrant up [<name>]`: Start boxes
- `vagrant ssh <name>`: SSH into a specific box
- `vagrant halt [<name>]`: Stop boxes
- `vagrant destroy [<name>]`: Destroy boxes

