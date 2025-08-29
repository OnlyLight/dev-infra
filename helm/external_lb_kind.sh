cat <<EOF | kind create cluster --config=-
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  extraPortMappings:
  - containerPort: 80
    hostPort: 80
    protocol: TCP
    listenAddress: "127.0.0.1"
  - containerPort: 443
    hostPort: 443
    protocol: TCP
    listenAddress: "127.0.0.1"
EOF