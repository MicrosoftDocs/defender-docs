---
title: Verify Defender for Containers deployment
description: Learn how to verify that Microsoft Defender for Containers sensors and extensions are running correctly on Kubernetes clusters.
ms.topic: how-to
ms.author: elkrieger
author: Elazark
ms.date: 03/12/2026
---

---
title: Verify Defender for Containers deployment
description: Learn how to verify that Microsoft Defender for Containers sensors and extensions are running correctly on Kubernetes clusters.
ms.topic: how-to
ms.author: elkrieger
author: Elazark
ms.date: 03/12/2026
---

# Verify Defender for Containers deployment

After deploying Microsoft Defender for Containers components, verify that the sensor and related extensions are running correctly on your cluster.

## Verify recommendation health

If you deployed Defender components by remediating a security recommendation:

1. In the Azure portal, go to **Microsoft Defender for Cloud** > **Recommendations**.

2. Locate the relevant recommendation.

3. Confirm that the recommendation status changes to **Healthy**.

## Verify Defender sensor deployment on AKS

To verify that the Defender sensor is enabled on an Azure Kubernetes Service (AKS) cluster, run the following command:

```azurecli
az aks show \
  --name <aks-cluster-name> \
  --resource-group <resource-group> \
  --query "securityProfile.defender.securityMonitoring.enabled"
```

The output should be `true`.

## Verify Azure Policy add-on on AKS

To verify that the Azure Policy add-on is enabled:

```azurecli
az aks show \
  --name <aks-cluster-name> \
  --resource-group <resource-group> \
  --query addonProfiles.azurepolicy
```

The output should show `enabled: true`.

## Verify extension installation for Arc-enabled clusters

For Amazon EKS, Google Kubernetes Engine (GKE), and Arc-enabled Kubernetes clusters, Defender components are installed as Azure Arc Kubernetes extensions.

To verify extension installation:

1. In the Azure portal, open the **Arc-enabled Kubernetes** resource.

1. Select **Extensions**.

1. Confirm that the following extensions show **Succeeded**:

   - **Microsoft Defender for Containers**
   - **Azure Policy for Kubernetes** (if enabled)

## Verify Defender sensor pods

Verify that the Defender sensor pods are running in the cluster.

```bash
kubectl get pods -n kube-system -l app=microsoft-defender
```

Confirm that the Defender sensor pods are in a `Running` state.

## Verify the Defender DaemonSet (optional)

You can also verify that the Defender DaemonSet is deployed correctly.

```bash
kubectl get ds microsoft-defender-collector-ds -n kube-system
```

Confirm that the **DESIRED**, **CURRENT**, and **READY** values match the number of cluster nodes.

## Related content

- [Enable Defender for Containers](defender-for-containers-enable-portal.md)

- [Deploy Defender sensor using Azure CLI](defender-for-containers-deploy-azure-cli.md)

- [Deploy Defender sensor using security recommendations](defender-for-containers-deploy-recommendations.md)

- [Troubleshoot Defender for Containers](defender-for-containers-troubleshoot.md)