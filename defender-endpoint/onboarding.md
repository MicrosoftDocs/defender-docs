---
title: Onboard devices to Microsoft Defender for Endpoint
description: Learn how to onboard endpoints to Microsoft Defender for Endpoint service.
ms.service: defender-endpoint
ms.author: ewalsh
author: emmwalshh
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection:
  - m365-security
  - m365solution-endpointprotect
  - m365solution-scenario
  - m365-initiative-defender-endpoint
  - highpri
  - tier1
ms.topic: install-set-up-deploy
ms.subservice: onboard
search.appverid: met150
ms.date: 05/08/2025
---

# Onboard devices to Microsoft Defender for Endpoint

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender Vulnerability Management](/defender-vulnerability-management/defender-vulnerability-management)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Microsoft Defender for Endpoint? [Sign up for a free trial.](https://go.microsoft.com/fwlink/p/?linkid=2225630)

[!INCLUDE [side-by-side-scenarios](includes/side-by-side-scenarios.md)]

## Onboard devices using any of the supported management tools

The deployment tool you use influences how you onboard endpoints to the service. Refer to your selected [deployment method](deployment-strategy.md#step-2-select-your-deployment-method).

If you're onboarding devices in the Microsoft Defender portal, follow these steps:

1. Make sure to review the [Minimum requirements for Defender for Endpoint](minimum-requirements.md).

2. In the [Microsoft Defender portal](https://security.microsoft.com), go to **Settings** > **Endpoints**, and then, under **Device management**, select **Onboarding**.

   :::image type="content" source="media/mde-device-onboarding-ui.png" alt-text="Screenshot showing device onboarding in the Microsoft Defender portal for Defender for Endpoint.":::

3. Under **Select operating system to start onboarding process**, select the operating system for the device.

4. Under **Connectivity type**, select either **Streamlined** or **Standard**. (See [prerequisites for streamlined connectivity](/defender-endpoint/configure-device-connectivity#prerequisites).)

5. Under **Deployment method**, select an option. Then download the onboarding package (and installation package, as appropriate). For more information, see the following articles:

   - [Onboard client devices running Windows or macOS to Microsoft Defender for Endpoint](onboard-client.md)
   - [Onboard servers through Microsoft Defender for Endpoint's onboarding experience](onboard-server.md)

## Video: Device onboarding

The following video provides a quick overview of the onboarding process and the different tools and methods: 

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=2524ee5d-6a5f-482c-8f69-dc3792577c60]

## Deploy using a ring-based approach

### New deployments

A ring-based approach is a method of identifying a set of endpoints to onboard and verifying that certain criteria are met before proceeding to deploy the service to a larger set of devices. You can define the exit criteria for each ring and ensure that they're satisfied before moving on to the next ring. Adopting a ring-based deployment helps reduce potential issues that could arise while rolling out the service.

This table provides an example of the deployment rings you might use:

|Deployment ring|Description|
|---|---|
|Evaluate|Ring 1: Identify 50 devices to onboard to the service for testing.|
|Pilot|Ring 2: Identify and onboard the next 50-100 endpoints in a production environment. Microsoft Defender for Endpoint supports various endpoints that you can onboard to the service. For more information, see [Select deployment method](deployment-strategy.md#step-2-select-your-deployment-method).|
|Full deployment|Ring 3: Roll out service to the rest of environment in larger increments. For more information, see [Get started with your Microsoft Defender for Endpoint deployment](mde-planning-guide.md).

### Exit criteria

An example set of exit criteria for each ring can include:

- Devices show up in the device inventory list
- Alerts appear in dashboard
- [Run a detection test](run-detection-test.md)
- [Run a simulated attack on a device](attack-simulations.md)

## Existing deployments

### Windows endpoints

For Windows and/or Windows Servers, you select several machines to test ahead of time (before patch Tuesday) by using the **Security Update Validation program (SUVP)**.

For more information, see:

- [What is the Security Update Validation Program](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/what-is-the-security-update-validation-program/ba-p/275767)
- [Software Update Validation Program and Microsoft Malware Protection Center Establishment - TwC Interactive Timeline Part 4](https://www.microsoft.com/security/blog/2012/03/28/software-update-validation-program-and-microsoft-malware-protection-center-establishment-twc-interactive-timeline-part-4/)

### Non-Windows endpoints

With macOS and Linux, you could take a couple of systems and run in the Beta channel.

> [!NOTE]
> Ideally at least one security admin and one developer so that you are able to find compatibility, performance and reliability issues before the build makes it into the Current channel.

The choice of the channel determines the type and frequency of updates that are offered to your device. Devices in Beta are the first ones to receive updates and new features, followed later by Preview and lastly by Current.

:::image type="content" source="media/insider-rings.png" alt-text="The insider rings." lightbox="media/insider-rings.png":::

In order to preview new features and provide early feedback, it's recommended that you configure some devices in your enterprise to use either Beta or Preview.

> [!WARNING]
> Switching the channel after the initial installation requires the product to be reinstalled. To switch the product channel: uninstall the existing package, re-configure your device to use the new channel, and follow the steps in this document to install the package from the new location.


## Example deployments

To provide some guidance on your deployments, in this section we guide you through using two deployment tools to onboard endpoints.

The tools in the example deployments are:

- [Onboarding using Microsoft Configuration Manager](onboarding-endpoint-configuration-manager.md)
- [Onboarding using Microsoft Intune](onboarding-endpoint-manager.md)

For some additional information and guidance, check out the [PDF](https://download.microsoft.com/download/5/6/0/5609001f-b8ae-412f-89eb-643976f6b79c/mde-deployment-strategy.pdf)  or  [Visio](https://download.microsoft.com/download/5/6/0/5609001f-b8ae-412f-89eb-643976f6b79c/mde-deployment-strategy.vsdx) to see the various paths for deploying Defender for Endpoint.

The example deployments will guide you on configuring some of the Defender for Endpoint capabilities, but you'll find more detailed information on configuring Defender for Endpoint capabilities in the [next step](#next-step).

## Next step

After onboarding the endpoints move on to the next step where you'll configure the various capabilities such as endpoint detection and response, next-generation protection, and attack surface reduction.

- [Step 5 - Configure capabilities](onboard-configure.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
