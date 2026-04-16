---
title: Microsoft Defender for Endpoint SmartScreen URL reputation demonstrations
description: Demonstrates how Microsoft Defender SmartScreen identifies phishing and malware websites based on URL reputation.
ms.service: defender-endpoint
ms.author: lwainstein
author: limwainstein
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier2
- demo
ms.topic: article
ms.subservice: asr
ms.date: 03/04/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
  - Microsoft Defender for Business

---
# URL reputation demonstrations


Test how Microsoft Defender SmartScreen helps you identify phishing and malware websites based on URL reputation.


## Prerequisites 

- Client devices must be running Windows 11 or Windows 10
- Server devices must be running Windows Server 2008 R2 SP1, Windows Server 2012 R2 and later, or Azure Stack HCI OS, version 23H2 and later.
- Microsoft Edge browser required
- For more information, see [Microsoft Defender SmartScreen](/windows/security/threat-protection/microsoft-defender-smartscreen/microsoft-defender-smartscreen-overview)

## SmartScreen for Microsoft Edge URL scenario demonstrations

### Is This Phishing?

Alerts the user to a suspicious page and ask for feedback:

- [Is this Phishing?](https://demo.smartscreen.msft.net/other/areyousure.html)

  Launching this link should render a message similar to the following screenshot:

  :::image type="content" source="media/smartscreen-url-reputation-is-this-phishing.png" alt-text="SmartScreen alerts the user the site is potentially a phishing site and possibly unsafe":::

### Phishing Page

A page known for phishing that should be blocked:

- [A known Phishing page](https://demo.smartscreen.msft.net/phishingdemo.html)

  Launching this link should render a message similar to the following example:

  :::image type="content" source="media/smartscreen-url-reputation-this-is-phishing.png" alt-text="SmartScreen reports the site is known for containing phishing threats":::

### Malware page

A page that hosts malware and should be blocked:

- [A known malware page](https://demo.smartscreen.msft.net/other/malware.html)

  Launching this link should render a message similar to the following screenshot:

  :::image type="content" source="media/smartscreen-url-reputation-malware-page.png" alt-text="SmartScreen alerts the user that the site is know for containing harmful programs":::

### Blocked download

Blocked from downloading because of its URL reputation

- [Download blocked due to URL reputation](https://demo.smartscreen.msft.net/download/malwaredemo/freevideo.exe)

  Launching this link should render a warning that the download was blocked as being unsafe by Microsoft Edge.

### Exploit page

A page that attacks a browser vulnerability

- [Known browser exploit page](https://demo.smartscreen.msft.net/other/exploit.html)

  Launching this link should render a message similar to the Malware page message.

### Malvertising

A benign page hosting a malicious advertisement

- [A page known to contain malicious advertisements](https://demo.smartscreen.msft.net/other/exploit_frame.html)

  Launching this link should render a message similar to the following screenshot:

  :::image type="content" source="media/smartscreen-url-reputation-malvertising.png" alt-text="A demonstration of how SmartScreen responds to a frame on a page that is detected to be malicious. Only the malicious frame is blocked":::

## See also

[Microsoft Defender SmartScreen Documentation](/windows/security/threat-protection/microsoft-defender-smartscreen/microsoft-defender-smartscreen-overview)

[Microsoft Defender for Endpoint - demonstration scenarios](defender-endpoint-demonstrations.md)


