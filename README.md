Vhost-Creator
=============

Creates a new apache vhost on your local dev machine (a work in progress - very limited at present - see TODO section below)

To create a new vhost
---------------------

First put your project directory where you want it. Clone your project in to it or start your project here.

Edit the file new_vhost.sh:
    - Change the path to the path of your project directory
    - Change the VHOSTNAME variable to the name of your project

Make the new_vhost.sh file executable with:

chmod +x new_vhost.sh

Run as root:

sudo ./new_vhost.sh

Done. Navigate to http://{YOUR PROJECT NAME}/

TODO
====

- Use PATH as a variable (need to escape slashes)
- Take in command line arguments for VHOSTNAME and PATH
