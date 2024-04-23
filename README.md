# DevOps_Assignment
This assignment contains the log &amp; monitoring script.



# DevOps Assignment
This assignment contains the log & monitoring script as per given assignment.

Created a script that automates the analysis and monitoring of log files.

# Structure #  

#1 I have Created diretory as a application_log with inside file having a name app.log

Path : /home/ubuntu/application_log

Where the log file as a demo Created & inserted some logs.

#2 demo script for demo log genration 

 ScriptName: --> app.sh

Path : /home/ubuntu 

#3 log analysis & monitoring script 
ScriptName: --> log_monitor.sh
Path : /home/ubuntu  


#Explantion for script

1. Log File Monitoring: Using the tail -f command, the script continuously checks the provided log file ($LOG_FILE) for new entries.

2. Track and view fresh log entries with tail: Real-time tracking and display of fresh log entries is accomplished with the tail -f command.

3. Include set up a system to break the monitoring loop: The cleaning function is called by the script when it detects the SIGINT signal (Ctrl+C),
   and it quits the script properly.
4. Log Analysis: Every log part is reviewed by the analyze_log function. It counts instances of the keyword "error" in this example.
   
6. Count the number of errors of particular terms or patterns: The analyze_log function keeps track of how often the term "error" appears in log entries.
   
7. Create reports with summary information: The total number of errors discovered during the monitoring interval is the summary report that is generated and shown by the generate_summary_report function.
   
9. The generate_summary_report function now appends the summary report to the specified file (SUMMARY_REPORT_FILE) instead of printing it to the console.
Each time the function is called, it appends the new summary report to the file. (this only run when only error is genrated).
   

#Summary 

This script counts the number of times a certain term/error appears in the log file,monitors it continuously, and creates summary reports on a regular basis.



