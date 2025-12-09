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

## View AWS recommendations

Open the **Recommendations** page in Defender for Cloud to review findings generated for your AWS resources. Use the **Environment** filter to scope results to AWS.

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

## Validate connector health

To confirm that your AWS connector is operating correctly:

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Defender for Cloud** > **Environment settings**.

1. Choose the AWS connector resource.

Connector health reports:
- Role assumption validation
- API call success
- Region scoping
- Plan enablement state

If the connector encounters permission or configuration issues, Defender for Cloud generates recommendations.

Learn more about [troubleshooting multicloud connectors](troubleshoot-connectors.md).

## Review coverage with workbooks

Microsoft Defender for Cloud provides **coverage workbooks** that summarize:
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

## View plan-specific insights

After you enable specific Defender plans, their findings and data are integrated into Defender for Cloud. The insights and data available depend on which Defender plans are enabled for your AWS environment.

### Agentless scanning (CSPM and Servers)
Agentless scanning results for vulnerabilities and data exposure can take up to 24 hours to initially populate. Findings appear in the **Recommendations** and **Asset inventory** pages. 

Learn more about [agentless data collection and scanning cadence](concept-agentless-data-collection.md).

### Server resources (Defender for Servers)
Arc-enabled EC2 instances appear in the **Asset inventory** as Azure Arc resources. Learn more about [how Arc-enabled servers are managed](/azure/azure-arc/servers/overview).

### Kubernetes signals (Defender for Containers)
Alerts, recommendations, and inventory data for your EKS clusters are surfaced in the **Alerts** page, **Recommendations** page, and **Asset inventory**. Learn more about [protecting Amazon Elastic Kubernetes Service clusters](defender-for-containers-enable.md).

## Monitor CloudTrail ingestion and insights (Preview)

Microsoft Defender for Cloud can ingest AWS CloudTrail management events (Preview) to increase visibility into identity operations, configuration changes, and other control-plane activity across your AWS environments. CloudTrail log collection enhances entitlement and configuration assessments by providing insight into unused or excessive permissions, privilege escalation paths, and activity associated with security incidents.

CloudTrail ingestion supports both single-account deployments and multi-account AWS Organizations using a central logging account. After you enable the feature, Defender for Cloud retrieves CloudTrail log events and correlates this data with configuration and identity context to generate recommendations, attack path insights, and identity-based risk indicators.

If you've enabled this feature, you will see CloudTrail-driven insights reflected in:

- CIEM recommendations
- Attack path analysis
- Configuration change alerts
- Identity-based anomaly indicators

Learn more about [integrating AWS CloudTrail logs with Microsoft Defender for Cloud (Preview)](integrate-cloudtrail-defender-for-cloud.md).

## Next steps

- [Review recommendations](recommendations-reference.md)
- [Investigate security alerts in Microsoft Defender XDR](concept-integration-365.md)
- [Troubleshoot multicloud connectors](troubleshoot-connectors.md)
- [Enable additional Defender plans](enable-all-plans.md)
