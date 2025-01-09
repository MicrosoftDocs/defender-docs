---
title: Set up Microsoft Defender for Endpoint deployment
description: Learn how to set up the deployment for Microsoft Defender for Endpoint.
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection:
  - m365-security
  - m365solution-endpointprotect
  - m365solution-scenario
  - highpri
  - tier1
ms.custom: admindeeplinkDEFENDER
ms.topic: conceptual
ms.subservice: onboard
search.appverid: met150
ms.date: 05/08/2024
---

# Set up Microsoft Defender for Endpoint deployment

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Microsoft Defender for Endpoint? [Sign up for a free trial.](https://signup.microsoft.com/create-account/signup?products=7f379fee-c4f9-4278-b0a1-e4c8c2fcdf7e&ru=https://aka.ms/MDEp2OpenTrial?ocid=docs-wdatp-exposedapis-abovefoldlink)

The first step when deploying Microsoft Defender for Endpoint is to set up your Defender for Endpoint environment.

In this deployment scenario, you're guided through the steps on:

- Licensing validation
- Tenant configuration
- Network configuration

> [!NOTE]
> For the purpose of guiding you through a typical deployment, this scenario will only cover the use of Microsoft Configuration Manager. Defender for Endpoint supports the use of other onboarding tools but we won't cover those scenarios in the deployment guide. For more information, see [Identify Defender for Endpoint architecture and deployment method](deployment-strategy.md).

[!Include [defender-endpoint-setup-guide.md](../includes/mde-automated-setup-guide.md)]

## Check license state

Checking for the license state and whether it was properly provisioned can be done through the admin center or through the **Microsoft Azure portal**.

1. To view your licenses, go to the **Microsoft Azure portal** and navigate to the [Microsoft Azure portal license section](https://portal.azure.com/#blade/Microsoft_AAD_IAM/LicensesMenuBlade/Products).

   :::image type="content" source="media/atp-licensing-azure-portal.png" alt-text="The Azure Licensing page" lightbox="media/atp-licensing-azure-portal.png":::

1. Alternately, in the admin center, navigate to **Billing** \> **Subscriptions**.

    On the screen, you see all the provisioned licenses and their current **Status**.

    :::image type="content" source="media/atp-billing-subscriptions.png" alt-text="The billing licenses page":::

## Cloud Service Provider validation

To gain access into which licenses are provisioned to your company, and to check the state of the licenses, go to the admin center.

1. From the **Partner portal**, select **Administer services > Office 365**.

2. Clicking on the **Partner portal** link opens the **Admin on behalf** option and gives you access to the customer admin center.

   :::image type="content" source="media/atp-O365-admin-portal-customer.png" alt-text="The Office 365 admin portal" lightbox="media/atp-O365-admin-portal-customer.png":::

## Tenant Configuration

Initiating Microsoft Defender for Endpoint tenant is easy. From the navigation menu, select any item under the Endpoints section, or any Microsoft Defender XDR feature such as Incidents, Hunting, Action center, or Threat analytics to start the tenant creation process.

From a web browser, navigate to the <a href="https://go.microsoft.com/fwlink/p/?linkid=2077139" target="_blank">Microsoft Defender portal</a>.

## Data center location

Microsoft Defender for Endpoint stores and process data in the [same location as used by Microsoft Defender XDR](/defender-xdr/m365d-enable). If Microsoft Defender XDR hasn't been turned on yet, onboarding to Defender for Endpoint also turns on Defender XDR, and a new data center location is automatically selected based on the location of active Microsoft 365 security services. The selected data center location is shown on the screen.

## Network configuration

Ensure devices can connect to the Defender for Endpoint cloud services. The use of a proxy is recommended.

[STEP 1: Configure your network environment to ensure connectivity with Defender for Endpoint service](configure-environment.md).
[STEP 2: Configure your devices to connect to the Defender for Endpoint service using a proxy](configure-proxy-internet.md).
[STEP 3: Verify client connectivity to Microsoft Defender for Endpoint service URLs](verify-connectivity.md).

In certain scenarios, you might want to allow traffic to IP addresses. Not all services are accessible in this way and you need to evaluate how to address this potential issue in your environment - for example, by centrally downloading then distributing updates. For more information, see [Option 2: Configure connectivity using static IP ranges](configure-device-connectivity.md#option-2-configure-connectivity-using-static-ip-ranges).

## Next step

- Continue to [Step 2 - Assign roles and permissions](prepare-deployment.md)
[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
