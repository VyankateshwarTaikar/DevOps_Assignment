#!/bin/bash

# Set log file path
LOG_FILE="/home/ubuntu/application_log/app.log"
# Set path for summary report file
SUMMARY_REPORT_FILE="/home/ubuntu/summary_report.txt"

# Function to handle cleanup and exit
cleanup() {
    echo "Exiting..."
    exit 0
}

# Trap Ctrl+C to call cleanup function
trap cleanup SIGINT

# Function to monitor log file for new entries
monitor_log() {
    echo "Monitoring log file: $LOG_FILE"
    tail -n 0 -f "$LOG_FILE" | while read line; do
        echo "$line"
        analyze_log "$line"
    done
}

# Function to analyze log entries and generate summary report
analyze_log() {
    local entry="$1"
    # Add your analysis logic here
    # Example: Count occurrences of specific keyword "error"
    if [[ "$entry" == *"error"* ]]; then
        ((error_count++))
    fi
}

# Function to generate and display summary report
generate_summary_report() {
    echo "Summary Report:" >> "$SUMMARY_REPORT_FILE"
    echo "Total Errors: $error_count" >> "$SUMMARY_REPORT_FILE"
    echo "" >> "$SUMMARY_REPORT_FILE"
    # Reset error count for next interval
    error_count=0
}

# Main function
main() {
    echo "Starting log monitoring..."
    error_count=0
    while true; do
        monitor_log &
        monitor_pid=$!
        sleep 60  # Set interval for generating summary report (in seconds)
        kill "$monitor_pid"
        generate_summary_report
    done
}

# Call main function
main
