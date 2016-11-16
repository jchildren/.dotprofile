#!/bin/bash
VSCODE_WEB="https://go.microsoft.com/fwlink/?LinkID=760868"

wget -O /tmp/vscode.deb $VSCODE_WEB
dpkg -i /tmp/vscode.deb
rm /tmp/vscode.deb