---
title: Deploy Defender for Containers on AWS (EKS)
description: Learn how to enable Microsoft Defender for Containers on Amazon EKS clusters.
ms.topic: how-to
ms.date: 06/04/2025
---

# Deploy Defender for Containers on AWS (EKS)

This article explains how to enable Microsoft Defender for Containers on your Amazon EKS clusters.

## Prerequisites

[!INCLUDE[defender-for-containers-prerequisites](includes/defender-for-containers-prerequisites.md)]

- AWS account connected to Microsoft Defender for Cloud
- EKS cluster running version 1.19 or later
- AWS CLI and kubectl configured
- IAM permissions to create roles and deploy CloudFormation

## Step 1: Connect AWS account

If you haven't already connected your AWS account:

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**
2. Select **Add environment** > **Amazon Web Services**
3. Follow the onboarding wizard

## Step 2: Enable Defender for Containers

### Using Azure portal

1. In **Microsoft Defender for Cloud** > **Environment settings**
2. Select your AWS connector
3. Toggle **Containers** to **On**
4. Select **Configure** and enable:
   - Runtime threat protection
   - Agentless discovery for Kubernetes
   - ECR vulnerability scanning
5. Select **Save**

### Using CloudFormation

Deploy the CloudFormation stack:

```bash
# Download the template
curl -o defender-containers-eks.yaml https://aka.ms/defender-containers-eks-cloudformation

# Deploy the stack
aws cloudformation create-stack \
    --stack-name DefenderContainersEKS \
    --template-body file://defender-containers-eks.yaml \
    --parameters \
        ParameterKey=DefenderForCloudRoleArn,ParameterValue=<connector-role-arn> \
        ParameterKey=EKSClusterName,ParameterValue=<cluster-name> \
    --capabilities CAPABILITY_NAMED_IAM
```

## Step 3: Deploy Defender sensor

### Automatic deployment

The Defender sensor is automatically deployed through the AWS connector. To verify:

```bash
# Check if sensor is deployed
kubectl get daemonset -n kube-system | grep defender
```

### Manual deployment

If automatic deployment doesn't occur:

```bash
# Get the deployment manifest
curl -o defender-sensor-eks.yaml https://aka.ms/defender-sensor-eks

# Update with your cluster details
sed -i 's/<CLUSTER_NAME>/<your-cluster-name>/g' defender-sensor-eks.yaml
sed -i 's/<REGION>/<your-region>/g' defender-sensor-eks.yaml

# Apply the manifest
kubectl apply -f defender-sensor-eks.yaml
```

## Step 4: Configure IAM roles

### Create IAM role for Defender

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Federated": "arn:aws:iam::<account>:oidc-provider/<oidc-provider>"
            },
            "Action": "sts:AssumeRoleWithWebIdentity",
            "Condition": {
                "StringEquals": {
                    "<oidc-provider>:sub": "system:serviceaccount:kube-system:microsoft-defender"
                }
            }
        }
    ]
}
```

### Attach policies

```bash
# Create the role
aws iam create-role \
    --role-name DefenderForContainersEKSRole \
    --assume-role-policy-document file://trust-policy.json

# Attach required policies
aws iam attach-role-policy \
    --role-name DefenderForContainersEKSRole \
    --policy-arn arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy

aws iam attach-role-policy \
    --role-name DefenderForContainersEKSRole \
    --policy-arn arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly
```

## Step 5: Configure ECR scanning

### Enable enhanced scanning

```bash
# Enable enhanced scanning with Inspector
aws ecr put-registry-scanning-configuration \
    --scan-type ENHANCED \
    --region <region>
```

### Configure repository scanning

```bash
# Enable scanning for specific repositories
aws ecr put-image-scanning-configuration \
    --repository-name <repo-name> \
    --image-scanning-configuration scanOnPush=true
```

## Step 6: Configure CloudWatch integration

### Create log group

```bash
# Create CloudWatch log group
aws logs create-log-group \
    --log-group-name /aws/containerinsights/<cluster-name>/defender
```

### Enable EKS control plane logging

```bash
# Enable audit logs
aws eks update-cluster-config \
    --name <cluster-name> \
    --logging '{"clusterLogging":[{"types":["api","audit","authenticator","controllerManager","scheduler"],"enabled":true}]}'
```

## Deploy for Fargate

For EKS on Fargate, deploy as a sidecar:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: app-with-defender
spec:
  template:
    spec:
      serviceAccountName: microsoft-defender
      containers:
      - name: app
        image: myapp:latest
      - name: defender-sidecar
        image: mcr.microsoft.com/defender-for-cloud/stable/defender-for-containers:latest
        env:
        - name: FARGATE_MODE
          value: "true"
        - name: CLUSTER_NAME
          value: "<cluster-name>"
```

## Verify deployment

### Check sensor status

```bash
# Verify DaemonSet
kubectl get ds -n kube-system microsoft-defender-sensor

# Check pod logs
kubectl logs -n kube-system -l app=microsoft-defender --tail=50
```

### Test connection to Azure

```bash
# Check Azure connectivity
kubectl exec -n kube-system <defender-pod> -- nslookup ods.opinsights.azure.com
```

## Configure for specific scenarios

### Private EKS clusters

For private clusters, configure VPC endpoints:

```bash
# Create VPC endpoints for required services
aws ec2 create-vpc-endpoint \
    --vpc-id <vpc-id> \
    --service-name com.amazonaws.<region>.logs \
    --route-table-ids <route-table-id>
```

### Multiple clusters

Deploy to multiple clusters using AWS Systems Manager:

```bash
# Store configuration in Parameter Store
aws ssm put-parameter \
    --name /DefenderForContainers/Config \
    --value file://defender-config.json \
    --type SecureString

# Deploy across clusters
for cluster in cluster1 cluster2 cluster3; do
    kubectl config use-context $cluster
    kubectl apply -f defender-sensor-eks.yaml
done
```

## Troubleshooting

### Sensor not starting

```bash
# Check IAM role
aws sts assume-role-with-web-identity \
    --role-arn <role-arn> \
    --role-session-name test \
    --web-identity-token <token>

# Check security groups
aws ec2 describe-security-groups \
    --group-ids <sg-id>
```

### No data in Defender

1. Verify CloudWatch logs are enabled
2. Check IAM permissions
3. Ensure outbound connectivity to Azure endpoints

## Next steps

- [Verify your Defender for Containers deployment](defender-for-containers-eks-verify.md)
- [Configure Defender for Containers settings](defender-for-containers-eks-configure.md)
- [Monitor EKS security with Defender for Cloud](defender-for-containers-eks-overview.md)