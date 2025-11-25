# Let's Fight With CMake, Docker, and Some Dependencies

Repository for the [CMake exercise](https://github.com/Simulation-Software-Engineering/Lecture-Material/blob/main/03_building_and_packaging/cmake_exercise.md).

# Build Docker container and run

Build the Docker container:

```bash
docker build -t cmake-exercise:local
```

*Building the `Dockerfile` could take a while, because many dependencies have to be installed. At my machine it took around 20-30min*

Start the container in interactive mode and mount the current directory:

```bash
docker run -it -v ./:/opt/cmake-exercise cmake-exercise:local
```

Clean up the `./build` directory (this is recommended but may not be required):

```bash
rm -rf build/
```

Run the `./build_and_run.sh`, to test if everything works:
```bash
./build_and_run.sh
```
this should result in a simular output (the following is a bit shortend):
```bash
...
[ 16%] Building CXX object CMakeFiles/main.dir/main.cpp.o
[ 33%] Building CXX object CMakeFiles/main.dir/flatset/flatset.cpp.o
[ 50%] Building CXX object CMakeFiles/main.dir/filesystem/filesystem.cpp.o
[ 66%] Building CXX object CMakeFiles/main.dir/fem/fem.cpp.o
[ 83%] Building CXX object CMakeFiles/main.dir/yamlParser/yamlParser.cpp.o
[100%] Linking CXX executable main
[100%] Built target main
Let's fight with CMake, Docker, and some dependencies!

Solve Poisson problem with FEM using deal.II
FEM results available in `solution.vtk`. Try visualizing with Paraview.

Modify a flat set using boost container
Elements in s1: 1       2       3       4

Inspect the current directory using boost filesystem
"." is a directory containing:
    "CMakeCache.txt"
    "CMakeFiles"
    "Makefile"
    "cmake_install.cmake"
    "main"
    "solution.vtk"

Parse some yaml file with yaml-cpp
  ../yamlParser/config.yml
Version: 1.2.3
root@e22431c56c9b:/opt/cmake-exercise# exit
exit
[silas@manacor cmake-exercise]$ ls
```
