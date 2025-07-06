# 🧱 OpenCart Stack with Docker

Self-hosted OpenCart 3 (OcStore 3) deployment using Docker Compose.

---

## 🚀 Features

- 🐳 Dockerized OpenCart with MariaDB
- 🔄 One-command setup
- 📜 Clean and extensible `docker-compose.yaml`

---

## 📦 Requirements

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)

---

## 🛠️ Quick Start

```bash
git clone https://github.com/nikitakiselev/opencart-deployment.git
cd opencart-deployment
cp .env.example .env
docker compose up -d
```

Then open http://localhost:8010 to access your OpenCart instance.

## ⚙️ Configuration

Environment Variables:

You can adjust service settings via `.env`

## 🤝 License

MIT — free to use, modify, and share.
