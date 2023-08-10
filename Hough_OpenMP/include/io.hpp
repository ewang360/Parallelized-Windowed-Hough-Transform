#ifndef IO_HPP
#define IO_HPP
#include <Eigen/Dense>
#include <array>
#include <string>
#include <vector>
#include <memory>

namespace eigen_io {
// Image io
/**
 * Converts raw buffer to Eigen float matrix
 *
 * \param data unsigned char raw buffer to be converted
 * \param x image dimension in x direction
 * \param y image dimension in y direction
 *
 *  \return gray eigen float matrix
 */
void convert_RawBuff2Mat(const std::unique_ptr<unsigned char[]> &data, Eigen::MatrixXf &gray, const int &x,
                         const int &y);

/**
 * Converts Eigen matrix to raw buffer
 *
 * \param gray input float eigen matrix in RowMajor order
 * \param size integer total size of the raw buffer (x*y)
 *
 *  \return gray_UC unique_ptr to uc raw buffer output
 */
void convert_Mat2RawBuff(const Eigen::Matrix<float, Eigen::Dynamic, Eigen::Dynamic, Eigen::RowMajor> &gray,
                         std::unique_ptr<unsigned char[]> &gray_UC, const int &size);

/**
 * Saves Eigen matrix to png
 *
 * \param img input float eigen matrix in RowMajor order
 * \param filename output file path ending in .png
 * \param x int, x dimension
 * \param y int, y dimension
 *
 */
int save_image(Eigen::Matrix<float, Eigen::Dynamic, Eigen::Dynamic, Eigen::RowMajor> &img, const std::string &filename,
               const int &size, const int &x, const int &y);
/**
 * Loads png image to Eigen matrix
 *
 * \param img input float eigen matrix in RowMajor order
 * \param filename output file path ending in .png
 *
 */
Eigen::MatrixXf read_image(const std::string &filename);

// Result io
/*
 * Saves maximums detected position in text file
 *
 */
void save_maximum(const std::string &filename, const std::vector<std::array<int, 2>> &maximums);
/*
 * Saves detected pairs in text file
 */
void save_pairs(const std::string &filename, const std::vector<std::array<float, 4>> &pairs);

/*
 * Saves detected rectangles in text file
 */
void save_rectangle(const std::string &filename, const std::vector<std::array<int, 8>> &indexes);

/*
 * Saves detected rectangle in text file
 */
void save_rectangle(const std::string &filename, const std::array<int, 8> &rectangles);

}  // namespace eigen_io
#endif
