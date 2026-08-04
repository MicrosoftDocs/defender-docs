---
title: Configure the Microsoft Defender Auto App for Iru
description: Prepare the Microsoft Defender Auto App to deploy to Mac endpoints using Iru
ms.service: defender-endpoint
author: paul-ej
ms.reviewer: N/A
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier3
- mde-macos
ms.topic: how-to
ms.subservice: macos
ms.date: 08/02/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
ms.custom: sfi-image-nochange, msecd-doc-authoring-1014
---

# Set up Microsoft Defender as an Auto App

1. Log in to the Iru Portal as highlighted in [mac-iru-login.md](./mac-iru-login.md)

2. In the left navigation pane, under Endpoint, select Library

3. In the top-right corner, select Add Library Item

4. Search for Microsoft Defender, then select Add and configure

5. In the Auto App configuration, set the following settings:
  - Installation: Continuously enforce (Unless manual installation is required)
  - Self Service: Not available in self service (Unless manual installation is required)
  - Enforcement:
    - Version enforcement: Automatically enforce new updates
    - Enforcement timeframe: 1 week (Recommended, then set the time for release)
    - Phased rollout: Configure if required
  - Notifications: Configure as required
  - Options:
    - Add to Dock during install: Configure as required
    - Run preinstall script: Configure as required
    - Run postinstall script: Configure as required

Once complete, hit Save

Once complete, proceed to [mac-iru-build-onboarding-mobileconfig](./mac-iru-build-onboarding-mobileconfig.md)