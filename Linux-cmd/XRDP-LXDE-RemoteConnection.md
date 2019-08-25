# 4 steps to Connect to LXDE desktop environment via XRDP on Ubuntu 19.4
#### 1- login with root user and update Apt-get
    sudo Apt-get update && apt-get upgrade
    sudo Apt-get dist-upgrade
#### 2- install lxde GUI (desktop environment)
    sudo apt-get install lxde
#### 3- install xrdp to enable remote desktop connection
    sudo apt-get install xrdp
#### 4- start xrdp Service
     Service xrdp start
## Issues and solutions
### Issue 1:
##### if you have error after reboot related to **lightdm** press **ctl+alt+f2** and login with root user
##### disable lightdm.service
    sudo systemctl disable lightdm.service
### Issue 2:
##### if you can not access remote desktop connection with specific user login with this user and create session to auto start **LXDE** for this user
    echo lxsession -s LXDE -e LXDE > ~/.xsession
##### after that restart **xrdp** service
    sudo service xrdp restart
##
**End**

https://my.contabo.com/