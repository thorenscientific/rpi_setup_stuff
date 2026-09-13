#!/bin/bash

echo "Setting date..."
sudo date -s "$(wget --method=HEAD -qSO- --max-redirect=0 google.com 2>&1 | sed -n 's/^ *Date: *//p')"

echo "Updating apt..."
sudo apt update

echo "Making scripts executable..."
chmod +x *.sh

echo "Setting up virtual environment..."
sudo apt install -y python3.13-venv
python3 -m venv ~/my_venv

echo "Activating virtual environment..."
source ~/my_venv/bin/activate

echo "Installing matplotlib..."
pip install matplotlib

echo "Cloning and installing pyadi-iio..."

git clone -b main --single-branch https://github.com/analogdevicesinc/pyadi-iio.git ~/pyadi-iio
cd ~/pyadi-iio
pip install .
cd ~

echo "Installing Thonny..."
sudo apt-get install -y thonny

echo "Grabbing Thonny config that points at my_venv..."
wget https://raw.githubusercontent.com/thorenscientific/rpi_setup_stuff/refs/heads/main/adi_datax_tools_for_ls/thonny_configuration.ini
mv thonny_configuration.ini ~/.config/Thonny/configuration.ini
cd ~/

echo "Adding my_venv activation to bashrc..."
~/rpi_setup_stuff/adi_datax_tools_for_ls/add_venv_to_bashrc.sh

echo "Installing Mousepad..."
sudo apt-get install -y mousepad

echo "Installing Tio..."
sudo apt install -y tio

echo "Snagging MAX32666FTHR HEX files..."
cd ~/Desktop
wget https://raw.githubusercontent.com/thorenscientific/rpi_setup_stuff/refs/heads/main/adi_datax_tools_for_ls/adalm-lsmspg_MAX32655FTHR_cuve_tracer.hex
wget https://raw.githubusercontent.com/thorenscientific/rpi_setup_stuff/refs/heads/main/adi_datax_tools_for_ls/adalm-lsmspg_MAX32655FTHR_tinyiiod_server.hex

echo "Adding lsmspg overlay to config.txt..."
sudo ~/rpi_setup_stuff/adi_datax_tools_for_ls/add_lsmspg_devicetree_to_config.sh

echo "Copying updated config.txt to Desktop..."
cp /boot/config.txt ~/Desktop