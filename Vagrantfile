VAGRANTFILE_API_VERSION = "2"

$cpus   = ENV.fetch("ISLANDORA_VAGRANT_CPUS", "2")
$memory = ENV.fetch("ISLANDORA_VAGRANT_MEMORY", "3000")
$hostname = ENV.fetch("ISLANDORA_VAGRANT_HOSTNAME", "trace")
$forward = ENV.fetch("ISLANDORA_VAGRANT_FORWARD", "TRUE")

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.
  config.vm.provider "virtualbox" do |v|
    v.name = "TRACE Development VM"
  end
  
  unless  $forward.eql? "FALSE"  
    config.vm.network :forwarded_port, guest: 8080, host: 8080 # Tomcat
    config.vm.network :forwarded_port, guest: 3306, host: 3306 # MySQL
    config.vm.network :forwarded_port, guest: 8000, host: 8000 # Apache
  end
  
  config.vm.hostname = $hostname
  # Every Vagrant virtual environment requires a box to build off of.
  #config.vm.box = "islandora/islandora-base"
  config.vm.box = "http://dlwork.lib.utk.edu/vboxes/u14plus.box"
  
  shared_dir = "/vagrant"

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", $memory]
    vb.customize ["modifyvm", :id, "--cpus", $cpus]
  end

  config.vm.provision "variables", type: "shell", path: "./configs/variables", privileged: "true"
  config.vm.provision "modules", type: "shell", path: "./scripts/modules.sh", args: shared_dir, privileged: "false"
  config.vm.provision "libraries", type: "shell", path: "./scripts/libraries.sh", args: shared_dir, privileged: "false"
  if File.exist?("./scripts/custom.sh") then
    config.vm.provision "custom", type: "shell", path: "./scripts/custom.sh", args: shared_dir
  end
  config.vm.provision "post", type: "shell", path: "./scripts/post.sh"
 # config.vm.provision "ldap", type: "shell", path: "./scripts/ldap.sh", args: shared_dir, privileged: "false"
  config.vm.provision "test_users", type: "shell", path: "./scripts/tests/test_users.sh", args: shared_dir, privileged: "false"
  
  if File.exist?("~/Desktop/traceCustomModule") then
    config.vm.synced_folder "~/Desktop/traceCustomModule", "/var/www/drupal/sites/all/modules/traceCustomModule", type: "rsync",
        rsync__exclude: ".git/"
  end
end
