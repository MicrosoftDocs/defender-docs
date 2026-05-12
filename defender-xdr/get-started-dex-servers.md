---
title: Get started with Microsoft Defender Experts for cloud workloads
description: Learn how to set up Microsoft Defender Experts for cloud workloads by selecting coverage, granting permissions, and configuring notifications in the Microsoft Defender portal.
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

This article explains how to set up Defender Experts for Servers in the Microsoft Defender portal, including onboarding cloud resources, granting permissions, configuring notifications, and preparing your environment.

## Review pricing information

For Defender Experts for Servers pricing, review the [Microsoft Defender for Cloud pricing page](https://azure.microsoft.com/pricing/details/defender-for-cloud/). You can also contact your Microsoft representative for more information.

## Prerequisites

Before you begin, confirm the following:

- [Defender for Servers Plan 1 or Plan 2](/azure/defender-for-cloud/defender-for-servers-overview) enabled in Microsoft Defender for Cloud
- Microsoft Entra ID Plan 2

To onboard your cloud workloads, you need at least a **Security Administrator** role in the Microsoft Defender portal. 

## Select the cloud resources to onboard

Choose which cloud resource types you want Defender Experts to cover. The Defender Experts service is enabled at the tenant level.

> [!NOTE]
> Defender Experts only supports managed cloud security for Microsoft Defender for Servers.

To select your coverage options:

1. In the Microsoft Defender portal, go to **Settings** > **Defender Experts** > **Cloud workloads**.

   :::image type="content" source="media/get-started-dex-servers/defender-experts-servers-settings.png" alt-text="Screenshot of the Defender Experts settings page in the Defender portal, with the Cloud workloads option higlighted." lightbox="media/get-started-dex-servers/defender-experts-servers-settings.png":::

1. Under supported cloud coverage options, select **Defender Experts for Servers**.

    :::image type="content" source="media/get-started-dex-servers/defender-experts-servers-select.png" alt-text="Screenshot of the Defender Experts settings page in the Defender portal, with the Defender Experts for Servers option higlighted." lightbox="media/get-started-dex-servers/defender-experts-servers-select.png":::  

1. Select **Save**. Saving your selection opens the Defender Experts onboarding wizard.

1. Select **Continue** to proceed with the onboarding wizard, or select **Cancel** to go back.

## Run the provisioning script

To start your managed cloud security service, first set up the components that Defender Experts needs to securely access your environment. Download and run a signed PowerShell script on any managed device by using PowerShell 7 or in Azure Cloud Shell.

> [!NOTE]
> To perform this onboarding step, ensure you're assigned _at least_ an **Application Admin** role.

To run the provisioning script:
1. In the Defender Experts onboarding wizard, under **Service set up**, download a copy of the signed PowerShell script and run it on a local device by using PowerShell 7 or in Azure Cloud Shell.  
1. After you run the script, it might take some time to process. Don't close the wizard while the script processes. You can select **Validate** to check connector access and verify that the required components are provisioned.


## Grant permissions to experts

Defender Experts for Servers requires **Service provider access** that experts use to sign in to your tenant and deliver services based on assigned security roles. For more information, see [Cross-tenant access overview](/entra/external-id/cross-tenant-access-overview).

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

After you onboard your cloud workloads, take note of the following information:

- **Billing:** Billing starts when you finish onboarding.
  - View your bill in **Microsoft Cost Management**. For more information, see [What is Microsoft Cost Management](/azure/cost-management-billing/costs/overview).
  - At the end of your billing cycle, look for **Microsoft Defender Experts for Servers costs**. 
- **Endpoint protection:** The Microsoft Defender for Endpoint extension is automatically installed on all supported machines connected to Microsoft Defender for Cloud. Ensure that automatic provisioning of the Defender for Endpoint sensor is enabled.

## Turn off Defender Experts for Servers service

To disable the service, [contact your Service Delivery Expert](communicate-defender-experts-xdr.md). 

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
