# Create Environment 
Ubuntu, t2micro, generate key (or select existing), select default security group, configure storage: 20, 
modify IAM role > select AmazonS3fullaccess, user must have SSH security access, connect with putty, log into server as user: ubuntu

# Update Environment 

```
sudo apt update 

sudo apt install unzip

sudo apt install python3-pip -y
```
# Install AWS CLI 
```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

unzip awscliv2.zip

sudo ./aws/install
```

# Configure AWS CLI
```
aws configure

aws key

aws secret key

us-east-1

json
```

# Clone Git Repository
```
git clone https://github.com/slpmssg12bia/pecos.git
```
# cd into the repository
```
cd pecos
```
# Recreate bash Files
```

touch pecos_archive_s3.sh
nano pecos_archive_s3.sh

#!/bin/bash
aws s3 sync pecosdump/ s3://viquity-database-import-us-east-1/Jobs/pecos/pecosarchive/pecosdump-"$(date +%d-%m-%y-%H-%M)"/

ctrl X
Y

---------------------------------
touch pecos_clean.sh
nano pecos_clean.sh

#!/bin/bash
rm -rf pecosdump

ctrl X
Y
---------------------------------
touch pecos_cron.sh
nano pecos_cron.sh

#!/bin/bash
cd /home/ubuntu/pecos
python3 pecos_cron.py

ctrl X
Y
---------------------------------

touch pecos_dump_to_s3.sh
nano pecos_dump_to_s3.sh

#!/bin/bash
aws s3 sync pecosdump/ s3://viquity-database-import-us-east-1/Jobs/pecos/pecoscurrentdump/pecosdump/

ctrl X
Y
---------------------------------

touch pecos_remove_old_dump.sh
nano pecos_remove_old_dump.sh

#!/bin/bash
aws s3 rm s3://viquity-database-import-us-east-1/Jobs/pecos/pecoscurrentdump --recursive

ctrl X
Y
---------------------------------

# Delete Original bash files
```
rm archive_s3.sh  clean.sh  cron.sh  dump_to_s3.sh  remove_old_dump.sh 
```

# Change Permissions of bash Files
```
chmod +x   pecos_archive_s3.sh  pecos_clean.sh  pecos_cron.sh  pecos_dump_to_s3.sh  pecos_remove_old_dump.sh  

```

# install pip dependencies
```
pip install -r pecos_requirements.txt 
```
# install Cron jobs for Parsing
```
pwd

sudo apt-get install cron
```
# Open Cron Tab
```
sudo su

pip install -r pecos_requirements.txt 

nano /etc/crontab
```
# Create Cron Job ~ https://crontab.guru/examples.html
```
04 04 * * * root bash /home/ubuntu/pecos/pecos_cron.sh
!!!CARRIAGE RETURN after line above!!!!!

ctrl x

y

enter
```
