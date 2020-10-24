cmake_minimum_required(VERSION 3.10)

project (CXX2dGames
        VERSION 0.1.0.0
        DESCRIPTION Educative project to help people getting started with C++ and Qt
        HOMEPAGE_URL "https://github.com/FanatikDevelopment/CXX2dGames")
message(VERBOSE "Generating build files for ${PROJECT_NAME}")

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g
    -Wall
    -Wextra
    -Werror
    -Wredundant-decls
    -Wcast-align
    -Wmissing-declarations
    -Wmissing-include-dirs
    -Wswitch-enum
    -Wswitch-default
    -Winvalid-pch
    -Wredundant-decls
    -Wmissing-prototypes
    -Wformat=2
    -Wmissing-format-attribute
    -Wformat-nonliteral")

option(BUILD_TESTS "Build ${PROJECT_NAME} tests" ON)

# add your subdirectories here

if(BUILD_TESTS)
    add_subdirectory(thirdparty/googletest
                     EXCLUDE_FROM_ALL)
endif()
