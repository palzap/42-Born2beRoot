
# Born2beRoot

Introduction to Virtual Machines and System Administration

#### Started:
13/12/2022

#### First submission:
22/12/2022

#### Score:
125%

## Project Overview
### What is a virtual machine?

A Virtual Machine (VM) is a compute resource that uses software instead of a physical computer to run programs and deploy apps. One or more virtual “guest” machines run on a physical “host” machine.  Each virtual machine runs its own operating system and functions separately from the other VMs, even when they are all running on the same host. This means that, for example, a virtual MacOS virtual machine can run on a physical PC. 

### How does a virtual machine work?

VMs are made possible through virtualization technology. Virtualization uses software to simulate virtual hardware that allows multiple VMs to run on a single machine. The physical machine is known as the host while the VMs running on it are called guests.

### Why Debian?

It is the OS recommended by the subject for beginners to system administration, which is my case. From what I gathered, Debian is easier to install and it's more similar to Ubuntu in terms of commands used.

Most users appreciate the stability, and the smooth upgrade processes of both packages and the entire distribution. Debian is also widely used by software and hardware developers because it runs on numerous architectures and devices, offers a public bug tracker and other tools for developers.

### What is apt and aptitude?

APT is the abbreviation for Advanced Package Tool. What makes this program “advanced” is its approach to packages. It doesn't simply evaluate them individually, but it considers them as a whole and produces the best possible combination of packages depending on what is available and compatible according to dependencies.

aptitude is a feature full package manager for Debian GNU/Linux systems, based on the renowned apt package management infrastructure. aptitude provides the functionality of dselect and apt-get, as well as many additional features not found in either program.

To sum everything up, aptitude incorporates all apt features and makes it more user friendly.

### What is AppArmor?

AppArmor is a Mandatory Access Control (MAC) system built on Linux's LSM (Linux Security Modules) interface. In practice, the kernel queries AppArmor before each system call to know whether the process is authorized to do the given operation. Through this mechanism, AppArmor confines programs to a limited set of resources. AppArmor applies a set of rules (known as “profile”) on each program. The profile applied by the kernel depends on the installation path of the program being executed.

### What is SSH?

The Secure Shell Protocol (SSH) is a cryptographic network protocol for operating network services securely over an unsecured network. Its most notable applications are remote login and command-line execution.

### Monitoring log script working?

Hope so!

