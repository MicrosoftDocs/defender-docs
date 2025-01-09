---
title: Integrate with iboss
description: This article describes how to integrate Microsoft Defender for Cloud Apps with iboss secure cloud gateway for seamless cloud discovery and automated block of unsanctioned apps.
ms.date: 01/29/2023
ms.topic: how-to
---
# Integrate Defender for Cloud Apps with iboss



If you work with both Defender for Cloud Apps and iboss, you can integrate the two products to enhance your security cloud discovery experience. iboss is a standalone secure cloud gateway that monitors your organization's traffic and enables you to set policies that block transactions. Together, Defender for Cloud Apps and iboss provide the following capabilities:

- Seamless deployment of cloud discovery - Use iboss to proxy your traffic and send it to Defender for Cloud Apps. This eliminates the need for installation of log collectors on your network endpoints to enable cloud discovery.
- iboss's block capabilities are automatically applied on apps you set as unsanctioned in Defender for Cloud Apps.
- Enhance your iboss admin portal with the Defender for Cloud Apps risk assessment of the top 100 cloud apps in your organization, which can be viewed directly in the iboss admin portal.

## Prerequisites

- A valid license for Microsoft Defender for Cloud Apps
- A valid license for iboss secure cloud gateway (release 9.1.100.0 or later)

## Deployment

1. In the [Microsoft Defender Portal](https://security.microsoft.com/), do the following integration steps:
    1. Select **Settings**. Then choose **Cloud Apps**.
    1. Under **Cloud Discovery**, select **Automatic log upload**. Then select **+Add data source**.
    1. In the **Add data source** page, enter the following settings:

        - Name = iboss
        - Source = iboss Secure Cloud Gateway
        - Receiver type = Syslog - UDP

        ![data source iboss.](media/iboss-integration.png)

    1. Select **View sample of expected log file**. Then select **Download sample log** to view a sample discovery log, and make sure it matches your logs.

1. Investigate cloud apps discovered on your network. For more information and investigation steps, see [Working with cloud discovery](working-with-cloud-discovery-data.md).

1. Any app that you set as unsanctioned in Defender for Cloud Apps will be pinged by iboss once every ten minutes, and then automatically blocked by iboss. For more information about unsanctioning apps, see [Sanctioning/unsanctioning an app](governance-discovery.md#sanctioningunsanctioning-an-app).

1. To configure iboss to send traffic logs to Microsoft Defender for Cloud Apps, contact iboss support.

## Next steps

> [!div class="nextstepaction"]
> [Control cloud apps with policies](control-cloud-apps-with-policies.md)

[!INCLUDE [Open support ticket](includes/support.md)]
