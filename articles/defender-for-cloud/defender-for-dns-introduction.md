---
title: Microsoft Defender for DNS - the benefits and features
description: Learn about the benefits and features of Microsoft Defender for DNS.
ms.date: 08/20/2025
ms.topic: overview
author: elkrieger
author: Elazark
---

# Overview of Microsoft Defender for DNS

[!INCLUDE [Defender for DNS note](./includes/defender-for-dns-note.md)]

Microsoft Defender for DNS provides an additional layer of protection for all Azure resources that use Azure DNS's Azure-provided name resolution capability.

From within Azure DNS, Defender for DNS monitors the queries from these resources and detects suspicious activities without the need for any extra agents.

## Support

**Microsoft Defender for DNS** is billed as shown on the [pricing page](https://azure.microsoft.com/pricing/details/defender-for-cloud/). You can also [estimate costs with the Defender for Cloud cost calculator](cost-calculator.md).

Review Defender for DNS [cloud availability](support-matrix-defender-for-cloud.md).

## What are the benefits of Microsoft Defender for DNS?

Microsoft Defender for DNS detects suspicious and anomalous activities such as:

- **Data exfiltration** from your Azure resources using DNS tunneling
- **Malware** communicating with command and control servers
- **DNS attacks** - communication with malicious DNS resolvers
- **Communication with domains used for malicious activities** such as phishing and crypto mining

A full list of the alerts provided by Microsoft Defender for DNS is on the [alerts reference page](alerts-dns.md).

## Dependencies

Microsoft Defender for DNS doesn't use any agents.

## Related content

- Learn how to [Export alerts to a SIEM](continuous-export.md).
