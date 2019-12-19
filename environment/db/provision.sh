# gives you a key which gives you access to the repository
wget -qO - https://www.mongodb.org/static/pgp/server-3.2.asc | sudo apt-key add -
# gets the source,
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org=3.2.20 # mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20
# sudo service mongod start
# sudo systemctl enable mongod.service

# removes the existing mongod.conf file
sudo rm /etc/mongod.conf
# linking the connection between the file
sudo ln -s /home/ubuntu/environment/mongod.conf /etc/mongod.conf
# restarting so the new configuration is in place
sudo systemctl restart mongod
sudo systemctl enable mongod
