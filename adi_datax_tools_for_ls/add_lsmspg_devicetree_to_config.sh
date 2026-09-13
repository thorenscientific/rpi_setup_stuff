#!/bin/bash

CONFIG="/boot/firmware/config.txt"
MARKER="# ADALM-LSMSPG-CONFIG-ADDED"

# Fall back to older path if needed
if [ ! -f "$CONFIG" ]; then
    CONFIG="/boot/config.txt"
fi

if [ ! -f "$CONFIG" ]; then
    echo "Error: config.txt not found at /boot/firmware/config.txt or /boot/config.txt"
    exit 1
fi

if grep -qF "$MARKER" "$CONFIG"; then
    echo "Config already applied, skipping."
    exit 0
fi

cat >> "$CONFIG" << 'EOF'

# ADALM-LSMSPG-CONFIG-ADDED
# config.txt additions

[all]

# Starting out with this COMMENTED:
# dtoverlay=rpi-adalm-lsmspg

# Heartbeat blinky:
dtparam=act_led_gpio=20
dtparam=act_led_trigger=heartbeat
dtparam=i2c_arm=on

# Short GPIO21 (pin 40) to ground for shutdown:
dtoverlay=gpio-shutdown,gpio_pin=21,active_low=1,gpiopull=up
EOF

echo "Config applied successfully."
