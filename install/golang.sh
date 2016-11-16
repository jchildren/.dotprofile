#!/bin/bash
VERSION="1.7.3"
OS="linux"
ARCH=$(dpkg --print-architecture)

GO_WEB="https://storage.googleapis.com/golang/"
GO_ARCHIVE="go$VERSION.$OS-$ARCH.tar.gz"

wget -P /tmp/ $GO_WEB$GO_ARCHIVE
tar -C /usr/local/ -xzf /tmp/$GO_ARCHIVE
rm /tmp/$GO_ARCHIVE