# main project library
add_library(
  ${PROJECT_NAME}
  ${${PROJECT_NAME}_SOURCE_DIR}/include/algorithms/BernsteinVazirani.hpp
  ${${PROJECT_NAME}_SOURCE_DIR}/include/algorithms/Entanglement.hpp
  ${${PROJECT_NAME}_SOURCE_DIR}/include/algorithms/GoogleRandomCircuitSampling.hpp
  ${${PROJECT_NAME}_SOURCE_DIR}/include/algorithms/Grover.hpp
  ${${PROJECT_NAME}_SOURCE_DIR}/include/algorithms/QFT.hpp
  ${${PROJECT_NAME}_SOURCE_DIR}/include/algorithms/QPE.hpp
  ${${PROJECT_NAME}_SOURCE_DIR}/include/algorithms/RandomCliffordCircuit.hpp
  ${${PROJECT_NAME}_SOURCE_DIR}/include/CircuitOptimizer.hpp
  ${${PROJECT_NAME}_SOURCE_DIR}/include/dd/FunctionalityConstruction.hpp
  ${${PROJECT_NAME}_SOURCE_DIR}/include/dd/NoiseFunctionality.hpp
  ${${PROJECT_NAME}_SOURCE_DIR}/include/dd/Operations.hpp
  ${${PROJECT_NAME}_SOURCE_DIR}/include/dd/Simulation.hpp
  ${${PROJECT_NAME}_SOURCE_DIR}/include/Definitions.hpp
  ${${PROJECT_NAME}_SOURCE_DIR}/include/operations/ClassicControlledOperation.hpp
  ${${PROJECT_NAME}_SOURCE_DIR}/include/operations/CompoundOperation.hpp
  ${${PROJECT_NAME}_SOURCE_DIR}/include/operations/NonUnitaryOperation.hpp
  ${${PROJECT_NAME}_SOURCE_DIR}/include/operations/Operation.hpp
  ${${PROJECT_NAME}_SOURCE_DIR}/include/operations/StandardOperation.hpp
  ${${PROJECT_NAME}_SOURCE_DIR}/include/parsers/qasm_parser/Parser.hpp
  ${${PROJECT_NAME}_SOURCE_DIR}/include/parsers/qasm_parser/Scanner.hpp
  ${${PROJECT_NAME}_SOURCE_DIR}/include/parsers/qasm_parser/Token.hpp
  ${${PROJECT_NAME}_SOURCE_DIR}/include/QuantumComputation.hpp
  ${${PROJECT_NAME}_SOURCE_DIR}/include/zx/FunctionalityConstruction.hpp
  ${CMAKE_CURRENT_SOURCE_DIR}/algorithms/BernsteinVazirani.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/algorithms/Entanglement.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/algorithms/GoogleRandomCircuitSampling.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/algorithms/Grover.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/algorithms/QFT.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/algorithms/QPE.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/algorithms/RandomCliffordCircuit.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/CircuitOptimizer.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/operations/NonUnitaryOperation.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/operations/Operation.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/operations/StandardOperation.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/parsers/GRCSParser.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/parsers/QASMParser.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/parsers/QCParser.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/parsers/RealParser.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/parsers/TFCParser.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/QuantumComputation.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/zx/FunctionalityConstruction.cpp
  parsers/qasm_parser/Parser.cpp
  parsers/qasm_parser/Scanner.cpp)

# set include directories
target_include_directories(${PROJECT_NAME}
                           PUBLIC $<BUILD_INTERFACE:${${PROJECT_NAME}_SOURCE_DIR}/include>)

# set required C++ standard and disable compiler specific extensions
target_compile_features(${PROJECT_NAME} PUBLIC cxx_std_17)
set_target_properties(${PROJECT_NAME} PROPERTIES CMAKE_CXX_STANDARD_REQUIRED ON CXX_EXTENSIONS OFF)

# add MQT::DDpackage library
add_subdirectory("${PROJECT_SOURCE_DIR}/extern/dd_package" "extern/dd_package")
target_link_libraries(${PROJECT_NAME} PUBLIC MQT::DDPackage)

add_subdirectory("${PROJECT_SOURCE_DIR}/extern/zx" "extern/zx")
target_link_libraries(${PROJECT_NAME} PUBLIC MQT::zx)

# add nlohmann::json library
set(JSON_BuildTests # cmake-lint: disable=C0103
    OFF
    CACHE INTERNAL "")
set(JSON_MultipleHeaders # cmake-lint: disable=C0103
    OFF
    CACHE INTERNAL "")
add_subdirectory("${PROJECT_SOURCE_DIR}/extern/json" "extern/json" EXCLUDE_FROM_ALL)
target_link_libraries(${PROJECT_NAME} PUBLIC nlohmann_json)

# enable interprocedural optimization if it is supported
enable_lto(${PROJECT_NAME})

# set compiler flags depending on compiler
if(MSVC)
  target_compile_options(${PROJECT_NAME} PUBLIC /utf-8)
else()
  target_compile_options(${PROJECT_NAME} PUBLIC -Wall -Wextra $<$<CONFIG:DEBUG>:-Og>)
  if(BINDINGS AND NOT WIN32)
    # adjust visibility settings for building Python bindings
    target_compile_options(${PROJECT_NAME} PUBLIC -fvisibility=hidden)
    target_compile_options(nlohmann_json INTERFACE -fvisibility=hidden)
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

if(GENERATE_POSITION_INDEPENDENT_CODE OR BINDINGS)
  include(CheckPIESupported)
  check_pie_supported()
  set_target_properties(${PROJECT_NAME} PROPERTIES POSITION_INDEPENDENT_CODE TRUE)
endif()

# add coverage compiler and linker flag to the library and all targets that link against it, if
# COVERAGE is set
if(COVERAGE)
  target_compile_options(${PROJECT_NAME} PUBLIC --coverage)
  target_link_libraries(${PROJECT_NAME} PUBLIC --coverage)
endif()

# add MQT alias
add_library(MQT::${PROJECT_NAME} ALIAS ${PROJECT_NAME})
