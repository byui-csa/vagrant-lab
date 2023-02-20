# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.synced_folder '.', '/vagrant', disabled: true

  config.vm.define 'kali', primary: true do |kali|
    kali.vm.box = 'kalilinux/rolling'
    kali.vm.network 'private_network', ip: '192.168.50.101', virtualbox__intnet: true
    kali.vm.provider 'virtualbox' do |vb|
      vb.cpus = 2
      vb.memory = 2048
      vb.customize ['modifyvm', :id, '--vram', '128']
    end
  end

  config.vm.define 'ubu' do |ubu|
    ubu.vm.box = 'rapid7/metasploitable3-ub1404'
    ubu.vm.hostname = 'metasploitable3-ub1404'
    ubu.ssh.username = 'vagrant'
    ubu.ssh.password = 'vagrant'
    ubu.vm.network 'private_network', ip: '192.168.50.102', virtualbox__intnet: true

    # Providers
    ubu.vm.provider 'virtualbox' do |vb|
      vb.name = 'metasploitable3-ub1404'
      vb.memory = 1024
      vb.cpus = 1
      vb.customize ['modifyvm', :id, '--vram', '32']
    end
  end

  config.vm.define 'win' do |win|
    # Base configuration for the VM and provisioner
    win.vm.box = 'rapid7/metasploitable3-win2k8'
    win.vm.hostname = 'metasploitable3-win2k8'
    win.vm.communicator = 'winrm'
    win.winrm.retry_limit = 60
    win.winrm.retry_delay = 10
    ubu.vm.network 'private_network', ip: '192.168.50.103', virtualbox__intnet: true

    # Configure Firewall to open up vulnerable services
    # easy
    win.vm.provision :shell, inline: 'C:\\startup\\disable_firewall.bat'
    # hard
    # win.vm.provision :shell, inline: "C:\\startup\\enable_firewall.bat"
    # win.vm.provision :shell, inline: "C:\\startup\\configure_firewall.bat"

    # Insecure share from the Linux machine
    win.vm.provision :shell, inline: 'C:\\startup\\install_share_autorun.bat'
    win.vm.provision :shell, inline: 'C:\\startup\\setup_linux_share.bat'
    win.vm.provision :shell, inline: 'rm C:\\startup\\*' # Cleanup startup scripts

    # Providers
    win.vm.provider 'virtualbox' do |vb|
      vb.name = 'metasploitable3-win2k8'
      vb.memory = 2048
      vb.cpus = 1
      vb.customize ['modifyvm', :id, '--vram', '64']
    end
  end
end
