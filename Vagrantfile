# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define :servidor do |servidor|
      servidor.vm.box = "cliente"
      servidor.vm.network :private_network, ip:"192.168.50.3"
      servidor.vm.hostname = "servidor"
      servidor.vm.provision "shell", path: "streama.sh"
  end
  config.vm.define :firewall do |firewall|
    firewall.vm.box = "cliente"
    firewall.vm.network :private_network, ip: "192.168.50.4"
    firewall.vm.network "public_network", use_dhcp_assigned_default_route: true
    firewall.vm.hostname = "firewall"
    firewall.vm.provision "shell", path: "firewall.sh"

   end

  config.vm.define :servidor_api do |servidor_api|
    servidor_api.vm.box = "cliente"
    servidor_api.vm.network :private_network, ip: "192.168.50.5"
    servidor_api.vm.hostname = "servidorapi"
  end

  config.vm.define :cliente_api do |cliente_api|
    cliente_api.vm.box = "cliente"
    cliente_api.vm.network :private_network, ip: "192.168.50.6"
    cliente_api.vm.hostname = "cliente"
  end
end
