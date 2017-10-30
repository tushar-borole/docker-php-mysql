if [ "$WEB_USER" ] && [ "$WEB_PASS" ]; then
    printf "${WEB_USER}:`openssl passwd -apr1 $WEB_PASS`\n" >> /etc/apache2/.htpasswd
    a2enconf htpasswd.conf
fi



rm -f /var/run/apache2/apache2.pid && \
sed -i "s|DOCUMENT_ROOT|$DOCUMENT_ROOT|g" /etc/apache2/sites-available/default && \
sed -i "s|ENVIRONMENT_VAR|$ENVIRONMENT|g" /etc/apache2/sites-available/default && \
/usr/sbin/apache2ctl -D FOREGROUND
