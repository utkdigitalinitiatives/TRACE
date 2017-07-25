#!/usr/bin/env bash
export DEBIAN_FRONTEND=noninteractive

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8
dpkg-reconfigure locales


#IP_ADDRESS=`php -i | grep -n '^SSH_CLIENT' | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"`

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
		printf "xdebug.remote_host=10.0.2.2\n" | sudo tee -a $PHP_INI
		printf "xdebug.remote_port=9000\n" | sudo tee -a $PHP_INI
		printf "xdebug.remote_log=/tmp/xdebug-log\n" | sudo tee -a $PHP_INI
		printf "xdebug.idekey=\"TRACE-DEV\"\n" | sudo tee -a $PHP_INI
fi

# check it:
#sudo tail -n 10 $PHP_INI;
