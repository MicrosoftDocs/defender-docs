---
title: Security posture assessments
description: This article provides an overview of Microsoft Defender for Identity's identity security posture assessment reports.
ms.date: 02/21/2024
ms.topic: how-to
---

# Microsoft Defender for Identity's security posture assessments

Typically, organizations of all sizes have limited visibility into whether or not their on-premises apps and services could introduce a security vulnerability to their organization. The problem of limited visibility is especially true regarding use of unsupported or outdated components.

While your company may invest significant time and effort on hardening identities and identity infrastructure (such as Active Directory, Active Directory Connect) as an on-going project, it's easy to remain unaware of common misconfigurations and use of legacy components that represent one of the greatest threat risks to your organization. 

Microsoft security research reveals that most identity attacks utilize common misconfigurations in Active Directory and continued use of legacy components (such as NTLMv1 protocol) to compromise identities and successfully breach your organization. To combat this effectively, Microsoft Defender for Identity now offers proactive identity security posture assessments to detect and recommend actions across your on-premises Active Directory configurations.

## What do Defender for Identity security assessments provide?

Defender for Identity's security posture assessments are available in [Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score), and provide:

- **Detections and contextual data** on known exploitable components and misconfigurations, along with relevant paths for remediation.

- **Active monitoring for your on-premises identities and identity infrastructure**, watching for weak spots with the existing Defender for Identity sensor.

- **Accurate assessment reports** of your current organization security posture, for quick responses and effect monitoring in a continuous cycle.

Microsoft Secure Score is a measurement of an organization's security posture, with a higher number indicating more recommended actions taken. It can be found at <https://security.microsoft.com/securescore> in the [Microsoft Defender portal](/microsoft-365/security/defender/microsoft-365-defender).

## Access Defender for Identity security posture assessments

You must have a Defender for Identity license to view Defender for Identity security posture assessments in Microsoft Secure Score.

While *certificate template* assessments are available to all customers that have AD CS installed on their environment, *certificate authority* assessments are available only to customers who've installed a sensor on an AD CS server. For more information, see [Configuring sensors for AD FS and AD CS](deploy/active-directory-federation-services.md).

**To access identity security posture assessments**:

1. Open the [Microsoft Secure Score dashboard](https://security.microsoft.com/securescore).
1. Select the **Recommended actions** tab. You can search for a particular recommended action, or filter the results (for example, by the category **Identity**).

    [![Recommended actions.](media/recommended-actions.png)](media/recommended-actions.png#lightbox)

1. For more details, select the assessment.

    [![Select the assessment.](media/select-assessment.png)](media/select-assessment.png#lightbox)

[!INCLUDE [secure-score-note](../includes/secure-score-note.md)]


## Next steps

- [Learn more about Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score)
- [Check out the Defender for Identity forum!](<https://aka.ms/MDIcommunity>)
