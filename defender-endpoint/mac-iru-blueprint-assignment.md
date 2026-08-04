---
title: Assign Microsoft Defender to a blueprint
description: Assign Microsoft Defender for installation to Mac devices
ms.service: defender-endpoint
author: Paul Edmondson-Jones
ms.author: N/A
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
ai-usage: N/A
---

# Pre-requisites

- Access to Iru console

# Assigning the items to a blueprint

1. Log into your Iru console

2. Under Endpoint, select Blueprints

3. Select the Blueprint where this is being assigned

4. Select Edit assignments in the top-right

5. In Library Items, search for the Microsoft Defender Auto App, and the Custom Profiles for Onboarding and Config, then drag them into the correct scope (for example, Add devices in this Blueprint will apply the configuration to all devices, but the Auto App is available for Mac. If you have a configuration scoped specifically to Mac, please add the items here)

6. Once assigned, select Save

7. This will now communicate to your devices, and push the configuration silently. If the user is signed in with the Company Portal app, it will identify the user automatically, check their licensing status, and enable Microsoft Defender.