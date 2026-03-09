# Day 41 – Kubernetes Minikube Setup

## Tools
- WSL
- Docker
- Kubectl
- Minikube

## Steps

1. Install Docker
2. Install Kubectl
3. Install Minikube
4. Start cluster
5. Create namespace
6. Deploy nginx pod

## Commands

kubectl get nodes
kubectl get ns
kubectl create namespace dev
kubectl run nginx --image=nginx -n dev
kubectl get pods -n dev
