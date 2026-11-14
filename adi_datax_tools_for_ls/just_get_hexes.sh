

echo "Snagging MAX32666FTHR HEX files..."
cd ~/Desktop

wget https://raw.githubusercontent.com/thorenscientific/rpi_setup_stuff/refs/heads/main/adi_datax_tools_for_ls/load_no-os_curve_tracer.sh
chmod +x load_no-os_curve_tracer.sh
wget https://raw.githubusercontent.com/thorenscientific/rpi_setup_stuff/refs/heads/main/adi_datax_tools_for_ls/load_no-os_tinyiiod_server.sh
chmod +x load_no-os_tinyiiod_server.sh
wget https://raw.githubusercontent.com/thorenscientific/rpi_setup_stuff/refs/heads/main/adi_datax_tools_for_ls/load_zephyr_example_a.sh
chmod +x load_zephyr_example_a.sh

mkdir hex_files
cd hex_files
wget https://raw.githubusercontent.com/thorenscientific/rpi_setup_stuff/refs/heads/main/adi_datax_tools_for_ls/no-os_curve_tracer_adalm-lsmspg_MAX32655FTHR.hex
wget https://raw.githubusercontent.com/thorenscientific/rpi_setup_stuff/refs/heads/main/adi_datax_tools_for_ls/no-os_iiod_server_adalm-lsmspg_MAX32655FTHR.hex
wget https://raw.githubusercontent.com/thorenscientific/rpi_setup_stuff/refs/heads/main/adi_datax_tools_for_ls/zephyr_max32655fthr-lsmspg-curve-tracer-A.hex
wget https://raw.githubusercontent.com/thorenscientific/rpi_setup_stuff/refs/heads/main/adi_datax_tools_for_ls/zephyr_max32655fthr-lsmspg-curve-tracer-B.hex