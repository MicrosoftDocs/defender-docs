---
title: Transition from grouped to individual recommendations in Defender for Cloud
description: Learn about the transition from grouped (legacy) to individual (dynamic) recommendations in Microsoft Defender for Cloud, including operational impacts and best practices.
ms.topic: conceptual
author: dlanger
ms.author: dlanger
ms.date: 02/11/2026
ms.custom: sfi-image-nochange
#customer intent: As a security administrator, I want to understand the transition from grouped to individual recommendations so that I can adapt my workflows and maintain effective security posture management.
---

# Transition from grouped to individual recommendations in Defender for Cloud

## Overview

Defender for Cloud is evolving its posture management model. During this transition, customers may see **two recommendation models side by side**:

- **Grouped (legacy) recommendations**
- **Individual (dynamic) recommendations**

This change affects how recommendations are presented, prioritized, and managed. It can temporarily increase the number of visible recommendations, change prioritization behavior, and create Secure Score interpretation challenges. This article explains what is changing, why both models currently exist, and how to operate effectively during the transition period.

Operationally, customers should expect workflow adjustments while both models are available. The goal is to move toward individual recommendations as the primary working model while maintaining continuity for compliance and reporting.

---

## Grouped vs. individual recommendations

The following table summarizes the behavioral and operational differences between grouped (legacy) and individual (dynamic) recommendations.

| Aspect | Grouped (legacy) recommendations | Individual (dynamic) recommendations |
|------|----------------------------------|--------------------------------------|
| Availability | Available in the Azure portal | Available in Azure and Defender portals |
| Structure | Aggregates multiple findings under a single parent recommendation (for example, multiple virtual machine vulnerabilities rolled up into one recommendation) | Flat structure where each finding appears as a separate recommendation |
| Management scope | Managed, exempted, and tracked at the grouped recommendation level | Managed, exempted, and tracked per finding |
| Prioritization behavior | Prioritization is applied at the grouped level | Prioritization is applied at the individual finding level |
| Secure Score impact | Currently contributes to Secure Score | Currently does not affect Secure Score |
| Lifecycle status | Set for deprecation during the transition period | Represents the posture model that Defender for Cloud is moving toward |

The primary behavioral difference is granularity. Grouped recommendations provide summarized posture views, while individual recommendations support investigation, prioritization, and action at scale.

---

## Best practice: Adopting individual recommendations

**Best practice:** Start using individual recommendations as your primary model for investigation and remediation.

### What is changing

- Each finding appears as a separate recommendation

## Next steps

- [Review security recommendations](review-security-recommendations.md)
- [Remediate security recommendations](implement-security-recommendations.md)
- [Security recommendations overview](security-recommendations.md)