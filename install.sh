#!/usr/bin/env bash

if ! ping -c 1 install.determinate.systems &> /dev/null; then
  echo "Cannot reach install.determinate.systems. Check your internet connection."
  exit 1
fi

echo "Installing Nix via Determinate Systems installer..."

curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
  sh -s -- install

# Note: The Determinate Nix Installer enables flakes by default.
