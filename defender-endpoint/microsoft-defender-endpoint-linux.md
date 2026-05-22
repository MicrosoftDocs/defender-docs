---
title: Microsoft Defender for Endpoint on Linux
ms.reviewer: gopkr, pahuijbr, megphapriya
description: Learn how Microsoft Defender for Endpoint on Linux protects servers with next-gen antivirus, EDR, and vulnerability management.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier3
- mde-linux
ms.topic: article
ms.subservice: linux
search.appverid: met150
ai-usage: ai-assisted
ms.date: 05/18/2026
appliesto:
  - Microsoft Defender for Servers Plan 1 or Plan 2
  - Microsoft Defender for Endpoint for servers
  - Microsoft Defender for Business servers
---

# Microsoft Defender for Endpoint on Linux

Microsoft Defender for Endpoint on Linux protects Linux server workloads in on-premises, cloud, and hybrid environments. It helps you prevent, detect, investigate, and respond to advanced threats with unified visibility through the Microsoft Defender portal.

Defender uses a lightweight eBPF-based sensor architecture without kernel modules, providing protection with minimal overhead and zero workload disruption on resource-constrained systems.

As Linux threats evolve beyond traditional malware into fileless and in-memory attacks, Defender combines next-generation antivirus protection, AI-driven endpoint detection and response (EDR), behavioral analytics, and Microsoft threat intelligence to detect and disrupt attacker techniques. These techniques include ransomware, memory injection, lateral movement, and advanced persistence threats.

With broad Linux distribution support and deep integration with the Microsoft Defender ecosystem, you can standardize security operations, gain end-to-end visibility, and accelerate threat response through a unified platform.

## Security capabilities for Linux server environments

The following table describes the core security capabilities offered by Microsoft Defender for Endpoint on Linux.

| Capability | Description |
|---|---|
| **Next-generation protection** | Provides real-time prevention against malware and emerging threats by analyzing execution patterns and blocking malicious activity. |
| **Endpoint detection and response (EDR)** | Delivers deep visibility into endpoint activity and enables rapid investigation and response to advanced attacks. |
| **Vulnerability management** | Identifies security gaps and prioritizes remediation actions to continuously reduce risk exposure. |
| **Streamlined management and operations** | Simplifies onboarding, configuration, monitoring, and management of Defender in large Linux environments. |
| **Seamless integration and extensibility** | Extends visibility and response through seamless connectivity with security tools, APIs, and the broader Defender platform. |

### Next-generation protection

Protect Linux endpoints from malware and advanced threats using real-time, behavior-based, and cloud-powered protection capabilities.

| Capability | Description |
|---|---|
| **Real-time protection** | Antivirus and antimalware protection using behavior-based, cloud-delivered, and machine-learning techniques. |
| **Behavioral monitoring** | Monitors process behavior in real time to detect and block malicious activity based on execution patterns and intent. |
| **Passive mode** | Provides antivirus protection in a passive state without automatic remediation while preserving full EDR visibility. Allows coexistence with other third-party antivirus solutions. |
| **Cloud-delivered protection** | Uses machine learning and threat intelligence to detect emerging threats quickly. |
| **Scheduled and on-demand scans** | Provides flexibility to perform quick, full, or custom scans on endpoints based on operational requirements. |

### Endpoint detection and response (EDR)

Detect, investigate, and respond to sophisticated attacks powered by AI-driven analytics, behavioral detections, and Microsoft global threat intelligence.

| Feature | Description |
|---|---|
| **Behavior-based detections** | Detects advanced threats using AI-driven behavioral analytics. |
| **MITRE ATT&CK-aligned detections** | Maps detections to attacker techniques for better investigation. |
| **Alert correlation** | Groups related alerts into incidents for streamlined investigation. |
| **Device timeline** | Provides a detailed view of activity on the endpoint. |
| **Advanced hunting** | Enables proactive threat hunting using query-based analysis. |
| **Live Response** | Allows remote investigation, script execution, and remediation such as file deletion, process termination, and evidence collection. |
| **Block file using file indicators** | Blocks or allows files on endpoints using custom indicators, helping prevent known malicious files from execution. |
| **Device isolation** | Helps contain compromised devices from lateral movement. |
| **Investigation package collection** | Collects forensic data for deeper analysis. |
| **Remote scanning** | Initiates antivirus scans to identify and remediate threats. |

