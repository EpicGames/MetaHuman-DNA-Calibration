# From the list of passed in compiler flags, add only those to the target
# which are supported by the selected compiler
#
# Usage:
#   include(SupportedCompileOptions)
#   set(CXX_FLAGS -Wall -Wextra -Wpedantic -Wduplicated-branches -Wunused)
#   target_supported_compile_options(target_name PUBLIC "${CXX_FLAGS}")
#
# Module dependencies:
#   CheckCXXCompilerFlag

include(CheckCXXCompilerFlag)

function(target_add_cxx_flag_if_supported target_name visibility flag_name)
    # Check if flag was already checked whether it's supported or not
    if(${flag_name} IN_LIST SUPPORTED_FLAGS_CACHE)
        set(has_flag_${flag_name} TRUE)
    elseif(${flag_name} IN_LIST UNSUPPORTED_FLAGS_CACHE)
        set(has_flag_${flag_name} FALSE)
    endif()
    # If not found in cache, perform the check now and cache the result
    if(NOT DEFINED has_flag_${flag_name})
        check_cxx_compiler_flag("${flag_name}" has_flag_${flag_name})
        # It's safe to rely on cache variables as the only parameter that may affect the validity
        # of their content is the chosen compiler itself, and changing a compiler forces CMake to
        # automatically purge the cache anyway.
        if(has_flag_${flag_name})
            set(SUPPORTED_FLAGS_CACHE "${SUPPORTED_FLAGS_CACHE};${flag_name}" CACHE INTERNAL "")
        else()
            set(UNSUPPORTED_FLAGS_CACHE "${UNSUPPORTED_FLAGS_CACHE};${flag_name}" CACHE INTERNAL "")
        endif()
    endif()
    # Enable flag is supported
    if(has_flag_${flag_name})
        target_compile_options(${target_name} ${visibility} ${flag_name})
    endif()
endfunction()

function(target_supported_compile_options target_name visibility flags)
    foreach(flag_name IN LISTS flags)
        target_add_cxx_flag_if_supported(${target_name} ${visibility} ${flag_name})
    endforeach()
endfunction()
