#!/bin/bash

echo "Loading no-os_curve_tracer_adalm-lsmspg_MAX32655FTHR.hex via openOCD..."
/usr/lib/datax-workshops-tools-for-ls/openocd/bin/openocd -f interface/cmsis-dap.cfg -f target/max32655.cfg -c "program ./hex_files/no-os_curve_tracer_adalm-lsmspg_MAX32655FTHR.hex verify reset exit"
echo "Done!"