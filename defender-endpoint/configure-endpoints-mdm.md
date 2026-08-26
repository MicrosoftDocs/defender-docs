---
title: Onboard Windows devices to Microsoft Defender for Endpoint by using Microsoft Intune
description: Learn how to use Microsoft Intune to onboard and offboard Windows 10 and Windows 11 devices in Microsoft Defender for Endpoint.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier1
ms.custom: admindeeplinkDEFENDER, msecd-doc-authoring-1015
ms.topic: install-set-up-deploy
ms.subservice: onboard
ms.date: 08/24/2026
ai-usage: ai-assisted
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
#customer intent: As a security administrator, I want to onboard Windows devices to Microsoft Defender for Endpoint by using Microsoft Intune so that I can monitor and protect them.
---

# Onboard Windows devices to Microsoft Defender for Endpoint by using Microsoft Intune

[!INCLUDE [Microsoft Defender deployment tool preview](./includes/defender-deployment-tool-preview.md)]

Use Microsoft Intune to onboard Windows 10 and Windows 11 devices to Microsoft Defender for Endpoint. Onboarding configures devices to communicate with Defender for Endpoint for threat detection and device risk assessment. You can also use Intune to offboard devices that no longer need monitoring.

Defender for Endpoint supports mobile device management (MDM) configuration through Open Mobile Alliance Uniform Resource Identifier (OMA-URI) settings. For more information, see [WindowsAdvancedThreatProtection CSP](/windows/client-management/mdm/windowsadvancedthreatprotection-csp) and [WindowsAdvancedThreatProtection DDF file](/windows/client-management/mdm/windowsadvancedthreatprotection-ddf).

## Before you begin

- Enroll the devices in Microsoft Intune as your MDM solution. For more information, see [Device enrollment in Microsoft Intune](/intune/intune-service/fundamentals/deployment-guide-enrollment).
- To create endpoint detection and response (EDR) policies, use an account with the **Endpoint Security Manager** role or equivalent permissions.

Intune is a separate product that's not included with every Defender for Endpoint subscription. You need a subscription that includes Intune, or you can buy Intune separately as a standalone subscription or add-on. For details, see [Microsoft Intune licensing](/intune/intune-service/fundamentals/licenses). If you don't have Intune, review the other methods in [Identify Defender for Endpoint architecture and deployment method](deployment-strategy.md).

## Onboard devices using Microsoft Intune

Review [Defender for Endpoint architecture and deployment methods](deployment-strategy.md) to select the appropriate onboarding method for your environment.

To connect Intune to Defender for Endpoint and onboard devices, follow the instructions in [Configure Microsoft Defender for Endpoint with Intune and onboard devices](/intune/device-security/microsoft-defender/configure-integration).

> [!NOTE]
>
> - The **Health Status for onboarded devices** policy uses read-only properties and can't be remediated.
> - The diagnostic data reporting frequency setting was added in Windows 10, version 1703. In Intune EDR policies, the setting is deprecated and doesn't affect new devices.
> - Onboarding a device to Defender for Endpoint also onboards it to [Endpoint data loss prevention (DLP)](/purview/endpoint-dlp-learn-about).

## Run a detection test to verify onboarding

After onboarding the device, you can choose to run a detection test to verify that a device is properly onboarded to the service. For more information, see [Run a detection test on a newly onboarded Microsoft Defender for Endpoint device](run-detection-test.md).

## Offboard devices using Mobile Device Management tools

For security reasons, the package used to offboard devices expires seven days after you download it. Expired offboarding packages sent to a device are rejected. When you download an offboarding package, the portal displays its expiration date, which is also included in the package name.

> [!NOTE]
> To avoid unpredictable policy collisions, don't deploy onboarding and offboarding policies on a device at the same time.

1. Get the offboarding package from the Defender portal.

   On the **Offboarding** page in the Defender portal at <https://security.microsoft.com/securitysettings/endpoints/offboarding>, configure the following settings:

   1. At the top of the page, select **Windows 10 and Windows 11**.
   1. In the **Offboard a device** section that appears, select **Mobile Device Management / Microsoft Intune** as the **Deployment method**.
   1. At the bottom of the page, select **Download package**, select **Download** in the confirmation dialog, and then save the `WindowsDefenderATPOffboardingPackage_valid_until_YYYY-MM-DD.offboarding.zip` file in a location that's easy to find.

1. Extract the contents of the `.zip` file (a file named `WindowsDefenderATP_valid_until_YYYY-MM-DD.offboarding`) to a shared, read-only location that's accessible to the admins who are responsible for deploying the package.

1. In the Microsoft Intune admin center, use one of the following deployment methods:

   - **Custom configuration policy**: To create a custom configuration policy, see <a href="/intune/device-configuration/create-device-profile" target="_blank">Create a device configuration profile in Microsoft Intune</a> (opens in a new tab in the Intune documentation). When creating the policy, use these settings:
     - **Platform**: Select **Windows 10 and later**.
     - **Profile type**: Select **Templates**.
     - **Template name**: Select **Custom**.
     - **Configuration settings**: Add the following settings:
       - **OMA-URI**: Enter `./Device/Vendor/MSFT/WindowsAdvancedThreatProtection/Offboarding`.
       - **Data type**: Select **String**.
       - **Value**: Paste the value from the content of the `WindowsDefenderATP_valid_until_YYYY-MM-DD` offboarding file.

   - **EDR policy**: To create an EDR policy, see <a href="/intune/device-configuration/endpoint-security/deploy-edr" target="_blank">Deploy endpoint detection and response policy with Intune</a> (opens in a new tab in the Intune documentation). When creating the policy, use these settings:
     - **Platform**: Select **Windows**.
     - **Profile**: Select **Endpoint detection and response**.
     - **Configuration settings**:
       - **Microsoft Defender for Endpoint client configuration package type**: Select **Offboard**.
       - In the **Offboarding (Device)** setting that appears, paste the value from the content of the `WindowsDefenderATP_valid_until_YYYY-MM-DD` offboarding file.

> [!IMPORTANT]
> The **Health Status for offboarded devices** policy uses read-only properties and can't be remediated.
>
> Offboarding stops the device from sending new detection, vulnerability, and security data to Defender for Endpoint. Historical data remains in the Defender portal until the configured retention period expires. The device profile, without data, remains in the device inventory for up to 180 days. For more information, see [Offboard devices](offboard-machines.md).

<a name='related-articles'></a>

## Related content

- [Onboard Windows devices using Group Policy](configure-endpoints-gp.md)
- [Onboard Windows devices using Microsoft Configuration Manager](configure-endpoints-sccm.md)
- [Onboard Windows devices using a local script](configure-endpoints-script.md)
- [Onboard non-persistent virtual desktop infrastructure (VDI) devices](configure-endpoints-vdi.md)
- [Run a detection test on a newly onboarded Microsoft Defender for Endpoint device](run-detection-test.md)
- [Troubleshoot Microsoft Defender for Endpoint onboarding issues](troubleshoot-onboarding.md)
