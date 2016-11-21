#!/bin/bash
apt update
apt install curl
curl -fsSL https://get.docker.com/ | sh
sudo usermod -aG docker $(whoami)
