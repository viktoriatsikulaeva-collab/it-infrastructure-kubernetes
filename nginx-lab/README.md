
# Nginx Web Server Administration - Docker Lab

## Objective

Learn how to deploy, operate, test and troubleshoot an Nginx web server using Docker.

## Environment

- Windows 11 with Ubuntu WSL2
- Docker Desktop
- Docker image: nginx:alpine
- Nginx version: 1.31.8
- Local port: 8083

## Implementation

### 1. Pull the Docker image

`docker pull nginx:alpine`

### 2. Run the Nginx container

`docker run -d --name yff-nginx -p 127.0.0.1:8083:80 nginx:alpine`

Port 8083 on the host is mapped to port 80 inside the container. The service is bound to localhost.

### 3. Verify the web server

`docker ps`

`curl -I http://localhost:8083`

Result: HTTP 200 OK.

### 4. Test the Nginx configuration

`docker exec yff-nginx nginx -t`

Result: Configuration syntax is OK and the test is successful.

### 5. Inspect server logs

`docker logs --tail 10 yff-nginx`

The logs confirmed that Nginx handled HTTP requests.

## Troubleshooting

The logs contained an HTTP 404 error for `/favicon.ico`.

Cause: The browser requested a website icon that was not present.

Impact: The main website continued working normally.

## Results

- Nginx web server responding successfully
- HTTP status: 200 OK
- Configuration test: PASS
- Container logs inspected

## What I Learned

- How to deploy a web server using Docker
- How Docker port mapping works
- How to test HTTP availability
- How to validate Nginx configuration
- How to inspect and interpret server logs

## Evidence

See `../evidence/screenshots/21-nginx-tests.png`.
