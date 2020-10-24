cmake_minimum_required(VERSION 3.10)

project(GameUtils
        VERSION 0.1.0.0
        DESCRIPTION "A library containing 2D game utility features"
        HOMEPAGE_URL "https://github.com/FanatikDevelopment/CXX2dGames")

message(VERBOSE "Generating build files for ${PROJECT_NAME}")

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

if(False) #GAMEUTILS_BUILD_TESTS)
    set(TEST_HEADER_FILES
        #Add your test header files here
    )

    set(TEST_SRC_FILES
        #Add your test source files here
    )

    add_executable(${PROJECT_NAME}_test TEST_HEADER_FILES TEST_SRC_FILES)

    target_include_directories(${PROJECT_NAME}_test
                        PUBLIC include
                        PUBLIC ../../thirdparty/googletest/googletest/include
                        PUBLIC ../../thirdparty/googletest/googlemock/include)
    target_link_libraries(${PROJECT_NAME}_test  PUBLIC ${PROJECT_NAME} gtest gmock)
    add_dependencies(${PROJECT_NAME}_test ${PROJECT_NAME})
endif()

