---
title: DLP content inspection
description: This article describes the process Defender for Cloud Apps follows when performing DLP content inspection on data in your cloud.
ms.date: 06/26/2025
ms.topic: how-to
---
# DLP content inspection in Microsoft Defender for Cloud Apps


Data Loss Prevention (DLP) in Defender for Cloud Apps relies on content inspection for identifying sensitive data within files. This inspection allows you to define expressions, thresholds, and rules that determine when files violate your organization’s data protection policies. Together, DLP policies and content inspection enable automated detection, alerting, and enforcement across files stored in connected cloud applications.

When you enable content inspection, you can choose to inspect content using preset expressions or custom expressions that you define. You can also set a minimum number of content violations that must be detected before a file is considered as a policy violation. For example, to trigger a policy when at least 10 credit card numbers are found in a file, set the violation threshold to 10.

When content matches an expression, the matched text is masked by replacing it with "X" characters. By default, Defender for Cloud Apps displays 100 characters of surrounding context before and after each violation. Any numbers in the surrounding context are replaced with "#" characters and aren't stored in Defender for Cloud Apps.

This approach is critical for meeting compliance regulations. For example, if an employee shares a file containing sensitive information such as credit card numbers or ID numbers with an unauthorized party (such as a vendor), the file policy can alert administrators or block the activity. This ensures that sensitive data is protected and that vendors or external parties can't access information that violates compliance policies.

If you want to partially reveal detected values, you can enable the **Unmask the last four characters of a match** option in the file policy. This option reveals only the last four characters of the matched text.

You must specify which file elements are included in the inspection: content, metadata, or file name. By default, content and metadata are inspected. This enables inspection of protected content, helping you detect sensitive data, enforce compliance, and apply governance actions on encrypted files. It helps reduce false positives and align policy enforcement with internal classification standards.

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

>[!NOTE]
>These app IDs represent the internal service principal (app registration) used by Defender for Cloud Apps in each environment (Public, Fairfax, and GCCM) to enable inspection and enforcement of protected files. Disabling or removing this app breaks inspection and prevent DLP policies from applying to protected files. Always verify that the app ID for your environment is present and enabled to maintain inspection and enforcement capabilities.

## Configure Microsoft Information Protection settings

In order to give Defender for Cloud Apps the necessary permissions:

1. Go to **Settings** > **Microsoft Information Protection**.
1. Under **Microsoft Information Protection settings**, configure one or both of the following options:

   - **Automatically scan new files for Microsoft Information Protection sensitivity labels and content inspection warnings.** When enabled, the App connector scans new files for embedded sensitivity labels from Microsoft Information Protection.

   - **Only scan files for Microsoft Information Protection sensitivity labels and content inspection warnings from this tenant.** When enabled, only sensitivity labels applied within your tenant are scanned. Labels applied by external tenants are disregarded.

1. After selecting your options, select **Save** to apply your changes.

## Configure file policies for protected files

1. In the Defender portal, go to **Settings > Cloud Apps > Policies > Policy management**.
1. Follow the steps to [create a new file policy](data-protection-policies.md#create-a-new-file-policy).
1. Select either **Apply to all files**, or **Apply to selected files** to specify which files will be scanned. This option is useful if you have an inner classification keyword standard that you want to exclude from the policy.
1. Select **Inspection method** > **Data Classification Service** to enable content inspection for the policy.
1. Check both boxes - **Inspect protected files** and **Unmask the last 4 characters of a match**.

:::image type="content" source="media/content-inspection/inspection-method-data-classification-service.png" alt-text="Screenshot that shows the Data classification service inspection method.":::


## Next steps

- [Learn how to control cloud apps using policies](control-cloud-apps-with-policies.md)
- [Integrate with Microsoft Purview for information protection](azip-integration.md)

[!INCLUDE [Open support ticket](includes/support.md)]
