#!/usr/bin/env bash
export DEBIAN_FRONTEND=noninteractive

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8
dpkg-reconfigure locales

## If eth1 has been successfully configured, then xdebug needs to 
## send its information to the base box via the hostonly network
## Otherwise, assume a localhost xdebug setup

if (ip link show dev eth1 2> /dev/null | grep -q 'state UP' 2>&1); then
	IP_ADDRESS="192.168.160.1"
else
	IP_ADDRESS="localhost"
fi


# install xdebug
sudo apt-get install --quiet --assume-yes --force-yes php5-xdebug

#PHP_INI="/etc/php5/apache2/php.ini"
PHP_INI="/etc/php5/apache2/conf.d/20-xdebug.ini" 

# add the following config settings to apache2's php.ini
# use printf, yo, except for our 'then' because printf doesn't
# like to have variables in its formatted output.
if grep -Fxq 'xdebug.idekey="TRACE-DEV"' $PHP_INI
	then
		echo "Already updated $PHP_INI"
	else
		printf "[Xdebug]\n" | sudo tee $PHP_INI
		printf "zend_extension=/usr/lib/php5/20121212/xdebug.so\n" | sudo tee -a $PHP_INI
		printf "xdebug.remote_enable=1\n" | sudo tee -a $PHP_INI
		printf "xdebug.remote_host=${IP_ADDRESS}\n" | sudo tee -a $PHP_INI
		printf "xdebug.remote_port=9000\n" | sudo tee -a $PHP_INI
		printf "xdebug.idekey=\"TRACE-DEV\"\n" | sudo tee -a $PHP_INI
fi

# check it:
#sudo tail -n 10 $PHP_INI;
