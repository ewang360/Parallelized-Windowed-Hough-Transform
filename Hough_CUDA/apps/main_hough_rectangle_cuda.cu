#include "cuda.h"
#include <cublas_v2.h>
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

// using Eigen::Dynamic;
// using Eigen::Matrix;
// using Eigen::RowMajor;
using namespace Eigen;
#define PI 3.14159265

std::chrono::high_resolution_clock::time_point startTime, endTime;

int main(int argc, char* argv[]) {

    // Nota bene: casting big images to unsigned char in Eigen result in a
    // segmentation fault on my machine for some unknown reasons. Compiler
    // complains that the array is too big. We have therefore chosen the
    // following way to convert Eigen matrix to unsigned char *

    int id = cudaGetDevice(&id);
    std::cout << "cuda device id: " << id << std::endl;

    cublasHandle_t handle;
    cublasCreate_v2(&handle);

    // Parse arguments
    cxxopts::Options options("Runs Hough rectangle detection algorithm");
    options.add_options()("i,image_path", "Path to binary (0-255) input image", cxxopts::value<std::string>())(
        "o,output_path", "Path to .txt file where detected rectangles will be saved", cxxopts::value<std::string>());
    auto result = options.parse(argc, argv);

    std::string filename = result["image_path"].as<std::string>();
    std::string output_filename = result["output_path"].as<std::string>();

    // Parse config file
    Config config;
    std::ifstream is("../src/configs.json");
    cereal::JSONInputArchive archive(is);
    archive(config);

    // Load image and prepare matrix
    Matrix<float, Dynamic, Dynamic, RowMajor> gray = eigen_io::read_image(filename.c_str());
    std::cout << "cuda version" << std::endl;

    std::vector<double> times;
    double avg_time = 0;

    //for (int t=0; t<10; t++) {    
    // get start time
    startTime = std::chrono::high_resolution_clock::now();

    // Perform Hough transform
    HoughRectangle ht(config.L_window, config.thetaBins, config.rhoBins, config.thetaMin, config.thetaMax);

    // Loop over each pixel to find rectangle
    rectangles_T<int> rectangles;
    HoughRectangle::fMat hough_img(config.rhoBins, config.thetaBins);

    double rho_min = -sqrt(pow(config.L_window / 2.0, 2) + pow(config.L_window / 2.0, 2));
    double rho_step = -rho_min*2/config.rhoBins;

    int found = 0;

    VectorXi vecX = VectorXi::LinSpaced(Sequential, config.L_window, 0, config.L_window - 1);
    VectorXi vecY = VectorXi::LinSpaced(Sequential, config.L_window, 0, config.L_window - 1);

    // Cartesian coordinate vectors
    int mid_X = round(config.L_window / 2);
    int mid_Y = round(config.L_window / 2);
    vecX = vecX.array() - mid_X;
    vecY = vecY.array() - mid_Y;

    int* d_vecX;
    float* d_cosT;
    int* d_vecY;
    float* d_sinT;
    float* d_img;
    float* d_acc;

    int m_theta_vec_size = config.thetaBins;
    int m_rho_vec_size = config.rhoBins;
    int size = config.L_window;
    size_t vec_X_size = sizeof(int) * size;
    size_t vec_Y_size = sizeof(int) * size;
    size_t img_size = sizeof(float) * size * size;
    size_t acc_size = sizeof(float) * m_theta_vec_size * m_rho_vec_size;
    size_t cosT_size = sizeof(float) * m_theta_vec_size;
    size_t sinT_size = sizeof(float) * m_theta_vec_size;

    cudaMalloc((void **)&d_vecX, vec_X_size);
    cudaMalloc((void **)&d_vecY, vec_Y_size);
    cudaMalloc((void **)&d_cosT, cosT_size);
    cudaMalloc((void **)&d_sinT, sinT_size);
    cudaMalloc((void **)&d_img, img_size);
    cudaMalloc((void **)&d_acc, acc_size);

    cudaMemcpy(d_vecX, vecX.data(), vec_X_size, cudaMemcpyHostToDevice);
    cudaMemcpy(d_vecY, vecY.data(), vec_Y_size, cudaMemcpyHostToDevice);

    for (int i = 0; i < gray.rows() - size; ++i) {
    // for (int i = 0; i < 1; ++i) {
        //std::cout << "Row " << i << "/" << gray.rows() << std::endl;
        for (int j = 0; j < gray.cols() - size; ++j) {
        // for (int j = 3; j < 4; ++j) {
            // if(j==0) {
            //     std::cout << "Row " << i << "/" << gray.rows() << std::endl;
            // }

            // Eigen::Vector3f *host_vectors = new Eigen::Vector3f[N];
            // Eigen::Vector3f *dev_vectors;

            hough_img.setZero();     
            cudaMemset(d_acc, 0, acc_size);   
            ht.hough_transform(gray.block(i, j, config.L_window, config.L_window), hough_img, rho_min, rho_step, d_vecX, d_vecY, d_cosT, d_sinT, d_img, d_acc);
            // ht.hough_transform(gray.block(i, j, config.L_window, config.L_window), hough_img);

            // Detect peaks
            std::vector<std::array<int, 2>> indexes = find_local_maximum(hough_img, config.min_side_length);
            std::vector<float> rho_maxs, theta_maxs;
            std::tie(rho_maxs, theta_maxs) = ht.index_rho_theta(indexes);

            // Find pairs
            std::vector<std::array<float, 4>> pairs =
                rectangle_detect::find_pairs(rho_maxs, theta_maxs, config.T_rho, config.T_theta, config.T_l);
            if (pairs.size() == 0) {
                continue;
            }  // no pairs detected

            // Find rectangle
            rectangles_T<float> rectangles_tmp = rectangle_detect::match_pairs_into_rectangle(pairs, config.T_alpha);
            if (rectangles_tmp.size() == 0) {
                continue;
            }  // if no rectangle detected
            // else {
            //     found = 1;
            //     // std::cout << "Rectangle detected"
            //     //         << " " << i << " " << j << std::endl;
            // }
            std::array<float, 8> detected_rectangle = rectangle_detect::remove_duplicates(rectangles_tmp, 1, 4);
            auto rectangles_corners =
                convert_all_rects_2_corner_format(detected_rectangle, config.L_window, config.L_window);
            correct_offset_rectangle(rectangles_corners, j, i);

            // Concatenate
            rectangles.push_back(rectangles_corners);
        }
    }
    
    // Free the allocated memory on the GPU
    cudaFree(d_vecX);
    cudaFree(d_cosT);
    cudaFree(d_vecY);
    cudaFree(d_sinT);
    cudaFree(d_img);
    cudaFree(d_acc);

    endTime = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> elapsed = endTime - startTime;
    double elapsedTimeInSeconds = elapsed.count();

    times.push_back(elapsedTimeInSeconds);
    avg_time += elapsedTimeInSeconds;
    //}

    for (int i=0; i<1; i++) {
        std::cout << "Time elapsed: " << times[i] << " sec" << std::endl;
    }

    // std::cout << "Average time elapsed: " << avg_time/10 << std::endl;

    // if (found == 0) {
    //     std::cout << "Did not detect any rectangle" << std::endl;
    //     exit(0);
    // }

    // Clean up and save
    eigen_io::save_rectangle(output_filename.c_str(), rectangles);

    return 0;
}
