#!/bin/bash

# Set log file path
LOG_FILE="/home/ubuntu/application_log/app.log"

# Function to generate random log entries
generate_log_entry() {
    echo "$(date +"%Y-%m-%d %H:%M:%S") - Log entry: $RANDOM" >> "$LOG_FILE"
}

# Main function
main() {
    echo "Generating log entries once per minute..."
    while true; do
        generate_log_entry
        sleep 60  # Generate log entry once per minute
    done
}

# Call main function
main
