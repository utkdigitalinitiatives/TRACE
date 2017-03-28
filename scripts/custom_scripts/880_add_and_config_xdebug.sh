#!/usr/bin/env bash

# install xdebug
sudo apt-get install php5-xdebug;

PHP_INI="/etc/php5/apache2/php.ini"

# add the following config settings to apache2's php.ini
# use printf, yo.
if grep -Fxq 'xdebug.idekey="TRACE-DEV"' $PHP_INI
	then
		printf "Already updated $PHP_INI"
	else
		printf "[Xdebug]\n" | sudo tee -a $PHP_INI
		printf "zend_extension=/usr/lib/php5/20121212/xdebug.so\n" | sudo tee -a $PHP_INI
		printf "xdebug.remote_enable=1\n" | sudo tee -a $PHP_INI
		printf "xdebug.remote_host=localhost\n" | sudo tee -a $PHP_INI
		printf "xdebug.remote_port=9000\n" | sudo tee -a $PHP_INI
		printf "xdebug.idekey=\"TRACE-DEV\"\n" | sudo tee -a $PHP_INI
fi

# check it:
sudo tail -n 10 $PHP_INI;