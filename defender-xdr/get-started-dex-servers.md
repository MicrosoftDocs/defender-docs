---
title: Get started with Microsoft Defender Experts for Servers
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
ms.date: 05/18/2026

#customer intent: As a security administrator, I want to set up Defender Experts for Servers so that my organization's cloud server workloads are covered by Microsoft's managed detection and response service.

---

# Get started with Microsoft Defender Experts for cloud workloads

**Applies to:**

- [Microsoft Defender Experts for Servers](dex-servers-overview.md)

This article discusses how you can enable and set up the Defender Experts for Servers service in the Microsoft Defender portal. The setup process involves onboarding your cloud resources, granting permissions to experts, configuring notification contacts, and preparing your environment so that Defender Experts can begin monitoring your server infrastructure.

## Prerequisites

Before you begin, make sure you have the following prerequisites:

- [Defender for Servers Plan 1 or Plan 2](/azure/defender-for-cloud/defender-for-servers-overview) enabled in Microsoft Defender for Cloud
- Microsoft Entra ID Plan 2

To onboard your cloud workloads, you need at least a **Security Administrator** role in the Microsoft Defender portal. Once they’re onboarded, you also need [Endpoint protection](/azure/defender-for-cloud/integration-defender-for-endpoint) turned on for Windows and Linux devices in Defender for Cloud to activate the Defender Experts service.

## Select the cloud resources to onboard

Choose which cloud resource types you want Defender Experts to cover. You can select server coverage, container coverage, or both.

To select your coverage options:

1. In the Microsoft Defender portal, go to **Settings** > **Defender Experts** > **Cloud workloads**.

1. Under **Select coverage options**, select **Defender Experts for Servers**.

1. Select **Onboard cloud resources**. The **Turn on Defender Experts for Servers?** confirmation dialog appears, informing you that additional charges apply based on the number of hours your protected servers are running.

1. Select **Continue** to proceed, or select **Cancel** to go back.

1. After you confirm, a processing banner appears while your cloud resources get onboarded to the Defender Experts service. Once onboarding completes successfully, the Defender Experts onboarding wizard launches to guide you through configuring the service. 

## Run the provisioning script

Run a provisioning script in your environment to set up the components that Defender Experts need to access and manage your cloud resources securely. This script performs the following tasks:

- Registers the required Azure resource provider.
- Creates a service principal for Defender Experts authentication.
- Assigns the **Security Reader** role to enable read-only access.

To run the provisioning script:

1. In the Defender Experts onboarding wizard, under **Provision required application**, download a copy of the PowerShell script and run it on a local device or in Azure Cloud Shell.
1. After the process completes, select **Validate** to check the connector access and verify that the required components are provisioned successfully.

## Grant permissions to experts

Defender Experts for Servers requires **Service provider access** that lets experts sign into your tenant and deliver services based on assigned security roles. For details, see [Cross-tenant access overview](/azure/active-directory/external-identities/cross-tenant-access-overview).

Grant experts one or both of the following permissions:

- **Investigate incidents and guide my responses** (default): Experts proactively monitor and investigate incidents and guide you through response actions. (Access level: Security Reader)
- **Respond directly to active threats** (recommended): Experts contain and remediate active threats immediately while investigating, reducing the threat's impact and improving response efficiency. (Access level: Security Operator)

To grant permissions:

1. In the onboarding wizard, under **Permissions**, choose one or more access levels to grant to the experts.

1. Select **Next** to continue. 

## Finish the setup and prepare your environment

To finish the setup:
1. Continue with the onboarding wizard to set up the following configurations:
   - [Notification contacts](get-started-xdr.md#tell-us-who-to-contact-for-important-matters)
   - [Microsoft Teams notifications](get-started-xdr.md#receive-managed-response-notifications-and-updates-in-microsoft-teams)

1. Review and submit settings. The onboarding wizard finishes its initial setup.
1. Select **View readiness assessment** to complete the necessary actions required to [optimize your security posture](get-started-xdr.md#prepare-your-environment-for-the-defender-experts-service).


## Turn off Defender Experts for Servers service

If you need to disable the service, [contact your Service Delivery Expert](communicate-defender-experts-xdr.md). 

   > [!NOTE]
   > Charges continue until the service is fully turned off within 48 hours.


## Related content

- [Microsoft Defender Experts for Servers overview](dex-servers-overview.md)
- [Managed detection and response](managed-detection-and-response-xdr.md)
- [Communicating with experts in the Microsoft Defender Experts service](communicate-defender-experts-xdr.md)
- [Get real-time visibility with Defender Experts reports](reports-xdr.md)
- [Understanding Defender Experts coverage for servers and cloud workloads](faq-cloud-coverage-defender-experts.md)
- [How Defender Experts permissions work](dex-xdr-permissions.md)

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/defender-m3d-techcommunity.md)]
