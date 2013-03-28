# Auto Vhost Creator

Automation of the process of setting up a new apache vhost on your Ubuntu dev machine to view a web project locally

## Why?
Say you have a bunch of web projects in ```/home/ben/Projects/``` and you want to be able to view them locally. You just create a vhost for each one. There are a number of steps required to do this, and this script automates them to speed the process up.
There are other ways of achieving this, including Apache modules, I've just found this way the easiest to do what I want.

### How it works
It's pretty straightforward, there's no magic. All the steps are in ```new_vhost.sh``` and explained in comments. The ```vhost``` file is just a blueprint on which it bases your new vhost.

### Before you start
Take a look at the file ```new_vhost.sh```:
- Change the SOURCE_PATH variable to the path of the parent of the site(s) you want to activate
- If it's not already, make the ```new_vhost.sh``` file executable with:

```
    chmod +x new_vhost.sh
```

### Usage
First check the project path is set right, then run as root, with the project name as the only argument:

```
    ./new_vhost.sh projectname
```

Done. Navigate to ```http://projectname/```

Repeat as necessary. If your Projects directory contains the projects ```abc```, ```def```, ```wvu``` and ```xyz``` then run:

```
    ./new_vhost.sh abc
    ./new_vhost.sh def
    ./new_vhost.sh wvu
    ./new_vhost.sh xyz
```
   
### Common problems
- Forbidden - make sure your Projects directory is readable by Apache:
    - Make sure the whole contents are owned by you, with ```chown -R project```
    - Make sure group has permission to read, with ```chmod 755 project```
    - Add the user ```www-data``` to your user's group in ```/etc/group```
- Not Found - if some pages 404:
    - Make sure you have mod_rewrite enabled - ```a2enmod rewrite```
    - Check your ```.htaccess``` file

### TODO
- Take multiple arguments to create multiple vhosts in one go e.g. ```./new_vhost.sh abc def wvu xyz (or *)```
- Take optional argument for project location eg. ```./new_vhost abc --location=/home/ben/work/Projects```
- Take optional argument for cases when VHOST name should be different to project folder e.g. ```./new_vhost www --name=foo```
