#!/bin/bash
set -e

# This project will install the project dependencies

# Update the system
sudo apt-get update -y

# Install git & git-lfs
sudo apt-get install -y git git-lfs

# Install g++ & cmake
sudo apt-get install -y build-essential g++ cmake

# Install boost & googletest
sudo apt-get install -y libboost-all-dev googletest

#install LLVM & clang 12
wget https://apt.llvm.org/llvm.sh
chmod +x llvm.sh
sudo ./llvm.sh 12
rm llvm.sh

# Install clang-format and clang tidy
sudo apt-get install -y clang-format clang-tidy

# Create a tools directory for development utilities
mkdir -p tools

# Install staruml to create UML diagrams
STARUML_PATH="tools/staruml"
if [ ! -f "$STARUML_PATH" ]; then
    STARUML_URL="http://staruml.io/download/releases/StarUML-3.2.2.AppImage"
    wget --output-document="$STARUML_PATH" $STARUML_URL
    chmod +x "$STARUML_PATH"
fi
