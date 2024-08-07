**Startup Docker Container:**
- execute the command `docker compose up --build -d`

**Generate CV Templates:**
1) Add the desired templates to *templates* file (One template per line).
2) execute the command `docker compose exec resume-builder bash /usr/src/app/generate.sh`

