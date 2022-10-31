set(SOURCES
    CommandSequence.cpp
    SingleCommand.cpp)

source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR} FILES ${SOURCES})

foreach(example IN LISTS SOURCES)
    get_filename_component(filename ${example} NAME_WE)
    string(TOLOWER ${filename} example_target_name)
    add_executable(${example_target_name} ${example})
    target_link_libraries(${example_target_name} PRIVATE ${DNAC})
    set_target_properties(${example_target_name} PROPERTIES
                          CXX_STANDARD 11
                          CXX_STANDARD_REQUIRED NO
                          CXX_EXTENSIONS NO
                          FOLDER examples)
    list(APPEND EXAMPLE_TARGETS ${example_target_name})
endforeach()

set(DNAC_EXAMPLES ${EXAMPLE_TARGETS} PARENT_SCOPE)

if(COPY_LIB_TO_EXAMPLES)
    list(GET EXAMPLE_TARGETS 0 EXAMPLE_TARGET)
    add_custom_command(TARGET ${EXAMPLE_TARGET} POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_FILE:${DNAC}> $<TARGET_FILE_DIR:${EXAMPLE_TARGET}>)
endif()
