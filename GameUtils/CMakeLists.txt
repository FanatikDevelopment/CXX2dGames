cmake_minimum_required(VERSION 3.10)

project(GameUtils
        VERSION 0.1.0.0
        DESCRIPTION "A library containing 2D game utility features"
        HOMEPAGE_URL "https://github.com/FanatikDevelopment/CXX2dGames")

message(VERBOSE "Generating build files for ${PROJECT_NAME}")

include("${CMAKE_SOURCE_DIR}/cmake/clang-cxx-tools.cmake")
formatFiles()
lintFiles()

if(NOT DEFINED BUILD_TESTS OR BUILD_TESTS)
    option(GAMEUTILS_BUILD_TESTS "Build ${PROJECT_NAME} tests" ON)
endif()


set(HEADER_FILES
    #Add your header files here
    include/GameUtils/GameUtils.h
)

set(SRC_FILES
    #Add your source files here
    src/GameUtils/GameUtils.cpp
)

add_library(${PROJECT_NAME} SHARED ${HEADER_FILES} ${SRC_FILES})

target_include_directories(${PROJECT_NAME}
                           PUBLIC include)

if(GAMEUTILS_BUILD_TESTS)
    enable_testing()
    include(GoogleTest)
    add_subdirectory(tests)
endif()

