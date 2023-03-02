# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.synced_folder '.', '/vagrant', disabled: true

  config.vm.define 'kali', primary: true do |kali|
    kali.vm.box = 'kalilinux/rolling'
    kali.vm.hostname = 'soc-kali'
    kali.vm.network 'private_network', ip: '192.168.50.101', virtualbox__intnet: 'soc'
    kali.vm.synced_folder '.', '/vagrant', type: 'rsync'
    kali.vm.provision :shell, path: 'provision.sh'
    kali.vm.provider 'virtualbox' do |vb|
      vb.name = 'soc-kali'
      vb.gui = false
      vb.cpus = 2
      vb.memory = 2048
      vb.customize ['modifyvm', :id, '--vram', '128']
      vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
      vb.customize ['modifyvm', :id, '--draganddrop', 'bidirectional']
      # vb.customize ['modifyvm', :id, '--graphicscontroller', 'vboxsvga']
    end
  end

  config.vm.define 'ub1804' do |ubu1804|
    ubu1804.vm.box = 'generic/ubuntu1804'
    ubu1804.vm.hostname = 'soc-ub1804'
    ubu1804.vm.network 'private_network', ip: '192.168.50.102', virtualbox__intnet: 'soc'

    # Providers
    ubu1804.vm.provider 'virtualbox' do |vb|
      vb.name = 'soc-ub1804'
      vb.memory = 1024
      vb.cpus = 1
      vb.customize ['modifyvm', :id, '--vram', '32']
    end
  end

  config.vm.define 'ub1404' do |ub1404|
    ub1404.vm.box = 'rapid7/metasploitable3-ub1404'
    ub1404.vm.hostname = 'soc-metasploitable3-ub1404'
    ub1404.ssh.username = 'vagrant'
    ub1404.ssh.password = 'vagrant'
    ub1404.vm.network 'private_network', ip: '192.168.50.102', virtualbox__intnet: 'soc'

    # Providers
    ub1404.vm.provider 'virtualbox' do |vb|
      vb.name = 'soc-metasploitable3-ub1404'
      vb.memory = 1024
      vb.cpus = 1
      vb.customize ['modifyvm', :id, '--vram', '32']
    end
  end

  config.vm.define 'win2k8' do |win2k8|
    # Base configuration for the VM and provisioner
    win2k8.vm.box = 'rapid7/metasploitable3-win2k8'
    win2k8.vm.hostname = 'soc-metasploitable3-win2k8'
    win2k8.vm.communicator = 'winrm'
    win2k8.winrm.retry_limit = 60
    win2k8.winrm.retry_delay = 10
    win2k8.vm.network 'private_network', ip: '192.168.50.103', virtualbox__intnet: 'soc'

    # Configure Firewall to open up vulnerable services
    win2k8.vm.provision :shell, inline: 'C:\\startup\\disable_firewall.bat' # easy
    # win.vm.provision :shell, inline: "C:\\startup\\enable_firewall.bat" # hard
    # win.vm.provision :shell, inline: "C:\\startup\\configure_firewall.bat" # hard

    # Insecure share from the Linux machine
    win2k8.vm.provision :shell, inline: 'C:\\startup\\install_share_autorun.bat'
    win2k8.vm.provision :shell, inline: 'C:\\startup\\setup_linux_share.bat'
    win2k8.vm.provision :shell, inline: 'rm C:\\startup\\*' # Cleanup startup scripts

    # Providers
    win2k8.vm.provider 'virtualbox' do |vb|
      vb.name = 'soc-metasploitable3-win2k8'
      vb.memory = 2048
      vb.cpus = 1
      vb.customize ['modifyvm', :id, '--vram', '64']
    end
  end
end
