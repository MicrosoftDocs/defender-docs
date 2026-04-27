---
title: Install Defender for Containers sensor using Helm
description: Learn how to install the Microsoft Defender for Containers sensor on Kubernetes clusters using Helm.
author: Elazark
ms.topic: how-to
ms.date: 04/27/2026
ms.author: elkrieger
ai-usage: ai-assisted
---

# Install Defender for Containers sensor by using Helm

This article describes how to install and configure the Microsoft Defender for Containers sensor on AKS, EKS, and GKE clusters by using Helm. You learn about prerequisites, enabling Defender for Containers, and step-by-step deployment instructions for different environments.

Defender for Containers supports multiple deployment models for deploying the sensor, including automatic provisioning and Helm-based installation. Helm-based deployment provides greater control over sensor versioning and upgrade timing, but it shifts some operational responsibility to you. When using Helm-based deployment, consider:

- **Sensor upgrades**: By using Helm-based deployment, you manage sensor upgrades and upgrade timing. Automatic provisioning follows Microsoft-managed rollout schedules.

- **Automatic installation flows**: When deploying the sensor by using Helm, skip automatic installation prompts and recommendations in the Azure portal to avoid conflicts with the existing deployment.

## General prerequisites

Implement all prerequisite requirements for the Defender for Containers sensor as described in the [Defender sensor network requirements](defender-for-containers-enable.md?tabs=aks-deploy-portal%2Ck8s-deploy-asc%2Ck8s-verify-asc%2Ck8s-remove-arc%2Caks-removeprofile-api&pivots=defender-for-container-aks%23network-requirements).

- Enable Defender for Containers in the target subscription or security connector:
    - Azure subscription: [Enable Defender for Containers on AKS via portal](defender-for-containers-azure-enable-portal.md)
    - Amazon Web Services (AWS): [Enable Defender for Containers on AWS (EKS) via portal](defender-for-containers-aws-enable-portal.md)
    - Google Cloud Project (GCP): [Enable Defender for Containers on GCP (GKE) via portal](defender-for-containers-gcp-enable-portal.md)
    - Arc-enabled Kubernetes (ARC): [Enable Defender for Containers on Arc-enabled Kubernetes via portal](defender-for-containers-arc-enable-portal.md)

- Ensure the following components of the Defender for Containers plan are enabled:
   - Defender sensor
  - Kubernetes API access
    
- For Multicloud environments (AWS or GCP), ensure the **Auto provision Defender's sensor for Azure Arc** toggle is disabled

  - If your environment also contains clusters that need auto-provisioning, keep the toggle enabled, and apply the tag **ms_defender_e2e_discovery_exclude=true** to clusters you intend to deploy the sensor onto with helm.
    
