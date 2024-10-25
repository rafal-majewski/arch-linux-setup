#!/bin/sh
echo "Updating what is currently installed using Pacman..."
sudo pacman --sync --refresh --sysupgrade
echo "Installing Git..."
sudo pacman --sync --needed git
