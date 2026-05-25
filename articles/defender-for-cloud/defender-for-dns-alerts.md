---
title: Respond to Microsoft Defender for DNS alerts
description: Learn best practices for responding to alerts that indicate security risks in DNS services.
ms.date: 05/25/2026
ms.topic: how-to
ms.author: elkrieger
author: ElazarK
---

# Respond to Microsoft Defender for DNS alerts

## Investigate and respond to DNS alerts

[!INCLUDE [Defender for DNS note](./includes/defender-for-dns-note.md)]

When you receive a security alert about suspicious activity in DNS transactions, investigate and respond by using the steps in this article. Even if you're familiar with the application or user that triggered the alert, verify the situation around every alert.

## Contact resource owner

Depending on the alert, the resource owner may be the user, application, or service that triggered the alert. The resource owner is typically the person or team responsible for the resource that generated the alert.

1. Contact the resource owner to determine whether the behavior was expected or intentional.
1. If the activity is expected, dismiss the alert.
1. If the activity is unexpected, treat the resource as potentially compromised and follow the mitigation steps in the next section.

## Mitigate the alert

If the resource owner confirms that the activity is unexpected, mitigate the alert as soon as possible to prevent further damage.

1. Isolate the resource from the network to prevent lateral movement (an attacker moving from one compromised system to other systems).
1. Run a full antimalware scan on the resource, following any resulting remediation advice.
1. Review installed and running software on the resource, removing any unknown or unwanted packages.
1. Revert the machine to a known good state, reinstalling the operating system if required, and restore software from a verified malware-free source.
1. Resolve any Microsoft Defender for Cloud recommendations for the machine, remediating highlighted security issues to prevent future breaches.

## Related content

- Export Defender for Cloud alerts to your centralized security information and event management (SIEM) system. For steps, see [Export alerts to a SIEM](export-to-siem.md).

- Send alerts in real time to Log Analytics or Event Hubs to build automated response processes. For steps, see [Configure continuous export](continuous-export.md).

## Next step

> [!div class="nextstepaction"]
> [Manage security alerts](manage-respond-alerts.md)

