---
title: Migrate file policies to Microsoft Purview
description: Migrate your Microsoft Defender for Cloud Apps file policies to Microsoft Purview DLP or auto-labeling policies before the January 6, 2027 retirement deadline.
author: AbbyMSFT
ms.author: abbyweisberg
ms.service: defender-for-cloud-apps
ms.topic: how-to
ms.custom: msecd-doc-authoring-106
ms.date: 07/02/2026
ai-usage: ai-assisted

#customer intent: As a security admin, I want to migrate my Defender for Cloud Apps file policies to Microsoft Purview so that my data protection continues after file policies are retired.

---

# Migrate file policies to Microsoft Purview

> [!IMPORTANT]
> File policies in Defender for Cloud Apps are retiring on **January 6, 2027**. Recreate your file policies as Microsoft Purview data loss prevention (DLP) or auto-labeling policies before this date.

Defender for Cloud Apps continues to provide SaaS app discovery, posture management, and threat detection. File-based data protection is moving to Microsoft Purview.

## Prerequisites

Before you begin, confirm you have:

- **Microsoft Purview roles**: One of the following role group memberships in the Microsoft Purview compliance portal:
  - Compliance Administrator
  - Compliance Data Administrator
- **Defender for Cloud Apps roles**: Cloud App Security Administrator to review your existing file policies.
- A **Microsoft 365 E5** or **Microsoft 365 E5 Compliance** license (or an equivalent standalone Microsoft Purview DLP license).

## Review existing file policies

1. In the Microsoft Defender portal, go to **Cloud Apps** > **Policies** > **Policy management**.
1. Set the **Type** filter to **File policy**.
1. For each file policy, document the following:
   - Policy name and description
   - Target apps (for example, SharePoint, OneDrive, Box, Dropbox)
   - Content inspection method (Data Classification Service, regular expressions, or other)
   - Sensitive information types or labels that the policy detects
   - Context filters (sharing level, file type, user groups)
   - Governance actions (quarantine, remove sharing, apply label)
1. Categorize each policy by its purpose:
   - **DLP detection and response**: Policies that detect sensitive content and take protective action. Migrate these to Microsoft Purview DLP policies.
   - **Auto-labeling**: Policies that apply sensitivity labels based on content. Migrate these to Microsoft Purview auto-labeling policies.

## Feature comparison

The following table compares file policy capabilities with their Microsoft Purview equivalents. Use it to confirm where protection stays the same and to plan alternatives for capabilities that don't have a direct equivalent.

| Capability | Defender for Cloud Apps | Microsoft Purview | Recommended action |
|---|---|---|---|
| Architecture | API-based scanning of existing files | API-based for cloud apps, plus proactive scanning for Exchange, Teams, and endpoints | No action needed; protection is equivalent or better |
| Policy structure | One policy with one set of filters and actions | One policy with multiple rules, each with its own conditions and actions | Recreate each Defender for Cloud Apps file policy as one or more Purview DLP rules |
| Sensitivity labeling | Governance action inside file policy | Separate auto-labeling policy in Information Protection | Create a Purview auto-labeling policy for each labeling file policy |
| Sharing remediation | Remove specific collaborators, change link access, remove public access | Block further access only; doesn't change existing sharing | Use Restrict access actions; use Power Automate to remove existing sharing |
| User quarantine | Dedicated user quarantine folder | No direct equivalent | Use DLP restrict access and a Power Automate flow to move files to a quarantine folder |
| Admin quarantine | Admin quarantine with review workflow | Admin quarantine | Full parity |
| Simulation mode | Not available | Full simulation mode before enforcement | Run policies in simulation mode before enabling enforcement |
| Policy limit | 50 file policies per tenant | 10,000 information protection and governance policies; 600 DLP rules per tenant | No action needed |
| Folder scoping | Parent folder filter supported | Site-level scoping only | Scope policies to specific SharePoint sites as the closest equivalent |
| Content inspection with regular expressions | Built-in regular expression engine | Custom sensitive information types with regular expressions | Recreate regular expression patterns as custom sensitive information types in Purview |
| File metadata filters (more than 20 filters) | Native metadata-based filtering, such as folder, file ID, and quarantine status | Conditions based on content, label, sharing scope, and file extension | Use available Purview conditions as close equivalents; unsupported filters have no direct equivalent |

### File policy condition mapping

The following table maps specific Defender for Cloud Apps file policy conditions to their Purview equivalents.

