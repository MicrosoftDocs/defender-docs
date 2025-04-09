---
title: Search the audit log for events in Microsoft Defender XDR
description: Learn how to use the audit log to search for Microsoft Defender XDR activities to help with investigation.
ms.service: defender-xdr
ms.author: diannegali
author: diannegali
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier3
ms.topic: how-to
ms.date: 01/14/2025
search.appverid: met150
appliesto:
- Microsoft Defender for Endpoint Plan 2
- Microsoft Defender XDR

#customer intent: As a SOC analyst, I want to learn how to use the audit log to search for Microsoft Defender XDR activities to help with investigation.
---

# Search the audit log for events in Microsoft Defender XDR

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

The audit log helps you investigate specific activities across Microsoft 365 services. In the Microsoft Defender portal, Microsoft Defender XDR and Microsoft Defender for Endpoint activities are audited. Some of the activities audited are:

- Changes to data retention settings
- Changes to advanced features
- Creation of indicators of compromise
- Isolation of devices
- Add\edit\deletion of security roles
- Create\edit custom detection rules
- Assign user to an incidents

For a complete list of Microsoft Defender XDR activities that are audited, see [Microsoft Defender XDR activities](#microsoft-defender-xdr-activities) and [Microsoft Defender for Endpoint activities](#microsoft-defender-for-endpoint-activities).

Auditing is automatically turned on for Microsoft Defender XDR. Features that are audited are logged in the audit log automatically. Auditing can also collect audit logs from GCC environments.

## Prerequisites

To access the audit log, you need to have the **View-Only Audit Logs** or **Audit Logs** role in Exchange Online. By default, those roles are assigned to the Compliance Management and Organization Management role groups.

> [!NOTE]
> Global administrators in Office 365 and Microsoft 365 are automatically added as members of the Organization Management role group in Exchange Online.

Microsoft Defender XDR uses the [Microsoft Purview auditing solution](/purview/audit-solutions-overview). Before you can look at the audit data in the Microsoft Defender portal, you need to turn on auditing in the Microsoft Purview compliance portal. For more information, see [Turn auditing on or off](/purview/audit-log-enable-disable).

> [!IMPORTANT]
> Global Administrator is a highly privileged role that should be limited to scenarios when you can't use an existing role. Microsoft recommends that you use roles with the fewest permissions. Using accounts with lower permissions helps improve security for your organization.

## Search the audit log

Follow these steps to search the audit log:

1. Navigate to the [Microsoft Defender portal's Audit page](https://security.microsoft.com/auditlogsearch) or go to the [Purview compliance portal](https://compliance.microsoft.com) and select **Audit**.

   :::image type="content" source="/defender/media/defender/unified-audit-log-xdr.png" alt-text="Screenshot of the unified audit log page in Microsoft Defender XDR " lightbox="/defender/media/defender/unified-audit-log-xdr.png":::

2. On the **New Search** page, filter the activities, dates, and users you want to audit.
3. Select **Search**

   :::image type="content" source="/defender/media/defender/unified-audit-search.png" alt-text="Screenshot of the unified audit log search options in Microsoft Defender XDR " lightbox="/defender/media/defender/unified-audit-search.png":::

4. Export your results to Excel for further analysis.

For step-by-step instructions, see [Search the audit log in the compliance portal](/purview/audit-new-search).

Audit log record retention is based on Microsoft Purview retention policies. For more information, see [Manage audit log retention policies](/purview/audit-log-retention-policies).

## Microsoft Defender XDR activities

For a list of all events that are logged for user and admin activities in Microsoft Defender XDR in the Microsoft 365 audit log, see:

- [Custom detection activities in Microsoft Defender XDR in the audit log](/purview/audit-log-activities#microsoft-defender-xdr-custom-detection-activities)
- [Incident activities in Microsoft Defender XDR in the audit log](/purview/audit-log-activities#microsoft-defender-xdr-custom-detection-activities)
- [Suppression rule activities in Microsoft Defender XDR in the audit log](/purview/audit-log-activities#microsoft-defender-xdr-suppression-rule-activities)

## Microsoft Defender for Endpoint activities

For a list of all events that are logged for user and admin activities in Microsoft Defender for Endpoint in the Microsoft 365 audit log, see:

- [General settings activities in Defender for Endpoint in the audit log](/purview/audit-log-activities#microsoft-defender-for-endpoint-general-settings-activities)
- [Indicator settings activities in Defender for Endpoint in the audit log](/purview/audit-log-activities#microsoft-defender-for-endpoint-indicator-settings-activities)
- [Response action activities in Defender for Endpoint in the audit log](/purview/audit-log-activities#microsoft-defender-for-endpoint-reponse-actions-activities)
- [Roles settings activities in Defender for Endpoint in the audit log](/purview/audit-log-activities#microsoft-defender-for-endpoint-roles-settings-activities)

## Search for events using a PowerShell script

You can use the following PowerShell code snippet to query the Office 365 Management API to retrieve information about Microsoft Defender XDR events:

```PowerShell
$cred = Get-Credential
$s = New-PSSession -ConfigurationName microsoft.exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $cred -Authentication Basic -AllowRedirection 
Import-PSSession $s
Search-UnifiedAuditLog -StartDate 2023/03/12 -EndDate 2023/03/20 -RecordType <ID>
```

>[!NOTE]
> See the API column in Audit activities included for the record type values.

For more information, see [Use a PowerShell script to search the audit log](/purview/audit-log-search-script)

## See also

- [Detailed properties in the audit log](/purview/audit-log-detailed-properties)
- [Export, configure, and view audit log records](/purview/audit-log-export-records)
- [Office 365 Management Activity API reference](/office/office-365-management-api/office-365-management-activity-api-reference)
