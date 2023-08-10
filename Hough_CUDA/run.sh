# !/bin/bash

#chatgpt made this
# Define the expected top-level directory name
expected_dirname="Hough_CUDA"

# Get the name of the current top-level directory
current_dirname=$(basename $(pwd))

# Check if the current top-level directory name matches the expected name
if [ "$current_dirname" != "$expected_dirname" ]; then
    echo "Error: You are not in the expected top-level directory."
    echo "Please navigate to a directory named $expected_dirname and run the script again."
    exit 1  # Exit with an error code
fi

image_path=$1

cd build
echo ./apps/main_hough_rectangle_cuda -i "../$image_path" -o out.txt
./apps/main_hough_rectangle_cuda -i "../$image_path" -o out.txt