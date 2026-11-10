
# Docker Lab - Python Health Service

## Objective
Containerize and operate a Python HTTP service using Docker.

## Environment
- Windows 11 / Ubuntu WSL2
- Docker Desktop
- Python 3.14
- Docker image: yff-python-health:v1

## Implementation

1. Created a Dockerfile based on python:3.14-slim.
2. Built the image using docker build.
3. Started the container in detached mode.
4. Mapped host port 8081 to container port 8000.
5. Verified container status and HTTP availability.

## Commands

```bash
docker build -t yff-python-health:v1 ./python-service
docker run -d --name yff-python-health -p 8081:8000 yff-python-health:v1
docker ps
curl -i http://localhost:8081/health
docker logs --tail 10 yff-python-health
```

## Test Results

- Container status: Up
- Health endpoint: HTTP 200 OK
- JSON response: {"status": "ok"}
- Result: PASS

## What I Learned

- Difference between Docker images and containers
- How to create a Dockerfile
- Building and running container images
- Port mapping and container networking
- Checking service availability
- Viewing container logs

## Evidence

See screenshots in ../evidence/screenshots/
