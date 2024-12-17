---
title: Enable sensitive data threat detection
description: Learn how to enable and configure sensitive data threat detection in Microsoft Defender for Storage to protect your data from exposure and enhance security.
ms.date: 05/16/2024
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
#customer intent: As a security professional, I want to enable and configure sensitive data threat detection in Microsoft Defender for Storage so that I can protect my organization's data from exposure and enhance overall security.

---

# Enable sensitive data threat detection

Sensitive data threat detection is enabled by default when you enable Defender for Storage. You can [enable it or disable it](/azure/storage/common/azure-defender-storage-configure) in the Azure portal or with other at-scale methods. This feature is included in the price of Defender for Storage.

## Using the sensitivity context in the security alerts

The sensitive data threat detection capability helps security teams identify and prioritize data security incidents for faster response times. Defender for Storage alerts include findings of sensitivity scanning and indications of operations performed on resources containing sensitive data.

In the alert’s extended properties, you can find sensitivity scanning findings for a **blob container**:

- Sensitivity scanning time UTC - when the last scan was performed
- Top sensitivity label - the most sensitive label found in the blob container
- Sensitive information types - information types that were found and whether they're based on custom rules
- Sensitive file types - the file types of the sensitive data

:::image type="content" source="media/defender-for-storage-data-sensitivity/sensitive-data-alerts.png" alt-text="Screenshot of an alert regarding sensitive data." lightbox="media/defender-for-storage-data-sensitivity/sensitive-data-alerts.png":::

## Integrate with the organizational sensitivity settings in Microsoft Purview (optional)

When you enable sensitive data threat detection, the sensitive data categories include built-in sensitive information types (SITs) in the default list of Microsoft Purview. This affects the alerts you receive from Defender for Storage: storage or containers that are found with these SITs are marked as containing sensitive data.

Of these built-in sensitive information types in the default list of Microsoft Purview, there's a subset supported by sensitive data discovery. You can view a [reference list](sensitive-info-types.md) of this subset, which also indicates which information types are supported by default. You can [modify these defaults](data-sensitivity-settings.md).

To customize the Data Sensitivity Discovery for your organization, you can [create custom sensitive information types (SITs)](/microsoft-365/compliance/create-a-custom-sensitive-information-type) and connect to your organizational settings with a single step integration. Learn more [here](episode-two.md).

You also can create and publish sensitivity labels for your tenant in Microsoft Purview with a scope that includes Items and Schematized data assets and auto-labeling rules (recommended). Learn more about [sensitivity labels](/microsoft-365/compliance/sensitivity-labels) in Microsoft Purview.

## Next steps

In this article, you learned about Microsoft Defender for Storage's sensitive data scanning.

> [!div class="nextstepaction"]
> [Enable Defender for Storage](enable-enhanced-security.md)
