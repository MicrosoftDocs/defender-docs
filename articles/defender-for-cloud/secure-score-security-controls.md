---
title: Secure score in Microsoft Defender for Cloud
description: Learn about the Microsoft Defender for Cloud secure score, which is part of the Microsoft cloud security benchmark.
ms.topic: concept-article
ms.date: 03/12/2025
ms.custom: sfi-image-nochange
zone_pivot_groups: defender-portal-experience
---

::: zone pivot="azure-portal"

# Secure score in Defender for Cloud

The secure score in Microsoft Defender for Cloud can help you improve your cloud security posture. The secure score aggregates security findings into a single score so that you can assess, at a glance, your current security situation. The higher the score, the lower the identified risk level is.

When you turn on Defender for Cloud in a subscription, the [Microsoft cloud security benchmark (MCSB)](/security/benchmark/azure/introduction) standard is applied by default in the subscription. Assessment of resources in scope against the MCSB standard begins.

The MCSB issues recommendations based on assessment findings. Only built-in recommendations from the MCSB affect the secure score. Currently, [risk prioritization](risk-prioritization.md) doesn't affect the secure score.

> [!NOTE]
> Recommendations flagged as **Preview** aren't included in secure score calculations. You should still remediate these recommendations wherever possible, so that when the preview period ends, they'll contribute toward your score. Preview recommendations are marked with an icon: :::image type="icon" source="media/secure-score-security-controls/preview-icon.png" border="false":::.
> Recommendation maturity [Preview] doesn't modify the secure score UI or weighting model; it only classifies recommendations. Aside from excluding preview recommendations, the secure score formulas and UI values remain unchanged.

## View the secure score

When you view the Defender for Cloud **Overview** dashboard, you can view the secure score for all of your environments. The dashboard shows the secure score as a percentage value and includes the underlying values.

:::image type="content" source="./media/secure-score-security-controls/single-secure-score-via-ui.png" alt-text="Screenshot of the portal dashboard that shows an overall secure score and underlying values." lightbox="media/secure-score-security-controls/single-secure-score-via-ui.png":::

The Azure mobile app shows the secure score as a percentage value. Tap it to see details that explain the score.

:::image type="content" source="./media/secure-score-security-controls/single-secure-score-via-mobile.png" alt-text="Screenshot of the Azure mobile app that shows an overall secure score and details." lightbox="media/secure-score-security-controls/single-secure-score-via-mobile.png":::

## Explore your security posture

The **Security posture** page in Defender for Cloud shows the secure score for your environments overall and for each environment separately.

:::image type="content" source="media/secure-score-security-controls/security-posture-page.png" alt-text="Screenshot of the Defender for Cloud page for security posture." lightbox="media/secure-score-security-controls/security-posture-page.png":::

On this page, you can see the subscriptions, accounts, and projects that affect your overall score, information about unhealthy resources, and relevant recommendations. You can filter by environment, such as Azure, Amazon Web Services (AWS), Google Cloud Platform (GCP), and Azure DevOps. You can then drill down into each Azure subscription, AWS account, and GCP project.

:::image type="content" source="media/secure-score-security-controls/bottom-half.png" alt-text="Screenshot of the bottom half of the security posture page." lightbox="media/secure-score-security-controls/bottom-half.png":::

## Calculation of the secure score

On the **Recommendations** page in Defender for Cloud, the **Secure score recommendations** tab shows how compliance controls within the MCSB contribute toward the overall security score.

:::image type="content" source="./media/secure-score-security-controls/security-controls.png" alt-text="Screenshot that shows security controls that affect a secure score." lightbox="./media/secure-score-security-controls/security-controls.png":::

Defender for Cloud calculates each control every eight hours for each Azure subscription or for each AWS or GCP cloud connector.

> [!IMPORTANT]
> Recommendations within a control are updated more often than the control itself. You might find discrepancies between the resource count on the recommendations and the resource count on the control.

### Example scores for a control

The following example focuses on secure score recommendations for **Remediate vulnerabilities**.

