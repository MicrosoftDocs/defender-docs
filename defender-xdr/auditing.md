---
title: How to search the audit logs for actions performed by Defender Experts
ms.reviewer:
description: As a tenant administrator, you can use Microsoft Purview to search the audit logs for the actions Microsoft Defender Experts did in your tenant to perform their investigations.
ms.service: defender-experts-for-xdr
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
manager: orspodek
audience: ITPro
ms.collection:
  - m365-security
  - tier1
  - essentials-manage
ms.topic: how-to
ms.custom: 
- cx-ti
- cx-dex
search.appverid: met150
ms.date: 08/01/2025
---

# Auditing

**Applies to:**

- [Microsoft Defender Experts for XDR](dex-xdr-overview.md)
- Microsoft Defender Experts for Servers

As a tenant administrator, you can use Microsoft Purview to search the audit logs for the times Microsoft Defender Experts signed into your tenant and the actions they did there to perform their investigations. You can also search the audit logs for the changes done by your tenant administrators to the Defender Experts settings.

Auditing is automatically turned on in the Microsoft Defender portal. Features that are audited are logged in the audit log automatically. Auditing can also collect audit logs from GCC environments.

> [!NOTE]
> Make sure you have the right [permissions](/microsoft-365/compliance/audit-log-search#before-you-search-the-audit-log) to search for audit logs.

## Search the audit logs for actions performed by Defender Experts

1. Sign into the [Microsoft Purview portal](https://purview.microsoft.com/) to use [Audit New Search](/microsoft-365/compliance/audit-new-search).
2. Provide a **Date and time range (UTC)**.
3. Select the **Workload** and **Record type** from the list shown in the following table to further narrow your search.
4. Select **Search** to list the audit logs related to actions taken by our experts in your tenant.

:::image type="content" source="/defender/media/xdr/audit.png" alt-text="Partial screenshot of Microsoft Purview portal Defender New search page." lightbox="/defender/media/xdr/audit.png":::

| Action performed by Defender Experts | Workload | Record type |
|--------------|-----|-----------|
| Sign into customer tenant |  AzureActiveDirectory | AzureActiveDirectoryStsLogon |
| Make changes to incidents in Microsoft Defender portal      |  Microsoft365Defender |  MS365Dincident |
|Make changes to alert suppression rules in Microsoft Defender portal|Microsoft365Defender|MS365DSuppressionRule|
|Make changes to indicators in Microsoft Defender for Endpoint|MicrosoftDefenderForEndpoint|MSDEIndicatorsSettings|
|Perform device remediation actions in Microsoft Defender for Endpoint|MicrosoftDefenderForEndpoint|MSDEResponseActions|

:::image type="content" source="/defender/media/xdr/audit-2.png" alt-text="Partial screenshot of a sample audit log related to Defender Experts." lightbox="/defender/media/xdr/audit-2.png":::

## Search the audit logs for actions performed by your administrators in the Defender Experts settings

1. Sign into the [Microsoft Purview portal](https://purview.microsoft.com/) to use [Audit New Search](/microsoft-365/compliance/audit-new-search).
2. Provide a **Date and time range (UTC)**.
3. Under **Workload**, choose _MicrosoftDefenderExperts_.
4. Select **Search** to list the audit logs related to actions taken by your tenant administrators to the Defender Experts settings.

:::image type="content" source="/defender/media/xdr/audit-3.png" alt-text="Partial screenshot of Microsoft Purview portal Defender New search page showing the Workload field selected to MicrosoftDefenderExperts." lightbox="/defender/media/xdr/audit-3.png":::

## Search the audit logs using a PowerShell script

In addition to using Audit New Search in the Microsoft Purview portal, you can use PowerShell cmdlets to search for audit logs. [Learn more](/microsoft-365/compliance/audit-log-search-script).

### See also

[Important considerations for Microsoft Defender Experts for XDR](additional-information-xdr.md)
[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
