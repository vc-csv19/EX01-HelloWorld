cmake_minimum_required(VERSION 3.5)
project(EX01-HelloWorld C ASM)

set(CMAKE_C_STANDARD 11)

add_custom_target(Generate-Assembly ALL BYPRODUCTS main.s COMMAND gcc -S ${CMAKE_HOME_DIRECTORY}/src/main.c -o ${CMAKE_HOME_DIRECTORY}/src/main.s)
add_executable(HelloWorld src/main.c)
add_executable(HelloWorld-From-Assembly src/main.s)
