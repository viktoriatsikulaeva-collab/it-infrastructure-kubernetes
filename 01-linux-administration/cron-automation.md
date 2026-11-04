# Linux System Monitoring and Cron Automation

## Objective
Practice Linux system administration by creating a Bash script to monitor system resources and automating its execution with cron.

## Environment
- Ubuntu running on WSL2
- Bash shell
- systemd and cron

## Tasks Completed
1. Created a Bash script using the nano editor.
2. Configured executable permissions with chmod +x.
3. Used date, free -h, and df -h / to collect system information.
4. Redirected command output to a text report.
5. Configured a cron job to run every five minutes.
6. Verified an automatic execution at 18:20 on November 4, 2026.
7. Disabled the scheduled job after testing.

## Commands Practiced
- chmod — change file permissions
- nano — edit text files
- systemctl — inspect system services
- journalctl — inspect system logs
- crontab -e — edit scheduled tasks
- crontab -l — list scheduled tasks
- tail — inspect the end of a file

## Results
The monitoring script successfully collected memory and disk usage information. Cron executed the script automatically and appended the results to a report file.

## Key Learning
Learned how Linux services, Bash scripts, file permissions, output redirection, and scheduled tasks work together to automate system administration.

## Note
Cron jobs in WSL2 run only while the Linux environment and cron service are running.
