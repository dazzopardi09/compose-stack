# My Unraid Docker Stack (Compose-ified)

This repository contains my Unraid Docker stack, exported and cleaned into modular `docker-compose.yml` files.  
Each service lives in its own YAML file for clarity and modularity.  

## Structure
```
compose-stack/
├── radarr.yml
├── sonarr.yml
├── jackett.yml
├── qbittorrent.yml
├── bazarr.yml
├── sabnzbd.yml
├── cloudflared.yml
├── kometa.yml
├── jellyseerr.yml
├── tautulli.yml
├── filebot.yml
├── tdarr.yml
├── nginx-proxy-manager.yml
├── binhex-plex.yml
├── binhex-flaresolverr.yml
├── monitoring/
│   ├── prometheus.yml
│   ├── grafana.yml
│   ├── node-exporter.yml
│   ├── cadvisor.yml
│   ├── plex-exporter.yml
│   ├── intel-gpu-exporter.yml
│   └── smartctl-exporter.yml
├── .env
├── .env.example
└── compose-up.sh
```

## Usage
A helper script `compose-up.sh` is included to simplify usage.

### Start the stack
```bash
./compose-up.sh up -d
```

### Stop the stack
```bash
./compose-up.sh down
```

### View status
```bash
./compose-up.sh ps
```

### Logs
```bash
./compose-up.sh logs -f
```

## Environment Variables
Secrets and common variables are centralized in the `.env` file. You will need to cfreate your own with your own variables. I've uploaded .env.example with placeholders to get you started.

### First-time setup
Copy the example file to `.env`:
```bash
cp .env.example .env
```

Then edit `.env` to add your real values.

## Notes
- Networks `dansproxy` and `plex_monitoring_default` must exist as external Docker networks:
  ```bash
  docker network create dansproxy
  docker network create plex_monitoring_default
  ```
- Some services (like Plex, Cloudflared) require tokens or claim codes.  
  Add these to `.env` before running.
- Each service can also be started independently by specifying only its YAML file with `docker compose`.

## License
This repo is for personal use. No warranties.
