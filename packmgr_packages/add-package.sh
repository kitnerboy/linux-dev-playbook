#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Configuration
PACKAGE_NAME="$1"
OUTPUT_DIR="$SCRIPT_DIR"


OUTPUT_FILE="$OUTPUT_DIR/install_${PACKAGE_NAME}.yml"


# Generate the content for the individual YAML file
cat > "$OUTPUT_FILE" <<- EOL
---
- name: "Ensure package: $package is installed"
  ansible.builtin.package:
    name: "$package"
    state: present
EOL

echo "✅ Successfully generated $package_count individual task files in: $OUTPUT_DIR/"