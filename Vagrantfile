# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
    config.vm.box = "debian/jessie64"
    config.vm.define "db" do |db|
      db.vm.hostname="db"
      db.vm.network "private_network", ip:"192.168.1.5"
      db.vm.provision "shell" do |s|
        ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
        s.inline = <<-SHELL
          echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
        SHELL
      db.vm.provision "ansible" do |ansible|
        ansible.verbose = "vvvv"
        ansible.inventory_path = "ansible/inventory"
        ansible.playbook = "ansible/db.yml"
      end
      end
    end

    config.vm.define "app" do |app|
      app.vm.hostname="app"
      app.vm.network "private_network", ip: "192.168.1.7"
      app.vm.provision "shell" do |s|
        ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
        s.inline = <<-SHELL
          echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
        SHELL
      end
      app.vm.provision "ansible" do |ansible|
        ansible.verbose = "vvvv"
        ansible.inventory_path = "ansible/inventory"
        ansible.playbook = "ansible/app.yml"
      end
    end
end
