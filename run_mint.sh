#!/bin/bash

# Set initial value for item
item=

# Set initial value for satsbyte
satsbyte=

while true; do
  # Set path to JSON file
  json_file="C:\\code\\项目代码\\atomicals-js\\fishfaceman\\item-${item}.json"
  
  # Run the yarn command with the current item and json_file values
  output=$(yarn cli mint-item fishfaceman "${item}" "${json_file}" --satsbyte "${satsbyte}" 2>&1)

  # Check if the output contains the specific error message
  if echo "$output" | grep -q "Error: Container item is already claimed. Choose another item"; then
    echo "Encountered the error message. Continuing with the next iteration."
  else
    # If the error message is not present, exit the script
    echo "Error message not found. Exiting script."
    exit 1
  fi

  ((item++))


done