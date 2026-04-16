---
title: Set up Microsoft Defender Experts for Servers
description: Learn how to set up Microsoft Defender Experts for Servers by selecting coverage, granting permissions, and configuring notifications in the Microsoft Defender portal.
ms.service: defender-experts
ms.subservice: dex-xdr
ms.author: pauloliveria
author: poliveria
ms.localizationpriority: medium
manager: orspodek
audience: ITPro
ms.collection:
  - m365-security
  - tier1
  - essentials-get-started
ms.topic: how-to
ms.custom:
- cx-ti
- cx-dex
- msecd-doc-authoring-1012
search.appverid: met150
ms.date: 04/16/2026

#customer intent: As a security administrator, I want to set up Defender Experts for Servers so that my organization's cloud server workloads are covered by Microsoft's managed detection and response service.

---

# Set up Microsoft Defender Experts for Servers

**Applies to:**

- [Microsoft Defender Experts for Servers](dex-servers-overview.md)

After purchasing the Defender Experts for Servers service, set up cloud workload coverage in the Microsoft Defender portal. The setup process involves selecting your coverage options, onboarding your cloud resources, granting permissions to experts, configuring notification contacts, and preparing your environment so that Defender Experts can begin monitoring your server infrastructure.

## Prerequisites

Before you begin, make sure you have the following items:

- A Defender Experts for Servers license. If you're interested in purchasing this service, complete the [Defender Experts customer interest form](https://aka.ms/IWantDefenderExperts).
- [Defender for Servers Plan 1 or Plan 2](/azure/defender-for-cloud/defender-for-servers-overview) enabled in Microsoft Defender for Cloud
- [Endpoint protection](/azure/defender-for-cloud/integration-defender-for-endpoint) turned on for Windows and Linux devices in Defender for Cloud
- **Security Administrator** or **Global Administrator** role in the Microsoft Defender portal

<!-- TODO: Confirm the exact role requirements for accessing the Cloud workloads settings page. The Figma design shows a banner stating "Only a global administrator in your organization can give access." Verify whether Security Administrator is also sufficient. -->

## Select coverage options

The **Cloud workloads** settings page lets you choose which cloud workload types Defender Experts covers. You can select server coverage, container coverage, or both.

To select your coverage options:

1. In the Microsoft Defender portal, go to **Settings** > **Defender Experts** > **Cloud workloads**.

1. Under **Step 1: Select coverage options**, select the coverage types you want to enable:

   - **Defender experts for server** - Covers all your servers in your tenant that have Defender for Servers protection enabled in Defender for Cloud.
   - **Defender experts for containers** - Covers all your tenants that have Container protection enabled in Defender for Cloud.

   <!-- TODO: Confirm whether both options can be selected independently or if there are dependencies between them. -->

1. After selecting your coverage options, continue to Step 2.

## Onboard cloud resources

After you select your coverage options, onboard your cloud resources to enable Defender Experts coverage for your Defender for Cloud plans.

To onboard your cloud resources:

1. Under **Step 2: Enable Microsoft Defender for Cloud protection**, review the coverage summary. This step covers all your Microsoft Defender for Cloud plans in your tenant that have Defender protection enabled.

1. Select **Onboard cloud resources**.

1. A confirmation dialog appears: **Turn on Defender Experts for Servers?** The dialog notes that additional charges apply based on the number of hours your protected servers are running. Select **Continue** to proceed, or select **Cancel** to go back.

1. After you confirm, a processing banner appears. The banner displays the message: **Onboarding you from coverage for Defender for Servers and Defender for Cloud. This may take a while.**

1. When onboarding completes successfully, you see a success notification: **Defender Experts can now cover Defender for Servers and Defender for Cloud.**

> [!NOTE]
> You can exclude critical devices and users from remediation now or after completing the setup.

> [!IMPORTANT]
> If onboarding fails, you see an error notification. Retry the onboarding process. If the issue persists, contact a Security Administrator for help.

After onboarding completes, the Defender Experts onboarding wizard launches to guide you through configuring the service. The wizard includes the following steps: granting permissions, excluding devices and users, adding notification contacts, setting up Microsoft Teams, and reviewing your settings.

## Grant permissions to experts

