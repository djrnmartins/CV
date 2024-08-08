**Startup Docker Container:**
1. Execute the command `docker compose up --build -d`. This command will install all depencies so you need to wait a few minutes. Open docker Logs window to see the logs.

**Update Templates:**
1. Add templates to templates file.
2. Execute the command `docker-compose exec cv-runner bash ./install.sh`

**Re-generate CV:**
1. Execute the command `docker-compose exec cv-runner bash ./generate.sh`