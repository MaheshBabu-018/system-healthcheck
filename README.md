
#  Linux System Health Check Script

This project provides a **Bash script** (`healthcheck.sh`) to monitor and log the system’s health status.  
It generates a detailed report containing system metrics and saves it into a log file (`healthlog.txt`) with a timestamp.

---

##  Features
The script outputs:
-  **System Date and Time**
-  **System Uptime**
-  **CPU Load Average**
-  **Memory Usage** (`free -m`)
-  **Disk Usage** (`df -h`)
-  **Top 5 memory-consuming processes** (`ps aux --sort=-%mem`)
-  **Service Status Check** (e.g., `nginx`, `ssh`)

---

### Clone the repositary.
