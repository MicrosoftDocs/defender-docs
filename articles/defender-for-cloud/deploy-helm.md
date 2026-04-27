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

This article describes how to install and configure the Microsoft Defender for Containers sensor on AKS, EKS, and GKE clusters by using Helm.

Defender for Containers supports multiple deployment models for deploying the sensor, including automatic provisioning and Helm-based installation. Helm-based deployment provides greater control over sensor versioning and upgrade timing, but it shifts some operational responsibility to you. When using Helm-based deployment, consider:

- **Sensor upgrades**: By using Helm-based deployment, you manage sensor upgrades and upgrade timing. Automatic provisioning follows Microsoft-managed rollout schedules.

- **Automatic installation flows**: When deploying the sensor by using Helm, skip automatic installation prompts and recommendations in the Azure portal to avoid conflicts with the existing deployment.

## General prerequisites

Before you install the sensor by using Helm, make sure that:

- You implement all prerequisite requirements for the Defender for Containers sensor as described in the [Defender sensor network requirements](defender-for-containers-enable.md?tabs=aks-deploy-portal%2Ck8s-deploy-asc%2Ck8s-verify-asc%2Ck8s-remove-arc%2Caks-removeprofile-api&pivots=defender-for-container-aks%23network-requirements).

- Defender for Containers is enabled in the target subscription or security connector:

  - Azure subscription: [Enable Defender for Containers on AKS via portal](defender-for-containers-azure-enable-portal.md)
  - Amazon Web Services (AWS): [Enable Defender for Containers on AWS (EKS) via portal](defender-for-containers-aws-enable-portal.md)
  - Google Cloud Project (GCP): [Enable Defender for Containers on GCP (GKE) via portal](defender-for-containers-gcp-enable-portal.md)
  - Arc-enabled Kubernetes: [Enable Defender for Containers on Arc-enabled Kubernetes via portal](defender-for-containers-arc-enable-portal.md)

- The following components of the Defender for Containers plan are enabled:

  - Defender sensor
  - Kubernetes API access

- **For AWS and GCP environments:** make sure the **Auto provision Defender's sensor for Azure Arc** toggle is disabled.

    If you want to keep automatic provisioning enabled for other Arc-enabled clusters in the AWS account or GCP project, apply the `ms_defender_e2e_discovery_exclude=true` tag to clusters where you intend to deploy the sensor by using Helm.

