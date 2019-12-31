cmake_minimum_required(VERSION 3.5)
project(EX01_HelloWorld C)

set(CMAKE_C_STANDARD 11)
set(CMAKE_BUILD_TYPE Debug-Docker Arm Host)

add_executable(EX01_HelloWorld src/main.c)