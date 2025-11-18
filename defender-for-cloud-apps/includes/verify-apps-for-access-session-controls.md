---
title: include file
description: include file
ms.collection: M365-security-compliance
ms.service: defender-for-cloud-apps
author: batamig
ms.topic: include
ms.date: 01/15/2024
ms.author: bagol
ms.custom: include file
---

This procedure describes how to verify that your apps are configured to use access and session controls in Defender for Cloud Apps and configure those settings if needed.

> [!NOTE]
> While you can't remove session control settings for an app, no behavior is changed until you have a session or access policy configured for the app.
>

1. In Microsoft Defender XDR, select **Settings > Cloud Apps > Connected apps > Conditional Access App Control apps**.

1. In the apps table, search for your app and check the **IDP type** column value. Make sure that **Non-MS authentication app** and **Session control** appear for your app.
