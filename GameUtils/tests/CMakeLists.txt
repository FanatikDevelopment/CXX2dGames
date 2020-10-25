cmake_minimum_required(VERSION 3.10)

project(GameUtils_test)

message(VERBOSE "Generating build files for ${PROJECT_NAME}")

set(TEST_HEADER_FILES
    #Add your test header files here
    unit/GameUtils_test.h
)

set(TEST_SRC_FILES
    #Add your test source files here
    main.cpp
)

add_executable(${PROJECT_NAME} ${TEST_HEADER_FILES} ${TEST_SRC_FILES})

target_include_directories(${PROJECT_NAME}
                    PUBLIC ../include
                    PUBLIC ${CMAKE_SOURCE_DIR}/thirdparty/googletest/googletest/include
                    PUBLIC ${CMAKE_SOURCE_DIR}/thirdparty/googletest/googlemock/include)
target_link_directories(${PROJECT_NAME} PUBLIC ${CMAKE_BINARY_DIR}/GameUtils)
target_link_libraries(${PROJECT_NAME} PUBLIC GameUtils gtest gmock)

add_dependencies(${PROJECT_NAME} GameUtils)

include(GoogleTest)
gtest_discover_tests(${PROJECT_NAME})
