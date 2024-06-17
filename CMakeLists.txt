cmake_minimum_required(VERSION 3.14...3.22)

project(
  ddsim
  LANGUAGES CXX
  DESCRIPTION "DDSIM - A JKQ quantum simulator based on decision diagrams")

set_property(GLOBAL PROPERTY USE_FOLDERS ON)
option(COVERAGE "Configure for coverage report generation")
option(BINDINGS "Configure for building Python bindings")
option(DEPLOY "Configure for deployment")

message("-- Generator is set to ${CMAKE_GENERATOR}")

if(DEFINED ENV{DEPLOY})
  set(DEPLOY
      $ENV{DEPLOY}
      CACHE BOOL "Use deployment configuration from environment" FORCE)
  message(STATUS "Setting deployment configuration to '${DEPLOY}' from environment")
endif()

set(default_build_type "Release") # cmake-lint: disable=C0103
if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
  message(STATUS "Setting build type to '${default_build_type}' as none was specified.")
  set(CMAKE_BUILD_TYPE
      "${default_build_type}"
      CACHE STRING "Choose the type of build." FORCE)
  # Set the possible values of build type for cmake-gui
  set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release" "MinSizeRel"
                                               "RelWithDebInfo")
endif()

# Check if submodule is present
macro(check_submodule_present MODULENAME) # cmake-lint: disable=C0103
  if(NOT EXISTS "${PROJECT_SOURCE_DIR}/extern/${MODULENAME}/CMakeLists.txt")
    message(FATAL_ERROR "${MODULENAME} submodule not cloned properly.
        Please run `git submodule update --init --recursive` from the main project directory")
  endif()
endmacro()

check_submodule_present(qfr)
check_submodule_present(cxxopts)

option(BUILD_DDSIM_TESTS "Also build tests and benchmarks for DDSIM project" OFF)
if(BUILD_DDSIM_TESTS)

  enable_testing()
  include(GoogleTest)
  add_subdirectory(test)
endif()

add_subdirectory(src)

if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
  add_subdirectory(apps)
endif()
