#!/usr/bin/env fish

# Function that returns a list of all .rs files in the current directory
function get_rust_files
    find . -name "*.rs"
end

# Function that calls get_rust_files and prints the names of each returned file
function print_rust_files
    for file in (get_rust_files)
        echo $file
    end
end

# Call print_rust_files
print_rust_files
