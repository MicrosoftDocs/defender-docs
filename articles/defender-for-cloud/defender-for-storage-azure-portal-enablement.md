---
title: Enable Defender for Storage by Using the Azure portal
description: Learn how to enable Microsoft Defender for Storage on your Azure subscription for Microsoft Defender for Cloud by using the Azure portal.
ms.topic: install-set-up-deploy
ms.date: 06/30/2025
---

# Enable and configure Defender for Storage by using the Azure portal

We recommend that you enable Microsoft Defender for Storage on the subscription level. Doing so helps ensure that all storage accounts currently in the subscription are protected. Protection for storage accounts that you create after enabling Defender for Storage on the subscription level starts up to 24 hours after creation.

> [!TIP]
> You can always [configure specific storage accounts](advanced-configurations-for-malware-scanning.md#override-defender-for-storage-subscription-level-settings) with custom settings that differ from the settings configured at the subscription level. That is, you can override subscription-level settings.

## [Enable on a subscription (recommended)](#tab/enable-subscription/)

To enable Defender for Storage at the subscription level by using the Azure portal:

1. Sign in to the Azure portal.

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select the subscription for which you want to enable Defender for Storage.

    :::image type="content" source="media/defender-for-storage-malware-scan/azure-portal-enablement-subscription.png" alt-text="Screenshot that shows the selection of a subscription on the pane for environment settings." lightbox="media/defender-for-storage-malware-scan/azure-portal-enablement-subscription.png":::

1. Select the three dots, and then select **Edit settings**.

1. On the **Defender plans** pane, locate **Storage** in the list. Then select **On** > **Save**.

    :::image type="content" source="media/defender-for-storage-malware-scan/azure-portal-enablement-turn-on.png" alt-text="Screenshot that shows the toggle for turning on a Defender for Storage plan." lightbox="media/defender-for-storage-malware-scan/azure-portal-enablement-turn-on.png":::

    If you currently have Defender for Storage enabled with per-transaction pricing, select the **New pricing plan available** link and confirm the pricing change.

Defender for Storage is now enabled for this subscription, including on-upload malware scanning and sensitive-data threat detection. Here are a few more options at this point:

- If you want to turn off on-upload malware scanning or sensitive-data threat detection, select **Settings** and change the status of the feature to **Off**. Then save the changes.
- If you want to change the size capping per storage account per month for malware scanning, or change the use of index tags for storing malware scan results, or enable soft deletion of malicious blobs, go to **Edit configuration**. Adjust the settings as needed, and then save your changes.
- If you want to disable the Defender for Storage plan, turn the status to **Off** for the plan on the **Defender plans** pane. Then save the changes.

## [Enable on a storage account](#tab/enable-storage-account/)

To enable and configure Defender for Storage for a specific account by using the Azure portal:

1. Sign in to the Azure portal.

1. Go to your storage account. On the left menu, in the **Security + networking** section, select **Microsoft Defender for Cloud**.

1. **On-upload malware scanning** and **Sensitive data threat detection** are enabled by default. You can disable the features by clearing their checkboxes.

1. Select **Enable on storage account**.

:::image type="content" source="media/defender-for-storage-malware-scan/azure-portal-enablement-on-storage-account.png" alt-text="Screenshot that shows the pane for enabling Defender for Storage." lightbox="media/defender-for-storage-malware-scan/azure-portal-enablement-on-storage-account.png":::

Defender for Storage is now enabled on this storage account. You can disable it or modify these features:

- On-upload malware scanning (such as monthly capping)
- Sensitive-data threat detection
- Limit of gigabytes scanned per month
- Filtering of on-upload scans
- Storage of scan results as blob index tags
- Soft deletion of malicious blobs
- Sending scan results to an Azure Event Grid topic
- Sending scan results to Log Analytics

Select **Settings**, edit the settings, and then select **Save**.

---

> [!TIP]
> You can configure malware scanning to send scanning results to:
>
> - [Event Grid custom topic](/azure/defender-for-cloud/advanced-configurations-for-malware-scanning#set-up-event-grid-for-malware-scanning): For near-real-time automatic response based on every scanning result.
> - [Log Analytics workspace](/azure/defender-for-cloud/advanced-configurations-for-malware-scanning#set-up-logging-for-malware-scanning): For storing every scan result in a centralized log repository for compliance and audit.
>
> [Learn more on how to set up a response for malware scanning results](defender-for-storage-configure-malware-scan.md).

## Related content

- Learn how to [enable and configure the Defender for Storage plan at scale by using an Azure built-in policy](defender-for-storage-policy-enablement.md).
