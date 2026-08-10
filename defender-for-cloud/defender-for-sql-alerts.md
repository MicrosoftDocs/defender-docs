---
title: Explore and investigate Defender for SQL security alerts
description: View and investigate SQL security alerts through the Alerts page, affected machine security pages, workload protections dashboard, or alert email links.
ms.topic: how-to
ms.date: 07/03/2026
ms.custom: msecd-doc-authoring-1013
#customer intent: As a security administrator, I want to investigate Defender for SQL security alerts so that I can understand suspicious activity and remediate the affected resources.
ai-usage: ai-assisted
---

# Explore and investigate Defender for SQL security alerts

This article shows how to review Microsoft Defender for SQL alerts. Learn how to spot suspicious activity and take action on affected resources. You can open alerts quickly and follow up with a deeper look when needed.

## View and investigate SQL alerts

You can access and review security alerts from Microsoft Defender for SQL. Defender for SQL creates alerts when it detects suspicious database activity or possible weak points. Each alert needs your review.

There are several ways to view Microsoft Defender for SQL alerts in Microsoft Defender for Cloud:

- The **Alerts** page.
- The affected machine's security page.
- The [workload protections dashboard](workload-protections-dashboard.md), which shows security coverage across resources.
- Through the direct link provided in the alert's email.

<a name="how-to-view-alerts"></a>
## Open SQL security alerts in Defender for Cloud

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

