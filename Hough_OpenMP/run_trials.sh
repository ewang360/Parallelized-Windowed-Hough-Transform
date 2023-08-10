#!/bin/bash
#SBATCH --job-name=hough_openmp
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=32
#SBATCH --cluster=smp
#SBATCH --partition=smp
#SBATCH --time=10:00:00
#SBATCH --qos=long
#SBATCH --output=hough_openmp_%j.txt
#SBATCH --account=ageorge

# Purge and Load Needed Modules
module purge
module load gcc/8.2.0
module load openmpi/4.0.5
module load eigen

# Navigate to correct directory
cd ~/Parallelized_Hough_Rectangle
echo "SLURM_NTASKS = " $SLURM_NTASKS

# Build project
cd build
make

# Execute application
./apps/main_hough_rectangle -i rectangle7.png -o output_img.txt
crc-job-stats