---
title: Investigate connection events that occur behind forward proxies
description: Learn how to use advanced HTTP level monitoring through network protection in Microsoft Defender for Endpoint, which surfaces a real target, instead of a proxy.
ms.service: defender-endpoint
ms.author: chrisda
author: chrisda
ms.localizationpriority: medium
ms.collection: 
- m365-security
- tier2
- mde-edr
ms.topic: how-to
ms.subservice: edr
ms.date: 07/02/2026
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
ms.custom: sfi-image-nochange, msecd-doc-authoring-1016

ai-usage: ai-assisted
---
# Investigate connection events that occur behind forward proxies


Defender for Endpoint supports network connection monitoring from different levels of the network stack. A challenging case is when the network uses a forward proxy as a gateway to the Internet.

The proxy acts as if it was the target endpoint. When a forward proxy acts as the target endpoint, simple network connection monitors audit the connections with the proxy that is correct but has lower investigation value.

Defender for Endpoint supports advanced HTTP level monitoring through network protection. When network protection is turned on, a new type of event is surfaced that exposes the real target domain names.

<a name="use-network-protection-to-monitor-network-connection-behind-a-firewall"></a>
## Use network protection to monitor connections behind a forward proxy or firewall

Monitoring network connection behind a forward proxy is possible due to other network events that originate from network protection. To see these network events on a device timeline, turn on network protection (at the minimum in audit mode).

Network protection can be controlled using the following modes:

- **Block**: Users or apps are blocked from connecting to dangerous domains. You'll be able to see this activity in the Defender portal.
- **Audit**: Users or apps won't be blocked from connecting to dangerous domains. However, you'll still see this activity in the Defender portal.


If you turn off network protection, users or apps won't be blocked from connecting to dangerous domains. You won't see any network activity in Microsoft Defender XDR.

If you don't configure it, network blocking is turned off by default.

For more information, see [Enable network protection](enable-network-protection.md).

<a name="investigation-impact"></a>
## How network protection reveals real targets behind forward proxies

When network protection is turned on, a device's timeline shows the proxy IP address while also displaying the real target address.

:::image type="content" source="media/atp-proxy-investigation.png" alt-text="The network events on device's timeline" lightbox="media/atp-proxy-investigation.png":::

Additional network protection connection events are available to surface the real domain names even behind a proxy.

Event's information:

:::image type="content" source="media/atp-proxy-investigation-event.png" alt-text="The URLs of a single network event" lightbox="media/atp-proxy-investigation-event.png":::

## Hunt for connection events using advanced hunting

The network protection connection events are also available through advanced hunting. You can find them in the DeviceNetworkEvents table under the `ConnectionSuccess` action type.

The following query returns all relevant ConnectionSuccess events:

```console
DeviceNetworkEvents
| where ActionType == "ConnectionSuccess"
| take 10
```

:::image type="content" source="media/atp-proxy-investigation-ah.png" alt-text="The advanced hunting query" lightbox="media/atp-proxy-investigation-ah.png":::

You can also filter out  events that are related to connection to the proxy itself.

Use the following query to filter out the connections to the proxy:

```console
DeviceNetworkEvents
| where ActionType == "ConnectionSuccess" and RemoteIP != "ProxyIP"
| take 10
```

## Related articles

- [Enable network protection with Group Policy or policy CSP](/windows/client-management/mdm/policy-csp-defender#defender-enablenetworkprotection)


