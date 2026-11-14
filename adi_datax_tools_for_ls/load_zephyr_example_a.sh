#!/bin/bash

echo "Loading zephyr_max32655fthr-lsmspg-curve-tracer-A.hex via openOCD..."
/usr/lib/datax-workshops-tools-for-ls/openocd/bin/openocd -f interface/cmsis-dap.cfg -f target/max32655.cfg -c "program ./hex_files/zephyr_max32655fthr-lsmspg-curve-tracer-A.hex verify reset exit"
echo "Done!"