cmake_minimum_required(VERSION 3.9)
project(hough_rectangle LANGUAGES CXX CUDA)

#set(CMAKE_CXX_STANDARD 17)  # works with 17, but not 20
#set(CMAKE_CUDA_STANDARD 14)
#set(CMAKE_CUDA_STANDARD_REQUIRED TRUE)
#set(CMAKE_CXX_STANDARD_REQUIRED TRUE)

# Require C++14, and disable compiler-specific extensions (if possible).
foreach(lang CXX CUDA)
    set(CMAKE_${lang}_STANDARD          14)
    set(CMAKE_${lang}_STANDARD_REQUIRED ON)
    set(CMAKE_${lang}_EXTENSIONS        OFF)
endforeach()

#----------------------------------------------------------------------------------------------------#
#External libraries
#----------------------------------------------------------------------------------------------------#
set(STB_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/third_party/stb)
set(CXXOPTS_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/third_party/cxxopts/include)
set(CEREAL_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/third_party/cereal-master/include)
set(CATCH2_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/third_party/catch2)

#OpenMP
find_package(OpenMP)

#Eigen
find_package (Eigen3 REQUIRED NO_MODULE)
add_subdirectory(third_party/eigen)

#Stb
add_library(stb INTERFACE)
target_include_directories(stb INTERFACE ${STB_INCLUDE_DIR})

#Cxxopts
add_library(cxxopts INTERFACE)
target_include_directories(cxxopts INTERFACE ${CXXOPTS_INCLUDE_DIR})

#Config4cpp
add_library(config4cpp INTERFACE)
target_include_directories(config4cpp INTERFACE ${CONFIG4CPP_INCLUDE_DIR})

#Cereal
add_library(cereal INTERFACE)
target_include_directories(cereal INTERFACE ${CEREAL_INCLUDE_DIR})

#Catch2
add_subdirectory(third_party/Catch2)


#----------------------------------------------------------------------------------------------------#
# Main library
#----------------------------------------------------------------------------------------------------#

add_library(hough_lib STATIC src/recursive_hough_transform.cpp src/eigen_utils.cpp src/rectangle_detection.cpp src/io.cpp
    src/process_image.cu src/rectangle_utils.cpp src/rectangle_detection.cpp include/eigen_utils.hpp include/rectangle_detection.hpp include/io.hpp include/config.hpp include/process_image.hpp
    include/recursive_hough_transform.hpp)
target_compile_features(hough_lib PUBLIC cxx_std_11)
target_include_directories(hough_lib PUBLIC include)
target_link_libraries(hough_lib  PUBLIC Eigen3::Eigen PUBLIC cereal PRIVATE stb)
set_target_properties(hough_lib PROPERTIES CUDA_SEPARABLE_COMPILATION ON POSITION_INDEPENDENT_CODE ON)

if(OpenMP_CXX_FOUND)
    target_link_libraries(hough_lib PUBLIC OpenMP::OpenMP_CXX)
endif()

find_package(CUDA QUIET)
if(CUDA_FOUND)
    include_directories(${CUDA_INCLUDE_DIRS})
    SET(ALL_CUDA_LIBS ${CUDA_LIBRARIES} ${CUDA_cusparse_LIBRARY} ${CUDA_cublas_LIBRARY})
    SET(LIBS ${LIBS} ${ALL_CUDA_LIBS})
    message(STATUS "CUDA_LIBRARIES: ${CUDA_INCLUDE_DIRS} ${ALL_CUDA_LIBS}")
    set(CUDA_PROPAGATE_HOST_FLAGS ON)
    set(CUDA_SEPARABLE_COMPILATION OFF)
endif()

#----------------------------------------------------------------------------------------------------#
# Source code
#----------------------------------------------------------------------------------------------------#
add_subdirectory(apps)

#----------------------------------------------------------------------------------------------------#
# Tests
#----------------------------------------------------------------------------------------------------#
enable_testing()
add_subdirectory(tests)
