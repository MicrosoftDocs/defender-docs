---
title: Microsoft Defender for Endpoint SmartScreen app reputation demonstration
description: Test how Microsoft Defender for Endpoint SmartScreen helps you identify phishing and malware websites
search.appverid: met150
ms.service: defender-endpoint
ms.subservice: ngp
ms.author: lwainstein
author: limwainstein
ms.reviewer: yongrhee 
ms.localizationpriority: medium
manager: bagol
audience: ITPro
ms.collection: 
- m365-security
- tier2
- demo
ms.topic: article
ms.date: 10/20/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Business

---
# SmartScreen app reputation demonstration


Test how Microsoft Defender for Endpoint SmartScreen helps you identify phishing and malware websites based on App reputation.

## Prerequisites

- Microsoft Edge or Internet Explorer browser required. 


### Supported operating systems

   - Windows 11
   - Windows 10
   - Windows Server 2016 and later
   - Windows Server 2012 R2
   - Windows Server 2008 R2 
   - Azure Stack HCI OS, version 23H2 and later.


## Scenario Demos

### Known good program

This program has a good reputation; the download should run uninterrupted:

- [Known good program download](https://demo.smartscreen.msft.net/download/known/freevideo.exe)

  Launching this link should render a message similar to the following:

  :::image type="content" source="media/smartscreen-app-reputation-known-good.png" alt-text="Based on the target file's reputation, SmartScreen allows the download without interference.":::

### Unknown program

Because the program download doesn't have sufficient reputation to ensure that it's trustworthy, SmartScreen will show a warning before running the program download.

- [Unknown program](https://demo.smartscreen.msft.net/download/unknown/freevideo.exe)
  
  Launching this link should render a message similar to the following:

  :::image type="content" source="media/smartscreen-app-reputation-unknown.png" alt-text="SmartScreen doesn't have sufficient reputation information about the download file, and warns the user to stop or proceed with caution.":::

### Known malware

This download is known malware; SmartScreen should block this program from running.

- [Known malware](https://demo.smartscreen.msft.net/download/known/knownmalicious.exe)

  Launching this link should render a message similar to the following:

  :::image type="content" source="media/smartscreen-app-reputation-known-malware.png" alt-text="Screenshot showing how SmartScreen detects a file download with an unsafe reputation; the download is blocked.":::

## Learn more

[Microsoft Defender SmartScreen Documentation](/windows/security/threat-protection/windows-defender-smartscreen/windows-defender-smartscreen-overview)

## See also

[Microsoft Defender for Endpoint - demonstration scenarios](defender-endpoint-demonstrations.md)


