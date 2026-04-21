# SRE Linux Scripts – Daily Automation Toolkit

**Author:** Jorge Calva  
**Role:** Senior Site Reliability Engineer  

Scripts para automatizar tareas comunes de SRE: limpieza de logs, monitoreo de salud, reinicio de pods stuck en Kubernetes, limpieza de Docker, y rotación de backups.

## 📂 Scripts

| Script | Uso |
|--------|-----|
| `logs/log-cleaner.sh /var/log 7` | Borra logs de más de 7 días |
| `monitoring/health-check.sh` | Muestra uso de CPU, RAM y disco |
| `k8s/pod-restart-stuck.sh default` | Reinicia pods en CrashLoopBackOff |
| `containers/docker-cleaner.sh` | Limpia contenedores e imágenes no usados |
| `backup/backup-rotate.sh /backup 5` | Mantiene solo los 5 backups más recientes |

## 🚀 Clonar y usar

```bash
git clone https://github.com/Gryphodt/sre-linux-scripts.git
cd sre-linux-scripts
./monitoring/health-check.sh
🔗 Conectar
LinkedIn
