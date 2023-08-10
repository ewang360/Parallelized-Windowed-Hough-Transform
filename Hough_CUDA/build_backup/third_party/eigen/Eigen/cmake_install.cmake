# Install script for directory: /ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/Eigen

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
   "/eigen3/Eigen/Cholesky;/eigen3/Eigen/CholmodSupport;/eigen3/Eigen/Core;/eigen3/Eigen/Dense;/eigen3/Eigen/Eigen;/eigen3/Eigen/Eigenvalues;/eigen3/Eigen/Geometry;/eigen3/Eigen/Householder;/eigen3/Eigen/IterativeLinearSolvers;/eigen3/Eigen/Jacobi;/eigen3/Eigen/LU;/eigen3/Eigen/MetisSupport;/eigen3/Eigen/OrderingMethods;/eigen3/Eigen/PaStiXSupport;/eigen3/Eigen/PardisoSupport;/eigen3/Eigen/QR;/eigen3/Eigen/QtAlignedMalloc;/eigen3/Eigen/SPQRSupport;/eigen3/Eigen/SVD;/eigen3/Eigen/Sparse;/eigen3/Eigen/SparseCholesky;/eigen3/Eigen/SparseCore;/eigen3/Eigen/SparseLU;/eigen3/Eigen/SparseQR;/eigen3/Eigen/StdDeque;/eigen3/Eigen/StdList;/eigen3/Eigen/StdVector;/eigen3/Eigen/SuperLUSupport;/eigen3/Eigen/UmfPackSupport")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/eigen3/Eigen" TYPE FILE FILES
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/Eigen/Cholesky"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/Eigen/CholmodSupport"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/Eigen/Core"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/Eigen/Dense"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/Eigen/Eigen"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/Eigen/Eigenvalues"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/Eigen/Geometry"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/Eigen/Householder"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/Eigen/IterativeLinearSolvers"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/Eigen/Jacobi"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/Eigen/LU"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/Eigen/MetisSupport"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/Eigen/OrderingMethods"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/Eigen/PaStiXSupport"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/Eigen/PardisoSupport"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/Eigen/QR"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/Eigen/QtAlignedMalloc"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/Eigen/SPQRSupport"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/Eigen/SVD"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/Eigen/Sparse"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/Eigen/SparseCholesky"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/Eigen/SparseCore"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/Eigen/SparseLU"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/Eigen/SparseQR"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/Eigen/StdDeque"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/Eigen/StdList"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/Eigen/StdVector"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/Eigen/SuperLUSupport"
    "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/Eigen/UmfPackSupport"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/eigen3/Eigen/src")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/eigen3/Eigen" TYPE DIRECTORY FILES "/ihome/ageorge/elw96/Hough_CUDA/third_party/eigen/Eigen/src" FILES_MATCHING REGEX "/[^/]*\\.h$")
endif()

