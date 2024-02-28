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

# What is the difference between Secure Score and Microsoft Security Exposure Management?


This article discusses the differences between [Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score.md) and [Microsoft Security Exposure Management](microsoft-security-exposure-management.md). While both are security posture tools that contribute to reducing your organizational security risk through meeting recommendations, Microsoft Security Exposure Management has broader tools to assist with security posture.

[!INCLUDE [prerelease](../includes//prerelease.md)]

## Overview

Microsoft Secure Score is an industry baseline and benchmark that helps your organization assess and improve its security posture. It provides a numerical summary based on system configurations, user behavior, and other security-related measurements. It depicts how well recommendations are met using a score and point system, which change as you complete recommendations.

For more information about Secure Score, see  [Assess your security posture with Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score-improvement-actions.md).

Microsoft Security Exposure Management is a posture and exposure management interface that provides a unified view of your organization’s security posture and threat exposure information across your organizational workloads. For more information, see [What is Microsoft Security Exposure Management](microsoft-security-exposure-management.md) <!--Including through measuring and benchmarking an organization's compliance with Microsoft Secure Score. It enables customers to choose the standards they wish to comply with. Whether they want to track compliance with industry-driven standards such as CIS (Center for Internet Security) or NIST (National Institute of Standards and Technology), or whether to align with Microsoft’s own standards, represented by the Microsoft Secure Score. This flexibility allows organizations to tailor their security and compliance strategies to meet specific industry requirements or to follow Microsoft’s best practices for security.--> While both provide posture management, they serve different functions. Both use recommendations, but in distinct ways. In addition, Security Exposure Management has a broader tool set and includes Secure Score data.

### Exposure insights through recommendations, initiatives, and metrics

Like Secure Score, Security Exposure Management uses recommendations. However, Security Exposure Management recommendations are [initiatives](initiatives.md) focused. They're used to help your initiatives meet security concerns, in a metric-driven way.

Initiative recommendations additionally include Secure Score recommendations. However, they also include recommendations surfaced in Microsoft Defender Vulnerability Management, Microsoft Defender for Cloud, and other sources. Security Exposure Management structures these recommendations in different security initiatives that align with organizational objectives. For instance, the ransomware initiative has many associated metrics and recommendations to help ensure proper control and reduced risk. Secure Score has recommendations and general metrics, but they aren't structured around initiative objectives. An initiatives based approach provides more extensive exposure insight capabilities.

### Points or compliance

Secure Score measures recommendation in terms of points achieved and whether points regress or are gained based on specific actions. In contrast, Security Exposure Management views adherence to recommendations from a compliance/non-compliance perspective. You can quickly find which initiative recommendation is compliant. <!-- check this for more details-->

### Other tools
<!-- that Exposure management is broader seems relevant in the comparison-->
In addition, Exposure Management consolidates and encompasses a range of security posture services, across-workloads. These include attack surface management tools to proactively mitigate attack risks.
<!--Insights including metric driven security initiatives, a broad range of recommendations, and events to track initiative and metric drift. Exposure Management includes tools to customize your experience of the security posture services to better match your organizational risk profile and needs. -->

Exposure Management now includes Secure Score as part of its overall suite of security posture tools.  

## Comparison

The following chart reviews some of the key differences of Secure Score and Exposure Management:

|Topic  |Secure Score  |Exposure Management  |
|---------|---------|---------|
|MS Defender for Cloud     | Not included | Initiative score is calculated based on the value and weight of the metrics assigned to the initiative. The metrics draw on recommendations from Secure Score and other sources, including Microsoft Defender for Cloud, to mitigate risks. |
| Recommendations | Yes | Recommendations are part of an overall initiatives risk mitigation method that also includes viewable metrics.  |
|Initiatives  | No | Yes   |
| Metrics | Security control metrics    | Broad range of metrics that are connected to initiatives and individually viewable.     |
|Points achieved/Compliance model |Uses a point system that measures points achieved out of a total number of points.  | Recommendations use a compliant/not-compliant state model. State can be sorted to view all noncompliant recommendations.   |
<!--  MEM also has data connectors to connect to other products,-->

<!--
1.	MSS and XSPM are two separate products in this sense, although they are very close
2.	MSS score is based only on the controls and the status of their implementation
3.	Initiative score is calculated based on all the metrics included in the initiative, that in many cases (but not all) are based on recommendations 
4.	In the future we want to have an MSS initiatitve, and in that case only MSS score == Initiatitve score
-->
## Summary

- Secure Score and Security Exposure Management are both posture management tools but serve different business objectives.
- Security Exposure Management has a broader set of tools for exposure insights, including Secure Score recommendations.
- Security Exposure Management includes a broader range of recommendation sources, including Microsoft Defender for Cloud.
- Secure Score uses a points achieved compliance method in contract to Security Exposure Management's compliant/non-compliant method.

## Next steps

- [Start using Exposure Management](start-using-exposure-management.md)
- <!--[!INCLUDE [support](../includes//support.md)]-->