| Defender for Cloud Apps condition | Purview equivalent | Equivalent support | Notes |
|---|---|---|---|
| Access level: External or Public | Content is shared from Microsoft 365 with people outside my organization | Equivalent | |
| Access level: Internal | Content is shared from Microsoft 365 only with people inside my organization | Equivalent | |
| Collaborators (entire organization) | Collaborators (domain) | Partial equivalent | Purview doesn't support a 1:1 match. Use Collaborators (domain) where the domain name maps to the organization name. |
| Select user groups | User groups condition | Equivalent | |
| Apply to files | Apply to files | Equivalent | |
| Sensitivity label | Content contains > Sensitivity labels | Equivalent | |
| Content inspection: preset expression or Data Classification Service | Content contains > Sensitive info types | Equivalent | Map each preset expression to the matching sensitive information type. Purview DLP uses the same detection engine. |
| Content inspection: custom regular expression | Content contains > Sensitive info types (custom) | Equivalent | Create a custom sensitive information type from the pattern first. |
| Minimum violation count | Instance count (minimum and maximum) per sensitive information type | Equivalent | |
| File name | Document name contains words or phrases | Equivalent | |
| File extension | File extension is | Equivalent | |
| Created date | Document created date | Partial equivalent | SharePoint and OneDrive only. |
| Last modified date | Document last modified date | Partial equivalent | SharePoint and OneDrive only. |
| Parent folder | SharePoint site-level scoping | Partial equivalent | No folder-level scoping. Scope to the SharePoint site instead. |
| File ID | None | No equivalent | Purview doesn't support File ID as a condition, so this condition isn't migratable. |

### Microsoft app support

| Defender for Cloud Apps app | Purview location | Equivalent support | Notes |
|---|---|---|---|
| SharePoint Online | SharePoint sites | Equivalent | |
| OneDrive for Business | OneDrive accounts | Equivalent | |

> [!IMPORTANT]
> Policies in Defender for Cloud Apps and Purview can't coexist. Running equivalent policies in both products at the same time creates enforcement conflicts. Disable Defender for Cloud Apps policies only after you validate and turn on the Purview policies.

## Migrate Defender DLP detection and response policies to Microsoft Purview DLP policies

Create equivalent DLP policies in Microsoft Purview for each file policy you categorized as "DLP detection and response."

