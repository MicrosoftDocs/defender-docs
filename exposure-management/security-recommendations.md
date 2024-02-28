---
title: Review security recommendations
description: This article describes Microsoft Security Exposure Management recommendations and how it works.
ms.author: v-mjosephy
author: mjosephym
manager: rayne-wiselman
ms.topic: overview
ms.service: azure
ms.date: 11/28/2023
---

# Review security recommendations

[!INCLUDE [prerelease](../includes//prerelease.md)]
<!-- Recommendations types ,compliance logic, recommendations fields (including other related EM objects) , products included, data is presented based on  product license-->

The Microsoft Security Exposure Management recommendations catalog serves as a centralized repository for security recommendations originating from various different sources. These include Microsoft Secure Score, encompassing [all its sources](/microsoft-365/security/defender/microsoft-secure-score.md#products-included-in-secure-score), and Microsoft Defender for Cloud. Examining and addressing recommendations allows you to preemptively address security risk and reduce exposure.

It can be found at [Microsoft Exposure Recommendations](https://security.microsoft.com/exposure-recommendations) in the [Microsoft Defender portal](https://security.microsoft.com/). You can access them in the Microsoft Defender portal by going to **Exposure Management -> Exposure Insights -> Recommendations**.

:::image type="content" source="./media/recommendations-navigation.png" alt-text="Screenshot of the recommendations window.":::

You can also access recommendations from an [**Initiatives**](initiatives.md) page to view initiative specific metrics.

## How it works

Every action taken on a security recommendation, helps reduce exposure and directly influences related [security metrics](security-metrics.md) and security [initiatives](initiatives.md), as relevant. Each security recommendation can be categorized as either *Compliant* or *Not Compliant* for your entire organization. The *Compliant* state signifies that the security recommendation were fully executed and successfully completed. Recommendations are sourced from Microsoft or CIS (Center for Internet Security benchmarks) and applicable across certain workloads and domains.

## View recommendations page

The following information is available to view in Recommendations as an overview, and you can filter recommendations by each item:

- **Name**
- **Compliance state** - compliant or not compliant
- **Impact** - high, low, or medium
- **Last calculated**
- **Last state change**
- **Related initiatives** - the number of related initiatives
- **Related metrics** - the number of related metrics
- **Source** - the benchmark source
- **Workload** - which workload the recommendations relate to
- **Domain** - Either device, apps, data, or identity

### Proactive workload recommendations

Security exposure management recommendations relate to the following workloads:

- App governance
- Atlassian (preview)
- Microsoft Entra ID <!-- Azure AD?-->
- Citrix ShareFile
- Defender for Cloud
- Defender for Endpoint
- Defender for Identity
- Defender for Office
- DocuSign
- Dropbox (preview)
- Exchange Online
- GitHub
- Google Workspace
- Intune
- Microsoft Defender for Cloud Apps
- Microsoft Purview Information Protection
- Microsoft Teams
- NetDocuments (preview)
- Okta
- Salesforce
- ServiceNow
- SharePoint Online
- Slack (preview)
- Workplace (preview)
- Zendesk (preview)
- Zoom

<!-- what does preview mean next to workload? only in the preview? -->

## Review recommendations

You can drill down into an individual recommendation by selecting it from the recommendations list. The individual recommendation view includes a more detailed description about the recommendation, when its state was last updated, its source and workload, as well as related metrics and initiatives. You can further explore steps to remediate the recommendation, details about exposed entities, and related initiatives and metrics.

:::image type="content" source="./media/recommendation-ransomeware-advanced-protection.png" alt-text="Screenshot of the ransomware advanced protection recommendation details ":::

:::image type="content" source="./media/recommendations-ransomeware-remediation-steps.png" alt-text="Screenshot of a recommendation remediation steps window.":::

The **Remediation steps** tab describes steps you can take to remediate the recommendation, and provides a means to act on the recommendation, as relevant. Selecting **Manage** takes you to the originating workload where you can work on addressing the recommendation. For instance, in Microsoft Defender for Cloud, Microsoft Entra ID, Microsoft Defender for Office, or Microsoft Defender Vulnerability Management.

> [!NOTE]
>Customers who have Microsoft Defender Cloud Security Posture Management (CSPM) subscriptions will have access to comprehensive cloud data. In the absence of this subscription, only limited cloud data will be accessible.

## Next steps

For more information, see:

- [Overview of improve security insights with exposure insights](exposure-insights-overview.md)
- [Explore security events](security-events.md)
- [Investigate initiative metrics](security-metrics.md)
- [Secure score for Microsoft Security Exposure Management](secure-score.md)
- [!INCLUDE [support](../includes//support.md)]

<!-- ## See also is this needed? -->
