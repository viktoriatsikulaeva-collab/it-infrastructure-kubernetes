
# Python IT Service Health Monitor

## Objective

Create and test a simple HTTP health-check service as part of an IT infrastructure administration project.

## Environment

- Ubuntu 26.04 LTS on WSL2
- Python 3.14.4
- HTTP server using Python standard library
- Testing with curl

## Implementation

The service is implemented in `server.py` and listens on port 8000.

It provides three HTTP responses:

| Endpoint | HTTP Status | Purpose |
|---|---|---|
| `/` | 200 | Service information |
| `/health` | 200 | Service availability check |
| `/unknown` | 404 | Invalid endpoint handling |

## Running the Service

```bash
python3 python-service/server.py
```

## Testing

```bash
curl -i http://localhost:8000/
curl -i http://localhost:8000/health
curl -i http://localhost:8000/unknown
```

## Test Results

- Root endpoint: PASS
- Health endpoint: PASS
- Invalid endpoint handling: PASS

All three HTTP tests returned the expected status codes.

## IT Operations Relevance

HTTP health checks help IT administrators determine whether a service is responding.

This project demonstrates basic service operation, endpoint testing, and troubleshooting.

The HTTP server is intended for local educational use, not production deployment.

## Evidence

See `../evidence/screenshots/10-python-http-tests.png`.