### Vulnerability management

Continuously assess vulnerabilities, misconfigurations, and security posture to reduce risk exposure and prioritize remediation.

| Capability | Description |
|---|---|
| **Vulnerability assessment** | Identifies software vulnerabilities and misconfigurations on devices. |
| **Security recommendations** | Provides actionable guidance to reduce endpoint risk. |
| **Remediation tracking** | Tracks remediation activities and exposure reduction. |
| **Secure Score integration** | Assesses security posture and provides actions to improve overall security. |

## Streamlined management and operations

Microsoft Defender for Endpoint on Linux provides flexible onboarding and centralized management capabilities via the Defender portal designed to simplify deployment, configuration, monitoring, and integration with other security tools in Linux server environments.

### Deployment at scale

Microsoft Defender for Endpoint on Linux supports multiple deployment methods, enabling efficient onboarding and management in large, diverse environments.

| Capability | Description |
|---|---|
| **Script-based deployment** | Use the Defender Deployment Tool from the Defender portal to simplify installation and onboarding via a single script. |
| **Defender for Cloud deployment** | Automatically onboard and manage Linux servers through Defender for Cloud for streamlined cloud and hybrid deployments. |
| **Third-party management tools** | Use tools such as Ansible, Chef, and Puppet for automated, at-scale deployments. |
| **Golden image deployment** | Pre-configure Defender in base images for consistent, repeatable deployment. |
| **Manual deployment** | Install Defender manually using CLI for testing or limited-scale scenarios. |

Defender supports enterprise-grade Linux distributions on both x64 and ARM64 architectures, enabling consistent protection in heterogeneous environments. For the support matrix and deployment guidance, see [Prerequisites for Defender for Endpoint on Linux](mde-linux-prerequisites.md).

### Management at scale

Centralized management capabilities via the Defender portal help organizations consistently configure, maintain, and monitor Linux server environments at scale while reducing operational overhead.

| Capability | Description |
|---|---|
| **Security settings configuration** | Centrally manage antivirus settings via the Defender or Intune portal and enforce consistent configurations in Linux environments, including exclusions. |
| **Software updates** | **Platform updates** - Monthly updates provide security enhancements and new features. Each release expires after nine months; staying within the latest three versions is recommended. <br/><br/> **Automatic security intelligence updates** - Keeps protection up to date with the latest threat intelligence and security definitions. <br/><br/> **Offline security intelligence updates** - Supports updating security intelligence in environments without internet connectivity. |
| **Device health monitoring** | Provides visibility into antivirus posture, scan results, platform, engine, and intelligence versions via the portal and APIs. |

## Seamless integration and extensibility

Microsoft Defender integrates with existing security tools and workflows through cloud-level capabilities that apply to all onboarded platforms. It enables integration via APIs, Power BI, and SIEM/SOAR solutions for centralized monitoring and automated response, while extending into Microsoft Defender XDR and third-party ecosystems to deliver unified visibility and coordinated security operations.

| Capability | Description |
|---|---|
| **Management and automation APIs** | Automate workflows and integrate Defender for Endpoint into your existing processes. |
| **Partner integrations** | Integrate with Microsoft and non-Microsoft security solutions. |

## Related content

- [What's new in Defender for Endpoint on Linux](whats-new-in-microsoft-defender-endpoint.md)
- [Check prerequisites for Defender for Endpoint on Linux](mde-linux-prerequisites.md)
- [Configure Defender for Endpoint security settings](linux-preferences.md)
- [Deploy updates for Microsoft Defender for Endpoint on Linux](linux-updates.md)
- [Device health reporting in Microsoft Defender for Endpoint](device-health-microsoft-defender-antivirus-health.md)