- Your environment doesn't have conflicting policy assignments that can deploy the generally available version of the sensor.

  Review policy assignments that use the following policy definition ID, and remove any conflicting assignments:

  `64def556-fbad-4622-930e-72d1d5589bf5`

  To review policy definitions, go to [Policy definitions in the Azure portal](https://ms.portal.azure.com/#view/Microsoft_Azure_Policy/PolicyMenuBlade/~/Definitions), and search for the policy definition ID.

## Install the Helm chart

Defender for Containers Helm charts are published to `mcr.microsoft.com/azuredefender/microsoft-defender-for-containers`.

The chart requires cluster identifier values under `global.cloudIdentifiers`. You can provide these values inline with `--set`, as shown in the following examples, or by using a values file.

To install the latest chart version, use the base Helm install command. Provide the required `global.cloudIdentifiers` values by using a values file or inline with `--set`, as shown in the environment-specific examples:

```bash
helm install defender-k8s oci://mcr.microsoft.com/azuredefender/microsoft-defender-for-containers
```

You can list the published versions by running the following command:

```bash
curl https://mcr.microsoft.com/v2/azuredefender/microsoft-defender-for-containers/tags/list
```

To install a specific version, include the version tag:

```bash
helm install defender-k8s oci://mcr.microsoft.com/azuredefender/microsoft-defender-for-containers:<tag>
```

To inspect configurable chart values, such as feature flags or pod resource limits, pull the chart and review the `values.yaml` file:

```bash
helm pull oci://mcr.microsoft.com/azuredefender/microsoft-defender-for-containers
```

Use the relevant tab to install the sensor for your environment.

# [AKS](#tab/aks)

For standard AKS clusters, use the `mdc` namespace.

For AKS Automatic clusters, use the `kube-system` namespace.

If your AKS cluster already has an existing Defender for Containers deployment, disable the existing deployment as described in [Configure Defender for Containers for Azure](/azure/defender-for-cloud/defender-for-containers-azure-configure), and remove any leftover resources by running the following commands:

```bash
kubectl delete crd/policies.defender.microsoft.com || true
kubectl delete crd/runtimepolicies.defender.microsoft.com || true
kubectl delete crd/securityartifactpolicies.defender.microsoft.com || true
kubectl delete ClusterRole defender-admission-controller-cluster-role || true
kubectl delete ClusterRole defender-admission-controller-resource-cluster-role || true
kubectl delete ClusterRoleBinding defender-admission-controller-cluster-role-binding || true
kubectl delete ClusterRoleBinding defender-admission-controller-cluster-resource-role-binding || true
```

Install the sensor:

```bash
helm install defender-k8s oci://mcr.microsoft.com/azuredefender/microsoft-defender-for-containers \
    --create-namespace --namespace <namespace> \
    --set global.cloudIdentifiers.Azure.subscriptionId="<cluster-subscription-id>" \
    --set global.cloudIdentifiers.Azure.resourceGroupName="<cluster-resource-group>" \
    --set global.cloudIdentifiers.Azure.clusterName="<cluster-name>" \
    --set global.cloudIdentifiers.Azure.region="<cluster-region>"
```

Replace `<namespace>` with:

- `mdc` for standard AKS clusters.
- `kube-system` for AKS Automatic clusters.

# [EKS](#tab/eks)

Install the sensor:

```bash
helm install defender-k8s oci://mcr.microsoft.com/azuredefender/microsoft-defender-for-containers \
    --create-namespace --namespace mdc \
    --set global.cloudIdentifiers.AWS.accountId="<aws-account-id>" \
    --set global.cloudIdentifiers.AWS.region="<cluster-region>" \
    --set global.cloudIdentifiers.AWS.clusterName="<cluster-name>"
```

# [GKE](#tab/gke)

Install the sensor:

```bash
helm install defender-k8s oci://mcr.microsoft.com/azuredefender/microsoft-defender-for-containers \
    --create-namespace --namespace mdc \
    --set global.cloudIdentifiers.GCP.projectId="<gcp-project-id>" \
    --set global.cloudIdentifiers.GCP.location="<cluster-location>" \
    --set global.cloudIdentifiers.GCP.clusterName="<cluster-name>"
```

---

## Verify the installation

Verify that the installation succeeded by using the namespace you used during installation.

# [Standard AKS, EKS, and GKE](#tab/standard)

```bash
helm list --namespace mdc
```

# [AKS Automatic](#tab/aks-automatic)

```bash
helm list --namespace kube-system
```

---

The installation is successful if the `STATUS` field displays `deployed`.

## Configure security rules for gated deployment

> [!NOTE]
> Kubernetes gated deployment is supported on AKS Automatic clusters only when the sensor is installed by using Helm in the `kube-system` namespace. Add-on deployment isn’t supported for this scenario.

> [!IMPORTANT]
> When you create rules, the selected subscription might show as `not supported for Gated deployment`. This status occurs because you installed the Defender for Containers components by using Helm rather than through the dashboard's automatic installation.

Define security rules to control what you can deploy into your Kubernetes clusters. These rules help you block or audit container images based on security criteria, such as images with too many vulnerabilities.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Defender for Cloud** > **Environment settings**.

1. Select **Security rules**.

1. Select **Gated deployment** > **Vulnerability assessment**.

1. Select a rule to edit it, or select **+ Add rule** to create a new one.

## Handle existing recommendations

> [!IMPORTANT]
> If you install the sensor by using Helm, don't use existing Defender for Cloud recommendations to install the Defender profile or Arc extension for the same cluster. Remediating these recommendations can create a conflicting deployment.

Depending on your deployment type, the following recommendations might still appear in Defender for Cloud:

- **Azure**: [Azure Kubernetes Service clusters should have Defender profile enabled - Microsoft Azure](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/GenericRecommendationDetailsBlade/assessmentKey/56a83a6e-c417-42ec-b567-1e6fcb3d09a9/showSecurityCenterCommandBar~/false)

    :::image type="content" source="media/deploy-helm/recommendation-aks.png" alt-text="Screenshot of the Azure portal that shows the Defender profile recommendation for AKS." lightbox="media/deploy-helm/recommendation-aks.png":::

- **Arc-enabled Kubernetes clusters**: [Azure Arc-enabled Kubernetes clusters should have the Defender extension installed - Microsoft Azure](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/GenericRecommendationDetailsBlade/assessmentKey/3ef9848c-c2c8-4ff3-8b9c-4c8eb8ddfce6/showSecurityCenterCommandBar~/false)

    :::image type="content" source="media/deploy-helm/recommendation-arc.png" alt-text="Screenshot of the Azure portal that shows the Defender extension recommendation for Arc-enabled Kubernetes clusters." lightbox="media/deploy-helm/recommendation-arc.png":::

## Upgrade an existing Helm-based deployment

With Helm-based deployment, you manage sensor upgrades. Defender for Cloud doesn't automatically apply them.

Run the following command to update an existing Helm-based deployment. Use the namespace you used during installation.

```bash
helm upgrade defender-k8s \
    oci://mcr.microsoft.com/azuredefender/microsoft-defender-for-containers \
    --namespace <namespace> \
    --reuse-values
```

For `<namespace>`, use:

- `mdc` for standard AKS, EKS, and GKE clusters.
- `kube-system` for AKS Automatic clusters.

## Related content

- [Common questions about protecting containers](faq-defender-for-containers.yml)