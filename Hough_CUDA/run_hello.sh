#!/bin/bash
#SBATCH --job-name=hello_world
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cluster=gpu
#SBATCH --gres=gpu:1
#SBATCH --partition=a100
#SBATCH --time=00:10:00
#SBATCH --output=hello_%j.txt
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

# Execute application
./hello_world
crc-job-stats