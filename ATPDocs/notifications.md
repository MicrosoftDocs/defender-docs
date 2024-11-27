---
title: Microsoft Defender for Identity notifications
description: Learn how to use and configure Microsoft Defender for Identity notifications in Microsoft Defender XDR.
ms.date: 09/03/2023
ms.topic: how-to
#CustomerIntent: As a Defender for Identity user, I want to learn how to work with Defender for Identity notifications to make sure I'm up to date about events detected by Defender for Identity.
---

# Defender for Identity notifications in Microsoft Defender XDR

Microsoft Defender for Identity provides notifications for health issues and security alerts, either via email notifications or to a Syslog server.

This article describes how to configure Defender for Identity notifications so that you're aware of any health issues or security alerts detected.

> [!TIP]
> In addition to email or Syslog notifications, we recommend that SOC admins use Microsoft Sentinel to view all alerts in a single portal.
> For more information, see [Microsoft Defender XDR integration with Microsoft Sentinel](/azure/sentinel/microsoft-365-defender-sentinel-integration).
> To integrate other SIEM tools, see [Integrate your SIEM tools with Microsoft Defender XDR](/microsoft-365/security/defender/configure-siem-defender).

## Configure email notifications

This section describes how to configure email notifications for Defender for Identity health issues or security alerts.

1. In [Microsoft Defender XDR](https://security.microsoft.com), select **Settings** > **Identities**. 

1. Under **Notifications**, select **Health issues notifications** or **Alert notifications** as needed.

1. In the **Add recipient email**, enter the email address(es) where you want to receive email notifications, and select **+ Add**.

Whenever Defender for Identity detects a health issue or security alert, configured recipients receive an email notification with the details, with a link to Microsoft Defender XDR for more details.

> [!NOTE]
> *Alert notifications* page will be deprecated by January 15, 2025. Please use the '[Email Notifications](https://security.microsoft.com/securitysettings/defender/email_notifications)' page under Defender XDR settings for new and existing notifications rules. [Learn more](https://aka.ms/IncidentsNotificationsDefenderXdr)
## Configure Syslog notifications

This section describes how to configure Defender for Identity to send health issues and security events to a Syslog server through a configured sensor. 

Events aren't sent from the Defender for Identity service to your Syslog server directly, but only through the sensor.

**To configure Syslog notifications**:

1. In [Microsoft Defender XDR](https://security.microsoft.com), select **Settings** > **Identities**.

1. Under **Notifications**, select **Syslog notifications** and then toggle on the **Syslog service** option.

1. Select **Configure service** to open the **Syslog service** pane.

1. Enter the following details:

    - **Sensor**: Select the sensor you want to send notifications to the Syslog server
    - **Service endpoint** and **Port**: Enter the IP address or fully qualified domain name (FQDN) for the Syslog server, and then enter the port number. You can configure only one Syslog endpoint.
    - **Transport**: Select the **Transport** protocol (TCP or UDP).
    - **Format**: Select the format (RFC 3164 or RFC 5424).

1. Select **Send test SIEM notification** and then verify the message is received in your Syslog infrastructure solution.

1. When you've confirmed that the test works, select **Save**.

1. After configuring the Syslog service, select the types of notifications to send to your Syslog server, including whenever:

    - A new security alert is detected
    - An existing security alert is updated
    - A new health issue is detected

> [!TIP]
> When working with Syslog in TLS mode, make sure to install the required certificates on the designated sensor.

## Creating automation scripts for Defender for Identity SIEM logs

If you're creating automation scripts for Defender for Identity SIEM logs, we recommend using the **externalId** field to identify the alert type instead of using the alert name. 

While alert names may occasionally be modified, the **externalId** of each alert is permanent. For more information, see [Defender for Identity SIEM log reference](cef-format-sa.md).

## Related content

For more information, see [Configure event collection](deploy/configure-event-collection.md).
