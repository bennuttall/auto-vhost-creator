VHOSTNAME='abc'
SOURCE_PATH="/home/ben/Projects/$VHOSTNAME"

# Copy vhost template
cp vhost $VHOSTNAME

# Replace "{VHOSTNAME}" with the vhost name
sed -i "s|{VHOSTNAME}|$VHOSTNAME|g" $VHOSTNAME

# Replace "PATH" with the path to the directory
sed -i "s|{PATH}|$SOURCE_PATH|g" $VHOSTNAME

# Move the new vhost file to sites-available
mv $VHOSTNAME /etc/apache2/sites-available/$VHOSTNAME

# Enable the site
a2ensite $VHOSTNAME

# Append the new vhost to the hosts file
echo "127.0.0.1   $VHOSTNAME" >> /etc/hosts

# Restart Apache
service apache2 restart

echo "VHOST $VHOSTNAME created. Browse to http://$VHOSTNAME/" to view.