:::image type="content" source="./media/secure-score-security-controls/remediate-vulnerabilities-control.png" alt-text="Screenshot that shows secure score recommendations for the Remediate vulnerabilities control." lightbox="./media/secure-score-security-controls/remediate-vulnerabilities-control.png":::

This example illustrates the following fields in the recommendations.

**Field** | **Details**
--- | ---
**Remediate vulnerabilities** | A grouping of recommendations for discovering and resolving known vulnerabilities.
**Max score** |  The maximum number of points that you can gain by completing all recommendations within a control.<br/><br/> The maximum score for a control indicates the relative significance of that control and is fixed for every environment.<br/><br/>Use the values in this column to determine which issues to work on first.
**Current score** | The current score for this control.<br/><br/> Current score = [Score per resource] * [Number of healthy resources]<br/><br/>Each control contributes to the total score. In this example, the control is contributing 3.33 points to current total score.
**Potential score increase** | The remaining points available to you within the control. If you remediate all the recommendations in this control, your score increases by 4%.<br/><br/> Potential score increase = [Score per resource] * [Number of unhealthy resources]
**Insights** | Extra details for each recommendation, such as:<br/><br/>  - :::image type="icon" source="media/secure-score-security-controls/preview-icon.png" border="false"::: **Preview recommendation**: This recommendation affects the secure score only when it's generally available.<br/><br/> - :::image type="icon" source="media/secure-score-security-controls/fix-icon.png" border="false"::: **Fix**: Resolve this issue.<br/><br/> - :::image type="icon" source="media/secure-score-security-controls/enforce-icon.png" border="false"::: **Enforce**: Automatically deploy a policy to fix this issue whenever someone creates a noncompliant resource.<br/><br/> - :::image type="icon" source="media/secure-score-security-controls/deny-icon.png" border="false"::: **Deny**: Prevent new resources from being created with this issue.

## Score calculation equations

Here's how scores are calculated.

### Security control

The equation for determining the score for a security control is:

:::image type="content" source="./media/secure-score-security-controls/secure-score-equation-single-control.png" alt-text="Screenshot that shows the equation for calculating a security control score."lightbox="media/secure-score-security-controls/secure-score-equation-single-control.png":::

The current score for each control is a measure of the status of the resources within the control. Each individual security control contributes toward the secure score. Each resource that's affected by a recommendation within the control contributes toward the control's current score. The secure score doesn't include resources found in preview recommendations.

In the following example, the maximum score of 6 is divided by 78 because that's the sum of the healthy and unhealthy resources. So, 6 / 78 = 0.0769. Multiplying that by the number of healthy resources (4) results in the current score: 0.0769 * 4 = 0.31.

:::image type="content" source="./media/secure-score-security-controls/security-control-scoring-tooltips.png" alt-text="Screenshot of tooltips that show the values used in calculating the security control's current score."lightbox="media/secure-score-security-controls/security-control-scoring-tooltips.png":::

### Single subscription or connector

The equation for determining the secure score for a single subscription or connector is:

:::image type="content" source="./media/secure-score-security-controls/secure-score-equation-single-sub.png" alt-text="Screenshot of the equation for calculating a subscription's secure score." lightbox="media/secure-score-security-controls/secure-score-equation-single-sub.png":::

:::image type="content" source="./media/secure-score-security-controls/secure-score-example-single-sub.png" alt-text="Screenshot of a single-subscription secure score with all controls enabled." lightbox="media/secure-score-security-controls/secure-score-example-single-sub.png":::

:::image type="content" source="./media/secure-score-security-controls/secure-score-example-single-sub-recs.png" alt-text="Screenshot that shows a list of controls and the potential score increase."lightbox="media/secure-score-security-controls/secure-score-example-single-sub-recs.png":::

This equation is the same equation for a connector, with just the word *subscription* replaced by the word *connector*.

### Multiple subscriptions and connectors

The equation for determining the secure score for multiple subscriptions and connectors is:

