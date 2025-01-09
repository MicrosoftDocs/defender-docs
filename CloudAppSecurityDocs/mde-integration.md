---
title: Integrate Microsoft Defender for Endpoint
description: This article describes how to integrate Microsoft Defender for Endpoint with Defender for Cloud Apps for enhanced visibility into Shadow IT and risk management.
ms.date: 06/03/2024
ms.topic: how-to
---

# Integrate Microsoft Defender for Endpoint with Microsoft Defender for Cloud Apps

[Microsoft Defender for Endpoint](/microsoft-365/security/defender-endpoint/microsoft-defender-endpoint) is a security platform for intelligent protection, detection, investigation, and response. Defender for Endpoint protects endpoints from cyber threats, detects advanced attacks and data breaches, automates security incidents, and improves security posture.

This article describes the out-of-the-box integration available between Microsoft Defender for Cloud Apps and Microsoft Defender for Endpoint, which  simplifies cloud discovery and enabling device-based investigation.

> [!IMPORTANT]
> This article focuses on shadow IT discovery capabilities from Defender for Endpoint logs. For more information on shadow IT governing capabilities via Defender for Endpoint, see [Govern discovered apps using Microsoft Defender for Endpoint](mde-govern.md).

## Prerequisites

- Microsoft Defender for Cloud Apps license

- One of the following:

    - Microsoft Defender for Endpoint with Plan 2
    - Microsoft Defender for Business with a premium or standalone license
    
    For more information, see [Compare Microsoft endpoint security plans](/microsoft-365/security/defender-endpoint/defender-endpoint-plan-1-2).

- Apps using one of the following operating systems:

    - Windows 10 version 1709 (OS Build 16299.1085 with KB4493441)
    - Windows 10 version 1803 (OS Build 17134.704 with KB4493464)
    - Windows 10 version 1809 (OS Build 17763.379 with KB4489899), or later Windows 10 and Windows 11 versions
    - macOS, on devices with [Defender for Endpoint version 20.123072.25.0](/defender-endpoint/mac-whatsnew) or higher

- To support integrations for macOS apps, you must turn on network protection capabilities in Microsoft Defender for Endpoint. Since network protection only audits TCP connection close events, UDP protocols aren't covered for macOS support. For more information, see [Turn on network protection](/defender-endpoint/enable-network-protection)

- (Recommended) Enable Microsoft Defender Antivirus:

  - **[Real-time protection enabled](/microsoft-365/security/defender-endpoint/configure-real-time-protection-microsoft-defender-antivirus)**
  - **[Cloud-delivered protection enabled](/microsoft-365/security/defender-endpoint/enable-cloud-protection-microsoft-defender-antivirus)**
  - **[Network protection enabled and configured to block mode](/microsoft-365/security/defender-endpoint/enable-network-protection)**

> [!NOTE]
> While Microsoft Defender Antivirus is highly recommended for discovery, it's not mandatory. Some discovery data is still available when Defender Antivirus is disabled.

## How it works

On its own, Defender for Cloud Apps collects logs from your endpoints using either [logs you upload](create-snapshot-cloud-discovery-reports.md) or by [configuring automatic log upload](discovery-docker.md). The out-of-the-box integration enables you to take advantage of the logs Defender for Endpoint's agent creates when it runs on Windows and monitors network transactions. Use this information for Shadow IT discovery across the Windows devices on your network.

The integration doesn't require extra deployment steps or routing or mirroring traffic from your endpoints, and works as follows:

- **Logs from your endpoints that are sent to Defender for Cloud Apps provide user and device information for traffic activities**. Pairing device context with the username provides a full picture across your network enabling you to determine which user did which activity from which device.
- **When you identify a risky user, check the devices that the user accessed to detect potential risks**. If you identify a risky device, check all the users who used it to detect further potential risks.
- **Once traffic information is collected, you're ready to [deep dive into cloud app use](discovered-apps.md#deep-dive-into-discovered-apps) in your organization**. Defender for Cloud Apps takes advantage of Defender for Endpoint Network Protection capabilities to block endpoint device access to cloud apps. For more information about governing the discovered apps, see [Govern discovered apps using Microsoft Defender for Endpoint](mde-govern.md).

Customers integrating with macOS devices may observe a spike in CPU consumption.

> [!TIP]
> [Watch our videos](#related-videos) showing the benefits of using Defender for Endpoint with Defender for Cloud Apps.
>

## Integrate Microsoft Defender for Endpoint with Defender for Cloud Apps <a name="how-to-integrate-microsoft-defender-for-endpoint-with-defender-for-cloud-apps"></a>

To enable Defender for Endpoint integration with Defender for Cloud Apps:

1. In the [Microsoft Defender portal](https://security.microsoft.com), from the navigation pane, select **Settings** > **Endpoints** > **General** > **Advanced features**.
1. Toggle the **Microsoft Defender for Cloud Apps** to **On**.
1. Select **Apply**.

>[!NOTE]
> It takes up to two hours after you enable the integration for the data to show up in Defender for Cloud Apps.
>

![Screenshot of the Defender for Endpoint settings.](media/mde-settings.png)

To configure the severity for alerts sent to Microsoft Defender for Endpoint:

1. In the Microsoft Defender Portal, select **Settings** > **Cloud Apps** > **Cloud Discovery** > **Microsoft Defender for Endpoint**.
1. Under **Alerts**, select the global severity level for alerts.
1. Select **Save**.

    ![Screenshot of the Defender for Endpoint alert settings.](media/mde-alert-severity-settings.png)

## Next steps

> [!div class="nextstepaction"]
> [Investigate apps discovered by Microsoft Defender for Endpoint](mde-investigation.md)

> [!div class="nextstepaction"]
> [Govern apps discovered by Microsoft Defender for Endpoint](mde-govern.md)

## Related videos

> [!div class="nextstepaction"]
> [Discover and block Shadow IT using Defender for Endpoint](https://www.youtube.com/watch?v=MsHkTOoqSQo)

> [!div class="nextstepaction"]
> [Shadow IT discovery beyond the corporate network](https://www.youtube.com/watch?v=f8hbvbY1Hnc)

[!INCLUDE [Open support ticket](includes/support.md)]
