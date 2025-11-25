cmake_minimum_required(VERSION 3.14)

project(cmake-exercise)


# Add dependencies like described in the exercise
find_package(deal.II REQUIRED)
find_package(yaml-cpp REQUIRED)
find_package(Boost REQUIRED COMPONENTS filesystem system)

# Add executables, with source files in subdirs
add_executable(
  main 
  main.cpp 
  flatset/flatset.cpp 
  filesystem/filesystem.cpp 
  fem/fem.cpp 
  yamlParser/yamlParser.cpp
)

# Link the files. When linking like this no extra path is necessary when including in source code
target_include_directories(
  main
  PUBLIC
  ${CMAKE_CURRENT_SOURCE_DIR}/flatset
  ${CMAKE_CURRENT_SOURCE_DIR}/filesystem
  ${CMAKE_CURRENT_SOURCE_DIR}/fem
  ${CMAKE_CURRENT_SOURCE_DIR}/yamlParser
)

# Link libraries
target_link_libraries(
  main
  Boost::filesystem
  yaml-cpp
)

# Setup Deal.II
DEAL_II_SETUP_TARGET(main)

