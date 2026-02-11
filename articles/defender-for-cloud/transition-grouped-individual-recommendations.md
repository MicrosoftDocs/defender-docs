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

## Adopting individual recommendations

**Best practice:** Start using individual recommendations as your primary model for investigation and remediation.

### What is changing

- Each finding appears as a separate recommendation
- Recommendation volume may increase
- Prioritization becomes risk-based at the individual finding level

### Where to start

- Begin reviewing and triaging **individual recommendations** for day-to-day security work
- Use individual recommendations to drive investigation, remediation, ownership, and exemptions
- Expect a more detailed and actionable queue compared to grouped recommendations

### How to treat grouped recommendations during the transition

- Continue to use grouped recommendations for scenarios that depend on Secure Score
- Avoid duplicating remediation work across both models
- Treat grouped recommendations as a temporary reporting construct rather than a primary investigation tool

### What to expect in daily operations

- Increased visibility into discrete issues
- More precise prioritization of high-risk findings
- Additional filtering and aggregation may be required to keep views manageable

---

## Managing the side-by-side experience

During the transition, both recommendation models may appear simultaneously.

**Best practice:** Actively control which model your teams work with to reduce confusion and duplicate effort.

### Keeping views manageable

- Use recommendation tags to filter your experience:
  - **New version** for individual recommendations
  - **Set for deprecation** for grouped recommendations
- Filter views based on the model your team is currently using
- Avoid leaving both models unfiltered unless explicitly required

### Avoiding duplicate or conflicting work

- Assign a clear operating model per team or workload
- Do not remediate the same issue through both grouped and individual recommendations
- Use grouped recommendations primarily for score tracking, not investigation

### Aligning teams during the transition

- Communicate which recommendation model is authoritative for remediation
- Document temporary operating guidelines for the transition period
- Revisit workflows as alignment between models becomes available

---

## Secure Score during the transition

Secure Score behavior does not yet fully align with the individual recommendation model.

### What Secure Score reflects today

- Secure Score currently applies only to **grouped (GA) recommendations**
- Remediating grouped recommendations affects Secure Score
- Individual recommendations do not currently contribute to Secure Score

### How to interpret Secure Score changes

- Secure Score may not reflect remediation performed through individual recommendations
- A stable or unchanged score does not necessarily indicate unchanged risk

### Balancing risk reduction and compliance reporting

**Best practice:**

- Use **individual recommendations** for investigation and risk reduction
- Continue monitoring **Secure Score** for compliance and reporting needs
- Treat score alignment as transitional until full posture calculation alignment is available

---

## Investigating and prioritizing at scale

Individual recommendations introduce increased granularity. Effective filtering and aggregation are required to operate at scale.

### Handling increased recommendation volume

- Start investigations within the security category most relevant to your team's ownership or risk domain
- Use categories to reduce noise and focus effort

Available categories include:

- **All** – Full posture view
- **Misconfigurations** – Configuration-based risks
- **Vulnerabilities** – Software and platform vulnerabilities
- **Secrets** – Exposed keys and secrets

### Prioritizing high-impact issues

**Best practice:** Make **Critical** and **High** risk levels your default operating view.

- Filter recommendations by risk level
- Address high-impact issues first to reduce risk quickly

### Using aggregation views effectively

Aggregated views help align remediation to your workflow:

- **View by title**
  - Groups the same recommendation type together
  - Suitable for bulk remediation across multiple resources
- **View by resource**
  - Shows all findings on a single asset
  - Suitable for asset-level investigation or isolating high-risk machines

Choose the aggregation that matches the task:

- Widespread issue remediation: **View by title**
- Asset investigation: **View by resource**

---

## What you should do now

- Begin adopting **individual recommendations** for investigation and remediation
- Define a clear internal operating model for the transition period
- Use filters and tags to limit views to the model your team is actively using
- Continue using **grouped recommendations** for Secure Score tracking where required
- Prioritize Critical and High risk individual recommendations in daily operations
- Use aggregation views to scale remediation and investigation efficiently

## Next steps

- [Review security recommendations](review-security-recommendations.md)
- [Remediate security recommendations](implement-security-recommendations.md)
- [Security recommendations overview](security-recommendations.md)