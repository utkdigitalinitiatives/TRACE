#!/usr/bin/env bash

# Add a file to cron.d for the TRACE/files/updating-solr-index.sh
SOLR_CRON="/etc/cron.d/update_solr"

if [ -f "$SOLR_CRON" ]; then
	echo "Cron exists. Exiting...";
	exit
else
	sudo touch "$SOLR_CRON"
	printf "# updating-solr cron\n" | sudo tee -a $SOLR_CRON
	printf "# run as root every 5 minutes\n" | sudo tee -a $SOLR_CRON
	printf "*/5 * * * * /vagrant/files/updating-solr-index.sh\n" | sudo tee -a $SOLR_CRON
fi
