#!/bin/bash

echo "Setting date..."
sudo date -s "$(wget --method=HEAD -qSO- --max-redirect=0 google.com 2>&1 | sed -n 's/^ *Date: *//p')"

echo "Setting up virtual environment."
sudo apt install python3.13-venv

python3 -m venv my_venv
source ~/my_venv/bin/activate

pip install matplotlib


echo "Updating apt"
sudo apt update

echo "Installing Thonny..."
sudo apt-get -y install thonny

echo "Cloning and installing pyadi-iio..."

git clone -b main --single-branch https://github.com/analogdevicesinc/pyadi-iio.git
cd pyadi-iio
pip install .

echo "Snagging MAX32666FTHR HEX files..."
cd /home/analog/Desktop
wget https://raw.githubusercontent.com/thorenscientific/rpi_setup_stuff/refs/heads/main/adi_datax_tools_for_ls/adalm-lsmspg_MAX32655FTHR_cuve_tracer.hex
wget https://raw.githubusercontent.com/thorenscientific/rpi_setup_stuff/refs/heads/main/adi_datax_tools_for_ls/adalm-lsmspg_MAX32655FTHR_tinyiiod_server.hex

echo "Installing Tio..."
sudo apt install tio