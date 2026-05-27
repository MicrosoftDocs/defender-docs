---
title: Risk evaluation framework changelog
description: Track MSEM-initiated changes to the Risk Evaluation Framework that affect Secure Score and recommendation risk level calculations in Microsoft Security Exposure Management.
ms.topic: reference
ms.date: 05/27/2026
ai-usage: ai-assisted
---

# Risk evaluation framework changelog

The Risk Evaluation Framework (REF) changelog documents MSEM-initiated changes that affect how security risk is evaluated in your environment. Changes reflect updates to **inputs and components** of the REF—such as scope, weights, and coverage—not the underlying scoring formula.

Review this changelog if you notice unexpected changes to:

- Your Secure Score
- Recommendation risk levels

## Understanding REF changes

REF changes are initiated by MSEM, not by customer actions. They might include:

- New recommendations introduced to the framework
- New risk factors added to evaluations
- Risk weighting updates
- Evaluation scope or domain definition changes

> [!NOTE]
> These changes reflect updates to risk evaluation inputs and components. The core scoring formula remains stable.

## Changelog

| Date | Change type | Description | More information |
|------|-------------|-------------|------------------|
| March 2026 | Evaluation scope update | Security recommendations previously categorized as **Cloud apps** are recategorized under **Identity** to better reflect their nature. Individual Identity and Cloud apps scores might change, though total Secure Score remains unchanged. | [What's new](whats-new.md#updates-to-secure-score-category-calculations-for-increased-accuracy) |
| November 2025 | Evaluation scope expansion | Integration of Microsoft Defender for Cloud's CSPM capabilities and Microsoft Defender Vulnerability Management expanded the REF scope to include cloud, device vulnerability, and SaaS app recommendations. | [What's new](whats-new.md#integration-of-microsoft-defender-for-clouds-cspm-capabilities-and-microsoft-defender-vulnerability-management-into-exposure-management) |
