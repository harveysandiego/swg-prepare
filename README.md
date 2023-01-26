# SWG Server Preparation Guide:

Original Guide by Tekohswg

Modified by RezecNoble - Designed for Oracle Linux

The first step which is outside the scope of this guide is to install Oracle Linux 8 or attain a server that is already running Oracle Linux 8. This is my recommendation right now because its one of the smoothest install processes for the Oracle Database.

This guide and script are going to assume the hostname/username of swg. Future releases will include a config file for defining custom variables.

Starting off, we want our server to have a static IP address. First, it’s helpful to know what our current IP address is. Open a terminal and run this command:

`ifconfig`

You’ll get an output that looks like this. Pay attention to the numbers that correspond with the ones circled in red. Yours will be different. Once you’ve noted this IP address, you may close the terminal.

<p align="center">
  <img src="/screenshots/img1.jpg">
</p>

Now, click the network icon (the ethernet jack) on the right side of the taskbar and click Edit Connections.... 

<p align="center">
  <img src="/screenshots/img2.jpg">
</p>

In the window that appears, select Wired connection 1 and click the gear icon at the bottom of the window. 

<p align="center">
  <img src="/screenshots/img3.jpg">
</p>

Click on the tab called IPv4 settings. For the Method, select Manual. Then under addresses, click Add. For your address, enter an address that has the same first three numbers as the IP address you noted earlier, but substitute the fourth number for something that is available on your network. Selecting a large fourth number like 250 is almost always be safely outside your DHCP address pool. If you press Tab when you’re done, the Netmask will be populated automatically. If it doesn’t, it should usually be 24. The Gateway should be the IP address of your router. (If you’re not sure, check for a sticker on your router or maybe the manual. You can also run route -n from a terminal.) For your DNS servers, enter 1.1.1.2, 1.0.0.2. Click Save when you’re done and close the Network Connections window.

<p align="center">
  <img src="/screenshots/img4.jpg">
</p>

If not already set, please set your hostname to something memorable, for this example I will use 'swg'

`hostnamectl set-hostname swg`

We should now add our static IP address to the hosts file. Open a terminal and enter this command:

`sudo vi /etc/hosts`

<p align="center">
  <img src="/screenshots/img5.jpg">
</p>

`Press     'esc' :wq      to save and exit.`

Go ahead and reboot the server at this point

`sudo reboot`

Now, we can install git using this command:

`sudo yum install git -y`

Next, we want to download the swg-prepare repository. This repository contains stuff you need to get your system ready.

`git clone https://github.com/SWGEvolve/swg-prepare.git`

Start off by running the following command:

`sh /home/swg/swg-prepare/main.sh`

This will launch a menu with four options.

- "Single Server Install"
- "Multi Server Install - Database"
- "Multi Server Install - Gameserver (Oracle 8)"
- "Multi Server Install - Gameserver (Debian 11)" (Still being tested, do not use)

<em>Single Server Installations</em> are meant for running your DB and Gameserver on a single installation of Oracle 8.
This option is best for prepping a new VM, running a test server or a development server.
!!It is NOT recommended to use that setup for a production server. In production you should run separate servers.

<em>Multi Server Options:</em>

The first option is meant for installing the Oracle database and setting the necessary configurations on a server running Oracle Linux 8.

The second option is meant for installing the Gameserver on a server running Oracle Linux 8.

The third option is meant for installing the Gameserver on a server running Debian 11. (Still being tested, do not use)

At any point in the future you can access sqldeveloper using the following command.
/opt/sqldeveloper/sqldeveloper.sh

To be continued with guide on setting up communcation between mulitserver configurations.....


# Premade OVAs:

<strong>Bare OL8 OS</strong> - This is a custom Oracle Linux 8.7 Install with XFCE and the Brave Webbrowser. This is a good starting point for following the guide.

https://drive.proton.me/urls/9JT2ND22QR#1stUVDiUy4AL

<strong>SWGSource_OL8</strong> - This is an OVA that has already had the DB and tools setup. It is ready to run the guide on SWGSource for installing the game.