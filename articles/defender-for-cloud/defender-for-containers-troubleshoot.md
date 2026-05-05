---
title: Troubleshoot Microsoft Defender for Containers
description: Troubleshoot common deployment and post-deployment issues in Microsoft Defender for Containers across supported Kubernetes environments.
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
  - **Symptoms:** `kubectl get pods -n kube-system -l app=defender` shows **Defender sensor** pods in `Pending`, `CrashLoopBackOff`, or `Error`.
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

- **Missing vulnerability findings for images in Azure Container Registry**
  - **Symptoms:** Vulnerability findings don't appear for images stored in Azure Container Registry.
  - **Resolution:**
    - **Registry scanning:** Confirm that the relevant registry scanning capability is enabled for Defender for Containers. In the Azure portal, verify that **Registry access** is enabled for the relevant scope.
    - **Further investigation:** If registry scanning is enabled and findings are still missing, open a support case with the registry name, image name, image digest, and expected finding details.

- **Missing vulnerability findings for images running on AKS clusters**
  - **Symptoms:** Vulnerability findings don't appear for images that are currently running in AKS workloads.
  - **Resolution:**
    - **Vulnerability scanning:** Confirm that the relevant vulnerability scanning capability is enabled for Defender for Containers. Runtime vulnerability findings depend on available scan results for the running image, such as registry scan or disk scan results.
    - **Pod inventory collection:** Confirm that pod inventory collection is enabled for the cluster. For AKS, pod inventory can be collected by the Defender sensor or by agentless collection, depending on the deployment configuration.
    - **Further investigation:** If vulnerability scanning and pod inventory collection are enabled but findings are still missing, open a support case with the cluster name, namespace, workload name, image name, and image digest.

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
    `aws eks update-cluster-config --name <cluster-name> --logging '{"clusterLogging":[{"types":["audit","authenticator"],"enabled":true}]}'`
  - **SQS Configuration:** Verify that CloudTrail is correctly sending logs to the SQS queue used by the connector. Verify that the SQS ARN is accurate in the connector settings.

# [Google Kubernetes Engine (GKE)](#tab/gke)

### Posture and Discovery

- **GKE Autopilot limitations**
  - > [!IMPORTANT]
    > On GKE Autopilot clusters, you cannot manually configure or override resource limits for the Defender sensor. The sensor is designed to request the minimum resources required by Autopilot's specialized scheduling automatically.

- **Service Account errors**
  - **Service Account Email:** Confirm the Service Account email in the Azure portal matches the email generated in the GCP console.
  - **IAM Roles:** Ensure the Service Account has the `container.viewer` and `container.clusters.update` roles at the project level.

### Registry assessment issues

- **Missing vulnerability findings in Artifact Registry**
  - **Symptoms:** Vulnerability findings don't appear for images stored in Google Artifact Registry.
  - **Resolution:**
    - **Registry scanning:** Confirm that the relevant registry scanning capability is enabled for Defender for Containers. In the GCP connector settings, verify that **Registry access** is enabled.
    - **Further investigation:** If registry scanning is enabled and findings are still missing, open a support case with the registry name, image name, image digest, and expected finding details.

- **Missing vulnerability findings for images running on GKE clusters**
  - **Symptoms:** Vulnerability findings don't appear for images that are currently running in GKE workloads.
  - **Resolution:**
    - **Vulnerability scanning:** Confirm that the relevant vulnerability scanning capability is enabled for Defender for Containers. Runtime vulnerability findings depend on available scan results for the running image, such as registry scan or disk scan results.
    - **Pod inventory collection:** Confirm that pod inventory collection is enabled for the cluster.
    - **Further investigation:** If vulnerability scanning and pod inventory collection are enabled but findings are still missing, open a support case with the cluster name, namespace, workload name, image name, and image digest.

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
  - **Resolution:**
    - **MCR Connectivity:** Verify nodes can reach `mcr.microsoft.com` to pull the **Defender sensor** image.
    - **Namespace conflicts:** Ensure no other security solutions or admission controllers are interfering with the `mdc` namespace.

---

## Verification via alert simulation

Use the [Kubernetes alerts simulation tool](alerts-containers.md#kubernetes-alerts-simulation-tool) to verify that Defender for Containers can generate alerts for your cluster and send them to Defender for Cloud.

## Related content

- [Deploy Defender sensor and Azure Policy to clusters using Azure CLI](defender-for-containers-deploy-azure-cli.md).

- [Install Defender sensor using Helm](deploy-helm.md).
