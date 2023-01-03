#!/bin/bash

# Extract the file with the flag from the forensic image
mount -o loop forensic.img /mnt
cp /mnt/flag.txt .
umount /mnt

# Extract any hidden files or directories from the forensic image
foremost forensic.img

# Search for the flag in the extracted files
flag=$(grep -r "CTF{" . | grep -o "CTF{[^}]*}")

# Submit the flag to the CTF website
curl -X POST -d "flag=$flag" https://ctf.example.com/submit

echo "Flag submitted: $flag"