> [!IMPORTANT]
> Microsoft recommends that you use roles with the fewest permissions. This helps improve security for your organization. Global Administrator is a highly privileged role that should be limited to emergency scenarios when you can't use an existing role.

Defender Experts for Servers requires **Service provider access** that lets experts sign into your tenant and deliver services based on assigned security roles. For details, see [Cross-tenant access overview](/azure/active-directory/external-identities/cross-tenant-access-overview).

Grant experts one or both of the following permissions:

- **Investigate incidents and guide my responses** (default) &mdash; Experts proactively monitor and investigate incidents and guide you through response actions. (Access level: Security Reader)
- **Respond directly to active threats** (recommended) &mdash; Experts contain and remediate active threats immediately while investigating, reducing the threat's impact and improving response efficiency. (Access level: Security Operator)

To grant permissions:

1. In the onboarding wizard, under **Permissions**, choose one or more access levels to grant to the experts.

1. If you want to exclude device and user groups from remediation actions, select **Manage exclusions**.

1. Select **Next** to continue to notification contacts.

> [!IMPORTANT]
> If you skip providing permissions, experts can't take certain response actions to secure your organization. Even with these permissions granted, experts only have individual access to specific areas for a limited period. For details, see [How Defender Experts for XDR permissions work](dex-xdr-permissions.md).

## Exclude devices and users from remediation

Defender Experts for Servers lets you exclude devices and users from remediation actions taken by experts. Instead of direct remediation, you receive guidance for those excluded entities. Exclusions are based on [device groups](/defender-endpoint/machine-groups) in Microsoft Defender for Endpoint and [user groups](/entra/fundamentals/concept-learn-about-groups) in Microsoft Entra ID.

To exclude device groups:

1. In the onboarding wizard, under **Exclusions**, go to the **Device groups** tab.

1. Select **+ Add device groups**, then search for and choose one or more device groups to exclude.

   > [!NOTE]
   > This page only lists existing device groups. To create a new device group, go to the Defender for Endpoint settings in the Microsoft Defender portal first. Then, refresh this page to search for the newly created group. For details, see [Create device groups](/defender-endpoint/machine-groups).

1. Select **Add device groups**.

1. Review the list of excluded device groups. To remove a device group from the exclusion list, choose it and select **Remove device group**.

1. Select **Next** to confirm your exclusion list. Otherwise, select **Skip** and all your added exclusions are discarded.

To exclude user groups:

1. Under **Exclusions**, go to the **User groups** tab.

1. Select **+ Add user groups**, then search for and choose one or more user groups to exclude.

   > [!NOTE]
   > This page only lists existing user groups. To create a new user group, sign into the Microsoft Entra ID admin center as a Global Administrator first. Then, refresh this page to search for the newly created group. For details, see [Create user groups](/entra/fundamentals/groups-view-azure-portal).

1. Select **Add user groups**.

1. Review the list of excluded user groups. To remove a user group, choose it and select **Remove user group**.

1. Select **Next** to confirm your exclusion list. Otherwise, select **Skip** and all your added exclusions are discarded.

> [!NOTE]
> You can only exclude users by adding them to a Microsoft Entra ID security group. On-premises Microsoft Entra ID users can't be excluded at this time.

To edit or update exclusions after setup, go to **Settings** > **Defender Experts** > **Exclusions**.

## Add notification contacts

Defender Experts for Servers lets you specify individuals or groups within your organization that need to be notified about critical incidents, service updates, and other recommendations.

- **Incident notification contacts** &mdash; Persons or teams that Defender Experts notify for managed response actions or communications requiring immediate response. These contacts should always be available given the urgent nature of the communications.
- **Service review contacts** &mdash; Persons or teams engaged for service updates and service briefings.

To add notification contacts:

1. In the onboarding wizard, under **Contacts**, search for and add your **Contact person or team** in the text field.

1. Add a **Phone number** (optional) that Defender Experts can call for matters requiring immediate attention.

1. Under the **Contact for** dropdown box, choose **Incident notification** or **Service review**.

1. Select **Add**.

1. Select **Next** to confirm your contacts list and continue to the Teams setup.

To edit or update contacts after setup, go to **Settings** > **Defender Experts** > **Notification contacts**.

## Set up Microsoft Teams notifications

