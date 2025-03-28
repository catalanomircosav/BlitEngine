cmake_minimum_required(VERSION 3.17)
project(Game)

file(GLOB_RECURSE GAME_SOURCES
    "Src/*.cpp"
)

file(GLOB_RECURSE GAME_HEADERS
    "Include/*.h"
)

add_executable(${PROJECT_NAME} ${GAME_SOURCES} ${GAME_HEADERS})

target_link_libraries(${PROJECT_NAME}
    Engine
)

target_include_directories(${PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/../Engine/Include
)

# Configurazione output directory
set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR}/bin/${CMAKE_BUILD_TYPE})

# Su Windows, gestione della copia
if(WIN32)
    # Crea la directory di output se non esiste
    add_custom_command(TARGET ${PROJECT_NAME} PRE_BUILD
        COMMAND ${CMAKE_COMMAND} -E make_directory ${EXECUTABLE_OUTPUT_PATH}
        COMMENT "Creating output directory"
    )
    
    # Copia gli asset (se presenti)
    if(EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/Assets)
        add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E copy_directory
                ${CMAKE_CURRENT_SOURCE_DIR}/Assets
                ${EXECUTABLE_OUTPUT_PATH}/Assets
            COMMENT "Copying assets to output directory"
        )
    endif()
endif()