1. Go to the [Microsoft Purview portal](https://purview.microsoft.com).
1. Select **Data loss prevention** > **Policies** > **Create policy**.
1. Choose the policy template that best matches your file policy, or select **Custom policy** to define conditions manually.
1. Set the policy scope to the same locations as your file policy. For SharePoint and OneDrive, select **SharePoint sites** and **OneDrive accounts**.  

1. Define content conditions that match your file policy:
   - Select the same sensitive information types in Purview.
   - If your file policy used DCS (Data Classification Service) for content inspection, Purview DLP uses the same detection engine.
   - If your file policy used regular expression patterns, recreate them as custom sensitive information types in Purview.

1. Configure protective actions that match your file policy governance actions:

   | Defender for Cloud Apps governance action | Purview DLP equivalent | Equivalent support | Notes |
   |---|---|---|---|
   | Notify file owner | User notifications: Notify who last modified | Equivalent | |
   | Notify specific users | User notifications: Notify specific people | Equivalent | |
   | Send alert | Incident reports: Send alert to admins | Equivalent | |
   | Remove public access | Restrict access: Block everyone except owner | Equivalent | |
   | Remove external users | Restrict access: Block people outside org | Equivalent | |
   | Remove direct shared link | Restrict access: Remove sharing link | Equivalent | |
   | Make private | Restrict access: Block everyone except owner | Equivalent | |
   | Admin quarantine | Admin quarantine | Equivalent | |
   | Apply sensitivity label | Apply sensitivity label (auto-labeling policy) | Equivalent | Purview > Information Protection > Auto-labeling |
   | Remove sensitivity label | Auto-labeling Remove labels only policy | Equivalent | Purview > Information Protection > Auto-labeling > Remove labels |
   | User quarantine | No direct equivalent | No equivalent | DLP restrict access and Power Automate (move to quarantine folder) |
   | Trash or delete file | No direct equivalent | No equivalent | DLP restrict access and Power Automate (delete on alert) |
   | Remove specific collaborator | No direct equivalent | No equivalent | SharePoint admin or Power Automate |
   | Expire shared link | No direct equivalent | No equivalent | SharePoint sharing policies and Microsoft Entra Conditional Access |
   | Transfer file ownership | No direct equivalent | No equivalent | Manual process or Power Automate (Google Workspace specific) |

1. Set up user notifications and policy tips to match your file policy's alert settings.
1. Set the policy to **simulation mode** to confirm it detects the same content as your file policy.
1. After confirming the results are accurate, turn the policy on.

## Migrate auto-labeling file policies to Microsoft Purview

Create auto-labeling policies in Microsoft Purview for each file policy you categorized as "Auto-labeling."

1. Go to the [Microsoft Purview portal](https://purview.microsoft.com).
1. Select **Information protection** > **Auto-labeling**.
1. Select **Create auto-labeling policy**.
1. Choose the sensitive information types or conditions that match your file policy's content inspection rules.
1. Select the sensitivity label to apply (use the same label your file policy applied).
1. Set the scope to the same locations:
   - Select **SharePoint sites** and **OneDrive accounts** to match your file policy's target apps.
   - Add specific sites or accounts if your policy was scoped to particular groups or locations.
1. Run the policy in **simulation mode** to review matched files before enabling automatic labeling.
1. After confirming the results are accurate, turn on the auto-labeling policy.

> [!NOTE]
> Auto-labeling policies label new and changed files going forward. To find and label sensitive content in files already at rest in SharePoint and OneDrive, run an [on-demand classification](/purview/on-demand-classification) scan for the same sensitive information types.

## Migration examples

The following examples show how common file policies map to Purview policies.

### Detect externally shared files with credit card numbers

*File policy*: Detects files shared externally that contain credit card numbers in SharePoint and OneDrive, notifies the file owner, removes external users, and sends an alert.

Create a Purview DLP policy:

1. Set the scope to **SharePoint sites** and **OneDrive accounts**.
1. Add conditions: **Content contains** > **Sensitive info types** > **Credit Card Number**, and **Content is shared from Microsoft 365** > **with people outside my organization**.
1. Add actions: **Restrict access** > **Block only people outside your organization**.
1. Set user notifications to **Notify the user who last modified the content**.
1. Set incident reports to send an alert to your compliance team.

### Detect and label files in multiple apps

*File policy*: Applies a **Confidential - PII** label, notifies the owner, and alerts on files that contain Social Security or passport numbers in SharePoint and OneDrive.

This file policy detects and labels, so recreate it as two Purview policies:

- An auto-labeling policy that applies **Confidential - PII** with conditions for the Social Security and passport sensitive information types.
- A DLP policy with the same conditions that notifies the owner and sends an alert.

## Roll out your Purview policies in stages

Move to enforcement in stages:

1. Run new policies in simulation mode and compare matches against your file policies.
1. Enforce for a small pilot group and confirm the actions and user experience.
1. Expand enforcement to your whole organization once the pilot is stable.

## Verify your migration

After you create your Purview policies, check that your protection is complete:

1. Compare the number and scope of your new Purview policies with your file policy inventory.
1. Check that all sensitive information types and labels are included.
1. Run Purview DLP policies in simulation mode and compare results with your active file policies.

## Decommission your file policies

After your Purview policies run successfully and provide equivalent protection, retire your file policies:

1. Export or take screenshots of each file policy's configuration and keep them for reference.
1. In the Microsoft Defender portal, edit each migrated file policy and set its state to **Disabled**. Don't delete it yet.
1. Monitor to confirm the Purview policies provide equivalent protection.
1. After validation with the file policies disabled, delete each one.

## Find alerts and activity after migration

Use these locations to review policy matches and activity after migration:

| Data | Location |
|---|---|
| DLP policy matches and alerts | [Microsoft Purview portal](https://purview.microsoft.com) > **Data loss prevention** > **Alerts** |
| Activity history | Microsoft Purview portal > **Data loss prevention** > **Activity explorer** |
| Auto-labeling matches | Microsoft Purview portal > **Information protection** > **Auto-labeling** > *policy* > **Items to review** |
| Incidents | Microsoft Defender portal > **Incidents & alerts** |

## Troubleshooting

| Issue | Cause | Resolution |
|---|---|---|
| DLP policy doesn't match the expected files | Sensitive information type confidence level is too high, or the location scope is incorrect | Lower the confidence level and confirm all relevant sites are in scope. |
| Too many false positives | The sensitive information type is too broad, or it's missing supporting context | Use a higher confidence level and add keyword lists to custom sensitive information types. |
| Auto-labeling doesn't apply labels | The label isn't published to users, or simulation is still running | Confirm the label is published and review the auto-labeling simulation results. |
| Alerts aren't generated | Incident reports aren't enabled, or alert recipients aren't configured | Enable incident reports in the rule and confirm the recipients. |
| Policy matches but the action isn't enforced | The policy is still in test or simulation mode | Turn the policy on after you validate the results. |

## Related content

- [File policies in Microsoft Defender for Cloud Apps](data-protection-policies.md)
- [Learn about data loss prevention](/purview/dlp-learn-about-dlp)
- [Learn about auto-labeling policies](/purview/apply-sensitivity-label-automatically)
- [Integrate with Microsoft Purview](azip-integration.md)