In addition to email and in-portal chat, you can use Microsoft Teams to receive managed response updates and communicate with experts in real time. When turned on, a new team named **Defender Experts team** is created with a **Managed response** channel for incident notifications.

> [!IMPORTANT]
> Defender Experts have access to all messages posted on any channel in the **Defender Experts team**. To prevent Defender Experts from accessing messages in this team, go to **Apps** in Teams, then navigate to **Manage your apps** > **Defender Experts** > **Remove**. This action can't be reversed.

To turn on Teams notifications:

1. In the onboarding wizard, under **Teams**, select the **Communicate on Teams** checkbox. A private **Defender Experts team** with a **Managed Response** channel is created.

1. Add your SOC team members to the channel by navigating to **Microsoft Teams** > **Defender Experts team** > **More options (...)** > **Manage team** > **Add member**.

1. Select **Next** to review your settings.

> [!NOTE]
> To set up the Defender Experts Teams application, you need either the **Global administrator** or **Security administrator** role assigned and a Microsoft Teams license.

To turn on Teams notifications after setup, go to **Settings** > **Defender Experts** > **Teams**.

## Review and submit settings

After configuring all wizard steps, review your settings summary on the final page of the onboarding wizard.

To complete the setup:

1. Review the permissions, exclusions, notification contacts, and Teams settings displayed on the summary page.

1. Select **Submit** to complete the setup.

1. Select **View readiness assessment** to check the required actions for your security posture.

## Prepare your environment with the readiness assessment

After you submit the setup, Defender Experts provides a **readiness assessment** to help you get the most out of the service. The readiness assessment is based on the number of protected devices in your environment and Defender Experts' policy recommendations.

To view the readiness assessment, in the Microsoft Defender portal, go to **Settings** > **Defender Experts** > **Service status**.

The readiness assessment has two parts:

- **Actions needed** &mdash; The number of actions or security settings you need to complete, are in progress, or have been completed. Prioritize actions with the **Complete now** status to start the service sooner.
- **Protected assets** &mdash; The current number of protected devices versus the ones you still need to protect. To reach target numbers, [onboard more devices](/defender-endpoint/onboarding) to Defender for Endpoint.

> [!NOTE]
> It can take up to 24 hours to get the latest status of your security settings.

> [!IMPORTANT]
> Defender Experts reviews your readiness assessment periodically, especially if there are changes to your environment. Monitor and run the readiness assessment regularly beyond initial onboarding to maintain a strong security posture.

After you complete all required tasks and meet the onboarding targets, the monitoring phase begins. During this phase, experts closely monitor your environment to identify latent threats, sources of risk, and normal activity. Once experts begin comprehensive response work on your behalf, you start receiving [incident notifications](managed-detection-and-response-xdr.md#incident-updates) that require remediation steps and targeted recommendations on critical incidents.

## Verify permissions

If you see a banner indicating **You don't have permission to edit this page**, contact a Security Administrator in your organization. The Cloud workloads settings page requires administrator-level permissions to make changes. For details, see [How Defender Experts for XDR permissions work](dex-xdr-permissions.md).

<!-- TODO: Confirm whether Defender Experts for Servers has its own permissions page or if it shares the DEX for XDR permissions model. -->

## Turn off Defender Experts for Servers

If you need to disable the service, turn off Defender Experts for Servers from the Cloud workloads settings page.

To turn off the service:

1. In the Microsoft Defender portal, go to **Settings** > **Defender Experts** > **Cloud workloads**.

1. Clear the **Defender experts for server** checkbox.

1. A confirmation dialog appears: **Turn off Defender Experts for Servers?** The dialog notes that Defender Experts no longer assist with incidents involving your cloud servers. Charges continue until the service is fully turned off within 48 hours.

1. Select **Continue** to confirm, or select **Cancel** to keep the service active.

## Related content

- [Microsoft Defender Experts for Servers overview](dex-servers-overview.md)
- [Managed detection and response](managed-detection-and-response-xdr.md)
- [Communicating with experts in the Microsoft Defender Experts for XDR service](communicate-defender-experts-xdr.md)
- [Get real-time visibility with Defender Experts for XDR reports](reports-xdr.md)
- [Understanding Defender Experts coverage for servers and cloud workloads](faq-cloud-coverage-defender-experts.md)
- [How Defender Experts for XDR permissions work](dex-xdr-permissions.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
