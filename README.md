# SRE Linux Scripts – Daily Automation Toolkit

**Author:** Jorge Calva  
**Role:** Senior Site Reliability Engineer  

This repository contains production-ready bash scripts I use daily to automate common SRE tasks: log rotation, system health checks, Kubernetes pod auto-remediation, Docker cleanup, and backup rotation.

---

## 📂 Scripts Overview

| Category | Script | Purpose |
|----------|--------|---------|
| Logs | `log-cleaner.sh` | Delete log files older than N days |
| Monitoring | `health-check.sh` | Check CPU, RAM, and disk usage |
| Kubernetes | `pod-restart-stuck.sh` | Auto-restart pods in CrashLoopBackOff / ImagePullBackOff |
| Containers | `docker-cleaner.sh` | Remove unused Docker images, containers, and volumes |
| Backup | `backup-rotate.sh` | Keep only the latest N backups in a directory |

---

## 🚀 Quick Start

```bash
git clone https://github.com/Gryphodt/sre-linux-scripts.git
cd sre-linux-scripts
chmod +x */*.sh
📖 Usage Examples
bash
# Remove logs older than 7 days from /var/log
./logs/log-cleaner.sh /var/log 7

# Check current system health
./monitoring/health-check.sh

# Restart stuck pods in the 'production' namespace
./k8s/pod-restart-stuck.sh production

# Clean up dangling Docker resources
./containers/docker-cleaner.sh

# Keep only the 5 most recent backups in /backup
./backup/backup-rotate.sh /backup 5
⏰ Cron Automation Examples
Add these lines to your crontab (crontab -e):

cron
# Every hour: clean old logs
0 * * * * /home/gryphodt/sre-linux-scripts/logs/log-cleaner.sh /var/log 7

# Every 5 minutes: health check (logs to file)
*/5 * * * * /home/gryphodt/sre-linux-scripts/monitoring/health-check.sh >> /var/log/health.log 2>&1

# Daily at 2am: Docker cleanup
0 2 * * * /home/gryphodt/sre-linux-scripts/containers/docker-cleaner.sh

# Every hour: restart stuck pods in default namespace
0 * * * * /home/gryphodt/sre-linux-scripts/k8s/pod-restart-stuck.sh default
🛠️ Script Details
log-cleaner.sh
Arguments: [directory] [days] [pattern]

Defaults: /var/log, 30, *.log

Safety: Only removes files matching the pattern and older than N days.

health-check.sh
Thresholds: CPU >90%, RAM >90%, Disk >85% → WARNING messages.

Exit codes: 0 (OK), 1 (warning, non‑critical), 2 (critical).

pod-restart-stuck.sh
Arguments: [namespace] (default: default)

Detects: CrashLoopBackOff, ImagePullBackOff, ErrImagePull

Action: Deletes the stuck pod (Kubernetes will recreate it).

docker-cleaner.sh
Interactive: Asks before removing volumes.

Flags: Use --all to remove all unused images (not just dangling).

backup-rotate.sh
Arguments: [backup_dir] [keep_count]

Default keep count: 7

Warning: Deletes files permanently – use with care.

🧠 Why This Matters (AIOps / SRE Alignment)
These scripts reflect the automation principles required for PagerDuty AIOps Ready and Datadog SRE Learning Path:

Reduce toil – automate repetitive tasks (log cleanup, pod restarts).

Proactive detection – health checks run every 5 minutes.

Self‑healing – stuck pods are automatically deleted and recreated.

📜 Certifications
PagerDuty AIOps Ready (2026)

Datadog Site Reliability Engineer Learning Path (2026)

The Linux Foundation: LFS101, LFS158, LFS162

🤝 Contributing
This is a personal portfolio project, but feel free to fork and adapt for your own SRE toolkit.

🔗 Connect with me
LinkedIn | GitHub

"Certifications give you knowledge, but practice makes mastery."
