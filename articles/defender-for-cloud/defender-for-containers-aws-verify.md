---
title: Verify Defender for Containers deployment on AWS (EKS)
description: Learn how to verify that Microsoft Defender for Containers is properly deployed on your Amazon EKS clusters.
ms.topic: how-to
ms.date: 06/04/2025
---

# Verify Defender for Containers deployment on AWS (EKS)

After you enable Defender for Containers, use this guide to verify all components are functioning correctly on your EKS clusters.

## Validation checklist

Complete these verification steps in order:

- [ ] [AWS connector shows as connected](#verify-connector-status)
- [ ] [EKS clusters connected to Arc](#verify-arc-connection)  
- [ ] [Defender sensor pods running](#verify-sensor-deployment)
- [ ] [ECR integration working](#verify-container-image-scanning)
- [ ] [Audit logs configured](#verify-audit-logging)
- [ ] [Test alert generated](#test-security-detection)
- [ ] [Recommendations appearing](#verify-security-recommendations)
- [ ] [No errors in logs](#check-component-logs)

> [!TIP]
> If any validation step fails, see the troubleshooting section for that component.

## Verify connector status

### Check connector in Azure portal

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.
1. Select your AWS connector.
1. Verify the following values:
   - Connection status shows as **Connected**
   - Last sync time is recent (within 15 minutes)
   - Containers plan shows as **On**

### Check connector using Azure CLI

```azurecli
# Check connector status
az security connector show \
    --name <connector-name> \
    --resource-group <resource-group>

# Check pricing tier
az security pricing show \
    --name 'Containers' \
    --scope "/subscriptions/{subscription-id}/resourceGroups/{resource-group}/providers/Microsoft.Security/securityConnectors/{connector-name}"
```

## Verify Arc connection

### Check EKS clusters in Arc

```azurecli
# List Arc-connected EKS clusters
az connectedk8s list \
    --resource-group <resource-group> \
    --query "[?contains(name, 'eks')]"

# Check specific cluster status
az connectedk8s show \
    --name <cluster-name> \
    --resource-group <resource-group> \
    --query connectivityStatus
```

### Verify from EKS cluster

```bash
# Check Arc agents
kubectl get pods -n azure-arc

# Verify Arc operators
kubectl get deployments -n azure-arc

# Check connectivity
kubectl logs -n azure-arc deployment/clusterconnect-agent --tail=50
```

## Verify sensor deployment

### Check DaemonSet status

```bash
# Check if the Defender sensor DaemonSet is running
kubectl get daemonset -n kube-system | grep defender

# Expected output:
# microsoft-defender-sensor   3         3         3       3            3           <none>          5m
```

### Check pod status

```bash
# List Defender pods
kubectl get pods -n kube-system -l app=microsoft-defender

# Check pod logs
kubectl logs -n kube-system -l app=microsoft-defender --tail=50

# Verify all nodes have sensor pods
kubectl get pods -n kube-system -l app=microsoft-defender -o wide
```

## Verify container image scanning

### Check ECR integration in portal

1. Go to **Microsoft Defender for Cloud** > **Inventory**.
1. Filter by **Resource type** = **Container registries**.
1. Verify your ECR registries appear with scanning enabled.

### Check ECR integration using AWS CLI

```bash
# List ECR repositories
aws ecr describe-repositories --region <region>

# Check scanning configuration
aws ecr describe-repositories \
    --repository-names <repo-name> \
    --region <region> \
    --query 'repositories[*].imageScanningConfiguration'
```

### View scan results

1. Go to **Recommendations**.
1. Select "Container registry images should have vulnerability findings resolved".
1. Review vulnerability findings for your ECR images.

## Verify audit logging

### Check EKS audit logs

```bash
# Verify audit logging is enabled
aws eks describe-cluster \
    --name <cluster-name> \
    --region <region> \
    --query 'cluster.logging'

# Expected output should show audit logs enabled
```

### Query CloudWatch logs

```bash
# Check if audit logs are flowing
aws logs filter-log-events \
    --log-group-name /aws/eks/<cluster-name>/cluster \
    --start-time $(date -u -d '1 hour ago' +%s)000 \
    --max-items 10
```

## Test security detection

### Generate a test alert

Run this benign test to verify threat detection:

```bash
# This command triggers a test alert
kubectl run test-alert \
    --image=nginx \
    --rm \
    -it \
    --restart=Never \
    -- /bin/bash -c "echo 'This is a test alert for Defender for Containers' > /etc/passwd"
```

### Run sample security scenarios

Test different alert scenarios on your EKS clusters:

#### Test 1: Suspicious file access

```bash
kubectl run suspicious-access \
    --image=busybox \
    --rm -it \
    --restart=Never \
    -- /bin/sh -c "cat /etc/shadow"
```

Expected alert: "Attempt to access sensitive files detected"

#### Test 2: Privileged container

```bash
kubectl apply -f - <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: privileged-test
spec:
  containers:
  - name: test
    image: nginx
    securityContext:
      privileged: true
  restartPolicy: Never
EOF

# Clean up
kubectl delete pod privileged-test
```

Expected alert: "Privileged container detected"

#### Test 3: Exposed Kubernetes dashboard

```bash
kubectl run dashboard-test \
    --image=kubernetesui/dashboard:v2.0.0 \
    --port=8443 \
    --rm -it \
    --restart=Never
```

Expected alert: "Exposed Kubernetes dashboard detected"

### View alerts in Defender for Cloud

1. Go to **Security alerts**.
1. Filter by your EKS clusters.
1. See alerts within 5-10 minutes.

> [!NOTE]
> Some alerts only trigger with actual malicious behavior and don't appear from benign tests.

## Verify security recommendations

1. Go to **Microsoft Defender for Cloud** > **Recommendations**.
1. Set the filter **Resource type** to **Kubernetes service**.
1. Look for EKS-specific recommendations:
   - "EKS clusters should have control plane audit logging enabled"
   - "EKS clusters should use IRSA for pod authentication"
   - "EKS clusters should have encryption of secrets enabled"

## Simulate security alerts from Microsoft Defender for Containers

To check that your Defender for Containers deployment works correctly on EKS, simulate different security alerts. These simulations trigger real alerts without causing any harm to your clusters.

### Prerequisites for alert simulation

- Defender sensor is deployed and running on EKS clusters
- Runtime protection is enabled
- Clusters are connected to Azure Arc
- Wait 5-10 minutes for alerts to appear after simulation

### Basic EKS alert simulations

#### Test unauthorized file access

```bash
kubectl run eks-file-alert \
    --image=amazonlinux:2 \
    --rm \
    -it \
    --restart=Never \
    -- /bin/bash -c "cat /etc/shadow 2>/dev/null || echo 'shadow file accessed'"
```

Expected alert: "Sensitive file access detected"

#### Test suspicious AWS API calls

```bash
kubectl run eks-api-alert \
    --image=amazon/aws-cli \
    --rm \
    -it \
    --restart=Never \
    --env="AWS_DEFAULT_REGION=us-east-1" \
    -- s3 ls 2>/dev/null || echo "S3 access attempted"
```

Expected alert: "Suspicious AWS API activity from container"

### Advanced EKS-specific simulations

#### Test IRSA bypass attempt

```bash
kubectl apply -f - <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: irsa-bypass-simulation
spec:
  containers:
  - name: irsa-test
    image: amazon/aws-cli
    command: ["/bin/bash", "-c"]
    args:
      - |
        # Attempt to access AWS without IRSA
        aws sts get-caller-identity || echo "IRSA bypass simulated"
        sleep 60
  serviceAccountName: default
  restartPolicy: Never
EOF

# Clean up
kubectl delete pod irsa-bypass-simulation
```

Expected alert: "Potential IRSA bypass detected"

#### Test EKS privilege escalation

```bash
# Create a test service account
kubectl create serviceaccount test-escalation -n default

# Attempt privilege escalation
kubectl create clusterrolebinding test-eks-admin \
    --clusterrole=cluster-admin \
    --serviceaccount=default:test-escalation \
    --dry-run=client -o yaml

# Clean up
kubectl delete serviceaccount test-escalation -n default
```

Expected alert: "Kubernetes privilege escalation attempt"

### Test EKS cluster reconnaissance

```bash
# Simulate cluster discovery
kubectl run eks-recon \
    --image=bitnami/kubectl:latest \
    --rm \
    -it \
    --restart=Never \
    -- get nodes -o wide

# Simulate secret enumeration
kubectl get secrets --all-namespaces --dry-run=client 2>/dev/null || echo "Secret enumeration attempted"
```

Expected alerts:

- "Kubernetes cluster reconnaissance detected"
- "Suspicious secret enumeration activity"

### Test container escape on EKS

```bash
kubectl run eks-escape-test \
    --image=ubuntu \
    --rm \
    -it \
    --restart=Never \
    --overrides='{"spec":{"containers":[{"name":"escape","image":"ubuntu","command":["nsenter","--target","1","--mount","--uts","--ipc","--net","--pid","--","echo","escape-test"],"securityContext":{"privileged":true}}]}}' \
    || echo "Container escape simulation triggered"
```

Expected alert: "Container escape attempt on EKS"

### Verify alert generation

After running simulations:

1. Go to **Microsoft Defender for Cloud** > **Security alerts**
1. Filter by:
   - **Resource type**: Kubernetes service
   - **Environment**: AWS
   - **Time range**: Last hour

1. Verify alerts show:
   - Correct EKS cluster identification
   - AWS-specific context (region, account ID)
   - Appropriate remediation for EKS

### EKS-specific alert validation

Check that alerts include:

- EKS cluster ARN
- AWS account ID
- Region information
- Relevant AWS service context (IAM, EC2, and other services)

### Clean up test resources

```bash
# Remove test pods
kubectl delete pods -l run=eks-file-alert
kubectl delete pods -l run=eks-api-alert
kubectl delete pods -l run=eks-recon
kubectl delete pods -l run=eks-escape-test

# Remove test resources
kubectl delete clusterrolebinding test-eks-admin 2>/dev/null || true
kubectl delete serviceaccount test-escalation 2>/dev/null || true
```

### Troubleshooting EKS alert generation

If alerts don't appear, try the following steps:

1. **Verify EKS audit logging**:

   ```bash
   aws eks describe-cluster --name <cluster-name> \
       --query 'cluster.logging.clusterLogging[?enabled==`true`].types[]'
   ```

1. **Check Arc connectivity**:

   ```bash
   kubectl get pods -n azure-arc -l app.kubernetes.io/component=connect-agent
   ```

1. **Review CloudWatch logs**:

   ```bash
   aws logs tail /aws/eks/<cluster-name>/cluster --follow
   ```

1. **Verify IAM permissions**: Ensure the Defender role has necessary permissions

## Check component logs

### Defender sensor logs

```bash
# View recent logs
kubectl logs -n kube-system -l app=microsoft-defender --tail=100

# Check for errors
kubectl logs -n kube-system -l app=microsoft-defender | grep -i error

# Check specific pod
kubectl describe pod -n kube-system <defender-pod-name>
```

### Arc agent logs

```bash
# Check Arc connectivity
kubectl logs -n azure-arc deployment/clusterconnect-agent

# Extension manager logs
kubectl logs -n azure-arc deployment/extension-agent
```

## Performance validation

### Check resource usage

```bash
# Check Defender sensor resource usage
kubectl top pods -n kube-system -l app=microsoft-defender

# Monitor over time
watch kubectl top pods -n kube-system -l app=microsoft-defender
```

### Expected resource consumption

Typical resource usage per node includes:

- **CPU**: Less than 100m (0.1 core)
- **Memory**: Less than 200Mi
- **Network**: Minimal, only for telemetry

## Common verification issues

### Connector shows disconnected

1. Verify CloudFormation stack completed successfully.
1. Check IAM role has correct trust policy.
1. Ensure you correctly entered the role ARN in Azure.

### No security alerts

If you don't see security alerts:

1. Ensure audit logging is enabled on EKS clusters.
1. Verify Defender sensor pods are running.
1. Check that runtime protection is enabled in connector settings.
1. Wait 5-10 minutes after generating test events.

### Missing vulnerability scans

For missing ECR scans:

1. Verify ECR permissions in IAM role.
1. Check that images are pushed recently.
1. Ensure vulnerability assessment is enabled in connector.
1. Wait up to 4 hours for initial scans.

### Clusters not appearing

If EKS clusters aren't showing:

1. Verify clusters are tagged correctly (no exclusion tags).
1. Check IAM role has `eks:ListClusters` permission.
1. Ensure clusters are in the same AWS account.
1. Wait 15-30 minutes for discovery.

## Monitor deployment health

### Set up CloudWatch alarms

```bash
# Create alarm for Arc disconnection
aws cloudwatch put-metric-alarm \
    --alarm-name "DefenderArcDisconnected" \
    --alarm-description "Alert when Arc agent disconnects" \
    --metric-name "ConnectedStatus" \
    --namespace "AzureArc" \
    --statistic "Average" \
    --period 300 \
    --threshold 1 \
    --comparison-operator "LessThanThreshold" \
    --evaluation-periods 2
```

### Query deployment metrics

Use this KQL query in Log Analytics:

```kusto
KubeEvents
| where TimeGenerated > ago(1h)
| where ClusterName contains "eks"
| where Reason in ("FailedCreate", "FailedScheduling", "FailedMount")
| project TimeGenerated, ClusterName, Namespace, Reason, Message
```

## Related content

- [Configure advanced settings](defender-for-containers-aws-configure.md)
- [Remove Defender for Containers](defender-for-containers-aws-remove.md)
