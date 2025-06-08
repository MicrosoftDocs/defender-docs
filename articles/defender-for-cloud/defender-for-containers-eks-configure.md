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

### Configure admission control policies

```yaml
# admission-policy.yaml
apiVersion: admissionregistration.k8s.io/v1
kind: ValidatingAdmissionPolicy
metadata:
  name: security-baseline
spec:
  failurePolicy: Fail
  matchConstraints:
    resourceRules:
    - apiGroups: ["apps"]
      apiVersions: ["v1"]
      resources: ["deployments"]
  validations:
  - expression: |
      object.spec.template.spec.containers.all(container,
        !has(container.securityContext) ||
        !has(container.securityContext.privileged) ||
        container.securityContext.privileged == false
      )
    message: "Containers must not run as privileged"
```

### Apply security policies

```bash
# Apply admission policy
kubectl apply -f admission-policy.yaml

# Create policy binding
cat <<EOF | kubectl apply -f -
apiVersion: admissionregistration.k8s.io/v1
kind: ValidatingAdmissionPolicyBinding
metadata:
  name: security-baseline-binding
spec:
  policyName: security-baseline
  validationActions: [Deny]
  matchResources:
    namespaceSelector:
      matchLabels:
        environment: production
EOF
```

## Configure container runtime security

### Enable runtime protection for Fargate

For EKS Fargate pods, configure GuardDuty Runtime Monitoring:

```bash
# Enable GuardDuty Runtime Monitoring
aws guardduty create-detector --enable --features '{
    "Name": "RUNTIME_MONITORING", 
    "Status": "ENABLED",
    "AdditionalConfiguration": [
        {
            "Name": "EKS_ADDON_MANAGEMENT",
            "Status": "ENABLED"
        }
    ]
}'
```

### Configure Bottlerocket security

For Bottlerocket nodes, apply security settings:

```toml
# userdata.toml
[settings.kernel]
lockdown = "integrity"

[settings.host-containers.admin]
enabled = false

[settings.oci-defaults]
capabilities = ["CAP_NET_BIND_SERVICE"]
```

## Monitor and tune performance

### Optimize resource usage

Adjust Defender sensor resources based on cluster size:

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: defender-performance-config
  namespace: kube-system
data:
  performance: |
    cpuLimit: 500m
    memoryLimit: 512Mi
    cpuRequest: 100m
    memoryRequest: 128Mi
    maxEventsPerSecond: 100
    bufferSize: 10000
```

### Configure EKS-specific alerts

Set up custom alerts for EKS events:

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: defender-eks-alerts
  namespace: kube-system
data:
  alerts: |
    - name: "unauthorized-eks-api-call"
      severity: "HIGH"
      enabled: true
    - name: "suspicious-iam-activity"
      severity: "MEDIUM"
      enabled: true
    - name: "exposed-eks-dashboard"
      severity: "HIGH"
      enabled: true
```

## Integrate with AWS services

### Configure AWS Security Hub integration

Enable integration with Security Hub:

```bash
# Enable Security Hub
aws securityhub enable-security-hub

# Enable Defender findings
aws securityhub enable-import-findings-for-product \
    --product-arn arn:aws:securityhub:<region>::product/microsoft/defender-for-cloud
```

### Set up EventBridge rules

Create rules for Defender events:

```json
{
  "Name": "defender-high-severity-alerts",
  "EventPattern": {
    "source": ["microsoft.defender"],
    "detail-type": ["Security Alert"],
    "detail": {
      "severity": ["HIGH", "CRITICAL"]
    }
  },
  "Targets": [
    {
      "Arn": "arn:aws:sns:region:account:security-alerts",
      "Id": "1"
    }
  ]
}
```

## Next steps

- [Verify your configuration](defender-for-containers-eks-verify.md)
- [Defender for Containers support matrix](support-matrix-defender-for-containers.md)
- [Review EKS security best practices](https://aws.amazon.com/architecture/security-identity-compliance/)
