# engine
cmake_minimum_required(VERSION 3.17)
project(Engine)

find_package(OpenGL REQUIRED)

file(GLOB_RECURSE ENGINE_SOURCES
    "Src/*.cpp"
)

file(GLOB_RECURSE ENGINE_HEADERS
    "Include/*.h"
)

# engine library
add_library(${PROJECT_NAME} STATIC ${ENGINE_SOURCES} ${ENGINE_HEADERS})

# thirdparty include directories
target_include_directories(${PROJECT_NAME} PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/Include
    ${CMAKE_CURRENT_SOURCE_DIR}/Thirdparty/Include
)

# link all the libraries
target_link_libraries(${PROJECT_NAME}
    OpenGL::GL
)

if(WIN32)
    target_link_libraries(${PROJECT_NAME} gdi32)
endif()