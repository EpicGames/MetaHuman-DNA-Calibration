set(CMakeModulesExtra_DIRS "${CMAKE_CURRENT_LIST_DIR}/install"
                           "${CMAKE_CURRENT_LIST_DIR}/symbols"
                           "${CMAKE_CURRENT_LIST_DIR}/utilities"
                           "${CMAKE_CURRENT_LIST_DIR}/version")
list(APPEND CMAKE_MODULE_PATH ${CMakeModulesExtra_DIRS})