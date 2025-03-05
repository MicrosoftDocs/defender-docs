---
title: Migrate from Advanced Threat Analytics | Microsoft Defender for Identity
description: Learn how to move an existing Advanced Threat Analytics installation to Microsoft Defender for Identity.
ms.date: 02/21/2024
ms.topic: how-to
---

# Advanced Threat Analytics (ATA) to Microsoft Defender for Identity

This article describes how to migrate from an existing ATA installation to a Microsoft Defender for Identity sensor, and includes the following steps:

> [!div class="checklist"]
>
> - Review and confirm Defender for Identity service prerequisites
> - Document your existing ATA configuration
> - Plan your migration
> - Set up and configure your Defender for Identity service
> - Perform post-migration checks and verifications
> - Decommission ATA

ATA is a standalone on-premises solution with multiple components, such as the ATA Center that requires dedicated hardware on-premises.

Defender for Identity is a cloud-based security solution that uses your on-premises Active Directory signals. The solution is highly scalable and is frequently updated.

In contrast to the ATA sensor, the Defender for Identity sensor also uses data sources such as Event Tracing for Windows (ETW) enabling Defender for Identity to deliver extra detections. Defender for Identity also provides:

- Support for [multi-forest environments](deploy/multi-forest.md)
- [Microsoft Secure Score posture assessments](/defender-for-identity/security-assessment)
- [UEBA capabilities](/cloud-app-security/tutorial-ueba)
- Direct integrations with other services like Microsoft Defender for Cloud Apps and Microsoft Entra for a hybrid view of what's taking place in both on-premises and hybrid environments
- And more

Defender for Identity also uses the Microsoft 365 security portfolio to automatically analyze cross-domain threat data, building a complete picture of each attack in a single dashboard.

> [!IMPORTANT]
> This migration guide is designed for Defender for Identity sensors only, and not standalone sensors.
>
> While you can migrate to Defender for Identity from any ATA version, your ATA data isn't migrated. Therefore, we recommend that you plan to retain your ATA Data Center and any alerts required for ongoing investigations until all ATA alerts are closed or remediated.
>

> [!NOTE]
> The final release of ATA is [generally available](https://support.microsoft.com/help/4568997/update-3-for-microsoft-advanced-threat-analytics-1-9). ATA ended Mainstream Support on January 12, 2021. Extended Support will continue until January 2026. For more information, read [our blog](https://techcommunity.microsoft.com/t5/microsoft-security-and/end-of-mainstream-support-for-advanced-threat-analytics-january/ba-p/1539181).

## Prerequisites

To migrate from ATA to Defender for Identity, you must have an environment and domain controllers that meet Defender for Identity sensor requirements. For more information, see [Microsoft Defender for Identity prerequisites](prerequisites.md).

Make sure that all the domain controllers you plan to use have sufficient internet access to the Defender for Identity service. For more information, see [Configure endpoint proxy and internet connectivity settings](configure-proxy.md).

## Plan your migration

Before starting the migration, gather all of the following information:

- **Account details for your [Directory Services](directory-service-accounts.md) account**.

- **Syslog notification [settings](/defender-for-identity/notifications)**.

- **Email [notification details](notifications.md)**.

- **All [ATA role group memberships](/advanced-threat-analytics/ata-role-groups)**.

- **[VPN integration details](vpn-integration.md)**.

- **Alert exclusions**. Exclusions are not transferable from ATA to Defender for Identity, so details of each exclusion are required to [replicate the exclusions as Defender for Identity](exclusions.md) in Microsoft Defender XDR.

- **Account details for entity tags**. If you don't already have dedicated entity tags, create new ones for use with Defender for Identity. For more information, see [Defender for Identity entity tags in Microsoft Defender XDR](entity-tags.md).

- **A complete list of all entities, such as computers, groups, or users, that you want to manually tag as *Sensitive* entities**. For more information, see [Defender for Identity entity tags in Microsoft Defender XDR](entity-tags.md).

- **Report scheduling [details](/defender-for-identity/classic-reports)**, including a list of all reports and scheduled timing.

> [!CAUTION]
> Do not uninstall the ATA Center until all ATA Gateways are removed. Uninstalling the ATA Center with ATA Gateways still running leaves your organization exposed with no threat protection.

## Move to Defender for Identity

Use the following steps to migrate to Defender for Identity:

1. [Create your new Defender for Identity workspace](deploy-defender-identity.md#start-using-microsoft-defender-xdr).

1. Uninstall the ATA Lightweight Gateway on all domain controllers.

1. Install the Defender for Identity Sensor on all domain controllers:

    1. [Download the Defender for Identity sensor files](download-sensor.md) and retrieve the access key.

    1. [Install Defender for Identity sensors on your domain controllers](install-sensor.md).

1. [Configure the your Defender for Identity sensor](configure-sensor-settings.md).

After the migration is complete, allow two hours for the initial sync to be completed before moving on with validation tasks.

## Validate your migration

In Microsoft Defender XDR, check the following areas to validate your migration:

- Review any [health issues](health-alerts.md) for signs of service issues.
- Review Defender for Identity [sensor error logs](troubleshooting-using-logs.md) for any unusual errors.

## Post-migration activities

After completing your migration to Defender for Identity, do the following to clean up your legacy ATA resources:

1. Make sure that you've recorded or remediated all existing ATA alerts. Existing ATA security alerts aren't imported to Defender for Identity with the migration.
1. Do one or both of the following:

    - **Decommission the ATA Center**. We recommend keeping ATA data online for a period of time. 
    - **Back up Mongo DB** if you want to keep the ATA data indefinitely. For more information, see [Backing up the ATA database](/advanced-threat-analytics/ata-database-management#backing-up-the-ata-database).

## Related information

After migrating to Defender for Identity, learn more about investigating alerts in Microsoft Defender XDR. For more information, see:

- [Understanding security alerts](understanding-security-alerts.md)
- [Investigate Defender for Identity security alerts in Microsoft Defender XDR](manage-security-alerts.md)