---
title: Prerelease testing using Google Play preproduction tracks
description: Describes how to conduct pre-release tests before mainstream release using Google Play pre-production tracks
ms.service: defender-endpoint
ms.author: diannegali
author: diannegali
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection:
- m365-security
- tier3
- mde-android
ms.custom: partner-contribution
ms.topic: how-to
ms.subservice: android
search.appverid: met150
ms.date: 04/14/2025
#customer intent: As an IT admin, I want to test custom APKs using Google Play pre-production tracks so that I can ensure the app is working as expected before deploying it to users.
---

# Conduct prerelease tests using Google Play preproduction tracks

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**
- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

Learn how to deploy custom APKs or conduct prerelease app tests using Google Play preproduction tracks. This is useful for testing custom APKs before deploying them to users in your organization. The preproduction track allows you to test the app with a limited number of users before making it available to everyone.

It's common for organizations to have custom APKs that are not available on the Google Play Store. These APKs may be developed in-house or by third-party vendors. By using the preproduction track, you can ensure that these custom APKs are working as expected before deploying them to users.

This article provides step-by-step instructions on how users can use custom APKs for Android devices that are onboarded to Microsoft Defender for Endpoint through the following methods:

- Android Enterprise scenarios
- Mobile Application Mangement (MAM) Enrollment scenarios

## Deploy custom APKs in the Android Enterprise scenario

To deploy custom APKs in the Android Enterprise scenario, follow these steps:

1. Contact Microsoft Support to provide the Google Play STore Organization ID for your organization. This ID is required to add your information to an inclusion list and make the pre-production build available for testing.
2. Once your organization is added to the inclusion list, your admin needs to sync a managed Google Play app with Microsoft Intune. To do this, see [Sync a Managed Google Play app with Intune](/intune/intune-service/apps/apps-add-android-for-work#sync-a-managed-google-play-app-with-intune).
3. After a custom testing APK is published for your organization, your security admin can create a group of users who need the custom APK.