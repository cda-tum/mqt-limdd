# set required cmake version
cmake_minimum_required(VERSION 3.14...3.19)

# project definition
project(
  LIMDDPackage
  LANGUAGES CXX
  VERSION 2.1.0
  DESCRIPTION "MQT decision diagram package tailored to quantum computing")

# enable organization of targets into folders
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

# configuration options
option(DEPLOY "Configure for deployment")
option(BINDINGS "Configure for building Python bindings")
option(COVERAGE "Configure for coverage report generation")
option(BUILD_DD_PACKAGE_TESTS "Also build tests for DD package")

# build type settings
set(default_build_type "Release") # cmake-lint: disable=C0103
if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
  message(STATUS "Setting build type to '${default_build_type}' as none was specified.")
  set(CMAKE_BUILD_TYPE
      "${default_build_type}"
      CACHE STRING "Choose the type of build." FORCE)
  set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release" "MinSizeRel"
                                               "RelWithDebInfo")
endif()

# add main library code
include(GNUInstallDirs)
add_library(${PROJECT_NAME} INTERFACE)
target_sources(
  ${PROJECT_NAME}
  INTERFACE
    $<BUILD_INTERFACE:${${PROJECT_NAME}_SOURCE_DIR}/include/dd/Complex.hpp>
    $<BUILD_INTERFACE:${${PROJECT_NAME}_SOURCE_DIR}/include/dd/ComplexCache.hpp>
    $<BUILD_INTERFACE:${${PROJECT_NAME}_SOURCE_DIR}/include/dd/LimCache.hpp>
    $<BUILD_INTERFACE:${${PROJECT_NAME}_SOURCE_DIR}/include/dd/LimFunctionality.hpp>
    $<BUILD_INTERFACE:${${PROJECT_NAME}_SOURCE_DIR}/include/dd/ComplexNumbers.hpp>
    $<BUILD_INTERFACE:${${PROJECT_NAME}_SOURCE_DIR}/include/dd/ComplexTable.hpp>
    $<BUILD_INTERFACE:${${PROJECT_NAME}_SOURCE_DIR}/include/dd/ComplexValue.hpp>
    $<BUILD_INTERFACE:${${PROJECT_NAME}_SOURCE_DIR}/include/dd/ComputeTable.hpp>
    $<BUILD_INTERFACE:${${PROJECT_NAME}_SOURCE_DIR}/include/dd/LimTable.hpp>
    $<BUILD_INTERFACE:${${PROJECT_NAME}_SOURCE_DIR}/include/dd/Control.hpp>
    $<BUILD_INTERFACE:${${PROJECT_NAME}_SOURCE_DIR}/include/dd/Definitions.hpp>
    $<BUILD_INTERFACE:${${PROJECT_NAME}_SOURCE_DIR}/include/dd/Edge.hpp>
    $<BUILD_INTERFACE:${${PROJECT_NAME}_SOURCE_DIR}/include/dd/Export.hpp>
    $<BUILD_INTERFACE:${${PROJECT_NAME}_SOURCE_DIR}/include/dd/GateMatrixDefinitions.hpp>
    $<BUILD_INTERFACE:${${PROJECT_NAME}_SOURCE_DIR}/include/dd/Node.hpp>
    $<BUILD_INTERFACE:${${PROJECT_NAME}_SOURCE_DIR}/include/dd/Package.hpp>
    $<BUILD_INTERFACE:${${PROJECT_NAME}_SOURCE_DIR}/include/dd/ToffoliTable.hpp>
    $<BUILD_INTERFACE:${${PROJECT_NAME}_SOURCE_DIR}/include/dd/UnaryComputeTable.hpp>
    $<BUILD_INTERFACE:${${PROJECT_NAME}_SOURCE_DIR}/include/dd/PauliAlgebra.hpp>
    $<BUILD_INTERFACE:${${PROJECT_NAME}_SOURCE_DIR}/include/dd/DensityNoiseTable.hpp>
    $<BUILD_INTERFACE:${${PROJECT_NAME}_SOURCE_DIR}/include/dd/StochasticNoiseOperationTable.hpp>
    $<BUILD_INTERFACE:${${PROJECT_NAME}_SOURCE_DIR}/include/dd/UniqueTable.hpp>)

# set include directories
target_include_directories(${PROJECT_NAME}
                           INTERFACE $<BUILD_INTERFACE:${${PROJECT_NAME}_SOURCE_DIR}/include>)

# set required C++ standard and disable compiler specific extensions
target_compile_features(${PROJECT_NAME} INTERFACE cxx_std_17)

# set compiler flags depending on compiler
if(MSVC)
  target_compile_options(${PROJECT_NAME} INTERFACE /utf-8 /W4)
else()
  target_compile_options(
    ${PROJECT_NAME}
    INTERFACE -Wall -Wextra -pedantic $<$<CONFIG:DEBUG>:-O0>$<$<CONFIG:RELEASE>:-fno-math-errno
              -ffinite-math-only -fno-trapping-math>)
  if(NOT DEPLOY)
    # only include machine-specific optimizations when building for the host machine
    target_compile_options(${PROJECT_NAME} INTERFACE -mtune=native)
    include(CheckCXXCompilerFlag)
    check_cxx_compiler_flag(-march=native HAS_MARCH_NATIVE)
    if(HAS_MARCH_NATIVE)
      target_compile_options(${PROJECT_NAME} INTERFACE -march=native)
    endif()
  endif()
endif()

# add coverage compiler and linker flag to the library and all targets that link against it, if
# COVERAGE is set
if(COVERAGE)
  target_compile_options(${PROJECT_NAME} INTERFACE --coverage)
  target_link_libraries(${PROJECT_NAME} INTERFACE --coverage)
endif()

# add MQT alias
add_library(MQT::DDPackage ALIAS ${PROJECT_NAME})

# enable interprocedural optimization if it is supported (Clang's ThinLTO does not work with Ubuntu
# 20.04's default linker at the moment)
macro(enable_lto TARGET_NAME) # cmake-lint: disable=C0103
  include(CheckIPOSupported)
  check_ipo_supported(RESULT ipo_supported)
  if(ipo_supported AND NOT ((${CMAKE_SYSTEM_NAME} MATCHES "Linux") AND (${CMAKE_CXX_COMPILER_ID}
                                                                        MATCHES "Clang")))
    set_target_properties(${TARGETNAME} PROPERTIES INTERPROCEDURAL_OPTIMIZATION TRUE)
  endif()
endmacro()

# add test code
if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME OR BUILD_DD_PACKAGE_TESTS)
  if(NOT EXISTS "${PROJECT_SOURCE_DIR}/extern/googletest/CMakeLists.txt")
    message(FATAL_ERROR "GoogleTest submodule not cloned properly.
        Please run `git submodule update --init --recursive` from the main project directory")
  endif()

  enable_testing()
  include(GoogleTest)
  add_subdirectory(test)
endif()
