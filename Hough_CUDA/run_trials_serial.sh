#!/bin/bash
#SBATCH --job-name=hough_cuda
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cluster=gpu
#SBATCH --gres=gpu:1
#SBATCH --partition=a100
#SBATCH --time=4:00:00
#SBATCH --output=hough_cuda_%j.txt
#SBATCH --account=ageorge

# Purge and Load Needed Modules
module purge
module load gcc/8.2.0
module load openmpi/4.0.5
module load eigen/3.4.0
module load cmake/3.13.3
module load cuda/11.6.1

# Navigate to correct directory
cd ~/Hough_CUDA
echo "SLURM_NTASKS = " $SLURM_NTASKS

# Build project
cd build
make

# ./apps/main_hough_rectangle -i edge_buildings.png -o output_img.txt
# ./apps/main_hough_rectangle -i edge_buildings.png -o output_img.txt
# ./apps/main_hough_rectangle -i edge_buildings.png -o output_img.txt
# ./apps/main_hough_rectangle -i edge_buildings.png -o output_img.txt
# ./apps/main_hough_rectangle -i edge_buildings.png -o output_img.txt
# ./apps/main_hough_rectangle -i edge_buildings.png -o output_img.txt
# ./apps/main_hough_rectangle -i edge_buildings.png -o output_img.txt
# ./apps/main_hough_rectangle -i edge_buildings.png -o output_img.txt
# ./apps/main_hough_rectangle -i edge_buildings.png -o output_img.txt
# ./apps/main_hough_rectangle -i edge_buildings.png -o output_img.txt

# ./apps/main_hough_rectangle -i rectangle2.png -o output_img.txt
# ./apps/main_hough_rectangle -i rectangle2.png -o output_img.txt
# ./apps/main_hough_rectangle -i rectangle2.png -o output_img.txt
# ./apps/main_hough_rectangle -i rectangle2.png -o output_img.txt
# ./apps/main_hough_rectangle -i rectangle2.png -o output_img.txt
# ./apps/main_hough_rectangle -i rectangle2.png -o output_img.txt
# ./apps/main_hough_rectangle -i rectangle2.png -o output_img.txt
# ./apps/main_hough_rectangle -i rectangle2.png -o output_img.txt
# ./apps/main_hough_rectangle -i rectangle2.png -o output_img.txt
# ./apps/main_hough_rectangle -i rectangle2.png -o output_img.txt

./apps/main_hough_rectangle -i rectangle7.png -o output_img.txt
./apps/main_hough_rectangle -i rectangle7.png -o output_img.txt
./apps/main_hough_rectangle -i rectangle7.png -o output_img.txt
./apps/main_hough_rectangle -i rectangle7.png -o output_img.txt
./apps/main_hough_rectangle -i rectangle7.png -o output_img.txt
./apps/main_hough_rectangle -i rectangle7.png -o output_img.txt
./apps/main_hough_rectangle -i rectangle7.png -o output_img.txt
./apps/main_hough_rectangle -i rectangle7.png -o output_img.txt
./apps/main_hough_rectangle -i rectangle7.png -o output_img.txt
./apps/main_hough_rectangle -i rectangle7.png -o output_img.txt

crc-job-stats