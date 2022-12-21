#!/usr/bin/bash

# OpenLens buiild setup on Ubuntu

# Install git and curl: 
sudo apt install -y curl git

# needed for 20.4
sudo apt-get install rpm  


# Install NodeJS repo: 
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -

# Install NodeJS v16 LTS: 
sudo apt install -y nodejs

# Install latest version of yarn: 
sudo npm install -g yarn

# Clone Open Lens repository: 
git clone https://github.com/lensapp/lens.git ~/openlens

# Go into Open Lens source codes directory: 
cd ~/openlens

# Select your specific version: 
git checkout v6.2.5

# Build your binaries: 
make build