---
title: Integrate with Menlo Security
description: This article describes how to integrate Microsoft Defender for Cloud Apps with Menlo Security for seamless cloud discovery and automated block of unsanctioned apps.
ms.date: 01/29/2023
ms.topic: how-to
---
# Integrate Defender for Cloud Apps with Menlo Security



If you work with both Defender for Cloud Apps and Menlo Security, you can integrate the two products to enhance your security cloud discovery experience. Menlo Security, as a standalone Secure Web Gateway, monitors your organization's traffic enabling you to set policies for blocking transactions. Together, Defender for Cloud Apps and Menlo Security provide the following capabilities:

- Seamless deployment of cloud discovery - Use Menlo Security to proxy your traffic and send it to Defender for Cloud Apps. This eliminates the need for installation of log collectors on your network endpoints to enable cloud discovery.
- Menlo Security's block capabilities are automatically applied on apps you set as unsanctioned in Defender for Cloud Apps.

## Prerequisites

- A valid license for Microsoft Defender for Cloud Apps, or a valid license for Microsoft Entra ID P1
- A valid license for Menlo Security

## Deployment

1. Log into your Menlo Admin portal and use the [Menlo Security Integration with Microsoft Cloud Access Security Setup Guide](https://admin.menlosecurity.com/docs/guides/web_admin_settings_casb.html?highlight=microsoft) to integrate the products.

1. Investigate cloud apps discovered on your network. For more information and investigation steps, see [Working with cloud discovery](working-with-cloud-discovery-data.md).
1. Any app that you set as unsanctioned in Defender for Cloud Apps will be pinged by Menlo Security every two hours, and then automatically blocked by Menlo Security. For more information about unsanctioning apps, see [Sanctioning/unsanctioning an app](governance-discovery.md#sanctioningunsanctioning-an-app).

## Next steps

> [!div class="nextstepaction"]
> [Control cloud apps with policies](control-cloud-apps-with-policies.md)

[!INCLUDE [Open support ticket](includes/support.md)]
