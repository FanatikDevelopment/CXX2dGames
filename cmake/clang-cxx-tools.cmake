find_program(CLANG_FORMAT "clang-format")
find_program(CLANG_TIDY "clang-tidy")

function(formatFiles)
    if(NOT CLANG_FORMAT)
        message(FATAL_ERROR "cannot find clang-format")
    endif()
    file(GLOB_RECURSE
     ALL_CXX_SOURCE_FILES
     *.[chi]pp *.[chi]xx *.cc *.hh *.ii *.[CHI]
     )
    add_custom_target(
        ${PROJECT_NAME}-clang-format
        COMMAND ${CLANG_FORMAT}
        -i
        -style=file
        ${ALL_CXX_SOURCE_FILES}
    )
endfunction()

function(lintFiles)
    if(NOT CLANG_FORMAT)
        message(FATAL_ERROR "cannot find clang-tidy")
    endif()
    file(GLOB_RECURSE
     ALL_CXX_SOURCE_FILES
     *.[chi]pp *.[chi]xx *.cc *.hh *.ii *.[CHI]
     )
    add_custom_target(
        ${PROJECT_NAME}-clang-tidy
        COMMAND ${CLANG_TIDY}
        -config=''
        -p='${CMAKE_BINARY_DIR}'
        ${ALL_CXX_SOURCE_FILES}
    )
endfunction()