# vi: set ft=ruby :

nodes = {
    'ubuntu-pound' => [1, 20],
    'centos-pound' => [1, 30]
}

Vagrant.configure("2") do |config|

    nodes.each do |prefix, (count, ip_start)|
        count.times do |i|

            #
            # Box
            # - note: will not be used, but is required here 

            config.vm.box = "precise32"

            #
            # hostname
            # 

            hostname = "%s-%02d" % [prefix, (i+1)]

            config.vm.provider :virtualbox do |v|
                v.customize ["modifyvm", :id, "--memory", 1024]
            end

            config.vm.define "#{hostname}" do |box|
                puts "working on #{hostname} with ip of 192.168.20.#{ip_start+i}"

                if prefix.include? 'ubuntu'
                    config.vm.box = "precise64-puppet"
                    #config.vm.box_url = "http://files.vagrantup.com/precise64.box"
                    config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-12042-x64-vbox4210.box"
                    config.vm.provision :shell, :path => 'ubuntu.sh'
                elsif prefix.include? 'centos'
                    config.vm.box = "centos64-puppet"
                    #config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210.box" 
                    config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-65-x64-virtualbox-puppet.box"
                    config.vm.provision :shell, :path => 'centos.sh'
                end

                #config.vm.provision :shell do |shell|
                #    shell.inline = "mkdir -p /etc/puppet/modules;
                #                    puppet module install puppetlabs/stdlib"
                #end
            
                config.vm.provision :puppet do |puppet|
                    puppet.manifests_path = "manifests"
                    #puppet.module_path = ""
                    puppet.manifest_file = "site.pp"
                    puppet.options = "--user vagrant --modulepath=/vagrant/modules:/etc/puppet/modules"
                end

                box.vm.hostname = "#{hostname}.example.com"

                # Public
                box.vm.network :private_network, :ip => "192.168.20.#{ip_start+i}", :netmask => "255.255.255.0" 

            end



        end
    end
end
