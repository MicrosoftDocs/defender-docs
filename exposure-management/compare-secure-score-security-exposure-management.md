---
title: What's the difference between Secure Score and Microsoft Security Exposure Management 
description: This article describes how Secure Score and Microsoft Exposure Management are different.
ms.author: v-mjosephy
author: mjosephym
manager: rayne-wiselman
ms.topic: overview
ms.service: azure
ms.date: 01/10/2024
---

# Compare Microsoft secure score and Microsoft Security Exposure Management

This article discusses the differences between Microsoft [secure score](/microsoft-365/security/defender/microsoft-secure-score) and [Microsoft Security Exposure Management](microsoft-security-exposure-management.md).

[!INCLUDE [prerelease](../includes//prerelease.md)]

## Comparison

**Area** | **Security Exposure Management** | **Secure score**
--- | --- | ---
**Business goal** | Provides a unified view of organizational security posture, and tools for working identifying and exploring attack surfaces, and reducing security risk exposure. | Acts as an industry baseline and benchmark to measure organizational security posture.
**Recommendations** | Includes secure score recommendations, and recommendations from other sources, such as Microsoft Defender for Cloud. | Includes secure score recommendations.
**Recommendation measurements** | Views adherence to recommendations from a compliance/non-compliance perspective. | Measures recommendations in terms of points achieved out of a total number of points, and whether points regress or are gained based on specific actions.
**Metrics** | Gathers recommendations for similar assets together into metrics.<br/><br/>Metrics enable you to quickly gauge exposure levels for groups of similar assets. | Uses security control metrics
**Initiatives** | Metrics are gathered into predefined initiatives. For instance, the ransomware initiative gathers and defines multiple metrics/recommendations related to ransomware risk.</br></br> Initiatives help you to assess security maturity in different areas of risk. |  Not available.
**Additional tools** | In addition to exposure insight tools, Security Exposure Management security insights to help you manage security exposure, and tools such as the enterprise exposure graph and the exposure (attack surface) map to review, analyze, and visualize cross-organizational attack surfaces.</br></br> Security Exposure Management also generates and provides visibility into potential attack paths across the organization. | Secure score metrics only.

## Next steps

[Get started with Microsoft Security Exposure Management](get-started-exposure-management.md)