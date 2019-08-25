#### https://my.contabo.com/
#### 5 steps to Connect to LXDE desktop environment via XRDP on Ubuntu 19.4
####-----------------------------------------------------------
#### 1- update OS && login with root user
sudo Apt-get update && apt-get upgrade
sudo Apt-get dist-upgrade

#### 2- install lxde GUI
sudo apt-get install lxde

#### 3- install xrdp
sudo apt-get install xrdp 

#### 4- start xrdp Service
Service xrdp start

#### 5- disable lightdm.service
#### if you have eroor after reboot press ctl+alt+f2 and login with root
sudo systemctl disable lightdm.service
####----------------------------------------------------------
#### Issue
#### if you can not remote connect with specific user
#### frist login with this user
#### Create session to auto start LXDE for this user  
echo lxsession -s LXDE -e LXDE > ~/.xsession
 
#### after that restart xrdp service
sudo service xrdp restart
####----------------------------------------------------------

 

 