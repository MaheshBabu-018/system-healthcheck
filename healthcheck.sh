#!/bin/bash
# Health Check Script

# Log file
LOGFILE="healthlog.txt"

# Add timestamp header
echo "============================" >> $LOGFILE
echo "   System Health Report" >> $LOGFILE
echo "   Generated on: $(date)" >> $LOGFILE
echo "============================" >> $LOGFILE

# System Date and Time
echo -e "\n Date and Time:" >> $LOGFILE
date >> $LOGFILE

# Uptime
echo -e "\n Uptime:" >> $LOGFILE
uptime -p >> $LOGFILE

# CPU Load
echo -e "\n CPU Load (from uptime):" >> $LOGFILE
uptime | awk -F'load average:' '{ print $2 }' >> $LOGFILE

# Memory Usage
echo -e "\n Memory Usage (MB):" >> $LOGFILE
free -m >> $LOGFILE

# Disk Usage
echo -e "\n Disk Usage:" >> $LOGFILE
df -h --total | grep -E "Filesystem|total" >> $LOGFILE

# Top 5 Memory-Consuming Processes
echo -e "\n Top 5 Memory-Consuming Processes:" >> $LOGFILE
ps aux --sort=-%mem | head -n 6 >> $LOGFILE

# Check Services (nginx, ssh)
echo -e "\n Service Status:" >> $LOGFILE
for service in nginx ssh
do
  if systemctl is-active --quiet $service; then
    echo "$service :  Running" >> $LOGFILE
  else
    echo "$service :  Not Running" >> $LOGFILE
  fi
done

echo -e "\n✅ Health check completed.\n\n" >> $LOGFILE
