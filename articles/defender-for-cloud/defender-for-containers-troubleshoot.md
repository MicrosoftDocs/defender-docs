---
title: Troubleshoot Defender for Containers on AWS (EKS)
description: Troubleshoot common issues when deploying or operating Microsoft Defender for Containers on Amazon Elastic Kubernetes Service (EKS).
author: Elazark
ms.author: elkrieger
ms.topic: troubleshooting
ms.date: 01/13/2026
---

# Troubleshoot Microsoft Defender for Containers

This article provides troubleshooting guidance for common deployment and operational issues in Microsoft Defender for Containers across all supported environments.

# [Azure Kubernetes Service (AKS)](#tab/aks)

### Common deployment issues

- **Defender sensor installation fails**
  - **Symptoms:** `kubectl get pods -n kube-system -l app=microsoft-defender` shows **Defender sensor** pods in `Pending`, `CrashLoopBackOff`, or `Error`.
  - **Resolution:**
    - **Insufficient resources:** Check node capacity. Use `kubectl top nodes` to verify if nodes have enough CPU and memory to schedule the sensor.
    - **Network egress:** Verify your cluster firewall or NSG allows outbound traffic to the [required FQDNs](defender-for-containers-azure-overview.md#prerequisites). 
    - **Taints and Tolerations:** Ensure node taints aren't preventing the pods from scheduling on specific node pools.

- **Missing recommendations**
  - **Symptoms:** Clusters show as "Healthy" but specific recommendations like "AKS clusters should have **Defender profile** enabled" are missing.
  - **Resolution:**
    - **Wait time:** Assessment scans can take up to 24 hours to reflect in the dashboard.
    - **Exclusion tags:** Check if the resource has the tag `ms_defender_container_exclude_sensors` = `true`.
    - **Policy Add-on:** Ensure the Azure Policy add-on is installed; without it, configuration-based recommendations will not trigger.

### Vulnerability scan issues

- **No scan results for images in ACR** - **Registry Access:** Confirm the **Registry access** toggle is set to **On** in your subscription's Containers plan settings.
  - **Image push:** Vulnerability scans are triggered by a push to the registry. If no recent push has occurred, the scan may not be present.
  - **Supported OS:** Verify the image uses a supported Linux or Windows distribution for scanning.

# [Amazon Elastic Kubernetes Service (EKS)](#tab/eks)

### Connector and Discovery

- **AWS connector disconnected**
  - **CloudFormation status:** Check the AWS CloudFormation console to ensure the onboarding stack is in the `CREATE_COMPLETE` state.
  - **Permissions:** Verify the `MDCContainersAgentlessDiscoveryK8sRole` role has not been modified. This role is required for Defender for Cloud to discover your clusters via the EKS API.

- **EKS clusters not appearing in inventory**
  - **Kubernetes API access:** Ensure this component is toggled **On** in the AWS connector settings.
  - **IAM identity mapping:** Ensure the `aws-auth` ConfigMap has been updated to include the Defender for Cloud role, or that an **EKS Access Entry** has been created for the role.

### Runtime Alerts

- **No control plane alerts generated**
  - **Audit logging:** Audit logs must be enabled for each cluster. Run:
    `aws eks update-cluster-config --name <cluster-name> --logging '{"clusterLogging":[{"types":["audit"],"enabled":true}]}'`
  - **SQS Configuration:** Verify that CloudTrail is correctly sending logs to the SQS queue used by the connector. Check for bolded SQS ARN accuracy in the connector settings.

# [Google Kubernetes Engine (GKE)](#tab/gke)

### Posture and Discovery

- **GKE Autopilot limitations**
  - > [!IMPORTANT]
    > On GKE Autopilot clusters, you cannot manually configure or override resource limits for the Defender sensor. The sensor is designed to request the minimum resources required by Autopilot's specialized scheduling automatically.

- **Service Account errors**
  - **Service Account Email:** Confirm the Service Account email in the Azure portal matches the email generated in the GCP console.
  - **IAM Roles:** Ensure the Service Account has the `container.viewer` and `container.clusters.update` roles at the project level.

### Registry Assessment

- **Missing findings in Artifact Registry**
  - **Registry access:** Confirm this component is enabled in the GCP connector settings.
  - **Audit log scoping:** Ensure GCP audit logging is configured for `SYSTEM`, `WORKLOAD`, and `API_SERVER`. Avoid enabling additional log types unless required by your organization to prevent unnecessary logging costs.

# [Arc-enabled Kubernetes](#tab/arc)

### Arc Connectivity

- **Cluster status "Disconnected"**
  - **Network Egress:** Ensure the cluster can reach the required Azure Arc endpoints on TCP 443.
  - **Time Sync:** Ensure node system time is accurate and synced via NTP. If the node time drifts significantly, the Arc certificate handshake will fail, preventing components from deploying.
  - **Proxy configuration:** If your environment uses a proxy, ensure the Arc agents are configured with the correct `http_proxy` and `https_proxy` settings during the `az connectedk8s connect` step.

### Extension Management

- **Defender extension stuck in "Creating" or "Failed"**
  - **Agent logs:** Check the Arc agent logs for detailed errors:
    `kubectl logs -n azure-arc -l app.kubernetes.io/component=cluster-agent`
  - **Reinstallation:** If the extension remains stuck, delete and recreate it via CLI:
    `az k8s-extension delete --cluster-name <name> --resource-group <rg> --cluster-type connectedClusters --name microsoft.azuredefender.kubernetes`

- **Defender sensor pod "ImagePullBackOff"**
  - **Symptoms:** Pods fail to start with an image pull error.
  - **Resolution:** - **MCR Connectivity:** Verify nodes can reach `mcr.microsoft.com` to pull the **Defender sensor** image.
    - **Namespace conflicts:** Ensure no other security solutions or admission controllers are interfering with the `kube-system` or `mdc` namespaces.

---

## Verification via alert simulation

To verify that your Defender for Containers deployment is successfully sending alerts to Defender for Cloud, run the following command to trigger a harmless test alert:

```bash
kubectl run test-alert --image=nginx --rm -it --restart=Never -- sh -c "echo test > /etc/shadow"
```
Check the **Security alerts** page in the Azure portal. The alert should appear within 10-15 minutes.