:::image type="content" source="./media/secure-score-security-controls/secure-score-equation-multiple-subs.png" alt-text="Screenshot that shows the equation for calculating the secure score for multiple subscriptions."lightbox="media/secure-score-security-controls/secure-score-equation-multiple-subs.png":::

The combined score for multiple subscriptions and connectors includes a *weight* for each subscription and connector. Defender for Cloud determines the relative weights for your subscriptions and connectors based on a linear weighting model using the combined number of healthy and unhealthy resources per subscription (excluding 'Not applicable' resources). The current score for each subscription and connector is calculated in the same way as for a single subscription or connector, and then its weight is applied (see equation). If a subscription or connector doesn't have any assessments (no healthy or unhealthy resources) for a given control, that control is excluded from the score calculation for that subscription or connector. In that case, neither the control's current nor maximum potential points contribute to that subscription's score. The aggregated secure score shown in the UI is not a simple arithmetic average of per-subscription percentages or per-control counts; it's a weighted sum across subscriptions. Therefore, the per-control resource numbers displayed in the UI can't be used to manually recompute the overall secure score across multiple subscriptions.

When you view multiple subscriptions and connectors, the secure score evaluates all resources within all enabled policies and groups them. Grouping them shows how, together, they affect each security control's maximum score.

:::image type="content" source="./media/secure-score-security-controls/secure-score-example-multiple-subs.png" alt-text="Screenshot that shows a secure score for multiple subscriptions with all controls enabled." lightbox="media/secure-score-security-controls/secure-score-example-multiple-subs.png":::

## Improve a secure score

The MCSB consists of a series of compliance controls. Each control is a logical group of related security recommendations and reflects your vulnerable attack surfaces.

To see how well your organization is securing each individual attack surface, review the scores for each security control. Your score improves only when you remediate *all* of the recommendations.

To get all the possible points for a security control, all of your resources must comply with all of the security recommendations within the security control. For example, Defender for Cloud has multiple recommendations for how to secure your management ports. You need to remediate them all to make a difference in your secure score.

You can improve your secure score by using either of these methods:

- Remediate security recommendations from your recommendations list. You can remediate each recommendation manually for each resource, or use the **Fix** option (when available) to resolve an issue on multiple resources quickly.
- [Enforce or deny](prevent-misconfigurations.md) recommendations to improve your score, and to make sure that your users don't create resources that negatively affect your score.

## Secure score controls

The following table lists the security controls in Microsoft Defender for Cloud. For each control, you can see the maximum number of points that you can add to your secure score if you remediate *all* of the recommendations listed in the control, for *all* of your resources.

