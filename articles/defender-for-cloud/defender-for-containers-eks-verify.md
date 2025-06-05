---
title: Verify Defender for Containers deployment on AWS (EKS)
description: Learn how to verify that Microsoft Defender for Containers is properly deployed on your EKS clusters.
ms.topic: how-to
ms.date: 06/04/2025
---

# Verify Defender for Containers deployment on AWS (EKS)

After enabling Defender for Containers, verify that all components are properly deployed and functioning on your EKS clusters.

## Verify AWS connector

### Check connector status

1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**
2. Select your AWS connector
3. Verify status shows as **Connected**
4. Check that **Containers** plan is **On**

### Verify CloudFormation stack

```bash
# Check stack status
aws cloudformation describe-stacks \
    --stack-name DefenderContainersEKS \
    --query 'Stacks[0].StackStatus'

# List stack resources
aws cloudformation list-stack-resources \
    --stack-name DefenderContainersEKS
```

## Verify sensor deployment

### Check DaemonSet status

```bash
# Verify sensor DaemonSet
kubectl get daemonset -n kube-system microsoft-defender-sensor

# Expected output:
# NAME                        DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR   AGE
# microsoft-defender-sensor   3         3         3       3            3           <none>          5m
```

### Check pod status

```bash
# List Defender pods
kubectl get pods -n kube-system -l app=microsoft-defender

# Check pod details
kubectl describe pods -n kube-system -l app=microsoft-defender
```

### Verify pod logs

```bash
# Check recent logs
kubectl logs -n kube-system -l app=microsoft-defender --tail=100

# Look for successful connection
kubectl logs -n kube-system -l app=microsoft-defender | grep "Successfully connected to Azure"
```

## Verify IAM configuration

### Check service account

```bash
# Verify service account
kubectl get sa microsoft-defender -n kube-system -o yaml

# Check IAM role annotation
kubectl get sa microsoft-defender -n kube-system \
    -o jsonpath='{.metadata.annotations.eks\.amazonaws\.com/role-arn}'
```

### Test IAM role

```bash
# Get pod name
POD=$(kubectl get pods -n kube-system -l app=microsoft-defender -o jsonpath='{.items[0].metadata.name}')

# Test AWS API access
kubectl exec -n kube-system $POD -- aws sts get-caller-identity
```

## Verify ECR scanning

### Check ECR configuration

```bash
# Verify enhanced scanning
aws ecr describe-registry \
    --query 'scanningConfiguration'

# Check repository scanning
aws ecr describe-repositories \
    --query 'repositories[*].[repositoryName,imageScanningConfiguration]'
```

### Test image scanning

```bash
# Push a test image
docker pull nginx:latest
docker tag nginx:latest <account>.dkr.ecr.<region>.amazonaws.com/test:latest
docker push <account>.dkr.ecr.<region>.amazonaws.com/test:latest

# Check scan results (wait 2-3 minutes)
aws ecr describe-image-scan-findings \
    --repository-name test \
    --image-id imageTag=latest
```

## Verify CloudWatch integration

### Check log groups

```bash
# List Defender log groups
aws logs describe-log-groups \
    --log-group-name-prefix "/aws/containerinsights"

# Check log streams
aws logs describe-log-streams \
    --log-group-name "/aws/containerinsights/<cluster-name>/defender"
```

### Query logs

```bash
# Get recent logs
aws logs filter-log-events \
    --log-group-name "/aws/containerinsights/<cluster-name>/defender" \
    --start-time $(date -u -d '5 minutes ago' +%s)000
```

## Verify data in Defender for Cloud

### Check cluster visibility

1. Navigate to **Microsoft Defender for Cloud** > **Inventory**
2. Filter by **Resource type** = **Kubernetes service**
3. Verify your EKS clusters appear

### Verify security alerts

Generate a test alert:

```bash
# This triggers a benign test alert
kubectl run test-alert \
    --image=nginx \
    --rm -it \
    --restart=Never \
    -- /bin/sh -c "curl http://testmynids.org/uid/index.html"
```

Check for alerts in Defender for Cloud within 5-10 minutes.

### Check recommendations

1. Navigate to **Recommendations**
2. Filter by **Resource type** = **Kubernetes service**
3. Look for EKS-specific recommendations

## Verify Fargate deployment

For Fargate profiles:

```bash
# List Fargate profiles
aws eks list-fargate-profiles --cluster-name <cluster-name>

# Check Fargate pods
kubectl get pods --all-namespaces -o json | \
    jq -r '.items[] | select(.spec.nodeName | startswith("fargate")) | 
    "\(.metadata.namespace)/\(.metadata.name)"'
```

## Common verification issues

### Sensor pods in CrashLoopBackOff

```bash
# Check pod events
kubectl describe pod <pod-name> -n kube-system

# Common causes:
# - IAM role misconfiguration
# - Network connectivity issues
# - Resource constraints
```

### No data in Defender

1. Verify AWS connector is healthy
2. Check CloudWatch log group exists
3. Ensure IAM roles have correct permissions
4. Verify network connectivity to Azure

### Missing ECR scan results

```bash
# Verify Inspector is enabled
aws inspector2 list-coverage \
    --filter-criteria '{"resourceType":[{"comparison":"EQUALS","value":"ECR"}]}'
```

### Test Binary Authorization

```bash
# Create a test policy
cat <<EOF > /tmp/binary-auth-policy.yaml
apiVersion: binaryauthorization.grafeas.io/v1beta1
kind: Policy
metadata:
  name: binary-authorization-policy
spec:
  globalPolicyEvaluationMode: ENABLE
  defaultAdmissionRule:
    evaluationMode: REQUIRE_ATTESTATION
    enforcementMode: ENFORCED_BLOCK_AND_AUDIT_LOG
    requireAttestationsBy:
    - projects/PROJECT_ID/attestors/prod-attestor
EOF

# Apply the policy
kubectl apply -f /tmp/binary-auth-policy.yaml

# Test with unsigned image (should fail)
kubectl run test-unsigned --image=nginx:latest

# Check audit logs
kubectl logs -n kube-system -l component=admission-controller
```

## Monitor performance impact

Defender for Containers is designed to have minimal performance impact. However, monitor your clusters for any unusual behavior or performance issues after deployment.

### Check resource usage

```bash
# Monitor node resource usage
kubectl top nodes

# Monitor pod resource usage
kubectl top pods --all-namespaces
```

### Review Defender metrics

In **Microsoft Defender for Cloud** > **Security policy** > **Kubernetes**, review the metrics and recommendations for your clusters.

## Next steps

- Explore **Microsoft Defender for Cloud** features for Kubernetes.
- Set up alerts and automation for security events.
- Regularly review and optimize your security posture.