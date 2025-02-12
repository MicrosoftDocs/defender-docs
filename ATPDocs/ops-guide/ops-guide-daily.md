---
title: Daily operational guide - Microsoft Defender for Identity
description: Learn about the Microsoft Defender for Identity activities that we recommend for your team on a daily basis.
ms.date: 01/29/2024
ms.topic: how-to
---

# Daily operational guide - Microsoft Defender for Identity

This article reviews the Microsoft Defender for Identity activities we recommend for your team on a daily basis.

## Review the ITDR dashboard

**Where**: In Microsoft Defender XDR, under select **Identities** > **Dashboard**.

**Persona**: SOC analysts, security administrators, identity, and access management administrators

Use Defender for Identity's **Dashboard** page to view critical insights and real-time data about identity threat detection and response (ITDR). On a daily basis, we recommend that you focus on the **Top insights**, **Identity related incidents**, and **Entra ID users at risk** widgets.

For more information, see [Work with Defender for Identity's ITDR dashboard (Preview)](../dashboard.md).

## Triage incidents by priority

**Where**: In Microsoft Defender XDR, select **Incidents & alerts**

**Persona**: SOC analysts

**When triaging incidents**:

1. In the incident dashboard, filter for the following items:

    |Filter   |Values  |
    |---------|---------|
    |**Status**     |   New, In progress      |
    |**Severity**     |  High, Medium, Low       |
    |**Service source**     |  Keep all service sources checked. This selection should list alerts with the most fidelity, with correlation across other Microsoft XDR workloads. Select **Defender for Identity** to view items that come specifically from Defender for Identity.       |

1. Select each incident to review all details. Review all tabs in the incident, the activity log, and advanced hunting.

1. In the incident's **Evidence and response** tab, select each evidence item. Select the options menu > **Investigate** and then select **Activity log** or **Go hunt** as needed.

1. Triage your incidents. For each incident, select **Manage incident** and then select one of the following options:

    - True positive
    - False positive
    - Informational, expected activity

    For true alerts, specify the threat type to help your security team see threat patterns and defend your organization from risk.

1. When you're ready to start your active investigation, assign the incident to a user and update the incident status to **In progress**.

1. When the incident is remediated, resolve it to resolve all linked and related active alerts and set a classification.

## Investigate users with a high investigation score

**Where**: In Microsoft Defender XDR and in Microsoft Entra.

In Microsoft Defender XDR:

1. Check the **Users at risk** widget on the **Home** page or the  **Entra ID users at risk** on the **Identities > Dashboard** page.

1. If you have users listed at *High risk*:

    - Select **View all users** to review high risk identities in Microsoft Entra.
    - Go to the **Identities** page and sort the grid to view users with high **Investigation priority** scores at the top. Select an identity to view the identity details page, including more details in the **Investigation priority** widget.

    The investigation priority widget includes the calculated investigation priority score breakdown and a two-week trend for an identity, including whether the identity score is on the high percentile for that tenant.

Find more identity-related information on:

- Individual alert or incident details pages
- Device details pages
- Advanced hunting queries
- The Action center page

**Persona**: SOC analysts

For more information, see:

- [Investigate users in Microsoft Defender XDR](/microsoft-365/security/defender/investigate-users)
- [Investigate assets](../investigate-assets.md)
- [Work with Defender for Identity's ITDR dashboard (Preview)](../dashboard.md)

## Configure tuning rules for benign true positives / false positive alerts

**Where**: In Microsoft Defender XDR, select **Hunting > Advanced hunting**

**Persona**: Security and compliance administrators, SOC analysts

If you find either benign true positives or outright false positives, we recommend that you tune your alerts to reduce the number of alerts you need to triage to match your risk appetite. Tuning alerts resolves alerts automatically based on your configurations and rule conditions.

We recommend creating new rules as needed as your network grows to make sure that your alert tuning remains relevant and effective.

For more information, see [Tune an alert](/microsoft-365/security/defender/investigate-alerts#tune-an-alert).

## Proactively hunt

**Where**: In Microsoft Defender XDR, select **Hunting > Advanced hunting**.

**Persona**: SOC analysts

You might want to proactively hunt on a daily or weekly basis, depending on your level as a SOC analyst.

Use Microsoft Defender XDR advanced hunting to proactively explore through the last 30 days of raw data, including Defender for Identity data correlated with data streaming from other Microsoft Defender XDR services.

Inspect events in your network to locate threat indicators and entities, including both known and potential threats.

We recommend that beginners use guided advanced hunting, which provides a query builder. If you're comfortable using Kusto Query Language (KQL), build queries from scratch as needed for your investigations.

For more information, see [Proactively hunt for threats with advanced hunting in Microsoft Defender XDR](/microsoft-365/security/defender/advanced-hunting-overview).

## Review Defender for Identity health issues

**Where**: In Microsoft Defender XDR, select **Identities > Health issues**.

**Persona**: Security administrators, Active Directory administrators

We recommend checking the **Health Issues** page regularly to check for any problems in your Defender for Identity deployment, such as connectivity or sensor issues. Make sure to check both the **Global** and **Sensor** tabs to view both types of issues.

We also recommend setting up email notifications for service issues so that you can catch issues as they happen.

For more information, see [Microsoft Defender for Identity health issues](../health-alerts.md) and [Configure email notifications](../notifications.md#configure-email-notifications).

## Related content

For more information, see:

- [Microsoft Defender XDR Security operations overview](/security/operations/overview)
- [Microsoft Defender for Identity operational guide](ops-guide.md)
- [Weekly operational guide - Microsoft Defender for Identity](ops-guide-weekly.md)
- [Monthly operational guide - Microsoft Defender for Identity](ops-guide-monthly.md)
- [Quarterly / Ad hoc operational guide - Microsoft Defender for Identity](ops-guide-quarterly.md)
