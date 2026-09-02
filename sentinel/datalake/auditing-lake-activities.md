---
title: Audit Log for Microsoft Sentinel Data Lake and Graph in Microsoft Purview Portal
description: Use the audit log to search for Microsoft Sentinel data lake and graph activities to help with investigation.
ms.service: microsoft-sentinel
ms.subservice: sentinel-platform
ms.author: edbaynash
author: EdB-MSFT
ms.reviewer: amyhari
ms.topic: how-to
ms.date: 06/12/2026
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1014

#customer intent: As a SOC analyst, I want to learn how to use the audit log to search for Microsoft Sentinel data lake activities to help with investigation.

---

# Audit log for Microsoft Sentinel data lake and graph in Microsoft Purview portal

This article explains how to access, search, and interpret audit logs for Microsoft Sentinel data lake and graph activities in the Microsoft Purview portal.

The audit log helps you investigate specific activities across Microsoft services. Microsoft Sentinel data lake and graph activities are audited and can be searched in the audit log. The audit log provides a record of activities that are performed by users and administrators in Microsoft Sentinel data lake and graph, such as:

- Accessing data in lake via KQL queries
- Running notebooks on data lake
- Create/ edit/ run/ delete jobs
- Run graph query
- Create and run MCP tools

Auditing is automatically turned on for Microsoft Sentinel data lake and graph. All Microsoft Sentinel data lake and graph activities are logged in the audit log automatically.

## Prerequisites

Microsoft Sentinel data lake and graph uses the [Microsoft Purview auditing solution](/purview/audit-solutions-overview). Before you can look at the audit data, you need to turn on auditing in the Microsoft Purview portal. For more information, see [Turn auditing on or off](/purview/audit-log-enable-disable). 

To access the audit log, you need to have the **View-Only Audit Logs** or **Audit Logs** role in Exchange Online. By default, those roles are assigned to the Compliance Management and Organization Management role groups.

> [!NOTE]
> Global administrators in Office 365 and Microsoft 365 are automatically added as members of the Organization Management role group in Exchange Online.

> [!IMPORTANT]
> Global Administrator is a highly privileged role that should be limited to scenarios when you can't use an existing role. Microsoft recommends that you use roles with the fewest permissions. Using accounts with lower permissions helps improve security for your organization.

## Microsoft Sentinel data lake and graph activities

The following linked articles list the audited events for Microsoft Sentinel data lake and graph activities:

- [Microsoft Sentinel data lake onboarding activities](/purview/audit-log-activities#microsoft-sentinel-data-lake-onboarding-activities)
- [Microsoft Sentinel data lake notebook activities](/purview/audit-log-activities#microsoft-sentinel-data-lake-notebook-activities)
- [Microsoft Sentinel data lake job activities](/purview/audit-log-activities#microsoft-sentinel-data-lake-job-activities)
- [Microsoft Sentinel data lake KQL activities](/purview/audit-log-activities#microsoft-sentinel-data-lake-kql-activities)
- [Microsoft Sentinel AI tool activities](https://aka.ms/sentinel-ai-tool-activities)
- [Microsoft Sentinel graph activities](https://aka.ms/sentinel-graph-activities)

For detailed audit log schema information, see [Microsoft Sentinel data lake and graph schema](https://aka.ms/sentinel-lake-audit-schema).

## Search the audit log

Follow these steps to search the audit log:

1. Navigate to the  [Microsoft Purview portal](https://purview.microsoft.com) and select **Audit**.

1. On the **New Search** page, filter the activities, dates, and users you want to audit.

1. Select **Search**

   :::image type="content" source="media/auditing-lake-activities/unified-audit-log.png" alt-text="Screenshot of the unified audit log page." lightbox="media/auditing-lake-activities/unified-audit-log.png":::

1. Export your results to Excel for further analysis.

For step-by-step instructions, see [Search the audit sign in the Microsoft Purview portal](/purview/audit-new-search).

Audit log record retention is based on Microsoft Purview retention policies. For more information, see [Manage audit log retention policies](/purview/audit-log-retention-policies).

## Search for events using a PowerShell script

You can use the following PowerShell code snippet to query the Office 365 Management API to retrieve information about Microsoft Sentinel data lake and graph audit events. This script opens a remote Exchange Online session, imports the session cmdlets, and then runs `Search-UnifiedAuditLog` to search for audit log entries within a specified date range and record type.

```PowerShell
$cred = Get-Credential
$s = New-PSSession -ConfigurationName microsoft.exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $cred -Authentication Basic -AllowRedirection 
Import-PSSession $s
Search-UnifiedAuditLog -StartDate 2023/03/12 -EndDate 2023/03/20 -RecordType <ID>
```

>[!NOTE]
> See the API column in [Audit activities](/purview/audit-log-activities) for the record type values.

For more information, see [Use a PowerShell script to search the audit log](/purview/audit-log-search-script)

## Related content

- [Detailed properties in the audit log](/purview/audit-log-detailed-properties)
- [Export, configure, and view audit log records](/purview/audit-log-export-records)
- [Office 365 Management Activity API reference](/office/office-365-management-api/office-365-management-activity-api-reference)
