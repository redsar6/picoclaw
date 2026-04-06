#!/bin/sh
mkdir -p /home/picoclaw/.picoclaw
printf '%s' "$PICOCLAW_CONFIG" > /home/picoclaw/.picoclaw/config.json
sleep 1
exec picoclaw gateway
