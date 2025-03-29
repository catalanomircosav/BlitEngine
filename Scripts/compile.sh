#!/bin/bash

# Check that we're in the correct folder
if [ ! -f "../CMakeLists.txt" ]; then
    echo "Error: Run this script from the Scripts folder"
    exit 1
fi

# Check that the Build folder exists
if [ ! -d "../Build" ]; then
    echo "Error: First run setup.sh to configure the project"
    exit 1
fi

# Go to the Build folder
cd ../Build

echo "Compiling..."

# Choose the build type (modify if needed)
BUILD_TYPE="Debug"

# Run the compilation
cmake --build . --config $BUILD_TYPE -j$(nproc)

if [ $? -ne 0 ]; then
    echo "Compilation failed!"
    exit 1
fi

echo "Compilation completed successfully!"
echo "The executables are in ../Build/bin/"