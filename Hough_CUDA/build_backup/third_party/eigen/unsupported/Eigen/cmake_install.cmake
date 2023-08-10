# Install script for directory: /ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/unsupported/Eigen

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "0")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/eigen3/unsupported/Eigen/AdolcForward;/eigen3/unsupported/Eigen/AlignedVector3;/eigen3/unsupported/Eigen/ArpackSupport;/eigen3/unsupported/Eigen/AutoDiff;/eigen3/unsupported/Eigen/BVH;/eigen3/unsupported/Eigen/EulerAngles;/eigen3/unsupported/Eigen/FFT;/eigen3/unsupported/Eigen/IterativeSolvers;/eigen3/unsupported/Eigen/KroneckerProduct;/eigen3/unsupported/Eigen/LevenbergMarquardt;/eigen3/unsupported/Eigen/MatrixFunctions;/eigen3/unsupported/Eigen/MoreVectorization;/eigen3/unsupported/Eigen/MPRealSupport;/eigen3/unsupported/Eigen/NonLinearOptimization;/eigen3/unsupported/Eigen/NumericalDiff;/eigen3/unsupported/Eigen/OpenGLSupport;/eigen3/unsupported/Eigen/Polynomials;/eigen3/unsupported/Eigen/Skyline;/eigen3/unsupported/Eigen/SparseExtra;/eigen3/unsupported/Eigen/SpecialFunctions;/eigen3/unsupported/Eigen/Splines")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/eigen3/unsupported/Eigen" TYPE FILE FILES
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/unsupported/Eigen/AdolcForward"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/unsupported/Eigen/AlignedVector3"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/unsupported/Eigen/ArpackSupport"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/unsupported/Eigen/AutoDiff"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/unsupported/Eigen/BVH"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/unsupported/Eigen/EulerAngles"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/unsupported/Eigen/FFT"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/unsupported/Eigen/IterativeSolvers"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/unsupported/Eigen/KroneckerProduct"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/unsupported/Eigen/LevenbergMarquardt"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/unsupported/Eigen/MatrixFunctions"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/unsupported/Eigen/MoreVectorization"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/unsupported/Eigen/MPRealSupport"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/unsupported/Eigen/NonLinearOptimization"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/unsupported/Eigen/NumericalDiff"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/unsupported/Eigen/OpenGLSupport"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/unsupported/Eigen/Polynomials"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/unsupported/Eigen/Skyline"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/unsupported/Eigen/SparseExtra"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/unsupported/Eigen/SpecialFunctions"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/unsupported/Eigen/Splines"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/eigen3/unsupported/Eigen/src")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/eigen3/unsupported/Eigen" TYPE DIRECTORY FILES "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/unsupported/Eigen/src" FILES_MATCHING REGEX "/[^/]*\\.h$")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/ihome/ageorge/elw96/Hough_CUDA/build/third_party/eigen/unsupported/Eigen/CXX11/cmake_install.cmake")

endif()

