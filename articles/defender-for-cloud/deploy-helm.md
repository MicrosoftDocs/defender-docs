---
title: Configure Defender for Containers sensor deployed with Helm
description: Learn how to configure and manage the Microsoft Defender for Containers sensor after deployment with Helm, including security rules, upgrades, and troubleshooting.
author: dcurwin
ms.topic: how-to
ms.date: 06/16/2025
ms.author: dacurwin
ai-usage: ai-assisted
---

# Configure Defender for Containers sensor deployed with Helm

This article describes how to configure and manage the Microsoft Defender for Containers sensor after you've deployed it using Helm on your Kubernetes clusters.

## Prerequisites

- Defender for Containers plan enabled on your subscription
- Defender sensor already deployed via Helm on your clusters
- Helm version 3.8 or later installed
- Network requirements met as described in [Defender sensor network requirements](defender-for-containers-enable.md?tabs=aks-deploy-portal%2Ck8s-deploy-asc%2Ck8s-verify-asc%2Ck8s-remove-arc%2Caks-removeprofile-api&pivots=defender-for-container-aks%23network-requirements)

## Verify Helm deployment

Run the following command to check that the installation succeeded:

```bash
helm list --namespace mdc
```

The STATUS field should read **deployed**.

## Security rules for gated deployment

Define security rules to control what can be deployed into your Kubernetes clusters. These rules help you block or audit container images based on security criteria, such as images with too many vulnerabilities.

### Accessing security rules

1. Go to the **Microsoft Defender for Cloud (MDC) Dashboard**.
1. In the left navigation pane, select **Environment settings**.
1. Select the **Security rules** tile.

### Configuring vulnerability assessment rules

1. In the Security rules page, go to **Vulnerability assessment** under the **Gated deployment** section.
1. Create or update your security rules.

> [!IMPORTANT]
> For Helm installations:
>
> - **Subscription Support Warning**: When you create rules, you might see a message that your selected subscription isn't supported for Gated deployment. This message appears because you installed the Defender for Containers components with Helm instead of using the dashboard's automatic installation.
> - **Skip Auto-Installation**: If you're prompted to enable gating in the third tab of the security rule edit window, select **Skip**. This option enables auto-installation, which conflicts with your existing Helm deployment.
>
> :::image type="content" source="media/deploy-helm/edit-vulnerability-assessment-rule.png" alt-text="Screenshot showing the third tab of the security rule edit window.":::

## Handle existing recommendations

> [!NOTE]
> If you use Helm to set up the sensor, **ignore** the existing recommendations about provisioning the sensor.

**For AKS**:

[Azure Kubernetes Service clusters should have Defender profile enabled - Microsoft Azure](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/GenericRecommendationDetailsBlade/assessmentKey/56a83a6e-c417-42ec-b567-1e6fcb3d09a9/showSecurityCenterCommandBar~/false)

:::image type="content" source="media/deploy-helm/recommendation-aks.png" alt-text="Screenshot of the Azure portal that shows the Defender profile recommendation for AKS. The screenshot highlights the recommendation to enable the Defender profile." lightbox="media/deploy-helm/recommendation-aks.png":::

**For multicloud**:

[Azure Arc-enabled Kubernetes clusters should have the Defender extension installed - Microsoft Azure](https://ms.portal.azure.com/#view/Microsoft_Azure_Security/GenericRecommendationDetailsBlade/assessmentKey/3ef9848c-c2c8-4ff3-8b9c-4c8eb8ddfce6/showSecurityCenterCommandBar~/false)

:::image type="content" source="media/deploy-helm/recommendation-arc.png" alt-text="Screenshot of the Azure portal that shows the Defender extension recommendation for Arc-enabled Kubernetes clusters. The screenshot highlights the recommendation to install the Defender extension." lightbox="media/deploy-helm/recommendation-arc.png":::

## Upgrade an existing Helm-based deployment

Run the following command to update an existing Helm-based deployment:

```bash
helm upgrade microsoft-defender-for-containers-sensor \
oci://mcr.microsoft.com/azuredefender/microsoft-defender-for-containers-sensor \
--devel \
--reuse-values
```

## Next steps

- [Common questions about protecting containers](faq-defender-for-containers.yml)
