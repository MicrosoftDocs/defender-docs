---
title: Hardware acceleration and Microsoft Defender Antivirus.
description: How Microsoft Defender Antivirus incorporates hardware acceleration and Microsoft Defender Antivirus.
author: chrisda
ms.author: chrisda
ms.reviewer: yongrhee
ms.service: defender-endpoint
ms.topic: overview
ms.date: 12/05/2024
ms.subservice: ngp
ms.collection: 
- m365-security
- tier2
ms.localizationpriority: medium
ms.custom: partner-contribution
ROBOTS: NOINDEX, NOFOLLOW
appliesto:
  - Microsoft Defender for Individuals
  - Microsoft Defender Antivirus
---

# Hardware acceleration and Microsoft Defender Antivirus

> [!NOTE]
> The features described in this article are currently in Preview, aren't available in all organizations, and are subject to change.

**Platforms:**

- Windows 11, Windows 10

**Known limitations:**

- Intel TDT doesn't support processors designated as servers.
- Multi-level virtualization isn't currently supported.
- Windows Server workloads aren't supported.
- Windows clients running on Xeon processors aren't supported due to Intel Xeon processors not supporting Intel TDT functionality.

## Microsoft Defender Antivirus (MDAV) and Intel Threat Detection Technology (TDT)

This table shows the Intel TDT technologies Microsoft collaborated with Intel on to provide security while also balancing performance:

|Available since|Intel TDT technology|Intel Threat Detection Technology (TDT) available on|
|---|---|---|
|2018|Intel TDT - Accelerated Memory Scanning (AMS)|Intel integrated graphic sixth Gen Core (circa 2015) or newer family of processors, running on laptops, tablets, and desktop systems.|
|2021|Intel TDT - Cryptojacking detector|Intel sixth Gen Core (circa 2015) or newer family of processors, running on laptops, tablets, and desktop systems.|
|2022|Intel TDT - Ransomware detector|Intel eighth Gen Core or newer family of processors.|

**Intel Threat Detection Technology (TDT) - Accelerated Memory Scanning (AMS):** Introduced extra memory scanning capabilities to detect fileless attacks that are expensive on the Central Processing Unit (CPU), and then offload them to the integrated Graphics Processor Unit (integrated GPU). Two benefits are:

- lower CPU consumption
- A reduction of System-on-a-chip (SoC) power consumption leading to longer battery life on laptops and tablets

**Intel Threat Detection Technology (TDT) - Cryptojacking:** Enhanced detection by using Intel's Central Processing Unit (CPU) performance monitoring unit (PMU) and offloading to the integrated Graphics Processor Unit (integrated GPU) to detect the malware code execution (fingerprint) of repeated mathematical operations at runtime. Machine learning processes signals with minimal overhead.

### How do you enable Intel TDT AMS or Cryptojacking integration?

Enabled by default when Microsoft Defender Antivirus is running.

### What do the detections show up as?

The regular Microsoft Defender Antivirus Event ID **1116**.

### What type of attacks does it help with?

- We use the Intel TDT - Cryptojacking detector to thwart various cryptojacking malware. The following Coinminer campaigns were successfully detected and blocked using the TDT Cryptojacking detector: [YouTube Pirated Software Videos Deliver Triple Threat: Vidar Stealer, LaPlasa Clipper, XMRig Miner](https://www.fortinet.com/blog/threat-research/youtube-pirated-software-videos-deliver-triple-threat-vidar-stealer-laplas-clipper-xmrig-miner)

- We use the Intel TDT detector to identify instances of CryptoJacking malware abusing Windows binaries (lolbins), and then employ Defender behavior monitoring to prevent and block such activities effectively. For more information, see [Hardware-based threat defense against increasingly complex cryptojackers](https://www.microsoft.com/security/blog/2022/08/18/hardware-based-threat-defense-against-increasingly-complex-cryptojackers/).

## Related articles

- [Defending against ransomware with Microsoft Defender for Endpoint and Intel TDT: A Case Study](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/defending-against-ransomware-with-microsoft-defender-for/ba-p/3243941).