**Secure score** | **Security control**
--- | ---
10 | **Enable MFA**: Defender for Cloud places a high value on MFA. Use these recommendations to help secure the users of your subscriptions.<br/><br/> There are three ways to enable MFA and be compliant with the recommendations: security defaults, per-user assignment, and conditional access policy.
8 | **Secure management ports**: Brute force attacks often target management ports. Use these recommendations to reduce your exposure with tools like [just-in-time VM access](just-in-time-access-overview.md) and [network security groups](/azure/virtual-network/network-security-groups-overview).
6 | **Apply system updates**: Not applying updates leaves unpatched vulnerabilities and results in environments that are susceptible to attacks. Use these recommendations to maintain operational efficiency, reduce security vulnerabilities, and provide a more stable environment for your users. To deploy system updates, you can use the [Azure Update Manager](/azure/update-manager/overview) to manage patches and updates for your machines.
6 | **Remediate vulnerabilities**: When your vulnerability assessment tool reports vulnerabilities to Defender for Cloud, Defender for Cloud presents the findings and related information as recommendations. Use these recommendations to remediate identified vulnerabilities.
4 | **Remediate security configurations**: Misconfigured IT assets have a higher risk of being attacked. Use these recommendations to harden the identified misconfigurations across your infrastructure.
4 | **Manage access and permissions**: A core part of a security program is ensuring that your users have just the necessary access to do their jobs: the least privilege access model. Use these recommendations to manage your identity and access requirements.
4 | **Enable encryption at rest**: Use these recommendations to ensure that you mitigate misconfigurations around the protection of your stored data.
4 | **Encrypt data in transit**: Use these recommendations to help secure data that's moving between components, locations, or programs. Such data is susceptible to man-in-the-middle attacks, eavesdropping, and session hijacking.
4 | **Restrict unauthorized network access**: Azure offers a suite of tools that help you provide high security standards for access across your network.<br/><br/> Use these recommendations to manage adaptive network hardening in Defender for Cloud, ensure that you configured [Azure Private Link](/azure/private-link/private-link-overview) for all relevant platform as a service (PaaS) services, enable [Azure Firewall](/azure/firewall/overview) on virtual networks, and more.
3 | **Apply adaptive application control**: Adaptive application control is an intelligent, automated, end-to-end solution to control which applications can run on your machines. It also helps to harden your machines against malware.
2 | **Protect applications against DDoS attacks**: Advanced networking security solutions in Azure include Azure DDoS Protection, Azure Web Application Firewall, and the Azure Policy add-on for Kubernetes. Use these recommendations to help protect your applications with these tools and others.
2 | **Enable endpoint protection**: Defender for Cloud checks your organization's endpoints for active threat detection and response solutions, such as Microsoft Defender for Endpoint or any of the major solutions shown in this list.<br/><br/> If no endpoint detection and response (EDR) solution is enabled, use these recommendations to deploy Microsoft Defender for Endpoint. Defender for Endpoint is included in the [Defender for Servers plan](defender-for-servers-introduction.md).<br/><br/>Other recommendations in this control help you deploy agents and configure [file integrity monitoring](file-integrity-monitoring-overview.md).
1 | **Enable auditing and logging**: Detailed logs are a crucial part of incident investigations and many other troubleshooting operations. The recommendations in this control focus on ensuring that you enabled diagnostic logs wherever they're relevant.
0 | **Enable enhanced security features**: Use these recommendations to enable any Defender for Cloud plans.
0 | **Implement security best practices**: This collection of recommendations is important for your organizational security but doesn't affect your secure score.

## Next steps

[Track your secure score](secure-score-access-and-track.md)

::: zone-end

::: zone pivot="defender-portal"

## Cloud secure score in the Defender portal

The secure score in Microsoft Defender for Cloud can help you improve your cloud security posture. The secure score aggregates security findings into a single score so that you can assess, at a glance, your current security situation. The higher the score, the lower the identified risk level is.

When you turn on Defender for Cloud in a subscription, the [Microsoft cloud security benchmark (MCSB)](/security/benchmark/azure/introduction) standard is applied by default in the subscription. Assessment of resources in scope against the MCSB standard begins.

## Cloud secure score model

The Cloud secure score model introduces asset risk factors and asset criticality into the calculation, making the score more accurate and enabling smarter prioritization of high‑risk level recommendations.

:::image type="content" source="./media/secure-score-security-controls/cloud-secure-score-flow.png" alt-text="Diagram of the new Cloud secure score calculation flow including asset risk factors and criticality.":::

Your secure score improves as you address security recommendations in Microsoft Defender for Cloud. Focus on recommendations with higher risk levels, as they contribute the most to your score.

:::image type="content" source="./media/secure-score-security-controls/cloud-secure-score-formula.png" alt-text="Formula diagram showing Cloud secure score incorporating asset risk factors and asset criticality.":::

**Legend (Cloud Secure Score formula)**  

- n = Number of assets  
- Criticality = The asset criticality for the organization  
- Rec. Low = Recommendations with low risk level  
- Rec. Medium = Recommendations with medium risk level  
- Rec. High = Recommendations with high risk level  
- Rec. Critical = Recommendations with critical risk level  

> [!NOTE]
> The previous (classic) secure score is still available in the Azure portal using the classic view of recommendations. Navigation: Azure portal → Microsoft Defender for Cloud → Recommendations → Switch to classic view.

## Microsoft secure score context

