#include <stdio.h>
#include "cuda.h"
#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <iostream>
#define STB_IMAGE_IMPLEMENTATION
#define STB_IMAGE_WRITE_IMPLEMENTATION
#include <Eigen/Dense>
#include <cereal/archives/binary.hpp>
#include <cereal/archives/json.hpp>
#include <cereal/cereal.hpp>
#include <fstream>
#include "config.hpp"
#include "cxxopts.hpp"
#include "eigen_utils.hpp"
#include "io.hpp"
#include "process_image.hpp"
#include "rectangle_detection.hpp"
#include "rectangle_utils.hpp"
#include "stb_image.h"
#include "stb_image_write.h"
#include "string"
#include <fstream>
#include <chrono>
#include <vector>

__global__ void hello( int* n ) {
    int i = blockIdx.x * blockDim.x + threadIdx.x ; // Which one am
    // if(n[i] <= 15) {
        printf( "Hello world from thread %d!\n", i ); // What do I
    // }
    // else {
    //     printf( "Goodbye world from thread %d!\n", i );
    // }
}

int main( void ) {
    int *ptr = new int[32];

    for(int i=0; i<32; i++) {
        ptr[i] = i;
    }
    // printf( "Running Kernel A \n" );
    // hello<<< 1,1 >>>( 1 );
    // cudaDeviceSynchronize();

    printf( "Running Kernel B \n" );
    hello<<< 1,32 >>>( ptr );
    cudaDeviceSynchronize();

    // printf( "Running Kernel C \n" );
    // hello<<< 8,32 >>>( 1 );
    // cudaDeviceSynchronize();

    return 0;
}