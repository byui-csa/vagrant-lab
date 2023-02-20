# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.synced_folder '.', '/vagrant', disabled: true

  config.vm.define 'kali', primary: true do |kali|
    kali.vm.box = 'kalilinux/rolling'
    kali.vm.provision :shell, path: 'provision.sh'
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
    ubu.vm.network 'private_network', ip: '172.28.128.3'

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
    # win.vm.network "private_network", type: "dhcp"

    # Configure Firewall to open up vulnerable services
    win.vm.provision :shell, inline: 'C:\\startup\\disable_firewall.bat'
    # case ENV['MS3_DIFFICULTY']
    #   when 'easy'
    #     win.vm.provision :shell, inline: "C:\\startup\\disable_firewall.bat"
    #   else
    #     win.vm.provision :shell, inline: "C:\\startup\\enable_firewall.bat"
    #     win.vm.provision :shell, inline: "C:\\startup\\configure_firewall.bat"
    # end

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

    # win.vm.provider "libvirt" do |v|
    #   v.memory = 4096
    #   v.cpus = 2
    #   v.video_type = 'qxl'
    #   v.input :type => "tablet", :bus => "usb"
    #   v.channel :type => 'unix', :target_name => 'org.qemu.guest_agent.0', :target_type => 'virtio'
    #   v.channel :type => 'spicevmc', :target_name => 'com.redhat.spice.0', :target_type => 'virtio'
    #   v.graphics_type = "spice"
    #   # Enable Hyper-V enlightenments: https://blog.wikichoon.com/2014/07/enabling-hyper-v-enlightenments-with-kvm.html
    #   v.hyperv_feature :name => 'stimer',  :state => 'on'
    #   v.hyperv_feature :name => 'relaxed', :state => 'on'
    #   v.hyperv_feature :name => 'vapic',   :state => 'on'
    #   v.hyperv_feature :name => 'synic',   :state => 'on'
    # end
  end
end
