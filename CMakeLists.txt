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

option(BUILD_TESTS "Build ${PROJECT_NAME} tests" ON)

# add your subdirectories here

add_subdirectory(GameUtils)
add_subdirectory(SpaceShooter)

if(BUILD_TESTS)
    enable_testing()
    #Suppress some warnings to build gtest
    add_subdirectory(thirdparty/googletest
                     EXCLUDE_FROM_ALL)
endif()
