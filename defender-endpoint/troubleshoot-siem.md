---
title: Troubleshoot SIEM tool integration issues in Microsoft Defender for Endpoint
description: Troubleshoot issues that might arise when using SIEM tools with Microsoft Defender for Endpoint.
ms.service: defender-endpoint
ms.subservice: onboard
ms.author: lwainstein
author: limwainstein
ms.localizationpriority: medium
ms.collection: 
- m365-security
- tier3
ms.topic: troubleshooting
ms.date: 02/24/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

---
# Troubleshoot SIEM tool integration issues


> [!NOTE]
> **Try our new APIs using MS Graph security API**. Find out more at: [Use the Microsoft Graph security API - Microsoft Graph | Microsoft Learn](/graph/api/resources/security-api-overview).
> 
> The new Microsoft Defender XDR alerts API, released to public preview in MS Graph, is the official and recommended API for customers migrating from the SIEM API. See [Migrate from the MDE SIEM API to the Microsoft Defender XDR alerts API](configure-siem.md).

You might need to troubleshoot issues while pulling detections in your SIEM tools.

This page provides detailed steps to troubleshoot issues you might encounter.

## Learn how to get a new client secret

If your client secret expires or if you've misplaced the copy provided when you were enabling the SIEM tool application,  you'll need to get a new secret.

1. Log in to the [Azure management portal](https://portal.azure.com).

1. Select **Microsoft Entra ID**.

1. Select your tenant.

1. Click **App registrations**. Then in the applications list, select the application.

1. Select **Certificates & Secrets** section, Click on New Client Secret, then provide a description and specify the validity duration.

1. Click **Save**. The key value is displayed.

1. Copy the value and save it in a safe place.

## Error when getting a refresh access token

If you encounter an error when trying to get a refresh token when using the threat intelligence API or SIEM tools, you'll need to add reply URL for relevant application in Microsoft Entra ID.

1. Log in to the [Azure management portal](https://ms.portal.azure.com).

1. Select **Microsoft Entra ID**.

1. Select your tenant.

1. Click **App Registrations**. Then in the applications list, select the application.

1. Add the following URL:
   - For the European Union: `https://winatpmanagement-eu.securitycenter.windows.com/UserAuthenticationCallback`
   - For the United Kingdom: `https://winatpmanagement-uk.securitycenter.windows.com/UserAuthenticationCallback`
   - For the United States:  `https://winatpmanagement-us.securitycenter.windows.com/UserAuthenticationCallback`.

1. Click **Save**.

## Error while enabling the SIEM connector application

If you encounter an error when trying to enable the SIEM connector application, check the pop-up blocker settings of your browser. It might be blocking the new window being opened when you enable the capability.



## Related topics

- [Use the Microsoft Graph security API - Microsoft Graph | Microsoft Learn](/graph/api/resources/security-api-overview)

- [Pull detections to your SIEM tools](configure-siem.md)


