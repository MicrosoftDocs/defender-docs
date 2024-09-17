---
title: Control unwanted behaviors with Exclusions, Indicators and other techniques 
description: Learn how to manage scenarios with exclusions, indicators, and other technique
author: siosulli
ms.author: siosulli
manager: deniseb 
ms.date: 02/14/2024
ms.topic: overview
ms.service: defender-endpoint
ms.subservice: asr
audience: ITPro
ms.collection: 
- m365-security
- tier2
- mde-asr
ms.custom: 
- partner-contribution
ms.reviewer: joshbregman
search.appverid: MET150
f1.keywords: NOCSH 

--- 

# Control unwanted behaviors with Exclusions, Indicators and other techniques 

## False positive scenarios

The table below describes way to manage common false positives scenarios.

|Scenario | Action to take | How to | Alternative | Security Risk Level |
|-------|-------|-------|-------|-------|
|Customer observes their app is detected by Microsoft Defender Antivirus when it runs| Add Defender for Endpoint ASR Exclusions |  [Create "allow" indicators indicator for the file](indicator-file.md) | N/A | High | 

## Performance issue scenarios

The table below describes ways to manage commone performance scenarios.

|Scenario | Action to take | How to | Alternative | Security Risk Level |
|-------|-------|-------|-------|-------|
|Performance isuse when a customer application opens files from network shares | Add Defender Antivirus Exclusions | Configure folder or file extension exclusions <br/> <br/>  - [Use Intune](configure-extension-file-exclusions-microsoft-defender-antivirus.md#use-intune-to-configure-file-name-folder-or-file-extension-exclusions) <br/> - [Use Group Policy](configure-extension-file-exclusions-microsoft-defender-antivirus.md#use-group-policy-to-configure-folder-or-file-extension-exclusions) | N/A | High | 


## 3rd party migration and exclustions 