## Setting up the Virtual Machine
We use Oracle VM Virtual Box Manager to create our Virtual Machine (VM).  
1. Open Virtual Box and press New  
![Open Virtual Box and press New](https://github.com/palzap/42-Born2beRoot/blob/master/images/setvm/01.png?raw=true)  
2. Fill in all information  
![Fill in all information](https://github.com/palzap/42-Born2beRoot/blob/master/images/setvm/02.png?raw=true)  
3. Set RAM size  
![Set RAM size](https://github.com/palzap/42-Born2beRoot/blob/master/images/setvm/03.png?raw=true)  
4. Create Hard Disk now  
![Create Hard Disk now](https://github.com/palzap/42-Born2beRoot/blob/master/images/setvm/04.png?raw=true)  
5. Create VDI  
![Create VDI](https://github.com/palzap/42-Born2beRoot/blob/master/images/setvm/05.png?raw=true)  
6. Dinamically allocated  
![Dinamcally allocated](https://github.com/palzap/42-Born2beRoot/blob/master/images/setvm/06.png?raw=true)  
7. Set total disk size  
![Set total disk size](https://github.com/palzap/42-Born2beRoot/blob/master/images/setvm/07.png?raw=true)  
8. Go to VM settings  
![Go to VM settings](https://github.com/palzap/42-Born2beRoot/blob/master/images/setvm/08.png?raw=true)  
9. Set Network Adapter settings now  
![Set Network Adapter settings now](https://github.com/palzap/42-Born2beRoot/blob/master/images/setvm/09.png?raw=true)  
10. Start VM  
![Start VM](https://github.com/palzap/42-Born2beRoot/blob/master/images/setvm/10.png?raw=true)  
11. Choose the Debian ISO. Download latest release from [here](https://www.debian.org/download)  
![Choose ISO](https://github.com/palzap/42-Born2beRoot/blob/master/images/setvm/11.png?raw=true)  
  
## Partitioning and OS installation
1. Select install  
![Select install](https://github.com/palzap/42-Born2beRoot/blob/master/images/installation/001.png?raw=true)  
2. Set hostname, it should be youruser42  
![Set hostname](https://github.com/palzap/42-Born2beRoot/blob/master/images/installation/002.png?raw=true)  
3. Set password  
![Set password](https://github.com/palzap/42-Born2beRoot/blob/master/images/installation/004.png?raw=true)  
4. Create a new user  
![Create a new user](https://github.com/palzap/42-Born2beRoot/blob/master/images/installation/006.png?raw=true)  
5. Choose Manual Partitioning  
![Choose Manual Partitioning](https://github.com/palzap/42-Born2beRoot/blob/master/images/installation/007.png?raw=true)  
6. Select Disk  
![Select Disk](https://github.com/palzap/42-Born2beRoot/blob/master/images/installation/008.png?raw=true)  
7. Complete the process and then select Create a new Partition  
![Create a new Partition](https://github.com/palzap/42-Born2beRoot/blob/master/images/installation/011.png?raw=true)  
8. Set the size in Megabytes for the /boot Partition. The `lsblk` command shows information in Mebibytes and Gibibytes [read more here](https://www.linuxscrew.com/kibibytes-mebibytes-gibibytes-tebibytes). So while creating partitions here, and to ensure that the sizes match the subject, just Google `mebibytes to megabytes` and use the converter to get the correct value of megabytes/gigabytes to input.  
![Set size for /boot Partition](https://github.com/palzap/42-Born2beRoot/blob/master/images/installation/012.png?raw=true)  
9. Set it as Primary and Beggining. Then set the Mount point to /boot  
![Set Mount point to /boot](https://github.com/palzap/42-Born2beRoot/blob/master/images/installation/017.png?raw=true)  
10. Configure encrypted volumes  
![Configure encrypted volumes](https://github.com/palzap/42-Born2beRoot/blob/master/images/installation/018.png?raw=true)  
11. Select the device to be encrypted  
![Select device to be encrypted](https://github.com/palzap/42-Born2beRoot/blob/master/images/installation/021.png?raw=true)  
12. Finish encryption and set a password for your encrypted volume. Then Configure the Logical Volume Manager (LVM)  
![Configure LVM](https://github.com/palzap/42-Born2beRoot/blob/master/images/installation/028.png?raw=true)  
13. Create a new LVM group and name it accordingly  
![Create LVM group](https://github.com/palzap/42-Born2beRoot/blob/master/images/installation/031.png?raw=true)  
14. Use the newly encrypted volume and start creating the logical volumes  
![Create logical volume](https://github.com/palzap/42-Born2beRoot/blob/master/images/installation/033.png?raw=true)  
15. Create all volumes according to the subject, in my case I'm going for the Bonus part.  
![Set volume name](https://github.com/palzap/42-Born2beRoot/blob/master/images/installation/035.png?raw=true)  
16. Set volume size  
![Set volume size](https://github.com/palzap/42-Born2beRoot/blob/master/images/installation/036.png?raw=true)  
17. After creating all volumes, enable and mount each one accordingly  
![Mount volumes](https://github.com/palzap/42-Born2beRoot/blob/master/images/installation/038.png?raw=true)  
18. home partition example  
![home partition example](https://github.com/palzap/42-Born2beRoot/blob/master/images/installation/043.png?raw=true)  
19. Complete the process and proceed with the installation. Make sure to install only the minimum service.  
![Minimum service](https://github.com/palzap/42-Born2beRoot/blob/master/images/installation/051.png?raw=true)  
20. Install GRUB boot loader on the primary device  
![Install GRUB boot loader](https://github.com/palzap/42-Born2beRoot/blob/master/images/installation/052.png?raw=true)  
21. Installation will now complete and you can now boot into your newly installed server.  

## Installing and configuring main services
Login as root user
```
su
````
### SSH - Secure Shell Protocol 
```
apt install ssh
```
#### Configuring ssh service port
```
nano /etc/ssh/sshd_config
    Port 4242
    PermitRootLogin no
```
```
nano /etc/ssh/ssh_config
    Port 4242
```

### UFW - Uncomplicated Firewall 
```
apt install ufw
ufw enable
ufw allow 4242
ufw status
```
**For my Bonus services**
```
ufw allow 3306
ufw allow 80
ufw allow 25
```
## Password policies
```
apt install libpam-pwquality
```

#### Configuring password aging controls
```
nano /etc/login.defs
    PASS_MAX_DAYS 30
    PASS_MIN_DAYS 2
    PASS_WARN_AGE 7
```

#### Configuring strong password policies according to the subject
```
    nano /etc/pam.d/common-password (add options after retry=3)
        minlen=3
        dcredit=-1
        ucredit=-1
        lcredit=-1
        difok=7
        maxrepeat=3
        usercheck=1
        enforce_for_root
```
## SUDO
```
apt install sudo
```
**Add your created user to sudo group**
```
    sudo adduser 'user' sudo
    sudo addgroup user42
    sudo adduser 'user' user42
```
#### Configuring SUDO (password policies and logfile path)
```
sudo visudo (add tge following)
    Defaults secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"
    Defaults passwd_tries=3
    Defaults badpass_message="Wrong password! Try again…"
    Defaults logfile="/var/log/sudo/logfile"
    Defaults log_input, log_output
    Defaults iolog_dir="/var/log/sudo"
    Defaults requiretty
```

#### Static IP (disable dhcp service to close port 68)
```    
hostname -I
sudo nano /etc/network/interfaces
    #The primary network interface
    auto enp0s3
    iface enp0s3 inet static
        address 'hostname -I'
        netmask 255.255.255.0
        gateway 'IP route'
```

## Monitoring script

**Create a new script to be executed every 10 minutes using cron**
```
sudo mkdir /var/monitoring
sudo nano /var/monitoring/monitoring.sh
```
```
#!/bin/bash
wall “Monitoring log

    *Architecture: $(uname -a)
    *Physical processors: $(grep “physical id” /proc/cpuinfo | uniq | wc -l)
    *Virtual processors: $(grep “processor” /proc/cpuinfo | wc -l)
    *Ram usage: $(free –mega | grep “Mem” | awk ‘{printf(“%i/%i MB (%.2f%%)\n”, $3, $2, ($3/$2*100))}’)
    *Disk usage: $(df -BG –total | grep “total” | awk ‘{printf(“%.1f/%.1f GB (%.2f%%)\n”, $3, $2, ($3/$2*100))}’)
    *CPU usage: $(top -ibn1 | grep “%Cpu” | tr ‘,’ ‘ ‘ |awk ‘{printf(“%.2f%%\n”, (100 – $8)}’)
    *Last boot: $(who –boot | awk ‘{print $3, $4}’)
    *LVM: $(if [ $(lsblk | grep “lvm” | wc -l) -eq 0 ]; then echo “no”; else echo “yes”; fi)
    *Active connections: $(ss -s | grep “TCP:” | awk ‘{print $4}’ | tr -d ,)
    *Users connected: $(who –count | grep “users” | awk ‘{print $2}’ | tr -d “users=”)
    *Network: IP: $(hostname -I) | MAC: $(ip link | grep “ether” | awk ‘{print $2}’ | head -1
    *Sudo commands: $(grep “COMMAND” /var/log/sudo/logfile | wc -l)”
```
```
sudo crontab -e
    Add the following rule
    */10 * * * * bash /var/monitoring/monitoring.sh
    Confirm that your script is running every 10 minutes
```
#### Simple explanation  
```
*Architecture: $(uname -a)  
    Easy to understand, uname prints system information and -a option shows all.  
```
```  
*Physical processors: $(grep “physical id” /proc/cpuinfo | uniq | wc -l)  
    The cpuinfo file shows all information from all cpu cores. Using uniq makes sure that wc -l only counts unique values.
```
```  
*Virtual processors: $(grep “processor” /proc/cpuinfo | wc -l)  
    The processor information is on the same file used before.
```
```
*Ram usage: $(free –mega | grep “Mem” | awk ‘{printf(“%i/%i MB (%.2f%%)\n”, $3, $2, ($3/$2100))}’)
    free displays the amount of free and used memory in the system, the –mega option converts the information to MB.  
```
```  
*Disk usage: $(df -BG –total | grep “total” | awk ‘{printf(“%.1f/%.1f GB (%.2f%%)\n”, $3, $2, ($3/$2100))}’)  
    df reports file system disk space usage, -BG converts the values to Gibibytes and –total adds an extra line with the totals.
```
```  
*CPU usage: $(top -ibn1 | grep “%Cpu” | tr ‘,’ ‘ ‘ | awk ‘{printf(“%.2f%%\n”, (100 – $8)}’)  
    top displays Linux processes, -i removes all idle processes, -b starts top in batch mode and -n1 restricts top to only 1 iteration.  
```
```  
*Last boot: $(who –boot | awk ‘{print $3, $4}’)
    who shows who is logged on, –boot shows time of last system boot.  
```
```  
*LVM: $(if [ $(lsblk | grep “lvm” | wc -l) -eq 0 ]; then echo “no”; else echo “yes”; fi)
    We set an if statement using lslbk, if no lvm is detected the output of wc -l will be 0 and it will echo no, otherwise it will echo yes.  
```
```  
*Active connections: $(ss -s | grep “TCP:” | awk ‘{print $4}’ | tr -d ,)  
    ss is another utility to check sockets on the system. -s option prints a summary.  
```
```  
*Users connected: $(who –count | grep “users” | awk ‘{print $2}’ | tr -d “users=”)  
    Using who command again, this time with the option –count to see how many users are connected.  
```
```  
*Network: IP: $(hostname -I) | MAC: $(ip link | grep “ether” | awk ‘{print $2}’ | head -1)  
    hostname -I shows the server IP and ip link shows network device configuration.  
```
```  
*Sudo commands: $(grep “COMMAND” /var/log/sudo/logfile | wc -l)*  
    We grep “COMMAND” on our created logfile and use wc -l to count  
```  
#### What is cron?  
The cron command-line utility is a job scheduler on Unix-like operating systems. Users who set up and maintain software environments use cron to schedule jobs (commands or shell scripts), also known as cron jobs, to run periodically at fixed times, dates, or intervals. It typically automates system maintenance or administration—though its general-purpose nature makes it useful for things like downloading files from the Internet and downloading email at regular intervals.  

## Bonus part – WordPress website

#### Lighttpd
```
sudo apt install lighttpd
```
#### Mariadb
```
sudo apt install mariadb-server
sudo mysql_secure_installation
    Switch to unix_socket authentication n
    Change the root password? n
    Remove anonymous users? Y
    Disallow root login remotely? Y
    Remove test database and access to it? Y
    Reload privilege tables now? Y
sudo mariadb
    CREATE DATABASE 'database-name';
    GRANT ALL ON .* TO 'username'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION;
    FLUSH PRIVILEGES;
    exit
```

#### PHP, Wget and Wordpress
```
sudo apt install php-cgi php-mysql
sudo apt install wget
cd /var/www
    sudo wget http://wordpress.org/latest.tar.gz
    sudo tar -xzvf latest.tar.gz
    sudo cp -r wordpress/* html/
    sudo rm latest.tar.gz
    sudo rm -r /wordpress
cd /html
    sudo cp wp-config-sample.php wp-config.php
    sudo nano wp-config.php
        define( 'DB_NAME', 'database_name' );
        define( 'DB_USER', 'database_user' );
        define( 'DB_PASSWORD', 'password' );
sudo lighty-enable-mod fastcgi
sudo lighty-enable-mod fastcgi-php
sudo service lighttpd force-reload
```
After all that, access your website by inputting your Virtual Machine IP address on your browser, the WordPress front page will load and you can edit your webpage 

## Postfix - Mail server
```
sudo apt install postfix
```

**Configure postfix only for local use**
```
sudo nano /etc/postfix
    myhostname = 'your desired hostname'
```
**Setting global aliases for easier send/read mail**
```
    sudo nano /etc/profile.d/00-aliases.sh
        alias sendmail='/usr/sbin/sendmail'
        alias readmail='cat /var/mail/$USER'
```
**Sending mail**
```
    echo "Hello" | sendmail 'user'@'hostname'
```
**Reading mail**
```
    readmail
```
