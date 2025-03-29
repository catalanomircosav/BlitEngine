# Introduction
BlitEngine is a simple modular 2D Game Engine developed in C++ with OpenGL and GLFW. This documentation explains how to set up the development environment and build the project.
## Project Structure
```
  BlitEngine/
  ├── Engine/          # Engine source code
  ├── Game/            # Example game code
  ├── Build/           # Generated folder (not versioned)
  └── Scripts/         # Utility scripts
```
## Prerequisites
1. C++ compiler supported by CMake
2. CMake 3.17+
3. Git
4. Latest OpenGL supported graphics card

## Initial Setup
1. Clone the repository
```
   git clone https://github.com/catalanomircosav/BlitEngine.git```
   cd BlitEngine
```
  2. Initialize the submodules
```
    git submodule update --init --recursive
```

## Building the project
### On Windows
```
cd Scripts
.\setup.bat
.\build.bat
```
### On Linux/OS X
```
chmod +x Scripts/*.sh
cd Scripts
./setup.sh
./build.sh
```
# Contributing
1. Fork the repository
2. Create a new feature branch (`git checkout -b feature/awesome-feature`)
3. Commit your changes (`git commit -m 'Add awesome feature'`)
4. Push to the branch (`git push origin feature/awesome-feature`)
5. Open a Pull Request

## License
BlitEngine is licensed under the MIT License. See [LICENSE](LICENSE) file for the full text.

Copyright © 2025 Mirco Saverio Catalano
