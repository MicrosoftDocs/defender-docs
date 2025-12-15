---
title: Respond to Microsoft Defender for DNS alerts
description: Learn best practices for responding to alerts that indicate security risks in DNS services.
ms.date: 06/11/2025
ms.topic: how-to
ms.author: elkrieger
author: Elazark
---

# Respond to Microsoft Defender for DNS alerts

[!INCLUDE [Defender for DNS note](./includes/defender-for-dns-note.md)]

When you receive a security alert about suspicious and anomalous activities identified in DNS transactions, we recommend you investigate and respond to the alert as described below. Even if you're familiar with the application or user that triggered the alert, it's important to verify the situation surrounding every alert.

## Contact resource owner

Depending on the alert, the resource owner may be the user, application, or service that triggered the alert. The resource owner is typically the person or team responsible for the resource that generated the alert.

1. Contact the resource owner to determine whether the behavior was expected or intentional.
1. If the activity is expected, dismiss the alert.
1. If the activity is unexpected, treat the resource as potentially compromised and mitigate as described in the next step.

## Mitigate the alert

If the resource owner confirms that the activity is unexpected, the alert should be mitigated as soon as possible to prevent further damage.

1. Isolate the resource from the network to prevent lateral movement.
1. Run a full antimalware scan on the resource, following any resulting remediation advice.
1. Review installed and running software on the resource, removing any unknown or unwanted packages.
1. Revert the machine to a known good state, reinstalling the operating system if required, and restore software from a verified malware-free source.
1. Resolve any Microsoft Defender for Cloud recommendations for the machine, remediating highlighted security issues to prevent future breaches.

## Related content

- Learn how to [export Defender for Cloud alerts](export-to-siem.md) to your centralized security information and event management (SIEM) system, such as Microsoft Sentinel, any third-party SIEM, or any other external tool.

- Learn how to [send alerts in real-time](continuous-export.md) to Log Analytics or Event Hubs to create automated processes to analyze and respond to security alerts.

## Next step

> [!div class="nextstepaction"]
> [Manage security alerts](manage-respond-alerts.md)
