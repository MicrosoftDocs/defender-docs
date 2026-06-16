---
title: Respond to Defender open-source database alerts
description: Investigate and respond to alerts from Microsoft Defender for open-source relational databases, including Azure Database services and AWS Relational Database Service instances.
ms.date: 05/25/2026
ms.topic: how-to
ms.custom: sfi-image-nochange
#customer intent: As a reader, I want to learn how to configure Microsoft Defender for open-source relational databases to enhance the security of my databases.
---

# Respond to Defender open-source database alerts

Microsoft Defender for Cloud detects anomalous activities indicating unusual and potentially harmful attempts to access or exploit databases for the following services:

- [Azure Database for PostgreSQL](/azure/postgresql/)
- [Azure Database for MySQL](/azure/mysql/)

For Amazon Web Services (AWS) Relational Database Service (RDS) instances (Preview):

- Aurora PostgreSQL
- Aurora MySQL
- PostgreSQL
- MySQL
- MariaDB

To get alerts from the Microsoft Defender plan, first [enable Defender for open-source relational databases on Azure](enable-defender-for-databases-azure.md) or [enable Defender for open-source relational databases on AWS](enable-defender-for-databases-aws.md).

Learn more about this Microsoft Defender plan in [Overview of Microsoft Defender for open-source relational databases](defender-for-databases-introduction.md).

## Prerequisites

Before you respond to database alerts, make sure these prerequisites are met:

- You need a Microsoft Azure subscription. If you don't have an Azure subscription, you can [sign up for a free subscription](https://azure.microsoft.com/pricing/purchase-options/azure-account?cid=msft_learn).

- You must [enable Defender for Cloud](get-started.md#enable-defender-for-cloud-on-your-azure-subscription) on your Azure subscription.

- **AWS users only**: [Connect your AWS account by using the AWS onboarding quickstart](quickstart-onboard-aws.md).

## Respond to alerts in Defender for Cloud

When Defender for Cloud is enabled on your database, it detects anomalous activities and generates alerts.

You can find alerts in multiple locations, including:

- In the Azure portal:
  - **Defender for Cloud's security alerts page** - Shows alerts for all resources protected by Defender for Cloud in the subscriptions you've got permissions to view.
  - The resource's **Microsoft Defender for Cloud** page - Shows alerts and recommendations for one specific resource.

- The designated person in your organization receives email alerts in their inbox after you [configure email notifications](configure-email-notifications.md).  

> [!TIP]
> A live tile on [Defender for Cloud's overview dashboard](overview-page.md) tracks the status of active threats to your resources including databases. Select the security alerts tile to navigate to the Defender for Cloud security alerts page and get an overview of active threats detected on your databases.
>
> For detailed steps and the recommended method to respond to security alerts, see [Respond to a security alert](manage-respond-alerts.md#respond-to-a-security-alert).

### Respond to email notifications of security alerts

Defender for Cloud sends email notifications when it detects anomalous database activities.

Each email includes details about the security event, such as activity type, database name, server name, application name, and event time. The email also includes possible causes and recommended investigation and mitigation actions.

1. From the email, select the **View the full alert** link to launch the Azure portal and show the security alerts page, which provides an overview of active threats detected on the database.

    :::image type="content" source="media/defender-for-databases-usage/suspected-brute-force-attack-notification-email.png" alt-text="Defender for Cloud's email notification about a suspected brute force attack." lightbox="media/defender-for-databases-usage/suspected-brute-force-attack-notification-email.png":::

    View active threats at the subscription level from within the Defender for Cloud portal pages:

    :::image type="content" source="media/defender-for-databases-usage/db-alerts-page.png" alt-text="Active threats on one or more subscriptions are shown in Microsoft Defender for Cloud." lightbox="media/defender-for-databases-usage/db-alerts-page.png":::

1. For extra details and recommended actions for investigating the current threat and remediating future threats, select a specific alert.

    :::image type="content" source="media/defender-for-databases-usage/specific-alert-details.png" alt-text="Screenshot that shows the details of a specific alert." lightbox="media/defender-for-databases-usage/specific-alert-details.png":::

> [!TIP]
> For a detailed tutorial on how to handle your alerts, see [Manage and respond to alerts](tutorial-security-incident.md).

## Related content

- [Automate responses to Defender for Cloud triggers](workflow-automations.md)
- [Stream alerts to a SIEM, SOAR, or ITSM solution](export-to-siem.md)
- [Suppress alerts from Defender for Cloud](alerts-suppression-rules.md)

