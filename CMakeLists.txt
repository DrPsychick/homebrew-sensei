cmake_minimum_required(VERSION 3.10)

# set the project name
project(sensei VERSION 0.1)

find_library(FOUNDATION Foundation)
if (NOT FOUNDATION)
    message(FATAL_ERROR "Foundation not found")
endif()
find_library(IOKIT IOKit)
if (NOT IOKIT)
    message(FATAL_ERROR "IOKit not found")
endif()

# add the executable
add_executable(sensei sensei.m)

# add libraries
target_link_libraries(sensei ${FOUNDATION})
target_link_libraries(sensei ${IOKIT})

install(TARGETS sensei RUNTIME DESTINATION bin)