- Your environment may have policy assignments that can cause the generally available version of the Sensor to deploy. We recommend checking for and removing the conflicting policies before proceeding with the installation:

 The policy definition ID is `64def556-fbad-4622-930e-72d1d5589bf5`. 

 Review [the list of policy definitions for your subscription](https://ms.portal.azure.com/#view/Microsoft_Azure_Policy/PolicyMenuBlade/~/Definitions), and search for this policy assignment to remove it.

## Install the Helm chart

#### Installation

Defender for Containers Helm charts are published to mcr.microsoft.com/azuredefender/microsoft-defender-for-containers

You may list the published versions by running


```bash
curl https://mcr.microsoft.com/v2/azuredefender/dev/microsoft-defender-for-containers/tags/list
```

You may install a version by running 


```bash
helm install defender-k8s 
```

In order to identify your cluster, you must set one of the nodes of global.cloudIdentifiers, based on which cloud environment the cluster is running in, for example


```bash
helm install defender-k8s 
    --set global.cloudIdentifiers.Azure.subscriptionId="$CLUSTERSUBSCRIPTIONID" \
    --set global.cloudIdentifiers.Azure.resourceGroupName="$CLUSTERRG" \
    --set global.cloudIdentifiers.Azure.clusterName="$CLUSTERNAME" \
    --set global.cloudIdentifiers.Azure.region="$CLUSTERREGION"
```


```bash
helm install defender-k8s --create-namespace --namespace mdc oci://mcr.microsoft.com/azuredefender/microsoft-defender-for-containers:tag \
    --set global.cloudIdentifiers.AWS.accountId="$ACCOUNTID" \
    --set global.cloudIdentifiers.AWS.region="$CLUSTERREGION" \
    --set global.cloudIdentifiers.AWS.clusterName="$CLUSTERNAME"

```

```bash
helm install defender-k8s --create-namespace --namespace mdc oci://mcr.microsoft.com/azuredefender/microsoft-defender-for-containers:tag \
    --set global.cloudIdentifiers.GCP.projectId="$ACCOUNTID" \
    --set global.cloudIdentifiers.GCP.location="$CLUSTERLOCATION" \
    --set global.cloudIdentifiers.GCP.clusterName="$CLUSTERNAME"
```

You may find other configuration options for the deployment (like feature flags, or resource limits for pods) by inspecting the values.yaml file for the chart


```
helm pull oci://mcr.microsoft.com/azuredefender/microsoft-defender-for-containers:tag
```

**For** **AKS Automatic only**: set the namespace to kube-system

**For AKS clusters with preexisting deployments of Defender for Containers**: disable the existing deployment as describe [here](/azure/defender-for-cloud/defender-for-containers-azure-configure), and remove any leftover resoures by running


```bash
kubectl delete crd/policies.defender.microsoft.com || true
kubectl delete crd/runtimepolicies.defender.microsoft.com || true
kubectl delete crd/securityartifactpolicies.defender.microsoft.com || true
kubectl delete ClusterRole defender-admission-controller-cluster-role || true
kubectl delete ClusterRole defender-admission-controller-resource-cluster-role || true
kubectl delete ClusterRoleBinding defender-admission-controller-cluster-role-binding || true
kubectl delete ClusterRoleBinding defender-admission-controller-cluster-resource-role-binding || true
```

---

### Verify the installation

Verify that the installation succeeded by using the namespace you used during installation:

**For standard AKS, EKS, and GKE:**

```bash
helm list --namespace mdc
```

**For AKS Automatic:**

```bash
helm list --namespace kube-system
```

The installation is successful if the `STATUS` field displays **deployed**.

## Configure security rules for gated deployment

> [!NOTE]
> Kubernetes gated deployment is supported on AKS Automatic clusters only when the sensor is installed by using Helm in the `kube-system` namespace. Add-on deployment isn’t supported for this scenario.

> [!IMPORTANT]
> **Subscription Support Warning**:
> When you create rules, your selected subscription might show as `not supported for Gated deployment`. This status occurs because you installed the Defender for Containers components by using Helm rather than through the dashboard's automatic installation.

Define security rules to control what you can deploy into your Kubernetes clusters. These rules help you block or audit container images based on security criteria, such as images with too many vulnerabilities. 

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to the **Defender for Cloud** > **Environment settings**.

1. Select **Security rules**.

1. Select **Gated deployment** > **Vulnerability assessment**.

1. Select a rule to edit it or select **+ Add rule** to create a new one.

## Handle existing recommendations

> [!IMPORTANT]
> If you set up the sensor by using Helm, **ignore** existing recommendations.

Depending on your deployment type, select the relevant recommendation to view any existing recommendations in the Azure portal:

- **Azure**: [Azure Kubernetes Service clusters should have Defender profile enabled - Microsoft Azure](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/GenericRecommendationDetailsBlade/assessmentKey/56a83a6e-c417-42ec-b567-1e6fcb3d09a9/showSecurityCenterCommandBar~/false)

    :::image type="content" source="media/deploy-helm/recommendation-aks.png" alt-text="Screenshot of the Azure portal that shows the Defender profile recommendation for AKS. The screenshot highlights the recommendation to enable the Defender profile." lightbox="media/deploy-helm/recommendation-aks.png":::

- **Multicloud**: [Azure Arc-enabled Kubernetes clusters should have the Defender extension installed - Microsoft Azure](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/GenericRecommendationDetailsBlade/assessmentKey/3ef9848c-c2c8-4ff3-8b9c-4c8eb8ddfce6/showSecurityCenterCommandBar~/false)

    :::image type="content" source="media/deploy-helm/recommendation-arc.png" alt-text="Screenshot of the Azure portal that shows the Defender extension recommendation for Arc-enabled Kubernetes clusters. The screenshot highlights the recommendation to install the Defender extension." lightbox="media/deploy-helm/recommendation-arc.png":::

## Upgrade an existing Helm-based deployment

With Helm-based deployment, you manage sensor upgrades. Defender for Cloud doesn't automatically apply them.

Run the following command to update an existing Helm-based deployment:

```bash
helm upgrade microsoft-defender-for-containers \
oci://mcr.microsoft.com/azuredefender/microsoft-defender-for-containers:tag \
--reuse-values
```

## Related content

- [Common questions about protecting containers](faq-defender-for-containers.yml)