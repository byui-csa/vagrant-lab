# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.synced_folder '.', '/vagrant', disabled: true

  config.vm.define 'kali', primary: true do |kali|
    kali.vm.box = 'kalilinux/rolling'
    kali.vm.hostname = 'vagrant-lab-kali'
    kali.vm.network 'private_network', ip: '192.168.50.101', virtualbox__intnet: true
    kali.vm.provider 'virtualbox' do |vb|
      vb.name = 'vagrant-lab-kali'
      vb.gui = true
      vb.cpus = 2
      vb.memory = 2048
      vb.customize ['modifyvm', :id, '--vram', '128']
      # vb.customize ['modifyvm', :id, '--graphicscontroller', 'vboxsvga']
    end
  end

  config.vm.define 'ubuntu' do |ubuntu|
    ubuntu.vm.box = 'rapid7/metasploitable3-ub1404'
    ubuntu.vm.hostname = 'vagrant-lab-ubuntu'
    ubuntu.ssh.username = 'vagrant'
    ubuntu.ssh.password = 'vagrant'
    ubuntu.vm.network 'private_network', ip: '192.168.50.102', virtualbox__intnet: true

    # Providers
    ubuntu.vm.provider 'virtualbox' do |vb|
      vb.name = 'vagrant-lab-ubuntu'
      vb.memory = 1024
      vb.cpus = 1
      vb.customize ['modifyvm', :id, '--vram', '32']
    end
  end

  config.vm.define 'windows' do |windows|
    # Base configuration for the VM and provisioner
    windows.vm.box = 'rapid7/metasploitable3-win2k8'
    windows.vm.hostname = 'vagrant-lab-windows'
    windows.vm.communicator = 'winrm'
    windows.winrm.retry_limit = 60
    windows.winrm.retry_delay = 10
    windows.vm.network 'private_network', ip: '192.168.50.103', virtualbox__intnet: true

    # Configure Firewall to open up vulnerable services
    windows.vm.provision :shell, inline: 'C:\\startup\\disable_firewall.bat' # easy
    # win.vm.provision :shell, inline: "C:\\startup\\enable_firewall.bat" # hard
    # win.vm.provision :shell, inline: "C:\\startup\\configure_firewall.bat" # hard

    # Insecure share from the Linux machine
    windows.vm.provision :shell, inline: 'C:\\startup\\install_share_autorun.bat'
    windows.vm.provision :shell, inline: 'C:\\startup\\setup_linux_share.bat'
    windows.vm.provision :shell, inline: 'rm C:\\startup\\*' # Cleanup startup scripts

    # Providers
    windows.vm.provider 'virtualbox' do |vb|
      vb.name = 'vagrant-lab-windows'
      vb.memory = 2048
      vb.cpus = 1
      vb.customize ['modifyvm', :id, '--vram', '64']
    end
  end
end
