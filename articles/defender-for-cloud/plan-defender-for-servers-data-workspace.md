---
title: Plan Defender for Servers data residency
description: Review data residency and workspace design for Microsoft Defender for Servers.
ms.topic: conceptual
ms.author: dacurwin
author: dcurwin
ms.date: 06/15/2023
ms.custom: references_regions
---
# Plan for data storage

This article helps you understand how data is stored in Microsoft Defender for Cloud, and when you need a Log Analytics workspace.

Defender for Servers is one of the paid plans provided by [Microsoft Defender for Cloud](defender-for-cloud-introduction.md).

## Before you begin

This article is the *second* article in the Defender for Servers planning guide series. Begin by [planning your deployment](plan-defender-for-servers.md).

## Understand data residency

Before you deploy Defender for Servers, it's important for you to understand data residency.

- Review [general Azure data residency considerations](https://azure.microsoft.com/blog/making-your-data-residency-choices-easier-with-azure/).
- Posture data collected by Defender for Cloud is stored in the Defender for Cloud backend. Data is routed based on the tenant location. European tenants are stored in a Europe location.
- Defender for Cloud's threat protection data including security alerts might be processed in the same region as the cloud resource, and later routed to the MDC backend.
- You can export data to a Log Analytics workspace using [continuous export](continuous-export.md).




## Next steps

After you understand how data is stored and when workspaces are needed, review [Defender for Server access roles](plan-defender-for-servers-roles.md).
