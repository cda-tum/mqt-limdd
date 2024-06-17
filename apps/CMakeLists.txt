add_subdirectory("${PROJECT_SOURCE_DIR}/extern/cxxopts" "extern/cxxopts")

# add executables linked with this project and optionally additional libraries
macro(add_sim_executable APPNAME) # cmake-lint: disable=C0103
  add_executable(${PROJECT_NAME}_${APPNAME} ${CMAKE_CURRENT_SOURCE_DIR}/${APPNAME}.cpp)
  target_link_libraries(${PROJECT_NAME}_${APPNAME} PUBLIC ${PROJECT_NAME} ${ARGN})
  add_custom_command(
    TARGET ${PROJECT_NAME}_${APPNAME}
    POST_BUILD
    COMMAND
      ${CMAKE_COMMAND} -E create_symlink
      $<TARGET_FILE_DIR:${PROJECT_NAME}_${APPNAME}>/${PROJECT_NAME}_${APPNAME}
      ${CMAKE_BINARY_DIR}/${PROJECT_NAME}_${APPNAME}
    COMMENT "Creating symlink for ${PROJECT_NAME}_${APPNAME}"
    VERBATIM)
  # cmake-lint: disable=C0307
  set_target_properties(
    ${PROJECT_NAME}_${APPNAME} PROPERTIES EXPORT_NAME # cmake-lint: disable=C0307
                                          ${PROJECT_NAME}_${APPNAME}) # cmake-lint: disable=C0307

endmacro()

add_sim_executable(simple cxxopts::cxxopts)
