---
title: Configure Defender for Containers on AWS (EKS)
description: Learn how to configure advanced settings for Microsoft Defender for Containers on EKS clusters.
ms.topic: how-to
ms.date: 06/04/2025
---

# Configure Defender for Containers on AWS (EKS)

This article explains how to configure advanced settings for Defender for Containers on your Amazon EKS clusters.

## Configure runtime protection

### Exclude namespaces from monitoring

Create a ConfigMap to exclude specific namespaces:

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: microsoft-defender-config
  namespace: kube-system
data:
  excludedNamespaces: |
    - kube-system
    - kube-public
    - aws-observability
    - amazon-cloudwatch
```

Apply and restart the sensor:

```bash
kubectl apply -f defender-config.yaml
kubectl rollout restart daemonset/microsoft-defender-sensor -n kube-system
```

### Configure EKS-specific monitoring

Configure monitoring for EKS-specific resources:

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: microsoft-defender-eks-config
  namespace: kube-system
data:
  eksFeatures: |
    monitorFargate: true
    monitorNodeGroups: true
    includeEKSAddons: false
    monitorIAMRoles: true
```

## Configure ECR vulnerability scanning

### Advanced ECR scanning settings

Configure enhanced scanning with Amazon Inspector:

```bash
# Enable enhanced scanning
aws ecr put-registry-scanning-configuration \
    --scan-type ENHANCED \
    --rules '{
        "scanFrequency": "CONTINUOUS_SCAN",
        "repositoryFilters": [
            {
                "filter": "prod-*",
                "filterType": "WILDCARD"
            }
        ]
    }'
```

### Configure cross-region ECR scanning

For ECR repositories in different regions:

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::<account>:role/DefenderForCloudRole"
            },
            "Action": [
                "ecr:DescribeRepositories",
                "ecr:ListImages",
                "ecr:DescribeImages",
                "ecr:BatchGetImage"
            ],
            "Resource": "arn:aws:ecr:*:<account>:repository/*"
        }
    ]
}
```

### Scan private ECR repositories

Configure authentication for private repositories:

```bash
# Create Kubernetes secret with ECR credentials
kubectl create secret docker-registry ecr-secret \
    --docker-server=<account-id>.dkr.ecr.<region>.amazonaws.com \
    --docker-username=AWS \
    --docker-password=$(aws ecr get-login-password) \
    -n kube-system
```

## Configure CloudWatch integration

### Customize log collection

Configure which logs to collect:

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: fluent-bit-config
  namespace: kube-system
data:
  parsers.conf: |
    [PARSER]
        Name   json
        Format json
        Time_Key time
        Time_Format %Y-%m-%dT%H:%M:%S.%LZ
  
  filters.conf: |
    [FILTER]
        Name    kubernetes
        Match   kube.*
        Merge_Log On
        K8S-Logging.Parser  On
        K8S-Logging.Exclude On
    
    [FILTER]
        Name    grep
        Match   kube.*
        Exclude log health-check
```

### Configure CloudWatch metrics

Enable custom metrics collection:

```bash
# Deploy CloudWatch agent
kubectl apply -f https://raw.githubusercontent.com/aws-samples/amazon-cloudwatch-container-insights/latest/k8s-deployment-manifest-templates/deployment-mode/daemonset/container-insights-monitoring/cloudwatch-namespace.yaml
```

## Configure security policies

### Deploy AWS-specific policies

Apply EKS security best practices:

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: defender-eks-policies
  namespace: kube-system
data:
  policies: |
    - name: "enforce-imdsv2"
      description: "Enforce IMDSv2 for EC2 instances"
      enforcement: true
    - name: "require-eks-pod-identity"
      description: "Require EKS Pod Identity for service accounts"
      enforcement: false
    - name: "block-public-load-balancers"
      description: "Prevent creation of public load balancers"
      enforcement: true
```

### Configure Pod Security Standards

Enable Pod Security Standards for EKS:

```bash
# Label namespaces with security standards
kubectl label namespace default \
    pod-security.kubernetes.io/enforce=restricted \
    pod-security.kubernetes.io/audit=restricted \
    pod-security.kubernetes.io/warn=restricted
```

## Configure alerts and notifications

### Set up SNS integration

Configure alerts to AWS SNS:

```bash
# Create SNS topic
aws sns create-topic --name defender-alerts

# Subscribe email
aws sns subscribe \
    --topic-arn arn:aws:sns:<region>:<account>:defender-alerts \
    --protocol email \
    --notification-endpoint <email>
```

### Configure alert filtering

Filter alerts by severity and type:

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: microsoft-defender-alerts-config
  namespace: kube-system
data:
  alertFilters: |
    - severity: ["High", "Critical"]
      forward: true
      destination: "sns"
    - type: ["Privilege Escalation", "Defense Evasion"]
      forward: true
      destination: "cloudwatch"
```

## Configure Fargate support

### Enable Fargate monitoring

For EKS on Fargate:

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: defender-fargate-config
  namespace: kube-system
data:
  fargateConfig: |
    enabled: true
    logConfiguration:
      logDriver: awslogs
      options:
        awslogs-group: /aws/eks/fargate
        awslogs-region: <region>
        awslogs-stream-prefix: defender
```

### Deploy sidecar for Fargate

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: app-with-defender
spec:
  template:
    spec:
      containers:
      - name: app
        image: myapp:latest
      - name: defender-sidecar
        image: mcr.microsoft.com/defender/sensor:latest
        env:
        - name: FARGATE_MODE
          value: "true"
```

## Performance optimization

### Adjust resource limits

```bash
# Update daemonset for resource limits
kubectl patch daemonset microsoft-defender-sensor -n kube-system \
    -p '{"spec":{"template":{"spec":{"containers":[{"name":"defender","resources":{"limits":{"cpu":"200m","memory":"512Mi"},"requests":{"cpu":"100m","memory":"256Mi"}}}]}}}}'
```

### Enable CPU and memory requests and limits

For EKS nodes:

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: kubelet-config
  namespace: kube-system
data:
  kubelet: |
    --cpu-cfs-quota=true
    --cpu-cfs-period=100000
    --enforce-node-allocatable=pods,kubelet
    --system-reserved-cpu=200m
    --system-reserved-memory=512Mi
```

## Troubleshooting

### View Defender for Containers logs

Access logs for troubleshooting:

```bash
kubectl logs -n kube-system daemonset/microsoft-defender-sensor
```

### Common issues and solutions

- **Issue**: Sensor not starting
  - **Solution**: Check if the IAM role is correctly attached to the nodes.

- **Issue**: Alerts not firing
  - **Solution**: Verify SNS topic and subscription configuration.
```