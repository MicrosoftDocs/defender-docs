---
title: Sensitive data threat detection in Defender for Storage
description: Understand how Microsoft Defender for Storage detects and protects sensitive data from exposure, enhancing your organization's data security.
ms.date: 05/16/2024
author: dcurwin
ms.author: dacurwin
ms.topic: overview
#customer intent: As a security professional, I want to understand how Microsoft Defender for Storage detects and protects sensitive data from exposure so that I can enhance my organization's data security.

---

# Sensitive data threat detection in Microsoft Defender for Storage

Sensitive data threat detection helps you prioritize and examine security alerts efficiently. It considers the sensitivity of the data at risk, leading to better detection and prevention of data breaches. This capability helps security teams reduce the likelihood of data breaches by quickly identifying and addressing the most significant risks. It also enhances sensitive data protection by detecting exposure events and suspicious activities on resources containing sensitive data.

This feature is configurable in the new Defender for Storage plan. You can choose to enable or disable it with no further cost.

Learn more about [scope and limitations of sensitive data scanning](concept-data-security-posture-prepare.md).

## Prerequisites

Sensitive data threat detection is available for Blob storage accounts, including:

- Standard general-purpose V1
- Standard general-purpose V2
- Azure Data Lake Storage Gen2
- Premium block blobs

To enable sensitive data threat detection at subscription and storage account levels, you need to have the relevant data-related permissions from the **Subscription owner** or **Storage account owner** roles.

Learn more about the [roles and permissions required for sensitive data threat detection](support-matrix-defender-for-storage.md).

## How does sensitive data discovery work?

Sensitive data threat detection is powered by the sensitive data discovery engine, an agentless engine that uses a smart sampling method to find resources with sensitive data.

The service is integrated with Microsoft Purview's sensitive information types (SITs) and classification labels, allowing seamless inheritance of your organization's sensitivity settings. This ensures that the detection and protection of sensitive data aligns with your established policies and procedures.

:::image type="content" source="media/defender-for-storage-data-sensitivity/data-sensitivity-cspm-storage.png" alt-text="Diagram showing how Defender CSPM and Defender for Storage combine to provide data-aware security.":::

Upon enablement, the engine initiates an automatic scanning process across all supported storage accounts. Results are typically generated within 24 hours. Additionally, newly created storage accounts under protected subscriptions are scanned within six hours of their creation. Recurring scans are scheduled to occur weekly after the enablement date. This is the same engine that Defender CSPM uses to discover sensitive data.

## Next step

To enable sensitive data threat detection, see [Enable sensitive data threat detection](enable-defender-for-storage-data-sensitivity.md).