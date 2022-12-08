---
name: Bug report
about: Create a report to help us improve
title: ''
labels: ''
assignees: ''

---

**Describe the bug**
A clear and concise description of what the bug is.

**To Reproduce**
Steps to reproduce the behavior:
1. Go to '...'
2. Click on '....'
3. Scroll down to '....'
4. See error

**Expected behavior**
A clear and concise description of what you expected to happen.

**Screenshots**
If applicable, add screenshots to help explain your problem.

**System info (please complete the following information):**
 - OS: [e.g. windows, ubuntu]
 - Container engine [e.g. docker 20.10]

**docker-compose.yml (please complete the following information):**
```yml
version: "3"
services:
  lidarr:
    image: youegraillot/lidarr-on-steroids
    restart: unless-stopped
    ports:
      - "8686:8686" # Lidarr web UI
      - "6595:6595" # Deemix web UI
    volumes:
      - <path>:/config
      - <path>:/config_deemix
      - <path>:/downloads
      - <path>:/music
```

**Additional context**
Add any other context about the problem here.
