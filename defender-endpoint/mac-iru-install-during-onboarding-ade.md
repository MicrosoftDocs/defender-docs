---
title: Deploying Microsoft Defender for Endpoint on macOS with Iru during Automated Device Enrolment (ADE)
Description: Deploying Microsoft Defender for Endpoint on macOS with Iru utilising Automated Device Enrolment (ADE), to install during device setup
ms.service: defender-endpoint
author: paul-ej
ms.author: N/A
ms.reviewer: N/A
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier3
- mde-macos
ms.topic: install-set-up-deploy
ms.subservice: macos
ms.date: 07/30/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2

---

# Overview

As part of Iru's latest capabilities during Automated Device Enrolment (ADE), applications can be installed during Setup Assistant so that they are ready for the user once their profile is created, and they hit their desktop

## Configuring Microsoft Defender to be installed during Onboarding

1. Log in to your Iru Console

2. Under Endpoint, select Library

3. Find your Automated Device Enrolment configuration, then select Edit

4. Enable the option "Install Library Items during Setup Assistant"

5. Search for and select the Microsoft Defender Auto App, and the profiles for Onboarding and Configuration, and save your changes