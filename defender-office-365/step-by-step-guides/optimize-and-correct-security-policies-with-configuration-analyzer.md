---
title: Optimize and correct threat policies with configuration analyzer
description: Use Configuration Analyzer to compare your email threat policies with Standard and Strict recommendations, apply suggested changes, and review historical configuration changes.
ms.service: defender-office-365
author: chrisda
ms.author: chrisda
ms.localizationpriority: medium
ms.collection:
- m365-guidance-templates
- m365-security
- tier3
ms.topic: how-to
ms.date: 06/12/2026
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1014
---

# Optimize and correct threat policies with configuration analyzer

Configuration analyzer is a central location and single pane of glass for administering and viewing the email threat policies you have configured in your tenant. You can perform a side-to-side comparison of your settings to our Standard and Strict recommended settings, apply recommendations and view historical changes that affected your posture.

<a name="what-youll-need"></a>
## Prerequisites

- A Microsoft 365 organization with cloud mailboxes.
- Sufficient permissions (Security Administrator role)
- 5 minutes to perform the steps below.

## Compare settings and apply recommendations

Perform the following steps to compare your settings and apply recommended changes:

1. Navigate to [Configuration analyzer in the Microsoft Defender portal](https://security.microsoft.com/configurationAnalyzer).
1. Pick either **Standard recommendations** or **Strict recommendations** from the top menu based on the side-to-side comparison you'd like to make.
1. If Configuration Analyzer detects settings that differ from the selected recommendation baseline, recommendations for policy changes are displayed.
1. You can then select a recommendation, note the recommended action, policy which the recommendation is applicable to, setting name & current configuration etc.
1. With a recommendation selected, you can press **Apply recommendation** and then **OK** on the confirmation message that appears.
1. If you wish to manually edit a policy, or confirm settings directly within the policy, you can press **View policy** instead of **Apply recommendation** which will load a new tab and take you directly to the affected policy for ease.

## View historical configuration changes

While in **Configuration analyzer** you can select **Configuration drift analysis and history** from the top menu bar.

The **Configuration drift analysis and history** page shows the modifications to your threat policies in the timeframe selected by the filters, along with data about the change and if it increased or decreased your overall posture.

To learn more details about Configuration Analyzer, see [Configuration analyzer](../configuration-analyzer-for-security-policies.md).
