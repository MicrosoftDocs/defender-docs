---
title: Alerts for Azure App Service
description: This article lists the security alerts for Azure App Service visible in Microsoft Defender for Cloud.
ms.topic: reference
ms.custom: linux-related-content
ms.date: 06/03/2024
ai-usage: ai-assisted
---

# Alerts for Azure App Service

This article lists the security alerts you might get for Azure App Service from Microsoft Defender for Cloud and any Microsoft Defender plans you enabled. The alerts shown in your environment depend on the resources and services you're protecting, and your customized configuration.  

> [!NOTE]
> Some of the recently added alerts powered by Microsoft Defender Threat Intelligence and Microsoft Defender for Endpoint might be undocumented.

[Learn how to respond to these alerts](manage-respond-alerts.md).

[Learn how to export alerts](continuous-export.md).


## Azure App Service alerts

[Further details and notes](defender-for-app-service-introduction.md)

## Agentless detection 

App Services operate at the application layer, enabling web apps to process user interactions and manage request flows. Defender for App Services analyzes patterns in these requests to identify behaviors that may indicate security threats. Critical events in web request logs are captured that indicate potential security threats, such as attempts to execute unauthorized code or manipulate application logic.

Examples of suspicious operations captured by Defender for App Services include:

- **Remote code execution** can allow an adversary to run arbitrary commands, potentially gaining control over the application environment.

- **Injection attempts** can manipulate application logic or access sensitive data, leading to data breaches or unauthorized actions.

- **Compromise indicators** can indicate the application is already compromised and may be leveraged to launch attacks against other systems or services.

## Workload runtime detection

Defender for App Services monitors the workload runtime activity to detect suspicious operations, including process creation events.

Examples of suspicious workload runtime activity include:

- **Web shell activity** - Defender for App Services monitors the activity on the running containers to identify behaviors that resemble web shell invocations.

- **Crypto mining activity** - Defender for App Services uses several heuristics to identify crypto mining activity on the running containers, including suspicious download activity, CPU optimization, suspicious process execution, and more.

- **Reconnaissance tools** – Defender for App Services identifies usage of reconnaissance tools that have been used for malicious activities.

> [!NOTE]
> For alerts that are in preview: [!INCLUDE [Legalese](./includes/defender-for-cloud-preview-legal-text.md)]

## Next steps

- [Security alerts in Microsoft Defender for Cloud](alerts-overview.md)
- [Manage and respond to security alerts in Microsoft Defender for Cloud](manage-respond-alerts.md)
- [Continuously export Defender for Cloud data](continuous-export.md)
