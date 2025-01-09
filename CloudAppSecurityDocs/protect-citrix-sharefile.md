---
title: Connect Citrix ShareFile | Microsoft Defender for Cloud Apps
description: This article provides information about how to connect your Citrix ShareFile app to Defender for Cloud Apps using the API connector for visibility and control over use.
ms.date: 12/12/2023
ms.topic: how-to
---

# Connect Citrix ShareFile to Microsoft Defender for Cloud Apps



Citrix ShareFile is a secure content collaboration, file sharing and sync solution that supports all the document-centric tasks and workflow needs of small and large businesses. Citrix ShareFile holds critical data of your organization, and this makes it a target for malicious actors.

Connecting Citrix ShareFile to Defender for Cloud Apps gives you improved insights into your users' activities and provides threat detection using machine learning based anomaly detections.

[!INCLUDE [security-posture-management-connector](includes/security-posture-management-connector.md)]

## Main threats

- Compromised accounts and insider threats 
- Data leakage 
- Insufficient security awareness 
- Unmanaged bring your own device (BYOD) 

## How Defender for Cloud Apps helps to protect your environment

- [Detect cloud threats, compromised accounts, and malicious insiders](best-practices.md#detect-cloud-threats-compromised-accounts-malicious-insiders-and-ransomware)

- [Use the audit trail of activities for forensic investigations](best-practices.md#use-the-audit-trail-of-activities-for-forensic-investigations)
 
## SaaS security posture management  

To see security posture recommendations for Citrix Share File in Microsoft Secure Score, create an API connector via the **Connectors** tab, with **Owner** and **Enterprise** permissions. In Secure Score, select **Recommended actions** and filter by **Product** = **CitrixSF**.

For example, recommendations for Citrix Share File include:

- *Enable multi-factor authentication (MFA)*
- *Enable single sign on (SSO)*
- *Enable session timeout for web users*

If a connector already exists and you don't see Citrix Share File recommendations yet, refresh the connection by disconnecting the API connector, and then reconnecting it with the *Access Company account* permissions.

For more information, see:

- [Security posture management for SaaS apps](security-saas.md)
- [Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)

## Connect Citrix ShareFile to Defender for Cloud Apps

### Prerequisites

The Citrix Share file user used for logging into Citrix Share file must have Access Company account permissions.

### Create API keys

1. Go to [ShareFile API Documentation](https://api.sharefile.com/), and sign in to your organization account.

    ![connect Citrix ShareFile login.](media/connect-citrix-sharefile-login.png "connect Citrix ShareFile login")

1. Select **Get an API Key**.

    ![connect Citrix ShareFile API key.](media/connect-citrix-sharefile-api-key.png "connect Citrix ShareFile API key")

1. To generate API keys (*Client ID* and *Client Secret*), go to **Create New**.

    ![connect Citrix ShareFile create new key.](media/connect-citrix-sharefile-create-new.png "connect Citrix ShareFile create new key")

1. Fill out the following fields:

    - **Application name**: Microsoft Defender for Cloud Apps (you can also choose another name).
    
    - **Redirect URL**:  `https://portal.cloudappsecurity.com/api/oauth/saga`.
    
      For US Government GCC customers, enter `https://portal.cloudappsecuritygov.com/api/oauth/saga` as the redirect URL.
  
      For US Government GCC High customers, enter `https://portal.cloudappsecurity.us/api/oauth/saga` as the redirect URL.
      
1. Select **Generate API Key**.

1. Copy the *Client ID* and *Client Secret*.

### Configure Defender for Cloud Apps

1. In the Microsoft Defender Portal, select **Settings**. Then choose **Cloud Apps**. Under **Connected apps**, select **App Connectors**.

1. In the **App connectors** page, select **+Connect an app**, followed by **Citrix ShareFile**.

    ![connect Citrix ShareFile app connectors.](media/connect-citrix-sharefile-app-connectors.png "connect Citrix ShareFile app connectors")

1. In the pop-up, give the connector a descriptive name, and select **Connect Citrix ShareFile**.  

    ![connect Citrix ShareFile instance name.](media/connect-citrix-sharefile-instance-name.png "connect Citrix ShareFile instance name")

1. In the next screen, enter the following fields:

    - The **Client ID** and **Client Secret** that you created in the Citrix ShareFile API portal.
    - **Client Subdomain**: Enter your account's subdomain. For example, if your account's URL is "mycompany.sharefile.com", you would enter "mycompany".

1. Select **Connect** in Citrix ShareFile.

1. In the Microsoft Defender Portal, select **Settings**. Then choose **Cloud Apps**. Under **Connected apps**, select **App Connectors**. Make sure the status of the connected App Connector is **Connected**.

## Rate limits

The default rate limit is 420 requests per minute.  

## Next steps

> [!div class="nextstepaction"]
> [Control cloud apps with policies](control-cloud-apps-with-policies.md)

[!INCLUDE [Open support ticket](includes/support.md)]

