#!/bin/bash

TARGET_IP="34.229.249.166"
TARGET_USER="Administrator"
WRONG_PASSWORD="wrong"
ATTEMPTS=10
DELAY=2

echo "[*] RDP brute-force simulation (wrong password)"
echo "[*] Target: $TARGET_USER@$TARGET_IP"
echo "[*] Attempts: $ATTEMPTS"

for i in $(seq 1 $ATTEMPTS); do
    echo "[*] Attempt $i"

    xfreerdp \
      /v:${TARGET_IP} \
      /u:${TARGET_USER} \
      /p:${WRONG_PASSWORD} \
      /cert:ignore \
      /sec:nla \
      /log-level:ERROR \
      +auth-only 2>/dev/null

    sleep $DELAY
done

echo "[+] Done. Check Wazuh Dashboard."
