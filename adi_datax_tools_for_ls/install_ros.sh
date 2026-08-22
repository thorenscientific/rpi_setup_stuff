#!/bin/bash
echo "Cloning adi_ros2."

git clone https://github.com/analogdevicesinc/adi_ros2.git
cd adi_ros2

echo "Docker Composing base..."
docker compose -f compose.build.yml build base

cd ~

echo "Cloning plescaevelyn/iio_ros2 and checking out adalm-lsmspg-example branch."

git clone -b adalm-lsmspg-example https://github.com/plescaevelyn/iio_ros2.git
cd iio_ros2
git checkout adalm-lsmspg-example

