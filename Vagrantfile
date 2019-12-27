# Install required plugins
# updates host
required_plugins = ["vagrant-hostsupdater"]
# installs plugin if not already install
required_plugins.each do |plugin|
    exec "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
end

def set_env(vars)
  # create code that will run bash commands
  # HEREDOC is a method to help visually
  command = <<~HEREDOC
    echo "Setting Environmental Variables"
    source ~/.bashrc
  HEREDOC

  vars.each do |key, value|
    # loops the vars
    command += <<~HEREDOC
      if [ -z "$#{key}"]; then
        echo "export #{key}=#{value}" >> ~/.bashrc
      fi
    HEREDOC
  end

  command
end

Vagrant.configure("2") do |config|
  # define virtual machine
  config.vm.define "app" do |app|
    # vagrant image used
    app.vm.box = "ubuntu/xenial64"
    # defining the network an ip address
    app.vm.network "private_network", ip: "192.168.10.100"
    # maps ip address to the alias
    app.hostsupdater.aliases = ["development.local"]
    # syncing the app folder to the virtual machine so it can be accessed
    app.vm.synced_folder "app", "/home/ubuntu/app"
    # run a shell script and path is where it is run
    app.vm.provision "shell", path: "environment/app/provision.sh", privileged: false
    app.vm.provision "shell", inline: set_env({DB_HOST: "mongodb://192.168.10.150:27017/posts"}), privileged: false
  end
  config.vm.define "db" do |db|
    db.vm.box = "ubuntu/xenial64"
    db.vm.network "private_network", ip: "192.168.10.150"
    db.hostsupdater.aliases = ["database.local"]
    db.vm.provision "shell", path: "environment/db/provision.sh", privileged: false
    db.vm.synced_folder "environment/db", "/home/ubuntu/environment"
  end
  # configure.vm.provision "ansible" do |ansible|
  #   ansible.playbook = "playbook.yml"


end