Microsoft secure score is a broader, unified concept spanning multiple security domains. This page focuses on the Cloud secure score (cloud security posture management in Defender for Cloud). Other Microsoft secure scores appear in the Microsoft security portals.

**Secure score types**

| Score type | Scope / domain | Primary source products & data |
| --- | --- | --- |
| Identity Secure Score | Identity posture | Microsoft Entra (Azure AD) recommendations |
| Endpoint Secure Score | Device / endpoint posture | Microsoft Defender for Endpoint (device configuration, threat protection) |
| Cloud Secure Score | Cloud posture (multicloud) | Microsoft Defender for Cloud (Azure, AWS, GCP) |

> [!NOTE]
> These domain scores might be collectively referred to as Microsoft Secure Scores in UI and documentation. Calculations are domain-specific. This article describes only the Cloud Secure Score model used by Defender for Cloud.

**Core calculation concepts (Cloud secure score)**  

- **Max score**: Fixed potential points per control (relative weighting).  
- **Current score**: Sum of control contributions based on healthy resources.  
- **Potential score increase**: Remaining points attainable by remediating unhealthy resources.  
- Cross-subscription aggregation uses a linear weighting model over (healthy + unhealthy) resource counts per subscription/connector (excluding Not applicable resources) as detailed later in this article.

**Example (illustrative only, not tied to below screenshots)**  

```text
Max Score: 100
Current Score: 75
Potential Increase: +25
```

The MCSB issues recommendations based on assessment findings. Only built-in recommendations from the MCSB affect the secure score. Currently, [risk prioritization](risk-prioritization.md) doesn't affect the secure score.

> [!NOTE]
> Recommendations flagged as **preview** aren't included in secure score calculations. You should still remediate these recommendations wherever possible, so that when the preview period ends, they'll contribute toward your score. Preview recommendations are marked with an icon: :::image type="icon" source="media/secure-score-security-controls/preview-icon.png" border="false":::.
> Recommendation maturity [Preview] doesn't modify the secure score UI or weighting model; it only classifies recommendations. Aside from excluding preview recommendations, the secure score formulas and UI values remain unchanged.

### Access the Cloud secure score (Defender portal)

Secure scores now consolidate into a unified Microsoft Security experience, providing a single entry point to understand posture across identities, devices, cloud apps, data, and infrastructure. The Cloud secure score is the cloud posture component within that broader set.

:::image type="content" source="media/secure-score-defender-portal/secure-score-landing-page.png" alt-text="Screenshot of secure score landing page" lightbox="media/secure-score-defender-portal/secure-score-landing-page.png":::

**Navigation paths to the Cloud secure score (Cloud initiative)**

- **Exposure Management** > **Secure score** > View Cloud Initiative  
- **Exposure Management** > **Initiatives** > View Cloud Initiative  
- **Cloud Infrastructure** > **Overview** > top metrics card or **Security posture** widget > View cloud initiative  

### Cloud initiative page

The Cloud initiative page surfaces:

- Cloud Secure Score (current, max, potential increase) with direct linkage to calculation concepts below.
- Secure score by environment (Azure, AWS, GCP) for quick multicloud comparison.
- Secure score by workload to highlight posture differences across major workload categories.
- Most common recommendations by criticality to focus remediation where it drives the largest score and risk reduction impact.

:::image type="content" source="media/secure-score-defender-portal/cloud-initiative-homepage.png" alt-text="Screenshot of cloud initiative homepage" lightbox="media/secure-score-defender-portal/cloud-initiative-homepage.png":::

### Initiatives dashboard (broader context)

Navigate to **Exposure Management** > **Initiatives** for a consolidated cloud security posture view. This dashboard aggregates:

- Top initiatives and their relative status
- Recent security and exposure score history (14‑day trends)
- Cross-domain insights (SaaS, endpoint, cloud, identity, ransomware protection)
- Workload-specific posture data to track remediation momentum

**Open the Cloud Security Initiative**

1. Go to **Exposure Management** > **Initiatives**.
1. Select **Cloud Security**.
1. From the side panel, choose **open initiative page**.
1. Review the overview dashboard elements:
   - Cloud secure score
   - Secure score over time trend
   - Secure score by environment
   - Secure score by workload
   - Recommendations summary
   - Most common recommendations by criticality



