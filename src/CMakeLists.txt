add_library(
  ${PROJECT_NAME}
  ${PROJECT_SOURCE_DIR}/include/Simulator.hpp ${CMAKE_CURRENT_SOURCE_DIR}/Simulator.cpp
  ${PROJECT_SOURCE_DIR}/include/CircuitSimulator.hpp
  ${CMAKE_CURRENT_SOURCE_DIR}/CircuitSimulator.cpp)
target_include_directories(${PROJECT_NAME}
                           PUBLIC $<BUILD_INTERFACE:${${PROJECT_NAME}_SOURCE_DIR}/include>)
# set required C++ standard and disable compiler specific extensions
target_compile_features(${PROJECT_NAME} PUBLIC cxx_std_17)
set_target_properties(${PROJECT_NAME} PROPERTIES CMAKE_CXX_STANDARD_REQUIRED ON CXX_EXTENSIONS OFF)

# cmake-lint: disable=C0103
set(JSON_MultipleHeaders
    OFF
    CACHE INTERNAL "")
add_subdirectory("${PROJECT_SOURCE_DIR}/extern/qfr" "extern/qfr")
target_link_libraries(${PROJECT_NAME} PUBLIC MQT::qfr)

# add coverage compiler and linker flag if COVERAGE is set
if(COVERAGE)
  target_compile_options(${PROJECT_NAME} PUBLIC --coverage)
  target_link_libraries(${PROJECT_NAME} PUBLIC --coverage)
endif()

# check if interprocedural optimization is supported
include(CheckIPOSupported)
check_ipo_supported(RESULT ipo_supported)
if(ipo_supported)
  set_target_properties(${PROJECT_NAME} PROPERTIES INTERPROCEDURAL_OPTIMIZATION TRUE)
endif()
# set compiler flags depending on compiler
if(MSVC)
  target_compile_options(${PROJECT_NAME} PRIVATE "/W4" "/utf-8")
else()
  target_compile_options(${PROJECT_NAME} PRIVATE -Wall -Wextra -Wpedantic)

  if(BINDINGS)
    # adjust visibility settings for building Python bindings
    include(CheckPIESupported)
    check_pie_supported()
    set_target_properties(${PROJECT_NAME} PROPERTIES POSITION_INDEPENDENT_CODE ON)
    target_compile_options(${PROJECT_NAME} PUBLIC -fvisibility=hidden)
  endif()
  if(NOT DEPLOY)
    # only include machine-specific optimizations when building for the host machine
    target_compile_options(${PROJECT_NAME} PUBLIC -mtune=native)
    include(CheckCXXCompilerFlag)
    check_cxx_compiler_flag(-march=native HAS_MARCH_NATIVE)
    if(HAS_MARCH_NATIVE)
      target_compile_options(${PROJECT_NAME} PUBLIC -march=native)
    endif()
  endif()
endif()

add_library(MQT::${PROJECT_NAME} ALIAS ${PROJECT_NAME})
