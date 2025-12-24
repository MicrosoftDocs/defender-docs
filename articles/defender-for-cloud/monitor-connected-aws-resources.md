---
title: Monitor connected AWS resources in Microsoft Defender for Cloud
description: Learn how to monitor recommendations, coverage, and alerts for your AWS resources after connecting them to Microsoft Defender for Cloud.
author: ElazarK
ms.author: elkrieger
ms.topic: how-to
ms.date: 11/15/2025
---

# Monitor AWS resources connected to Microsoft Defender for Cloud

After you [connect your AWS account to Microsoft Defender for Cloud](quickstart-onboard-aws.md), the service continuously assesses your resources for security posture, configuration drift, and threat signals. This article describes where to monitor results, validate connector health, and view coverage.

## Validate connector health

To confirm that your AWS connector is operating correctly:

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Defender for Cloud** > **Environment settings**.

1. Locate the AWS account and review the **Connectivity status** column to see whether the connection is healthy or has issues.

1. Select the value shown in the **Connectivity status** column to view more details.

The Environment details page lists any detected configuration or permission issues affecting the connection to the AWS account.

:::image type="content" source="media/monitor-connected-aws-resources/environment-details-connector-health.png" alt-text="Environment details page in Microsoft Defender for Cloud showing the connectivity status for a connected Amazon Web Services account." lightbox="media/monitor-connected-aws-resources/environment-details-connector-health.png":::

If an issue is present, you can select it to view a description of the problem and the recommended remediation steps. In some cases, a remediation script is provided to help resolve the issue.

Learn more about [troubleshooting multicloud connectors](troubleshoot-connectors.md).

## View AWS recommendations

Open the **Recommendations** page in Defender for Cloud to review findings generated for your AWS resources. Use the **Environment** filter to scope results to AWS.

:::image type="content" source="media/monitor-connected-aws-resources/view-recommendations.png" alt-text="Recommendations page in Microsoft Defender for Cloud showing the environment type filter set to Amazon Web Services accounts and a list of security recommendations." lightbox="media/monitor-connected-aws-resources/view-recommendations.png":::

Recommendations improve security posture by identifying misconfigurations, missing controls, or policy violations. You can investigate:

- Affected AWS resources
- Severity and remediation steps
- Relevant security standards

Learn more about [working with recommendations](recommendations-reference.md).

## View AWS resources in asset inventory

To view AWS resources by type, open the **Asset inventory** page in Defender for Cloud and filter on **Resource type**.

:::image type="content" source="media/monitor-connected-aws-resources/aws-resource-types-in-inventory.png" alt-text="Screenshot showing AWS resource types filtered in the asset inventory page in Defender for Cloud." lightbox="media/monitor-connected-aws-resources/aws-resource-types-in-inventory.png":::

You can group resources by environment, subscription, region, or recommendation state.

Learn more about [working with asset inventory](asset-inventory.md).

## Review coverage with workbooks

Microsoft Defender for Cloud provides coverage workbooks that summarize:
- Enabled plans
- Resource types in scope
- Feature availability by environment

Coverage reports help you ensure that workloads receive the expected protections.

Learn more about [Coverage workbooks](custom-dashboards-azure-workbooks.md#coverage-workbook).

## View alerts in Microsoft Defender XDR

When you enable Defender for Cloud, alerts generated for AWS resources automatically appear in the Microsoft Defender portal. This lets SOC analysts correlate attacks across cloud, endpoint, and identity signals.

You can:
- Investigate alerts
- Pivot across correlated assets
- Assign incidents to analysts
- Trigger automated response workflows

Learn more about [alerts in Microsoft Defender XDR](concept-integration-365.md).

## View CloudTrail insights (Preview)

If you have enabled AWS CloudTrail management event ingestion, Microsoft Defender for Cloud analyzes and links CloudTrail log activity with your configuration and identity context to provide advanced security insights.

CloudTrail telemetry enhances security assessments by identifying unused permissions, misconfigured roles, dormant identities, and privilege escalation paths.

You can view CloudTrail-driven insights in the following areas:

- **Recommendations:** Review CIEM and identity-related findings.
- **Attack Path Analysis:** Identify potential lateral movement paths that involve AWS identities.
- **Alerts:** View configuration changes and identity-based anomaly indicators.

Learn more about [integrating AWS CloudTrail logs with Microsoft Defender for Cloud (Preview)](integrate-cloud-trail.md).

## Next steps

- [Review recommendations](recommendations-reference.md)
- [Investigate security alerts in Microsoft Defender XDR](concept-integration-365.md)
- [Troubleshoot multicloud connectors](troubleshoot-connectors.md)
- [Enable additional Defender plans](enable-all-plans.md)