## Secure score controls

The following table lists the security controls in Microsoft Defender for Cloud. For each control, you can see the maximum number of points that you can add to your secure score if you remediate *all* of the recommendations listed in the control, for *all* of your resources.

**Secure score** | **Security control**
--- | ---
10 | **Enable MFA**: Defender for Cloud places a high value on MFA. Use these recommendations to help secure the users of your subscriptions.<br/><br/> There are three ways to enable MFA and be compliant with the recommendations: security defaults, per-user assignment, and conditional access policy.
8 | **Secure management ports**: Brute force attacks often target management ports. Use these recommendations to reduce your exposure with tools like [just-in-time VM access](just-in-time-access-overview.md) and [network security groups](/azure/virtual-network/network-security-groups-overview).
6 | **Apply system updates**: Not applying updates leaves unpatched vulnerabilities and results in environments that are susceptible to attacks. Use these recommendations to maintain operational efficiency, reduce security vulnerabilities, and provide a more stable environment for your users. To deploy system updates, you can use the [Azure Update Manager](/azure/update-manager/overview) to manage patches and updates for your machines.
6 | **Remediate vulnerabilities**: When your vulnerability assessment tool reports vulnerabilities to Defender for Cloud, Defender for Cloud presents the findings and related information as recommendations. Use these recommendations to remediate identified vulnerabilities.
4 | **Remediate security configurations**: Misconfigured IT assets have a higher risk of being attacked. Use these recommendations to harden the identified misconfigurations across your infrastructure.
4 | **Manage access and permissions**: A core part of a security program is ensuring that your users have just the necessary access to do their jobs: the least privilege access model. Use these recommendations to manage your identity and access requirements.
4 | **Enable encryption at rest**: Use these recommendations to ensure that you mitigate misconfigurations around the protection of your stored data.
4 | **Encrypt data in transit**: Use these recommendations to help secure data that's moving between components, locations, or programs. Such data is susceptible to man-in-the-middle attacks, eavesdropping, and session hijacking.
4 | **Restrict unauthorized network access**: Azure offers a suite of tools that help you provide high security standards for access across your network.<br/><br/> Use these recommendations to manage adaptive network hardening in Defender for Cloud, ensure that you configured [Azure Private Link](/azure/private-link/private-link-overview) for all relevant platform as a service (PaaS) services, enable [Azure Firewall](/azure/firewall/overview) on virtual networks, and more.
3 | **Apply adaptive application control**: Adaptive application control is an intelligent, automated, end-to-end solution to control which applications can run on your machines. It also helps to harden your machines against malware.
2 | **Protect applications against DDoS attacks**: Advanced networking security solutions in Azure include Azure DDoS Protection, Azure Web Application Firewall, and the Azure Policy add-on for Kubernetes. Use these recommendations to help protect your applications with these tools and others.
2 | **Enable endpoint protection**: Defender for Cloud checks your organization's endpoints for active threat detection and response solutions, such as Microsoft Defender for Endpoint or any of the major solutions shown in this list.<br/><br/> If no endpoint detection and response (EDR) solution is enabled, use these recommendations to deploy Microsoft Defender for Endpoint. Defender for Endpoint is included in the [Defender for Servers plan](defender-for-servers-introduction.md).<br/><br/>Other recommendations in this control help you deploy agents and configure [file integrity monitoring](file-integrity-monitoring-overview.md).
1 | **Enable auditing and logging**: Detailed logs are a crucial part of incident investigations and many other troubleshooting operations. The recommendations in this control focus on ensuring that you enabled diagnostic logs wherever they're relevant.
0 | **Enable enhanced security features**: Use these recommendations to enable any Defender for Cloud plans.
0 | **Implement security best practices**: This collection of recommendations is important for your organizational security but doesn't affect your secure score.

## Next steps

[Track your secure score](secure-score-access-and-track.md)

::: zone-end
