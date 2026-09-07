---
title: Migrate file policies to Microsoft Purview
description: Migrate your Microsoft Defender for Cloud Apps file policies to Microsoft Purview DLP or auto-labeling policies before the January 6, 2027 retirement deadline.
author: AbbyMSFT
ms.author: abbyweisberg
ms.service: defender-for-cloud-apps
ms.topic: how-to
ms.custom: msecd-doc-authoring-106
ms.date: 08/28/2026
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

## Migrate policies with the DLP to Purview migration tool

Use the **DLP to Purview migration** tool to move eligible file policies to Microsoft Purview without recreating them by hand. The tool reads your existing policies, groups them by migration readiness, shows you the Purview payload it plans to create, and then creates the policies in Purview for you.

### Prerequisites for the migration tool

Before you begin, confirm you meet the following requirements:

- **Supported environment**: You're a commercial cloud customer using a Production environment. The tool isn't available for government or sovereign clouds.
- **Permissions**: You have Security Administrator permissions to view your Defender for Cloud Apps DLP policies, and Compliance Administrator permissions to create DLP policies in Microsoft Purview.
- **Existing policies**: You have one or more Defender for Cloud Apps DLP file policies that you want to migrate.
- **Licensing**: You have the required E5 or Information Protection and Governance (IP&G) licensing for the Purview products.
- **Purview access**: You can sign in to the Microsoft Purview portal with the Compliance Administrator role to review the migrated policies.
- **Browser and session**: You use a current, supported browser and keep your session active so migration isn't interrupted.

### What the tool supports

The migration tool supports SharePoint and OneDrive DLP file policies only. The following aren't supported yet:

- Auto-labeling policy migration for Microsoft workloads.
- DLP and auto-labeling policy migration for non-Microsoft apps, including Google Workspace, Box, Dropbox, and Salesforce.

The wizard shows these unsupported scenarios in a **Coming soon** callout in Step 1, so you can see what's planned for future releases.

> [!TIP]
> Review your policies before you start. The tool groups policies as **Can migrate**, **Partial migration**, or **Cannot migrate**, so knowing which policies you want to move helps you plan the run.

### Open the migration tool

1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **Cloud apps** > **Policies** > **Policy management**.
1. Select the **All policies** tab. A banner states that file policies in Defender for Cloud Apps are retired on January 6, 2027, and that you should migrate your existing policies to Microsoft Purview to maintain coverage.
1. Select **Migrate** on the banner. The **DLP to Purview migration** wizard opens and guides you through four steps.

:::image type="content" source="media/migrate-file-policies-to-purview/banner-migrate-button.png" alt-text="Screenshot of the Policies page in the Microsoft Defender portal showing the file policy retirement banner and the Migrate button." lightbox="media/migrate-file-policies-to-purview/banner-migrate-button.png":::

### Step 1 of 4: Select policies

1. Review your policies, which are grouped under the **Can migrate**, **Partial migration**, and **Cannot migrate** tabs. Each tab shows the number of policies it contains.
1. Expand a policy's **Notes** to see why it's in that group, such as *Target apps supported in Purview DLP* or *Content inspection can be mapped to Purview SITs*.
1. Use the checkboxes to select the policies you want to migrate. You can select more than one. Policies already marked **Migrated** can't be selected again.
1. Use the **Search policies** box to find a specific policy by name.
1. Review the **Coming soon** callout to see capabilities planned for future releases.
1. Confirm the count at the bottom of the pane, such as *1 policy ready to migrate*, then select **Next**.

:::image type="content" source="media/migrate-file-policies-to-purview/step-1-select-policies.png" alt-text="Screenshot of Step 1 of the DLP to Purview migration wizard showing policies grouped under the Can migrate, Partial migration, and Cannot migrate tabs." lightbox="media/migrate-file-policies-to-purview/step-1-select-policies.png":::

### Step 2 of 4: Review payload

1. Review the Purview payloads that the tool creates for each selected policy. Warnings call out fields that need manual attention.
1. Check the **Verdict** for each policy, such as *Fully migratable*.
1. Select **Show payload** to expand the full payload, and use the copy icon to copy it for your records.
1. You don't need to enter a policy name. The tool generates the Purview policy name automatically.
1. Select **Migrate** to start creating the policies in Purview.

:::image type="content" source="media/migrate-file-policies-to-purview/step-2-review-payload.png" alt-text="Screenshot of Step 2 of the wizard showing the migration verdict for a selected policy and the Show payload option." lightbox="media/migrate-file-policies-to-purview/step-2-review-payload.png":::

### Step 3 of 4: Migration in progress

The tool creates your policies and shows a running count, such as *0 of 1 policies processed*. Wait for the process to finish. This screen advances to Step 4 automatically when migration completes.

