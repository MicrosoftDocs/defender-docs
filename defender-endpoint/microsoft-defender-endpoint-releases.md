---
title: Microsoft Defender for Endpoint versions and releases
description: This article describes new releases and versions of Microsoft Defender for Endpoint on Windows, macOS, Linux, Android, and iOS.
ms.topic: whats-new
ms.service: defender-endpoint
author: lwainstein
ms.author: lwainstein
ms.reviewer: noamhadash, pahuijbr, yongrhee
ms.localizationpriority: medium
ms.date: 09/03/2025
appliesto: Microsoft Defender for Endpoint Plan 1, Microsoft Defender for Endpoint Plan 2, Microsoft Defender XDR
---

# Microsoft Defender for Endpoint versions and releases

This article describes releases and versions of Microsoft Defender for Endpoint across Windows, macOS, Linux, Android, and iOS.

To learn about new features in Microsoft Defender for Endpoint, see [What's new in Microsoft Defender for Endpoint](whats-new-in-microsoft-defender-endpoint.md).

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

## Release versions

| OS | KB | Month | Updates |
| -------- | -------- | -------- | -------- |
| **10.8797.25857.1000** || May 2025 ||
| Windows 11 24H2 | [KB5058499](https://support.microsoft.com/en-us/topic/may-28-2025-kb5058499-os-build-26100-4202-preview-d4c2f1ee-8138-4038-b705-546945076f92) | May 2025 | [Updates](whats-new-in-microsoft-defender-endpoint.md#may-2025) |
| Windows 11 23H2 | [KB5058502](https://support.microsoft.com/en-us/topic/may-27-2025-kb5058502-os-22621-5413-and-22631-5413-preview-6291789c-1eea-4227-9740-a701af6de688) | May 2025 | [Updates](whats-new-in-microsoft-defender-endpoint.md#may-2025) |
| Windows 10 22/H2 | [KB5058481](https://support.microsoft.com/en-us/topic/may-28-2025-kb5058481-os-build-19045-5917-preview-7698d6e7-dd65-494d-b523-aa4c6aa913a2) | May 2025 | [Updates](whats-new-in-microsoft-defender-endpoint.md#may-2025) |
| **10.8760.27617.1006** || July 2024 ||
| Windows 11 24H2 | [KB5041865](https://support.microsoft.com/en-us/topic/august-27-2024-kb5041865-os-build-26100-1591-preview-5d299921-2b27-4fe0-b414-c2336371b552) | July 2024 | [Updates](whats-new-in-microsoft-defender-endpoint.md#release-108760276171006-updates) |
| Windows 11 23H2 <br/> Windows 11 22H | [KB5041587](https://support.microsoft.com/en-us/topic/august-27-2024-kb5041587-os-builds-22621-4112-and-22631-4112-preview-9706ea0e-6f72-430e-b08a-878963dafe08) | July 2024 | [Updates](whats-new-in-microsoft-defender-endpoint.md#release-108760276171006-updates) |
| Windows 11 21H2 | [KB5043067](https://support.microsoft.com/en-us/topic/september-10-2024-kb5043067-os-build-22000-3197-62287850-4f0d-4e4a-9fe8-b026bb1be994) | July 2024 | [Updates](whats-new-in-microsoft-defender-endpoint.md#release-108760276171006-updates) |
| Windows 10 22H2 | [KB5041582](https://support.microsoft.com/en-us/topic/august-29-2024-kb5041582-os-build-19045-4842-preview-f4c4d191-5457-475c-80ac-e1d43cf9c941) | July 2024 | [Updates](whats-new-in-microsoft-defender-endpoint.md#release-108760276171006-updates) |
| Windows Server 2022 and later | [KB5042881](https://support.microsoft.com/en-us/topic/september-10-2024-kb5042881-os-build-20348-2700-5b548143-9613-4e5a-9454-8ed9be8b2bd2) | July 2024 | [Updates](whats-new-in-microsoft-defender-endpoint.md#release-108760276171006-updates) |
| Windows Server 2019 | [KB5043050](https://support.microsoft.com/en-us/topic/september-10-2024-kb5043050-os-build-17763-6293-66e9809a-1838-4474-a6a7-90d64f042f00) | July 2024 | [Updates](whats-new-in-microsoft-defender-endpoint.md#release-108760276171006-updates) |
| Windows Server 2016 <br/> Windows Server 2012 R2 | [KB5005292](https://support.microsoft.com/topic/microsoft-defender-for-endpoint-update-for-edr-sensor-f8f69773-f17f-420f-91f4-a8e5167284ac) | July 2024 | [Updates](whats-new-in-microsoft-defender-endpoint.md#release-108760276171006-updates) |

### Release 10.8797.25857.1000 updates

#### Data Loss Prevention (DLP)

- On-Demand Scan: Improved the functionality, performance, and reliability of the Cold Data Scan feature. This enhancement enables deeper, more consistent scanning of archived or infrequently accessed data, helping organizations uncover potential data risks hidden in long-term storage. 
- General Stability and Performance Improvements: Additional under-the-hood optimizations to improve overall system performance, reliability, and stability.

#### Identity 

- Entity sync enrichment: Expanded the capabilities of the SenseIdentity client to enhance Active Directory (AD) entity synchronization. This update introduces support for syncing new entity types including Group Policy Objects, Authentication Silos, and Domain Controller computer accounts for all Domain Controllers within trusted domains. Additionally, the update enriches existing synced entities (Domain, Account, and Group) with a broader set of attributes, enabling more comprehensive visibility and detection capabilities. 

#### Threat protection

- User contaminant improvements 

#### Network Detection and Response (NDR) 

- Improved data telemetry providing better visibility and insights 

#### SOC experience 

- Improved Data Completeness and Detection: Enhancements have been made to improve the completeness of data collected and reduce the time it takes to detect potential data loss incidents. These improvements enable faster and more accurate identification of data exfiltration attempts across monitored endpoints. 
- Improved Handling for Offline Network Environments: Refined the handling of scenarios where devices operate in offline or restricted network environments. Specifically addresses cases where result uploads to blob storage fail due to offline Certificate Revocation List (CRL) checks, ensuring better reliability and continuity in data collection.

## Windows versions

This page covers the Microsoft Defender for Endpoint EDR `MsSense.exe` versions. You can also check the file information section in the monthly cumulative rollup updates in the following articles:

- [Windows 11 release information](/windows/release-health/windows11-release-information)
- [Windows 10 updates](https://support.microsoft.com/topic/windows-10-update-history-8127c2c6-6edf-4fdf-8b9f-0f7be1ef3562)
- [Windows Server 2022 updates](https://support.microsoft.com/topic/windows-server-2022-update-history-e1caa597-00c5-4ab9-9f3e-8212fe80b2ee)
- [Windows Server 2019 updates](https://support.microsoft.com/topic/windows-10-and-windows-server-2019-update-history-725fc2e1-4443-6831-a5ca-51ff5cbcb059)
- [Windows Server 2025 updates](https://support.microsoft.com/en-us/topic/windows-server-2025-update-history-10f58da7-e57b-4a9d-9c16-9f1dcd72d7d7)