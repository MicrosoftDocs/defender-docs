---
title: Monthly operational guide - Microsoft Defender for Cloud Apps
description: This article provides monthly operational recommendations to help security operations teams to plan and run security activities.
ms.date: 12/13/2023
ms.topic: reference
---

# Monthly operational guide - Microsoft Defender for Cloud Apps

This article lists monthly operational activities that we recommend you perform with Microsoft Defender for Cloud Apps.

Monthly activities can be performed more frequently or as needed, depending on your environment and needs.

## Review policy assessments

**Where**: In the Microsoft Defender XDR Portal, select **Cloud apps > Policies > Policy management**

**Persona**: Security and Compliance administrators

Review the policies and make any necessary updates to ensure they're still appropriate for your organization.

- **Check for false positive and benign true positive rates, and adjust policies where rates are too high**. For example, ensure that any new corporate IP address is properly configured in your Defender for Cloud Apps settings to avoid impossible travel false positives.

- **Review business needs and assess requirements for custom policies**. For example, is the threat detected by each policy still relevant? Or is there a new, built in solution to detect that threat?

- **Clear old alerts**. For example:

    1. View alerts from the last six months. Filter out alerts that are marked as *Resolved*, and group similar alerts to make viewing simpler.
    1. Verify why each alert displayed isn't addressed.
    1. If alerts are benign, dismiss them and adjust policies as needed.

For more information, see [Control cloud apps with policies](../control-cloud-apps-with-policies.md).

## Review activity logs

**Where**: In the Microsoft Defender XDR Portal, under **Cloud apps**, select **Activity log**.

**Persona**: Security and Compliance administrators

You frequently review activity logs in relation to alerts and as part of threat investigations. We recommend revisiting the Activity log monthly to check for repeated activities by the same entity, such as multiple searches or sign-ins by the same user.

1. Pivot results by activity type, such as failed sign-ins, or deleting or assigning privileges.
1. Narrow down activity to an app or a user.
1. Use the results to create a new policy to help you monitor more closely and respond to potential threats.

For more information, see [Activity queries](../activity-filters-queries.md#activity-queries).

## Related content

[Microsoft Defender for Cloud Apps operational guide](ops-guide.md)
