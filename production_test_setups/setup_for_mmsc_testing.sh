#!/bin/bash

sudo pip install --upgrade --force-reinstall numpy
sudo pip install --upgrade --force-reinstall matplotlib
git clone https://github.com/thorenscientific/pyadi-iio.git
cd pyadi-iio
git checkout adalm-mmsc
sudo pip install .
cd ..
git clone https://github.com/analogdevicesinc/genalyzer/
cd genalyzer
mkdir build
cd build
cmake ..
make
sudo make install
cd ..
cd bindings/python
sudo pip install .
cd ~/pyadi-iio/examples/adalm-mmsc/
