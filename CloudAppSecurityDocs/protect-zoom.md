---
title: Connect Zoom | Microsoft Defender for Cloud Apps
description: This article provides information about how to connect your Zoom environment  to Defender for Cloud Apps using the API connector for visibility and control over use.
ms.date: 06/18/2023
ms.topic: how-to
---

# Connect Zoom to Microsoft Defender for Cloud Apps (Preview)



Zoom is an online video conferencing and collaboration tool. Zoom holds critical data of your organization, and this makes it a target for malicious actors.

Connecting Zoom to Defender for Cloud Apps gives you improved insights into your users' activities and provides threat detection using machine learning based anomaly detections.

[!INCLUDE [security-posture-management-connector](includes/security-posture-management-connector.md)]

## SaaS security posture management

To see security posture recommendations for Zoom in Microsoft Secure Score, create an API connector via the **Connectors** tab, with `“account:read:admin`, `chat_channel:read:admin` and `user:read:admin”` permissions. In Secure Score, select **Recommended actions** and filter by **Product** = **Zoom**.

For example, recommendations for Zoom include: 

- *Enable multi-factor authentication (MFA)*
- *Enable session timeout for web users*
- *Enforce end to end encryption in all Zoom meetings*

If a connector already exists and you don't see Zoom recommendations yet, refresh the connection by disconnecting the API connector, and then reconnecting it with the `“account:read:admin`, `chat_channel:read:admin` and `user:read:admin”` permissions.

For more information, see: 

- [Security posture management for SaaS apps](security-saas.md)
- [Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)

## Prerequisites

Before connecting Zoom to Defender for Cloud Apps, make sure that you have the following prerequisites:

- A Zoom PRO plan or higher
- Access to Zoom as an account owner or admin, which is required to access the Zoom API.

    The admin account is used only for initial consent while connecting Zoom to Defender for Cloud Apps. Defender for Cloud Apps uses an OAuth app for daily transactions.

## How to connect Zoom to Defender for Cloud Apps

1. Sign into Zoom as an account owner or admin.

1. In the Microsoft Defender Portal, select **Settings**. Then choose **Cloud Apps**. Under **Connected apps**, select **App Connectors**.

1. In the **App connectors** page, select **+ Connect an app**, and then **Zoom**.
    :::image type="content" source="media/connect-zoom.png" alt-text="Screenshot of the App Connectors > Zoom pop-up.":::

1. In the **Instance name** page of the pop-up, give the connector a descriptive name, and select **Next**.

1. In the **External link** page, select **Connect Zoom**.  You're redirected to the Zoom page, where you're prompted to allow the connection.

1. In Zoom, select to allow the connection. 

    In Microsoft Defender XDR, the **External link** page of the pop-up is updated to confirm that you're connected. For example:

    :::image type="content" source="media/connect-zoom-success.png" alt-text="Screenshot of the success message in Microsoft Defender XDR.":::

1. In the Microsoft Defender XDR pop-up, select **Done**.

   > [!NOTE]
   > After the connector's **Status** is marked as **Connected**, the connector is live and works.

## Rate limits

- **Pro accounts**: 30 requests per second
- **Business accounts**: 80 requests per second

## Next steps

> [!div class="nextstepaction"]
> [Control cloud apps with policies](control-cloud-apps-with-policies.md)

[!INCLUDE [Open support ticket](includes/support.md)]
