---
author: limwainstein
ms.author: lwainstein
ms.service: defender-endpoint
ms.topic: include
ms.date: 07/01/2026
ai-usage: ai-assisted
---

Issues have been found with versions [101.26042.0000–101.26042.0009](/defender-endpoint/microsoft-defender-endpoint-releases#linux--june-2026--101260420009), where the Defender service might be disabled on some devices that were upgraded and rebooted. For all supported Linux operating systems, affected versions have been removed from the production channel, and are no longer available for installation.

If you use Defender for Servers (Plan 1 or 2) with Defender for Cloud and have the MDE integration enabled, automatic updates for the MDE.Linux extension are enabled by default, which means your machines could have received an affected version automatically. If an affected version was installed, the issue might impact active protection on rebooted devices until remediation steps are taken. 
 
Do one of the following:

- If you haven't upgraded yet, we recommend waiting to upgrade until the next available version.
- If you've already upgraded to an affected version and rebooted the server, manually enable and start the service on the affected machine using the following command:
  ```bash
  systemctl enable mdatp
  systemctl start mdatp  
  ```