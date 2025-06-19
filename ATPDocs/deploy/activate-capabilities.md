---
title: Activate the Unified sensor on a domain controller 
description: Learn about how to activate the Microsoft Defender for Identity sensor on domain controllers.
ms.date: 06/18/2025
ms.topic: how-to
ms.reviewer: rlitinsky
---

# Activate the Unified sensor on a domain controller (Preview)

Microsoft Defender for Endpoint customers can activate the built-in Unified sensor directly on onboarded domain controllers.

The Unified sensor supports the following Defender for Identity functionality:

- Investigation features on the [ITDR dashboard](test-sensor.md#check-the-itdr-dashboard)
- [Identity inventory](test-sensor.md#confirm-entity-page-details)
- [Identity advanced hunting data](test-sensor.md#test-advanced-hunting-tables)
- [Security posture recommendations](test-sensor.md#test-identity-security-posture-management-ispm-recommendations)
- [Alert detections](test-sensor.md#test-alert-functionality)
- [Remediation actions](test-sensor.md#test-remediation-actions)
- [Automatic attack disruption](/microsoft-365/security/defender/automatic-attack-disruption)

We recommend activating this sensor, built in to the Windows Server, for customers who want to deploy core identity protections to new domain controllers running Windows Server 2019 or later. For all other identity infrastructures, or for customers looking to deploy the most robust identity protections available from Microsoft Defender for Identity today, we recommend [deploying the classic Defender for Identity sensor](install-sensor.md).

## Prerequisites

- Before activating the Defender for Identity capabilities on your domain controller, make sure that the domain controller doesn't have another Defender for Identity sensor already deployed.
- The domain controller must have one of these Operating Systems:
   - Windows Server 2019 or later
   - [March 2024 Cumulative Update](https://support.microsoft.com/topic/march-12-2024-kb5035857-os-build-20348-2340-a7953024-bae2-4b1a-8fc1-74a17c68203c) or later.

       > [!IMPORTANT]
       > After the March 2024 Cumulative Update is installed, LSASS might experience a memory leak on domain controllers during on-premises and cloud-based Active Directory Domain Controllers service Kerberos authentication requests. [This out-of-band update: KB5037422](https://support.microsoft.com/en-gb/topic/march-22-2024-kb5037422-os-build-20348-2342-out-of-band-e8f5bf56-c7cb-4051-bd5c-cc35963b18f3) addresses this issue.

- Your domain controller must be onboarded to Microsoft Defender for Endpoint. For more information, see [Onboard a Windows server](/microsoft-365/security/defender-endpoint/onboard-windows-server).
- You must either be a [Security Administrator](/entra/identity/role-based-access-control/permissions-reference), or have the following [Unified RBAC](../role-groups.md#unified-role-based-access-control-rbac) permissions:
    - `System settings (Read and manage)`
    - `Security setting (All permissions)`

## Configure Windows auditing

Defender for Identity detections rely on specific Windows Event Log entries to enhance detections and provide extra information about the users performing specific actions, such as NTLM sign-ins and security group modifications.

Configure Windows event collection on your domain controller to support Defender for Identity detections. For more information, see [Event collection with Microsoft Defender for Identity](event-collection-overview.md) and [Configure audit policies for Windows event logs](configure-windows-event-collection.md).

You might want to use the Defender for Identity PowerShell module to configure the required settings. For example, the following command defines all settings for the domain, creates group policy objects, and links them.

```powershell
Set-MDIConfiguration -Mode Domain -Configuration All
```
For more information, see:
- [DefenderForIdentity Module](/powershell/module/defenderforidentity/)
- [Defender for Identity in the PowerShell Gallery](https://www.powershellgallery.com/packages/DefenderForIdentity/)

## For customers with domain controllers onboarded to Defender for Endpoint 

Microsoft Defender for Endpoint customers who have onboarded the domain controller to Defender for Endpoint, can activate the Windows Server Defender for Identity sensor.

### Activate the Defender for Identity sensor

1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **System** > **Settings** > **Identities** > **Activation**.

   The **Activation Page** displays all servers from your device inventory, and the server's activation state. You can choose to activate eligible domain controllers either automatically, where Defender for Identity activates them as soon as they're discovered, or manually, by selecting specific domain controllers from the list of eligible servers.

1. Select the domain controller where you want to activate Defender for Identity, and select **Activate**. Confirm your selection when prompted. 

   [![Screenshot that shows how to activate the new sensor.](media/activate-capabilities/1.jpg)](media/activate-capabilities/1.jpg#lightbox)

1. When the activation is complete, a green success banner shows. In the banner, select **Click here to see the onboarded servers**. This takes you to the **Sensors** page, where you can check your sensor health.

    [![Screenshot that shows how to see the onboarded servers.](media/activate-capabilities/2.jpg)](media/activate-capabilities/2.jpg#lightbox)
 
## For customers without domain controllers onboarded to Defender for Endpoint 

This solution uses Defender for Endpoint URL endpoints for communication, including streamlined URLs. For more information, see:
 - [Configure your network environment to ensure connectivity with Defender for Endpoint](/microsoft-365/security/defender-endpoint/configure-environment##enable-access-to-microsoft-defender-for-endpoint-service-urls-in-the-proxy-server)
 - [Configure connectivity using streamlined connection](/microsoft-365/security/defender-endpoint/configure-device-connectivity#option-1-configure-connectivity-using-the-simplified-domain).

### Download the Defender for Identity onboarding package

1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **System** > **Settings** > **Identities** > **Activation**.

2. Select **Download onboarding package**, and save the file in a location you can access from your domain controller.

   [![Screenshot that shows how to onboard the new sensor.](media/activate-capabilities/screenshot-that-shows-how-to-onboard-the-new-sensor.png)](media/activate-capabilities/screenshot-that-shows-how-to-onboard-the-new-sensor.png#lightbox)
   
3. From the domain controller, extract the zip file you downloaded from the Microsoft Defender portal, and run the `DefenderForIdentityOnlyOnboardingScript.cmd` script as an Administrator.

   [![screenshot that shows the onboarding script.](media/activate-capabilities/screenshot-2025-06-04-170500.png)](media/activate-capabilities/screenshot-2025-06-04-170500.png#lightbox)

## Confirm onboarding 

To confirm the sensor is working: 

1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **System** > **Settings** > **Identities** > **Sensors**.
1. Check that the onboarded domain controller is listed. 

> [!NOTE]
> The first time you activate Defender for Identity capabilities on your domain controller, it might take up to an hour for the first sensor to show as **Running** on the **Sensors** page. Subsequent activations are shown within five minutes. The activation doesn't require a restart/reboot. 

## Next steps
- [Manage and update Microsoft Defender for Identity sensors](../sensor-settings.md).
