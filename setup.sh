#!/bin/bash
set -e;

NOTOOLS=false;
NOUPDATE=false;

OPTIND=1;
for arg in "$@"
do
  shift
  case "$arg" in
    "--help"|"-h")
        echo "usage setup.sh [--no-tools] [--no-update]";
        echo "-no-tools:        avoid downloading utility tools";
        echo "-no-update:       avoid updating packages";
        exit 0;
        ;;
    "--no-tools")
        NOTOOLS=true;
    ;;
    "--no-update")
        NOUPDATE=true;
    ;;
  esac
done

if [ $NOUPDATE = false ]
then
    # Update the system
    sudo apt-get update -y
fi

# Install git & git-lfs
sudo apt-get install -y git git-lfs

# Install g++ & cmake
sudo apt-get install -y build-essential g++ cmake

#install LLVM & clang 12
wget https://apt.llvm.org/llvm.sh
chmod +x llvm.sh
sudo ./llvm.sh 12
rm llvm.sh

# Install clang-format and clang tidy
sudo apt-get install -y clang-format clang-tidy

# Install staruml to create UML diagrams
if [ $NOTOOLS = false ]
then
    # Create a tools directory for development utilities
    mkdir -p tools
    
    #install staruml
    STARUML_PATH="tools/staruml"
    if [ ! -f "$STARUML_PATH" ]
    then
        STARUML_URL="http://staruml.io/download/releases/StarUML-3.2.2.AppImage"
        wget --output-document="$STARUML_PATH" $STARUML_URL
        chmod +x "$STARUML_PATH"
    fi
fi
