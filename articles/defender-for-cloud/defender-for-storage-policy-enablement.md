---
title: Enable Defender for Storage with an Azure Built-in Policy
description: Learn how to enable and configure the Microsoft Defender for Storage plan at scale with an Azure built-in policy.
ms.topic: install-set-up-deploy
ms.date: 06/30/2025
---

# Enable and configure Microsoft Defender for Storage at scale with an Azure built-in policy

You should enable Microsoft Defender for Storage via a built-in policy. This method facilitates enablement at scale. It also ensures that a consistent security policy is applied across all existing and future storage accounts within the defined scope, such as entire management groups. This approach keeps the storage accounts protected with Defender for Storage according to your organization's defined configuration.

> [!TIP]
> You can always [configure specific storage accounts](advanced-configurations-for-malware-scanning.md#override-defender-for-storage-subscription-level-settings) with custom configurations that differ from the settings configured at the subscription level. That is, you can override subscription-level settings.

## Azure built-in policy

To enable and configure Defender for Storage at scale by using an Azure built-in policy, follow these steps:

1. Sign in to the Azure portal and go to the **Policy** dashboard.

1. On the left menu, select **Definitions**.

1. In the **Security Center** category, search for and then select **Configure Microsoft Defender for Storage to be enabled**.

    This policy enables all Defender for Storage capabilities: activity monitoring, malware scanning, and sensitive-data threat detection. You can also get it here: [List of built-in policy definitions](/azure/governance/policy/samples/built-in-policies#security-center). If you want to enable a policy without the configurable features, use **Configure basic Microsoft Defender for Storage to be enabled (Activity Monitoring only)**.

    :::image type="content" source="media/defender-for-storage-malware-scan/policy-definitions.png" alt-text="Screenshot that shows where to select policy definitions." lightbox="media/defender-for-storage-malware-scan/policy-definitions.png":::

1. Select the policy and review it.

1. Select **Assign**. You can fine-tune, edit, and add custom rules to the policy.

    :::image type="content" source="media/defender-for-storage-malware-scan/policy-assign.png" alt-text="Screenshot that shows where to assign a policy." lightbox="media/defender-for-storage-malware-scan/policy-assign.png":::

1. After you finish reviewing the policy details, select **Review + create**.

1. Select **Create** to assign the policy.

### Malware scanning

You can configure malware scanning to send scanning results to the following places:

- [Event Grid custom topic](/azure/defender-for-cloud/advanced-configurations-for-malware-scanning#set-up-event-grid-for-malware-scanning): For near-real-time automatic response based on every scanning result.
- [Log Analytics workspace](/azure/defender-for-cloud/advanced-configurations-for-malware-scanning#set-up-logging-for-malware-scanning): For storing every scan result in a centralized log repository for compliance and audit.

[Learn more on how to set up a response for malware scanning results](defender-for-storage-configure-malware-scan.md).

## Related content

- Learn how to [enable and configure Microsoft Defender for Storage with IaC templates](defender-for-storage-infrastructure-as-code-enablement.md).
