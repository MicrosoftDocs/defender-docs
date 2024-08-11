---
title: Agentless machine scanning in Microsoft Defender for Cloud
description: Learn how Defender for Cloud can gather information about multicloud machine without installing an agent.
author: dcurwin
ms.author: dacurwin
ms.service: defender-for-cloud
ms.topic: concept-article
ms.date: 04/07/2024
ms.custom: template-concept
#customer intent: As a user, I want to understand how agentless machine scanning works in Defender for Cloud so that I can effectively collect data from my machines.
---

# Agentless machine scanning

Microsoft Defender for Cloud provides agentless machine scanning to improve security posture on Azure VMs, and on AWS and GCP machines connected to Defender for Cloud. Agentless scanning doesn't need any installed agents or network connectivity, and doesn't effect machine performance.

Agentless scanning for virtual machines provides:

- **Scan software inventory**: Scan your [software inventory](/defender/defender-vulnerability-management/tvm-software-inventory) for broad visibility with integrated Microsoft Defender Vulnerability Management.
-  **Scan for vulnerabilities**: [Assess machines for vulnerabilities](auto-deploy-vulnerability-assessment.md) using integrated Defender Vulnerability Management.
- **Scan for secrets on machines**: Locate plain text secrets in your compute environment with agentless [secrets scanning](secrets-scanning.md).
- **Scan for malware**: [Scan machines for malware and viruses](agentless-malware-scanning.md) using [Microsoft Defender Antivirus](/microsoft-365/security/defender-endpoint/microsoft-defender-antivirus-windows). 

Agentless scanning is available in the following Defender for Cloud plans:

- [Defender Cloud Security Posture Management (CSPM)](concept-cloud-security-posture-management.md).
- [Defender for Servers Plan 2](plan-defender-for-servers-select-plan.md#plan-features).
- Malware scanning is only available in Defender for Servers Plan 2.

## Agentless scanning architecture

Agentless scanning for VMs uses cloud APIs to collect data. Whereas agent-based methods use operating system APIs in runtime to continuously collect security related data. Defender for Cloud takes snapshots of VM disks and performs an out-of-band, deep analysis of the operating system configuration and file system stored in the snapshot. The copied snapshot remains in the same region as the VM. The VM isn't affected by the scan.

After acquiring the necessary metadata is acquired from the copied disk, Defender for Cloud immediately deletes the copied snapshot of the disk and sends the metadata to Microsoft engines to detect configuration gaps and potential threats. For example, in vulnerability assessment, the analysis is done by Defender Vulnerability Management. The results are displayed in Defender for Cloud, which consolidates both the agent-based and agentless results on the Security alerts page.

The scanning environment where disks are analyzed is regional, volatile, isolated, and highly secure. Disk snapshots and data unrelated to the scan aren't stored longer than is necessary to collect the metadata, typically a few minutes.

:::image type="content" source="media/concept-agentless-data-collection/agentless-scanning-process.png" alt-text="Diagram of the process for collecting operating system data through agentless scanning.":::

## Next steps

[Enable agentless scanning for VMs](enable-vulnerability-assessment-agentless.md).

