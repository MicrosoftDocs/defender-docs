---
author: limwainstein
ms.author: lwainstein
ms.service: defender-endpoint
ms.topic: include
ms.date: 07/10/2026
ai-usage: ai-assisted
---


#### Issues have been found with versions 101.26042.0000–101.26042.0009
Issues have been found with versions [101.26042.0000–101.26042.0009](/defender-endpoint/microsoft-defender-endpoint-releases#linux--june-2026--101260420009), where the Defender service might be disabled on some devices that were upgraded and rebooted. For all supported Linux operating systems, affected versions have been removed from the production channel, and are no longer available for installation.

If you use Defender for Servers (Plan 1 or 2) with Defender for Cloud and have the MDE integration enabled, automatic updates for the MDE.Linux extension are enabled by default, which means your machines could have received an affected version automatically. If an affected version was installed, the issue might impact active protection on rebooted devices until remediation steps are taken. 
 
**Resolution:**

- If you haven't upgraded yet, we recommend upgrading to the following build version: 101.26042.0011.


#### Update may fail on FIPS-enabled RHEL 8/9 devices

We are investigating an issue where some devices running Red Hat Enterprise Linux (RHEL) 8 or 9 with FIPS mode enabled may fail to install Microsoft Defender for Endpoint on Linux platform version 101.26042.x.

**Impact**

Affected devices may be unable to complete the platform update and may remain on their previously installed platform version until a corrected package is available.

**Current status**

Fixed in platform version 101.26052.0011 and later. FIPS-enabled RHEL 8/9 devices that were affected by this issue can now install/update to 101.26052.0011 or later successfully.
