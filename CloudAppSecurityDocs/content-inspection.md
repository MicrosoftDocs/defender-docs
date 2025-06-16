---
title: DLP content inspection
description: This article describes the process Defender for Cloud Apps follows when performing DLP content inspection on data in your cloud.
ms.date: 06/16/2025
ms.topic: how-to
---
# DLP content inspection in Microsoft Defender for Cloud Apps

When you enable content inspection, you can choose to inspect content using preset expressions or custom expressions that you define. You can also set a minimum number of content violations that must be detected before a file is considered a policy violation. For example, to trigger a policy when at least 10 credit card numbers are found in a file, set the violation threshold to 10.

When content matches an expression, the matched text is masked by replacing it with "X" characters. By default, Defender for Cloud Apps displays 100 characters of surrounding context before and after each violation. Any numbers in the surrounding context are replaced with "#" characters and aren't stored in Defender for Cloud Apps.

If you want to partially reveal detected values, you can enable the **Unmask the last four characters of a match** option in the file policy. This option reveals only the last four characters of the matched text.

You must specify which file elements are included in the inspection: content, metadata, or file name. By default, content and metadata are inspected.


## Prerequisites

Before you can inspect encrypted files, you must grant one-time admin consent. 

1. In the Defender portal, go to **Settings > Cloud Apps > Microsoft Information Protection > Inspect protected files**.

1. Select Grant permission and to grant Defender for Cloud Apps permission in Microsoft Entra ID.

## Content inspection for protected files


Defender for Cloud Apps allows admins to grant permission to decrypt encrypted files and scan their content for violations. This consent is also required to enable scanning labels on encrypted files.

When you grant consent, Defender for Cloud Apps provisions the Microsoft Cloud App Security (Internal) app in your tenant. This app must remain enabled. The app uses the Azure Rights Management Services > Content.SuperUser permission to decrypt and inspect protected files.

The following app IDs apply based on your Microsoft cloud environment:

**App IDs**

| Environment | App ID |
|--------------|---------|
| Public | 25a6a87d-1e19-4c71-9cb0-16e88ff608f1 |
| Fairfax | bd5667e4-0484-4262-a9db-93faa0893899 |
| GCCM | 23105e90-1dfc-497a-bb5d-8b18a44ba061 |


## Configure Microsoft Information Protection settings

In order to give Defender for Cloud Apps the necessary permissions:

1. Go to **Settings** > **Microsoft Information Protection**.
1. Under **Microsoft Information Protection settings**, configure one or both of the following options:

   - **Automatically scan new files for Microsoft Information Protection sensitivity labels and content inspection warnings**  
     When enabled, the App connector scans new files for embedded sensitivity labels from Microsoft Information Protection.

   - **Only scan files for Microsoft Information Protection sensitivity labels and content inspection warnings from this tenant**  
     When enabled, only sensitivity labels applied within your tenant are scanned. Labels applied by external tenants are disregarded.

1. After selecting your options, select **Save** to apply your changes.

## Configure file policies for protected files

1. In the Defender portal, go to **Policies > Policy management**.
1. Create or edit a file policy.
1. You can configure the settings per file policy to determine which policies will scan protected files.
1. Specify a regular expression to exclude a file from the results. This option is highly useful if you have an inner classification keyword standard that you want to exclude from the policy.


## Next steps

- [Learn how to control cloud apps using policies](control-cloud-apps-with-policies.md)
- [Integrate with Microsoft Purview for information protection](azip-integration.md)

[!INCLUDE [Open support ticket](includes/support.md)]
