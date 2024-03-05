---
title: What is the difference between Secure Score and Microsoft Security Exposure Management 
description: This article describes how Secure Score and Microsoft Exposure Management are different.
ms.author: v-mjosephy
author: mjosephym
manager: rayne-wiselman
ms.topic: overview
ms.service: azure
ms.date: 01/10/2024
---

# What is the difference between secure score and Microsoft Security Exposure Management?

This article discusses the differences between Defender Extended Detection and Response (XDR) [secure score](/microsoft-365/security/defender/microsoft-secure-score.md) and [Microsoft Security Exposure Management](microsoft-security-exposure-management.md).

[!INCLUDE [prerelease](../includes//prerelease.md)]

## Comparison

**Area** | **Security Exposure Management** | **Secure score**
--- | --- | ---
**Business goal** | Provides a unified view of organizational security posture, including tools for working with recommendations, exploring attack surfaces, and reducing risk exposure. | Acts as an industry baseline and benchmark to measure organizational security posture.
**Recommendations** | Security Exposure Management includes secure score recommendations. It also includes recommendations from other sources, such as Microsoft Defender for Cloud. | Includes secure score recommendations.
**Recommendation measurements** | Security Exposure Management views adherence to recommendations from a compliance/non-compliance perspective. | Secure score measures its recommendation in terms of points achieved out of a total number of points, and whether points regress or are gained based on specific actions.
**Metrics** | Security Exposure Management gathers recommendations for similar assets together into metrics. Metrics enable you to quickly gauge exposure levels for groups of similar assets. | Security control metrics
**Initiatives** | Metrics are gathered into predefined initiatives. For instance, the ransomware initiative gathers multiple metrics/recommendations related to ransomware risk.</br></br> Initiatives help you to assess security maturity in different areas of risk. |  Not available.
**Additional features** | In addition to exposure insight tools, Security Exposure Management provides the enterprise exposure graph and the enterprise exposure map to help you review, analyze, and visualize your cross-organizational attack surfaces.</br></br> Security Exposure Management also generates and provides visibility into potential attack paths across the organization. | Not available.

## Next steps

[Start using Exposure Management](start-using-exposure-management.md)
