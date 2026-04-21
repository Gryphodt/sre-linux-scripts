#!/bin/bash
NAMESPACE="${1:-default}"
echo "Checking pods in $NAMESPACE..."
kubectl get pods -n "$NAMESPACE" --no-headers | while read -r line; do
    NAME=$(echo "$line" | awk '{print $1}')
    STATUS=$(echo "$line" | awk '{print $3}')
    if [[ "$STATUS" == "CrashLoopBackOff" || "$STATUS" == "ImagePullBackOff" ]]; then
        echo "Deleting stuck pod: $NAME ($STATUS)"
        kubectl delete pod "$NAME" -n "$NAMESPACE"
    fi
done
echo "Done."
