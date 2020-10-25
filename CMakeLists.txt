cmake_minimum_required(VERSION 3.10)

project (CXX2dGames
        VERSION 0.1.0.0
        DESCRIPTION "Educative project to help people getting started with C++ and Qt"
        HOMEPAGE_URL "https://github.com/FanatikDevelopment/CXX2dGames")
message(VERBOSE "Generating build files for ${PROJECT_NAME}")

set(CMAKE_EXPORT_COMPILE_COMMANDS True)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -Wall -Wextra -Werror")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wredundant-decls -Wcast-align")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wmissing-declarations -Wmissing-include-dirs -Wswitch-enum")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wswitch-default -Winvalid-pch -Wredundant-decls")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wformat=2 -Wmissing-format-attribute -Wformat-nonliteral")

option(BUILD_TESTS "Build ${PROJECT_NAME} tests" ON)

# add your subdirectories here

add_subdirectory(GameUtils)
add_subdirectory(SpaceShooter)

if(BUILD_TESTS)
    enable_testing()
    #Suppress some warnings to build gtest
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-switch-enum -Wno-format-nonliteral")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-switch-default")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-missing-declarations")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-missing-include-dirs")
    add_subdirectory(thirdparty/googletest
                     EXCLUDE_FROM_ALL)
endif()
