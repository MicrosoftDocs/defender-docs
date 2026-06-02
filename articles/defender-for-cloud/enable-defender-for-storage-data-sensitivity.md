---
title: Enable sensitive data threat detection
description: Learn how to enable and configure sensitive data threat detection in Microsoft Defender for Storage to protect your data and enhance security.
ms.date: 06/02/2026
author: ElazarK
ms.author: elkrieger
ms.topic: how-to
#customer intent: As a security professional, I want to enable and configure sensitive data threat detection in Microsoft Defender for Storage so that I can protect my organization's data from exposure and enhance overall security.

---

# Enable sensitive data threat detection

## Sensitive data threat detection in Defender for Storage

Sensitive data threat detection is enabled by default when you enable Defender for Storage. You can enable or disable it in the Azure portal or with other at-scale methods. For instructions, see [Configure Defender for Storage](/azure/storage/common/azure-defender-storage-configure). This feature is included in the price of Defender for Storage.

This article explains what sensitive data threat detection includes, how to interpret sensitivity findings in alerts, and how to align detection with Microsoft Purview sensitivity settings.

## Use the sensitivity context in the security alerts

Sensitive data threat detection helps security teams identify and prioritize incidents faster. Defender for Storage alerts include sensitivity scan findings and indicate operations performed on resources that contain sensitive data.

In the alert’s extended properties, you can find sensitivity scanning findings for a **blob container**:

- **Sensitivity scanning time (UTC)**: When the last scan was performed.
- **Top sensitivity label**: The most sensitive label found in the blob container.
- **Sensitive information types**: Information types that were found and whether they're based on custom rules.
- **Sensitive file types**: The file types of the sensitive data.

:::image type="content" source="media/defender-for-storage-data-sensitivity/sensitive-data-alerts.png" alt-text="Screenshot of an alert regarding sensitive data." lightbox="media/defender-for-storage-data-sensitivity/sensitive-data-alerts.png":::

## Integrate with the organizational sensitivity settings in Microsoft Purview (optional)

When you enable sensitive data threat detection, the sensitive data categories include built-in sensitive information types (SITs) in the default list of Microsoft Purview. Including built-in SITs in the default list affects the alerts you receive from Defender for Storage: storage accounts or containers that include these SITs are marked as containing sensitive data.

Of the built-in sensitive information types in the default list of Microsoft Purview, a subset is supported by sensitive data discovery. You can view a [supported sensitive information types reference](sensitive-info-types.md), which indicates which information types are enabled by default. To change these defaults, see [Configure data sensitivity settings](data-sensitivity-settings.md).

To customize Data Sensitivity Discovery for your organization, create custom sensitive information types (SITs) and connect to organizational settings by using a single-step integration. For details, see [Create a custom sensitive information type](/microsoft-365/compliance/create-a-custom-sensitive-information-type) and [advanced customization options for data sensitivity discovery](episode-two.md).

You can also create and publish sensitivity labels for your tenant in Microsoft Purview. The sensitivity label scope includes Items, Schematized data assets, and autolabeling rules (recommended). For details, see [Sensitivity labels in Microsoft Purview](/microsoft-365/compliance/sensitivity-labels).

## Next steps

> [!div class="nextstepaction"]
> [Enable Defender for Storage](connect-azure-subscription.md)