> [!IMPORTANT]
> Don't close this window until the migration is complete. Closing the tool early can create improper or incomplete policies in Purview. Wait for the completion screen to load.

:::image type="content" source="media/migrate-file-policies-to-purview/step-3-migration-in-progress.png" alt-text="Screenshot of Step 3 of the wizard showing migration progress and a warning not to close the window." lightbox="media/migrate-file-policies-to-purview/step-3-migration-in-progress.png":::

### Step 4 of 4: Migration complete

1. Review the results table, which lists each policy in three columns: **MDA Policy**, **Purview Policy**, and **Status**. The **MDA Policy** column also shows the policy GUID and rule GUID for each source policy.
1. Check the status for each row. A successful row shows **Created in Purview**.
1. Open the [Microsoft Purview DLP policies page](https://purview.microsoft.com/datalossprevention/policies) to review the policies created in Purview.
1. Select **Done** to close the wizard.

:::image type="content" source="media/migrate-file-policies-to-purview/step-4-migration-complete.png" alt-text="Screenshot of Step 4 of the wizard showing the results table with the MDA Policy, Purview Policy, and Status columns." lightbox="media/migrate-file-policies-to-purview/step-4-migration-complete.png":::

### Review the migrated policies in Purview

Migrated policies appear on the **Data loss prevention** > **Policies** page in the Microsoft Purview portal, with these characteristics:

- **Naming**: The tool names each policy `[Migrated] <original policy name> (1P DLP)`. A source policy that targets both SharePoint and OneDrive produces two Purview policies, one for each location.
- **Mode**: New policies are created in **Test with notifications** mode, so they don't enforce actions until you turn enforcement on.
- **Policy sync status**: Newly created policies show **Sync in progress** until the policy finishes deploying.

Validate each policy in test mode before you turn on enforcement and disable the original file policy.

:::image type="content" source="media/migrate-file-policies-to-purview/purview-migrated-policies.png" alt-text="Screenshot of the Data loss prevention Policies page in the Microsoft Purview portal listing the migrated policies." lightbox="media/migrate-file-policies-to-purview/purview-migrated-policies.png":::

### Frequently asked questions about the migration tool

#### Which environments does the tool support?

The migration tool is available for commercial cloud customers in all Production environments. Government and sovereign clouds aren't in scope at this time.

#### How do I open the migration tool?

Select **Migrate** on the retirement banner shown on the **Policies** page in the Microsoft Defender portal. The migration wizard opens directly from the banner.

#### Do I need to name the new Purview policy?

No. The tool generates the Purview policy name automatically, using the format `[Migrated] <original policy name> (1P DLP)`.

#### What do "Can migrate," "Partial migration," and "Cannot migrate" mean?

Your existing policies are grouped by how completely they can be moved. **Can migrate** policies transfer fully, **Partial migration** policies transfer with some settings that might need manual review, and **Cannot migrate** policies aren't supported for migration.

#### Can I select more than one policy at a time?

Yes. Step 1 supports multi-select with checkboxes, so you can migrate several eligible policies in a single run.

#### Where can I see the policies after migration?

After migration completes, open the [Microsoft Purview DLP policies page](https://purview.microsoft.com/datalossprevention/policies) to review the policies that were created in Purview.

#### Does migrating remove my original file policies?

No. Migration creates new equivalent policies in Purview. Review your source and target policies in the Purview portal before you decommission any original policy.

#### What is the "Coming soon" section in Step 1?

It highlights migration capabilities planned for upcoming releases, including auto-labeling policy migration for Microsoft workloads and policy migration for Google Workspace, Box, Dropbox, and Salesforce.

### Known issues with the migration tool

| Issue | Cause | Workaround |
|---|---|---|
| Closing the tool during migration | Closing the window or navigating away while Step 3 is running can create incomplete or improperly configured policies. | Keep the tool open until Step 4 appears. If you closed early, review the affected policies in Purview and rerun migration for any that are incomplete. |
| Policy appears under **Cannot migrate** | The policy uses configuration that automated migration doesn't yet support. | Recreate the policy manually in Purview, or wait for the expanded support noted in the **Coming soon** callout. |
| Partial results in the completion table | Some selected policies show a non-successful status in the Step 4 results table. | Note the affected **MDA Policy** rows, then rerun the wizard for just those policies. Check the **Status** column for the specific reason. |
| Banner not visible | The banner might not appear if it was previously dismissed or your view isn't refreshed. | Refresh the portal. If the banner still doesn't appear, confirm you're in a supported commercial Production environment. |

If an issue persists after you try the workaround, contact your support channel and include the policy names and the status shown in the Step 4 results table.

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
| Sharing remediation | Remove specific collaborators, change link access, remove public access | Block everyone, people outside the organization, or specific external domains or users; doesn't change existing sharing | Use Restrict access actions; use Power Automate to remove existing sharing |
| User quarantine | Dedicated user quarantine folder | File quarantine for SharePoint and OneDrive moves the file to an admin-controlled quarantine site and removes user access | Use the native file quarantine action; use Power Automate only for custom destination or workflow requirements |
| Admin quarantine | Admin quarantine with review workflow | File quarantine in an admin-controlled SharePoint site | Equivalent containment capability |
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

### Non-Microsoft app support

Microsoft Purview DLP extends to non-Microsoft connected apps, so you can detect, monitor, and protect sensitive data at rest in non-Microsoft SaaS applications. These policies use the same classification engine and policy framework as Microsoft 365 locations.

| Defender for Cloud Apps app | Purview location | Equivalent support | Notes |
|---|---|---|---|
| Box | Box | Equivalent (preview) | Requires a Defender for Cloud Apps app connector. |
| Dropbox | Dropbox | Equivalent (preview) | Requires a Defender for Cloud Apps app connector. |
| Google Workspace | Google Workspace | Equivalent (preview) | Requires a Defender for Cloud Apps app connector. |
| Salesforce | Salesforce | Equivalent (preview) | Requires a Defender for Cloud Apps app connector. |

> [!NOTE]
> Support for non-Microsoft connected apps is in preview, and the apps roll out in phases. Not all apps are available in every tenant at the same time.

Keep the following requirements in mind when you plan this part of your migration:

- **App connector required**: Connect each app to Defender for Cloud Apps with an app connector before you apply a Purview DLP policy to it. Purview uses the existing Defender for Cloud Apps connectors to reach the app. For more information, see [Connect apps](enable-instant-visibility-protection-and-governance-actions-for-your-apps.md).
- **Custom policy template only**: Create these policies with the **Custom** policy template. The predefined Financial, Medical and health, and Privacy templates don't support non-Microsoft app locations.
- **Separate policies per location type**: You can select several non-Microsoft apps in one policy, but you can't combine them with SharePoint, OneDrive, Exchange, Fabric, or Devices locations in the same policy.
- **Advanced DLP rules only**: Configure these policies with advanced DLP rules. Available conditions and actions vary by app.
- **Notification limits**: Policy tips and user overrides aren't supported for non-Microsoft apps.

The DLP to Purview migration tool doesn't migrate non-Microsoft app policies yet, so recreate these policies manually in Purview for now.

> [!TIP]
> **Learn more:** For the supported app list, prerequisites, and step-by-step instructions to create a DLP policy for these apps, see [Use Microsoft Purview data loss prevention policies for non-Microsoft connected apps](/purview/dlp-non-microsoft-connected-applications) in the Microsoft Purview documentation.

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
   | Admin quarantine | File quarantine for SharePoint and OneDrive | Equivalent | Moves the file to an admin-controlled quarantine site, removes permissions and sharing links, and preserves the file for investigation |
   | Apply sensitivity label | Apply sensitivity label (auto-labeling policy) | Equivalent | Purview > Information Protection > Auto-labeling |
   | Remove sensitivity label | Auto-labeling Remove labels only policy | Equivalent | Purview > Information Protection > Auto-labeling > Remove labels |
   | User quarantine | File quarantine for SharePoint and OneDrive | Partial equivalent | Purview moves the file to an admin-controlled quarantine site rather than a user quarantine folder |
   | Trash or delete file | No direct equivalent | No equivalent | DLP restrict access and Power Automate (delete on alert) |
   | Remove specific collaborator | Restrict access: Block access for specific external domains or users (Preview) | Partial equivalent | Blocks access for configured external domains or users, but doesn't remove the existing sharing relationship |
   | Expire shared link | No direct equivalent | No equivalent | SharePoint sharing policies and Microsoft Entra Conditional Access |
   | Transfer file ownership | No direct equivalent | No equivalent | Manual process or Power Automate (Google Workspace specific) |

1. Set up user notifications and policy tips to match your file policy's alert settings.
1. Set the policy to **simulation mode** to confirm it detects the same content as your file policy.
1. After confirming the results are accurate, turn the policy on.

For SharePoint and OneDrive, configure the Purview DLP file quarantine location before you use the quarantine action. When a rule triggers, Purview removes the file's permissions and sharing links, moves the file to the admin-controlled quarantine site, and leaves a notification file in the original location. For more information, see [Learn about DLP file quarantine for SharePoint and OneDrive](/purview/dlp-spo-odb-quarantine-learn).

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
- [Use Microsoft Purview DLP policies for non-Microsoft connected apps](/purview/dlp-non-microsoft-connected-applications)
