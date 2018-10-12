VAGRANTFILE_API_VERSION = "2"

$cpus   = ENV.fetch("ISLANDORA_VAGRANT_CPUS", "2")
$memory = ENV.fetch("ISLANDORA_VAGRANT_MEMORY", "3000")
$hostname = ENV.fetch("ISLANDORA_VAGRANT_HOSTNAME", "trace")
$forward = ENV.fetch("ISLANDORA_VAGRANT_FORWARD", "TRUE")

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.
  # config.vm.provider "virtualbox" do |v|
  #   v.name = "TRACE Development VM"
  # end

  unless  $forward.eql? "FALSE"
    config.vm.network :forwarded_port, guest: 8080, host: 8080, auto_correct: true # Tomcat
    config.vm.network :forwarded_port, guest: 3306, host: 3306, auto_correct: true # MySQL
    config.vm.network :forwarded_port, guest: 8000, host: 8000 # Apache
  end

  config.vm.hostname = $hostname
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "utkdigitalinitiatives/TRACE"
  config.vm.box = "TRACE"
  #config.vm.box = "c7vbb"

  # config.vm.box_url = "http://dlwork.lib.utk.edu/vboxes/u14plus.json"
  #config.vm.box_url = "http://dlwork.lib.utk.edu/vboxes/c7vbb.json"
  # config.vm.box_version = "0.1.4"
  shared_dir = "/vagrant"

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", $memory]
    vb.customize ["modifyvm", :id, "--cpus", $cpus]
  end

  #config.vm.provision "variables", type: "shell", path: "./configs/variables", privileged: "true"
  config.vm.provision :shell, path: "./scripts/modules.sh", :args => shared_dir, :privileged => false
  config.vm.provision :shell, path: "./scripts/libraries.sh", :args => shared_dir, :privileged => false

  if File.exist?("./scripts/custom.sh") then
    config.vm.provision "custom", type: "shell", path: "./scripts/custom.sh"
  end
  config.vm.provision "post", type: "shell", path: "./scripts/post.sh"

  if File.exist?("~/Desktop/traceCustomModule") then
    config.vm.synced_folder "~/Desktop/traceCustomModule", "/var/www/drupal/sites/all/modules/traceCustomModule", type: "rsync",
        rsync__exclude: ".git/"
  end

  # This is to check if a file exist (only found on the staging server) and runs script
  # Add alias vagrant='ENV='\''local'\'' vagrant'  to staging server
  if ENV['ENV'] == 'staging'
    config.vm.provision :shell, path: "./scripts/staging_env.sh", :args => shared_dir, :privileged => true
    config.vm.network "forwarded_port", guest: 443, host: 8443
  end
end
