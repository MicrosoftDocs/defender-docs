---
# required metadata

title: Setting email notification settings in Advanced Threat Analytics
description: Describes how to have ATA notify you (by email or by ATA event forwarding) when it detects suspicious activities 
keywords:
author: batamig
ms.author: bagol
manager: raynew
ms.date: 01/10/2023
ms.topic: conceptual
ms.service: advanced-threat-analytics
ms.assetid: bff20bf7-8b53-49da-81e5-b818a1c3b24e

# optional metadata

#ROBOTS:
#audience:
#ms.devlang:
ms.suite: ems
#ms.tgt_pltfrm:
#ms.custom:

---

# Provide ATA with your email server settings

[!INCLUDE [Banner for top of topics](includes/banner.md)]

ATA can notify you when it detects a suspicious activity. For ATA to be able to send email notifications, you must first configure the **Email server settings**.

1. On the ATA Center server, click the **Microsoft Advanced Threat Analytics Management** icon on the desktop.

1. Enter your user name and password and click **Log in**.

1. Select the settings option on the toolbar and select **Configuration**.

    ![ATA configuration settings icon.](media/ATA-config-icon.png)

1. In the **notifications** section, under **Mail server**, enter the following information:

   |              Field              |                                                                                                 Description                                                                                                  |               Value                |
   |---------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------|
   | SMTP server endpoint (required) |                                                            Enter the FQDN of your SMTP server and optionally change the port number (default 25).                                                            | For example:<br />smtp.contoso.com |
   |               SSL               |                                              Toggle SSL if the SMTP server required SSL. **Note:** If you enable SSL, you also need to change the Port number.                                               |        Default is disabled         |
   |         Authentication          | Enable if your SMTP server requires authentication. **Note:** If you enable authentication, you must provide a user name and password of an email account that has permission to connect to the SMTP server. |        Default is disabled         |
   |      Send from (required)       |                                                                        Enter an email address from whom the email will be sent from.                                                                         | For example:<br />ATA@contoso.com  |

    ![ATA email server settings image.](media/ata-email-server.png)

## Provide ATA with your Syslog server settings

ATA can notify you when it detects a suspicious activity by sending the notification to your Syslog server. If you enable Syslog notifications, you can set the following for them.

1. Before configuring Syslog notifications, work with your SIEM admin to find out the following information:

   - FQDN or IP address of the SIEM server

   - Port on which the SIEM server is listening

   - What transport to use: UDP, TCP, or TLS (Secured Syslog)

   - Format in which to send the data RFC 3164 or 5424

1. On the ATA Center server, click the **Microsoft Advanced Threat Analytics Management** icon on the desktop.

1. Enter your user name and password and click **Log in**.

1. Select the settings option on the toolbar and select **Configuration**.

    ![ATA configuration settings icon.](media/ATA-config-icon.png)

1. Under Notifications section, Select **Syslog server** and enter the following information:

   |Field|Description|
   |---------|---------------|
   |Syslog server endpoint|FQDN of the Syslog server and optionally change the port number (default 514) <br><br>You can configure only one Syslog endpoint.|
   |Transport|Can be UDP, TCP, or TLS (Secured Syslog)|
   |Format|This is the format that ATA uses to send events to the SIEM server - either RFC 5424 or RFC 3164.|

    ![ATA Syslog server settings image.](media/ata-syslog-server-settings.png)

## See also

[Check out the ATA forum!](https://social.technet.microsoft.com/Forums/security/home?forum=mata)
