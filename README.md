# Unraid Modular Docker Compose Stack

A ready-to-use **Docker Compose stack** for Unraid (or any Docker host), designed to run a full self-hosted media server setup.  
This repo is modular — each service has its own `.yml` file so you can enable only what you need.

---

## ✨ Features

- **Plex Media Server** – organize & stream your media library  
- **Sonarr / Radarr** – automated TV & movie downloads  
- **qBittorrent / SABnzbd** – torrent & Usenet clients  
- **Jackett / Prowlarr** – indexer integrations  
- **Bazarr** – subtitles automation  
- **Jellyseerr** – request management  
- **Kometa** – Plex metadata & collections automation  
- **Tautulli** – Plex usage analytics  
- **Grafana / Prometheus / Node Exporter / Intel GPU Exporter** – monitoring stack  
- **Tdarr** – automated transcoding workflows  
- **Nginx Proxy Manager** – reverse proxy with SSL  
- **Cloudflared** – Cloudflare Tunnel support  
- **Filebot** – media renaming & organization  

---

## 📂 Structure

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

---

## 🚀 Usage

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

---

## 🔑 Environment Variables

Secrets and common variables are centralized in the `.env` file.  
You must create your own `.env` with your values.  

A starter file `.env.example` is provided with placeholders:

```bash
cp .env.example .env
nano .env
```

---

## ⚙️ Notes

- Networks `dansproxy` and `plex_monitoring_default` must exist as external Docker networks:
  ```bash
  docker network create dansproxy
  docker network create plex_monitoring_default
  ```
- Some services (e.g., Plex, Cloudflared) require tokens or claim codes. Add these to your `.env` before running.  
- Each service can also be started independently by specifying only its YAML file with `docker compose -f <file>.yml up -d`.  

---

## 📜 License

This repo is for personal use. No warranties.  

---

## 🏷️ Tags

`unraid` `docker-compose` `plex` `radarr` `sonarr` `homelab` `selfhosted` `media-server`
