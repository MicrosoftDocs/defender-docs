---
title: Microsoft Defender for Endpoint Potentially unwanted applications (PUA) demonstration
description: Demonstration to show how the Potentially Unwanted Applications (PUA) protection feature can identify and block PUAs from downloading and installing on endpoints.
search.appverid: met150
ms.service: defender-endpoint
ms.author: lwainstein
author: limwainstein
ms.localizationpriority: medium
audience: ITPro
ms.collection:
- m365-security
- tier2
- demo
ms.topic: article
ms.subservice: asr
ms.date: 10/20/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Business
  - Microsoft Defender for Individuals
  - Microsoft Defender Antivirus
---

# Potentially unwanted applications (PUA) demonstration


The Potentially Unwanted Applications (PUA) protection feature in Microsoft Defender Antivirus can identify and block PUAs from downloading and installing on endpoints in your network. These applications aren't considered viruses, malware, or other types of threats, but might perform actions on endpoints that adversely affect their performance or use.

## Prerequsites

- Enable PUA protection. For more information, see the [Detect and block Potentially Unwanted Applications](detect-block-potentially-unwanted-apps-microsoft-defender-antivirus.md) article.
- You can also [download and use the PowerShell script](https://www.powershellgallery.com/packages/WindowsDefender_InternalEvaluationSettings/) to enable this setting and others.


### Supported operating systems 

- Windows 11 or Windows 10
- Windows Server 2022
- Windows Server 2019
- Windows Server 2016
- Windows Server 2012 R2
- Windows Server 2008 R2 SP1
- macOS
- Linux

## Scenario

1. Go to [http://www.amtso.org/feature-settings-check-potentially-unwanted-applications/](http://www.amtso.org/feature-settings-check-potentially-unwanted-applications/)
1. Click "Download the Potentially Unwanted Application 'test' file" link
1. After downloading the file, it's automatically blocked and prevented from running.

## See also

[Detect and block Potentially Unwanted Applications](detect-block-potentially-unwanted-apps-microsoft-defender-antivirus.md)

[Microsoft Defender for Endpoint - demonstration scenarios](defender-endpoint-demonstrations.md)


