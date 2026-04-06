#!/bin/sh
mkdir -p /home/picoclaw/.picoclaw
echo "$PICOCLAW_CONFIG" > /home/picoclaw/.picoclaw/config.json
exec picoclaw gateway
