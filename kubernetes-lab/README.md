
# Kubernetes Deployment and Troubleshooting Lab

## Objective

Deploy, monitor and troubleshoot a containerized Python HTTP service using Kubernetes.

## Environment

- Windows 11 and Ubuntu WSL2
- Docker Desktop Kubernetes
- Single-node Kubernetes cluster
- Python HTTP Health Monitor
- Docker image: yff-python-health:v1

## Implementation

1. Created a Kubernetes Deployment with two replicas.
2. Configured readiness and liveness probes using `/health`.
3. Created a ClusterIP Service.
4. Investigated and resolved a container image availability problem.
5. Recreated the Pods and verified the Deployment.
6. Tested the Service through port forwarding.

## Troubleshooting

### Problem

Both Pods initially failed with `ErrImageNeverPull`.

The Deployment had 0/2 available replicas.

### Cause

The container image was not accessible to the Kubernetes node.

The Deployment used `imagePullPolicy: Never`, which requires the image to be available locally to the node.

### Resolution

Made the Docker image available to the Kubernetes node and recreated the failed Pods.

### Verification

- Both Pods reached Running status.
- Deployment reported 2/2 available replicas.
- Kubernetes rollout completed successfully.
- HTTP health endpoint returned 200 OK.

## What I Learned

- Kubernetes Deployments and Pods
- Container image availability
- Kubernetes Services
- Readiness and liveness probes
- HTTP health checks
- Troubleshooting deployment failures
- Automatic replacement of Pods

## Evidence

- evidence/kubernetes-lab-results.txt
- evidence/screenshots/16-kubernetes-image-error.png
- evidence/screenshots/17-kubernetes-recovery.png
- evidence/screenshots/18-kubernetes-health-check.png
