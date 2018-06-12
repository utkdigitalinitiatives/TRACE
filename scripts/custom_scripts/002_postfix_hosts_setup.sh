#!/bin/sh
apt-get -y update
# apt-get -y upgrade
apt-get -y install postfix mailutils
adduser vagrant mail

now=$(date "+%Y-%m-%d %H:%M:%S %Z: ")
echo "${now} running $0 " >> /tmp/sedpostfix.log

if (egrep 'myhostname \= ' /etc/postfix/main.cf >> /tmp/sedpostfix.log 2>&1); then

  if ! (sed -i.bak --regexp-extended 's/(myhostname \= ).+$/\1localhost.com/;' /etc/postfix/main.cf >> /tmp/sedpostfix.log 2>&1); then
      echo "${now} Unable to change myhostname in /etc/postfix/main.cf " >> /tmp/sedpostfix.log
  fi
else
  echo "myhostname = localhost.com" >> /etc/postfix/main.cf
fi

if (egrep 'mydestination \= ' /etc/postfix/main.cf >> /tmp/sedpostfix.log 2>&1); then
  if ! (sed -i.bak --regexp-extended 's/(mydestination \= ).+$/\1localhost.com, localhost, trace/;' /etc/postfix/main.cf >> /tmp/sedpostfix.log 2>&1); then
     echo "${now} Unable to change mydestination in /etc/postfix/main.cf " >> /tmp/sedpostfix.log
  fi
else
  echo "mydestination = localhost.com,localhost,trace" >> /etc/postfix/main.cf
fi

if (egrep 'smtp_dns_support_level \= ' /etc/postfix/main.cf >> /tmp/sedpostfix.log 2>&1); then
  if ! (sed -i.bak --regexp-extended 's/(smtp_dns_support_level \= ).+$/\1disabled/;' /etc/postfix/main.cf >> /tmp/sedpostfix.log 2>&1); then
     echo "${now} Unable to change smtp_dns_support_level in /etc/postfix/main.cf" >> /tmp/sedpostfix.log
  fi
else
  echo "smtp_dns_support_level = disabled" >> /etc/postfix/main.cf
fi

if (egrep 'lmtp_host_lookup \= ' /etc/postfix/main.cf >> /tmp/sedpostfix.log 2>&1); then
  if ! (sed -i.bak --regexp-extended 's/(lmtp_host_lookup \= ).+$/\1native/;' /etc/postfix/main.cf >> /tmp/sedpostfix.log 2>&1); then
     echo "${now} Unable to change lmtp_host_lookup in /etc/postfix/main.cf" >> /tmp/sedpostfix.log
  fi
else
  echo "lmtp_host_lookup = native" >> /etc/postfix/main.cf
fi

if (egrep 'smtp_host_lookup \= ' /etc/postfix/main.cf >> /tmp/sedpostfix.log 2>&1); then
  if ! (sed -i.bak --regexp-extended 's/(smtp_host_lookup \= ).+$/\1native/;' /etc/postfix/main.cf >> /tmp/sedpostfix.log 2>&1); then
    echo "${now} Unable to change smtp_host_lookup in /etc/postfix/main.cf" >> /tmp/sedpostfix.log
  fi
else
  echo "smtp_host_lookup = native" >> /etc/postfix/main.cf
fi

if (egrep 'ignore_mx_lookup_error \= ' /etc/postfix/main.cf >> /tmp/sedpostfix.log 2>&1); then
  if ! (sed -i.bak --regexp-extended 's/(ignore_mx_lookup_error \= ).+$/\1yes/;' /etc/postfix/main.cf >> /tmp/sedpostfix.log 2>&1); then
    echo "${now} Unable to change ignore_mx_lookup_error in /etc/postfix/main.cf" >> /tmp/sedpostfix.log
  fi
else
  echo "ignore_mx_lookup_error = yes" >> /etc/postfix/main.cf
fi


if ! (sed -i.bak --regexp-extended 's/(127\.0\.0\.1[[:blank:]]+localhost).*$/127.0.0.1       localhost localhost.com/;' /etc/hosts >> /tmp/sedpostfix.log 2>&1); then
    echo "${now} Unable to change localhost in /etc/hosts" >> /tmp/sedpostfix.log
fi