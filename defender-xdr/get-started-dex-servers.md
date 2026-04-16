---
title: Set up Microsoft Defender Experts for Servers
description: Learn how to set up Microsoft Defender Experts for Servers by selecting coverage options and onboarding your cloud resources in the Microsoft Defender portal.
ms.service: defender-experts
ms.subservice: dex-servers
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

After purchasing the Defender Experts for Servers service, you can set up cloud workload coverage in the Microsoft Defender portal. The setup process involves selecting your coverage options and onboarding your cloud resources so that Defender Experts can begin monitoring your server infrastructure.

## Prerequisites

Before you begin, make sure you have the following:

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

   - **Defender experts for server** &mdash; This add-on covers all your servers in your tenant that have Defender for Servers protection enabled in Defender for Cloud.
   - **Defender experts for containers** &mdash; This add-on covers all your tenants that have Containers protections enabled in Defender for Cloud.

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

## Verify permissions

If you see a banner indicating **You don't have permission to edit this page**, contact a Security Administrator in your organization. The Cloud workloads settings page requires administrator-level permissions to make changes. For details, see [How Defender Experts for XDR permissions work](dex-xdr-permissions.md).

<!-- TODO: Confirm whether Defender Experts for Servers has its own permissions page or if it shares the DEX for XDR permissions model. -->

## Turn off Defender Experts for Servers

If you need to disable the service, you can turn off Defender Experts for Servers from the Cloud workloads settings page.

To turn off the service:

1. In the Microsoft Defender portal, go to **Settings** > **Defender Experts** > **Cloud workloads**.

1. Clear the **Defender experts for server** checkbox.

1. A confirmation dialog appears: **Turn off Defender Experts for Servers?** The dialog notes that Defender Experts will no longer assist with incidents involving your cloud servers. Charges continue until the service is fully turned off within 48 hours.

1. Select **Continue** to confirm, or select **Cancel** to keep the service active.

## Related content

- [Microsoft Defender Experts for Servers overview](dex-servers-overview.md)
- [Managed detection and response](managed-detection-and-response-xdr.md)
- [Understanding Defender Experts coverage for servers and cloud workloads](faq-cloud-coverage-defender-experts.md)
- [How Defender Experts for XDR permissions work](dex-xdr-permissions.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
