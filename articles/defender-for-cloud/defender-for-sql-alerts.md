---
title: Explore and investigate Defender for SQL security alerts
description: View and investigate SQL security alerts through the Alerts page, affected machine security pages, workload protections dashboard, or alert email links.
ms.topic: how-to
ms.date: 05/25/2026
#customer intent: As a security administrator, I want to investigate Defender for SQL security alerts so that I can understand suspicious activity and remediate the affected resources.
---

# Explore and investigate Defender for SQL security alerts

Use this article to review Microsoft Defender for SQL alerts and investigate suspicious activity across affected resources. The guidance helps you open alerts quickly and follow through with deeper investigation when needed.

## View and investigate SQL alerts

This article explains how to access and review security alerts from Microsoft Defender for SQL. When Defender for SQL detects suspicious database activity or potential vulnerabilities, it generates alerts that require investigation.

There are several ways to view Microsoft Defender for SQL alerts in Microsoft Defender for Cloud:

- The **Alerts** page.
- The affected machine's security page.
- The [workload protections dashboard](workload-protections-dashboard.md), which shows security coverage across resources.
- Through the direct link provided in the alert's email.

## How to view alerts

To view security alerts in Microsoft Defender for Cloud, follow these steps:

1. Go to the [Azure portal](https://portal.azure.com) and sign in.

1. Search for and select **Microsoft Defender for Cloud**.

1. Select **Security alerts**.

1. Select an alert.

Alerts are self-contained and include detailed remediation steps and investigation guidance. For broader investigation, use related Microsoft Defender for Cloud and Microsoft Sentinel capabilities:

- Enable SQL Server auditing for deeper investigations. If you use Microsoft Sentinel, you can upload SQL auditing logs from Windows Security Log events to Sentinel for richer investigation. For details, see [SQL Server auditing](/sql/relational-databases/security/auditing/create-a-server-audit-and-server-audit-specification?preserve-view=true&view=sql-server-ver15).

- To improve your security posture, use Defender for Cloud's recommendations for the host machine indicated in each alert to reduce the risks of future attacks.
  
For details, see [Manage and respond to security alerts](manage-respond-alerts.md).

## Related content

For related information, see these resources:

- [Security alerts for SQL Database and Azure Synapse Analytics](alerts-sql-database-and-azure-synapse-analytics.md)
- [Set up email notifications for security alerts](configure-email-notifications.md)
- [Microsoft Sentinel documentation](/azure/sentinel/)

