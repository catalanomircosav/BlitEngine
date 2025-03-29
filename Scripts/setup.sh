#!/bin/bash

# Check if CMake is installed
if ! command -v cmake &> /dev/null
then
    echo "CMake is not installed. Please install CMake before continuing."
    exit 1
fi

# Create build directory
mkdir -p ../Build
cd ../Build

# Generate project files
cmake .. -DCMAKE_BUILD_TYPE=Debug -G "Unix Makefiles"

if [ $? -ne 0 ]; then
    echo "CMake configuration failed!"
    exit 1
fi

echo "Configuration completed successfully!"
echo "You can now compile with 'make' in the Build directory"