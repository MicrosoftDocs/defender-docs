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
ms.date: 07/02/2026
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
---

# Optimize and correct threat policies with configuration analyzer

## Overview

Configuration analyzer is a central location for managing email threat policies in your tenant. Compare your settings with Standard and Strict recommendations. You can also apply changes and review past updates that affected your security posture.

<a name="what-youll-need"></a>
## Prerequisites

- A Microsoft 365 organization with cloud mailboxes.
- Sufficient permissions (Security Administrator role)
- 5 minutes to perform the steps below.

## Compare settings and apply recommendations

Perform the following steps to compare your settings and apply recommended changes:

1. Navigate to [Configuration analyzer in the Microsoft Defender portal](https://security.microsoft.com/configurationAnalyzer).
1. Select **Standard recommendations** or **Strict recommendations** from the top menu.
1. If your settings differ from the chosen baseline, suggested changes appear.
1. Select a recommendation to view the suggested action, affected policy, and current setting.
1. To apply it, select **Apply recommendation**, then select **OK** to confirm.
1. To edit a policy directly, select **View policy** instead. A new tab opens with the policy for the selected recommendation.

## View historical configuration changes

In **Configuration analyzer**, select **Configuration drift analysis and history** from the top menu bar.

This page shows changes made to your threat policies in the selected time range. It also shows whether each change improved or lowered your security posture.

To learn more details about Configuration Analyzer, see [Configuration analyzer](../configuration-analyzer-for-security-policies.md).
