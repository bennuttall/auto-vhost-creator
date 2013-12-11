VHOSTNAME=$1
SOURCE_PATH="/home/ben/Projects/web/$VHOSTNAME"

# Copy vhost template
cp vhost.conf "$VHOSTNAME.conf"

# Replace "{VHOSTNAME}" with the vhost name
sed -i "s|{VHOSTNAME}|$VHOSTNAME|g" "$VHOSTNAME.conf"

# Replace "PATH" with the path to the directory
sed -i "s|{SOURCE_PATH}|$SOURCE_PATH|g" "$VHOSTNAME.conf"

# Move the new vhost file to sites-available
mv "$VHOSTNAME.conf" /etc/apache2/sites-available/

# Enable the site
a2ensite $VHOSTNAME

# Append the new vhost to the hosts file
echo "127.0.0.1 $VHOSTNAME" >> /etc/hosts

# Restart Apache
service apache2 restart

echo "VHOST $VHOSTNAME created. Browse to http://$VHOSTNAME/" to view.
