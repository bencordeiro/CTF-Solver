#!/bin/bash

# This script decodes base64-encoded strings, Caesar-ciphered strings, and ROT13-ciphered strings

# Check if the base64 and tr commands are available
if ! [ -x "$(command -v base64)" ] || ! [ -x "$(command -v tr)" ]; then
  echo 'Error: base64 or tr is not installed.' >&2
  exit 1
fi

# Prompt the user for an encoded string
read -p "Enter the encoded string: " encoded

# Prompt the user for the type of encoding
read -p "Enter the type of encoding (base64, caesar, rot13): " encoding

case "$encoding" in
  "base64")
    # Decode the base64-encoded string
    decoded=$(echo "$encoded" | base64 --decode)
    ;;
  "caesar")
    # Decode the Caesar-ciphered string
    decoded=$(echo "$encoded" | tr '[A-Za-z]' '[X-ZA-Wx-za-w]')
    ;;
  "rot13")
    # Decode the ROT13-ciphered string
    decoded=$(echo "$encoded" | tr '[A-Za-z]' '[N-ZA-Mn-za-m]')
    ;;
  *)
    echo "Error: invalid encoding type." >&2
    exit 1
    ;;
esac

# Print the decoded string
echo "Decoded string: $decoded"
