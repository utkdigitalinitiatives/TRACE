#!/usr/bin/env bash
echo "Updating apache2 local errordocument to include a custom error 500 page."
# overwrite apache localized-error-pages.conf
sudo cp /vagrant/files/localized-error-pages.conf /etc/apache2/conf-available/localized-error-pages.conf
# copy new error page into main directory
sudo cp /vagrant/files/system-error.html /var/www/drupal/
# restart apache2
service apache2 restart
