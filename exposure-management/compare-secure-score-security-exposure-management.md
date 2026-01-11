---
title: Compare Microsoft Secure Score and Microsoft Security Exposure Management 
description: Compare Microsoft secure score and Microsoft Security Exposure Management.
ms.author: dlanger
author: dlanger
manager: rayne-wiselman
ms.topic: overview
ms.service: exposure-management
ms.date: 11/04/2024
---

# Compare Microsoft Security Exposure Management with secure score

This article discusses the differences between Microsoft [Secure Score](/defender-xdr/microsoft-secure-score) and [Microsoft Security Exposure Management](microsoft-security-exposure-management.md).

## Comparison

**Area** | **Security Exposure Management** | **Secure Score**
--- | --- | ---
**Business goal** | Provides a unified view of organizational security posture, and tools for identifying and exploring attack surfaces, and reducing security risk exposure. | Acts as an industry baseline and benchmark to measure organizational security posture.
**Recommendations** | Includes Secure Score recommendations, and recommendations from other sources, such as Microsoft Defender for Cloud. | Recommendations focus mostly on posture assessment of Microsoft Defender products.
**Recommendation measurements** | Views adherence to recommendations from a compliance/non-compliance perspective. | Measures recommendations in terms of points achieved out of a total number of points, and whether points regress or are gained based on specific actions.
**Metrics** | Gathers recommendations for similar assets together into metrics. </br></br>Metrics enable you to quickly gauge exposure levels for groups of similar assets. | Uses security control metrics.
**Initiatives** | Metrics are gathered into predefined initiatives. For instance, the ransomware initiative gathers and defines multiple metrics/recommendations related to ransomware risk. |  Not available.
**Additional tools** |  Security insights help you to manage security exposure. Tools such as the enterprise exposure graph and the attack surface map enable you to query, review, analyze, and visualize cross-organizational attack surfaces.</br></br> Security Exposure Management also generates and provides visibility into potential attack paths across the organization. | Secure Score metrics only.

## Next steps

Review the [prerequisites](prerequisites.md) to get started with Security Exposure Management.
