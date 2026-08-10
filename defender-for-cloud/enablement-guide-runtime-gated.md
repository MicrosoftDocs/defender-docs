---
title: Configure gated deployment rules for Kubernetes container images
description: Learn how to configure gated deployment rules in Microsoft Defender for Containers to audit or block Kubernetes deployments based on container image vulnerability findings.
#customer intent: As a Kubernetes administrator, I want to configure gated deployment rules so that I can audit or block Kubernetes deployments that don't meet my organization's container image vulnerability policy.
author: Elazark
ms.author: elkrieger
ms.date: 06/07/2026
ms.topic: how-to
---

# Configure gated deployment rules for Kubernetes container images

This article shows you how to configure gated deployment rules in Microsoft Defender for Containers.

Gated deployment uses an admission controller to evaluate container images before they're admitted into a Kubernetes cluster. It uses vulnerability scan results from supported container registries to audit or deny deployments when images don't meet your organization's vulnerability policy.

## Prerequisites

Before you begin, make sure that:

- You have a Microsoft Azure subscription. If you don't have an Azure subscription, you can [sign up for a free subscription](https://azure.microsoft.com/pricing/purchase-options/azure-account?cid=msft_learn).

- [Defender for Cloud is enabled](get-started.md#enable-defender-for-cloud-on-your-azure-subscription) on your Azure subscription.

- [Defender for Containers is enabled](defender-for-containers-enable-plan.md) for the environment that contains your Kubernetes cluster and container registry, with the following components enabled:

  - **Defender sensor** with **Security Gating**
  - **Registry access** with **Security findings**

  > [!NOTE]
  > If the Kubernetes cluster and container registry are in different environments, enable Defender for Containers and the required components for both environments.
    
- **AKS clusters:** The cluster has an [OpenID Connect (OIDC) issuer](/azure/aks/use-oidc-issuer) enabled.

- Your Kubernetes environment and container registry are supported for gated deployment. See the [Defender for Containers support matrix](support-matrix-defender-for-containers.md#containers-software-supply-chain-protection-features).

- Vulnerability scan results are available for the container images you want to evaluate. Gated deployment uses vulnerability assessment findings from supported registries.

- You have the required permissions:
  - To create or change gated deployment rules, you need **Security Admin** or higher permissions.
  - To view gated deployment rules, you need **Security Reader** or higher permissions.

## Configure a gated deployment rule

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select **Security rules**.

   :::image type="content" source="media/enablement-guide-runtime-gating/security-rules.png" alt-text="Screenshot of the Security Rules tile in Microsoft Defender for Cloud." lightbox="media/enablement-guide-runtime-gating/security-rules.png":::

1. Select **Gated deployment** > **Vulnerability assessment**.

   :::image type="content" source="media/enablement-guide-runtime-gating/vulnerability-assessment.png" alt-text="Screenshot of the Vulnerability Assessment tab in Security Rules." lightbox="media/enablement-guide-runtime-gating/vulnerability-assessment.png":::

   > [!NOTE]
   > By default, after the required prerequisites are met, Defender for Containers creates an audit rule that flags image deployments with high or critical vulnerabilities.

1. Select **Add rule**.

1. Enter a **Rule name**.

1. Select an **Action**:

   - **Audit**: Allows the deployment and creates an admission event for review.
   - **Deny**: Blocks deployments that match the rule conditions.

   > [!TIP]
   > Start with **Audit** to understand the effect of the rule before you use **Deny** mode to block deployments.

   > [!NOTE]
   > Deny mode can introduce a one- or two-second delay during deployment because the image is evaluated before the workload is admitted into the cluster.

1. If needed, enter a **Rule description**.

1. Enter a **Scope name**.

1. Select the **Cloud scope**.

1. Under **Resource scope**, keep the default scope or select **Add condition** to narrow the rule scope.

   > [!TIP]
   > Start with a narrow scope, such as namespace or deployment, before applying broader enforcement.

   :::image type="content" source="media/enablement-guide-runtime-gating/rule-creation-wizard.png" alt-text="Screenshot of the rule creation wizard in Microsoft Defender for Cloud." lightbox="media/enablement-guide-runtime-gating/rule-creation-wizard.png":::

1. Select **Next**.

1. Toggle on **Block all deployments with missing artifacts** if you want to block deployments when vulnerability findings artifacts aren't available.

1. Select **Add condition**, and define at least one condition for the rule.

   :::image type="content" source="media/enablement-guide-runtime-gating/edit-vulnerability-assessment-rule.png" alt-text="Screenshot of the vulnerability assessment rule configuration pane." lightbox="media/enablement-guide-runtime-gating/edit-vulnerability-assessment-rule.png":::

1. Select **Next**. 

1. To exempt specific vulnerabilities, select **Add allowed vulnerabilities**, and then enter the CVE IDs that you want to exempt.

1. To make the vulnerability exemption temporary, toggle on **Time bound**, and then select a **Valid until** date.

1. To exempt specific resources, select **Add exemption**, and then define the resource-based exemption.

   :::image type="content" source="media/enablement-guide-runtime-gating/exemption-configuration-panel.png" alt-text="Screenshot of the exemption configuration pane with the time-bound option." lightbox="media/enablement-guide-runtime-gating/exemption-configuration-panel.png":::

1. Select **Add Rule**.

## Monitor gated deployment events

You can monitor gated deployment events to review rule evaluations, triggered actions, and affected resources. Use these events to help refine rule scope, conditions, and exemptions.

To investigate a specific admission event:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select **Security rules**.

1. Select **Gated deployment** > **Admission Monitoring**.

   :::image type="content" source="media/enablement-guide-runtime-gating/admission-monitoring.png" alt-text="Screenshot of the Admission Monitoring view showing rule evaluations and actions." lightbox="media/enablement-guide-runtime-gating/admission-monitoring.png":::

1. Select an event from the list.

   The details pane shows:

   - The event timestamp and admission action.
   - The container image digest, detected violations, and triggered rule.
   - The vulnerability assessment policy and criteria used for evaluation.
   - The rule conditions and exemptions that were applied.

   :::image type="content" source="media/enablement-guide-runtime-gating/admission-event-details.png" alt-text="Screenshot of the admission event details pane." lightbox="media/enablement-guide-runtime-gating/admission-event-details.png":::

## Disable or delete a gated deployment rule

To disable or delete a gated deployment rule:

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select **Security Rules**.

1. Select the **Vulnerability Assessment** tab.

1. Select the rule.

1. Select **Disable** or **Delete rule**.

## Related content

- [Gated deployment for Kubernetes container images](runtime-gated-overview.md)
- [Troubleshoot gated deployment in Kubernetes](troubleshooting-runtime-gated.md)
- [Vulnerability assessments for supported environments](agentless-vulnerability-assessment-azure.md)