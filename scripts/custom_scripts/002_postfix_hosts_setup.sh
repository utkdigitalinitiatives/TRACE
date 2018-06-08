#!/bin/sh

apt-get -y install postfix mailutils

now=$(date "+%Y-%m-%d %H:%M:%S %Z: ")
echo "${now} running $0 " >> /tmp/sedpostfix.log

if ! (sed -i.bak --regexp-extended 's/(myhostname \= ).+$/\1localhost.com/;' /etc/postfix/main.cf >> /tmp/sedpostfix.log 2>&1); then
    echo "${now} Unable to change myhostname in /etc/postfix/main.cf " >> /tmp/sedpostfix.log
fi
if ! (sed -i.bak --regexp-extended 's/(mydestination \= ).+$/\1localhost.com, localhost, trace/;' /etc/postfix/main.cf >> /tmp/sedpostfix.log 2>&1); then
    echo "${now} Unable to change mydestination in /etc/postfix/main.cf " >> /tmp/sedpostfix.log
fi
if ! (sed -i.bak --regexp-extended 's/(smtp_dns_support_level \= ).+$/\1disabled/;' /etc/postfix/main.cf >> /tmp/sedpostfix.log 2>&1); then
    echo "${now} Unable to change smtp_dns_support_level in /etc/postfix/main.cf" >> /tmp/sedpostfix.log
fi
if ! (sed -i.bak --regexp-extended 's/(lmtp_host_lookup \= ).+$/\1native/;' /etc/postfix/main.cf >> /tmp/sedpostfix.log 2>&1); then
    echo "${now} Unable to change lmtp_host_lookup in /etc/postfix/main.cf" >> /tmp/sedpostfix.log
fi
if ! (sed -i.bak --regexp-extended 's/(smtp_host_lookup \= ).+$/\1native/;' /etc/postfix/main.cf >> /tmp/sedpostfix.log 2>&1); then
    echo "${now} Unable to change smtp_host_lookup in /etc/postfix/main.cf" >> /tmp/sedpostfix.log
fi
if ! (sed -i.bak --regexp-extended 's/(ignore_mx_lookup_error \= ).+$/\1yes/;' /etc/postfix/main.cf >> /tmp/sedpostfix.log 2>&1); then
    echo "${now} Unable to change ignore_mx_lookup_error in /etc/postfix/main.cf" >> /tmp/sedpostfix.log
fi

if ! (sed -i.bak --regexp-extended 's/(127\.0\.0\.1[\s\t]+localhost).*$/127.0.0.1       localhost localhost.com/;' /etc/hosts >> /tmp/sedpostfix.log 2>&1); then
    echo "${now} Unable to change ignore_mx_lookup_error in /etc/postfix/main.cf" >> /tmp/sedpostfix.log
fi
