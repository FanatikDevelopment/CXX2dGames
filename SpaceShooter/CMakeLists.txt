cmake_minimum_required(VERSION 3.10)

project(SpaceShooter
        VERSION 0.1.0.0
        DESCRIPTION "a shoot 'em up game based on GameUtils library"
        HOMEPAGE_URL "https://github.com/FanatikDevelopment/CXX2dGames")

message(VERBOSE "Generating build files for ${PROJECT_NAME}")

if(NOT DEFINED BUILD_TESTS OR BUILD_TESTS)
    option(SPACESHOOTER_BUILD_TESTS "Build ${PROJECT_NAME} tests" ON)
endif()


set(HEADER_FILES
    #Add your header files here
)

set(SRC_FILES
    #Add your source files here

    src/SpaceShooter/main.cpp
)

add_executable(${PROJECT_NAME} ${HEADER_FILES} ${SRC_FILES})

target_include_directories(${PROJECT_NAME}
                           PUBLIC include
                           PUBLIC ../GameUtils/include)

target_link_directories(${PROJECT_NAME} PUBLIC
                        ${CMAKE_BINARY_DIR}/GameUtils)
target_link_libraries(${PROJECT_NAME} PUBLIC -lGameUtils)
add_dependencies(${PROJECT_NAME} GameUtils)

if(False)#SPACESHOOTER_BUILD_TESTS)
    set(TEST_HEADER_FILES
        #Add your test header files here
    )

    set(TEST_SRC_FILES
        #Add your test source files here
    )

    add_executable(${PROJECT_NAME}_test ${TEST_HEADER_FILES} ${TEST_SRC_FILES})

    target_include_directories(${PROJECT_NAME}_test
                        PUBLIC include
                        PUBLIC ../../thirdparty/googletest/googletest/include
                        PUBLIC ../../thirdparty/googletest/googlemock/include)
    target_link_libraries(${PROJECT_NAME}_test  PUBLIC gtest gmock)
    add_dependencies(${PROJECT_NAME}_test ${PROJECT_NAME})
endif()

