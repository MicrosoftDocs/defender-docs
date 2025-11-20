---
title: Enable Gated Deployment for Kubernetes Clusters
description: Learn how to configure Gated Deployment in Microsoft Defender for Containers to enforce container image security policies for Kubernetes clusters.
#customer intent: As a Kubernetes administrator, I want to configure Gated Deployment in Defender for Containers so that I can enforce container image security policies during deployments.
author: dcurwin
ms.author: dacurwin
ms.reviewer: dacurwin
ms.date: 10/29/2025
ms.topic: concept-article
---

# Enable gated deployment in Defender for Containers

This article shows how to enable and configure gated deployment for Kubernetes clusters with Microsoft Defender for Containers.

Gated deployment enforces container image security policies during deployment by using vulnerability scan results from supported registries - Azure Container Registry (ACR), Amazon Elastic Container Registry (ECR), and Google Artifact Registry. It works with the Kubernetes admission controller to evaluate images before the cluster admits them.

## Prerequisites

| **Requirement** | **Details** |
|-----------------|-------------|
| Defender plan | Enable Defender for Containers on both the container registry and Kubernetes cluster subscriptions/accounts.<br/>**Important**: If your container registry and Kubernetes cluster reside in different Azure subscriptions (or AWS accounts/GCP projects), you must enable the Defender for Containers plan and relevant extensions on both cloud accounts. |
| Plan extensions | Defender Sensor, Security Gating, Security Findings, and Registry Access.<br/>Turn these plan extensions on or off in the Defender for Containers plan setting. They're enabled by default in new Defender for Containers environments. |
| Kubernetes cluster support | AKS, EKS, GKE - version 1.31 or later. |
| Registry support | Use Azure Container Registry (ACR), Amazon Elastic Container Registry (ECR), or Google Artifact Registry. |
| Permissions | Create or change gated deployment policies with Security Admin or higher tenant permission. View them with Security Reader or higher tenant permission. |

## Enable gated deployment and create a security rule

### Step 1: Enable required plan extensions

1.  Go to **Microsoft Defender for Cloud** > **Environment Settings**.
1.  Select the relevant subscription, AWS account, or GCP project.
1.  Under **Settings & Monitoring**, turn on these toggles:

    - **Defender Sensor**
        - Security Gating
    - **Registry Access**
        - Security Findings

:::image type="content" source="media/enablement-guide-runtime-gating/media/enablement-guide-runtime-gating/environment-settings-enabled-toggles.png" alt-text="Screenshot of Environment Settings showing enabled toggles in Microsoft Defender for Cloud." lightbox="media/enablement-guide-runtime-gating/environment-settings-enabled-toggles.png":::

### Step 2: Access security rules

1.  In Environment Settings, go to the **Security Rules** tile.

    :::image type="content" source="media/enablement-guide-runtime-gating/security-rules.png" alt-text="Screenshot of Security Rules pane with Vulnerability Assessment tab in Microsoft Defender for Cloud." lightbox="media/enablement-guide-runtime-gating/security-rules.png":::

1.  Select the **Vulnerability Assessment** tab.

    :::image type="content" source="media/enablement-guide-runtime-gating/vulnerability-assessment.png" alt-text="Screenshot of Security Rules Vulnerability Assessment." lightbox="media/enablement-guide-runtime-gating/vulnerability-assessment.png":::

### Step 3: Create a new rule

> [!NOTE]
> By default, after you enable the Defender plans and required extensions, the portal creates an audit rule that flags images with high or critical vulnerabilities.

1.  Select **Add Rule**.
1.  Fill in the following fields:

| **Field** | **Description** |
|----|----|
| Rule Name | A unique name for the rule |
| Action | Choose Audit or Deny |
| Scope Name | A label for the scope |
| Cloud Scope | Select Azure Subscription, AWS Account, or GCP Project |
| Resource Scope | Choose from Cluster, Namespace, Pod, Deployment, Image, Label Selector |
| Matching Criteria | Select from Equals, Starts With, Ends With, Contains, Not Equals |

:::image type="content" source="media/enablement-guide-runtime-gating/rule-creation-wizard.png" alt-text="Screenshot of Rule creation wizard – basic configuration." lightbox="media/enablement-guide-runtime-gating/rule-creation-wizard.png":::

### Step 4: Define conditions

Under **Scan Configurations**, specify:

- **Trigger Rule Conditions**: Choose vulnerability severity levels or specific CVE IDs

:::image type="content" source="media/enablement-guide-runtime-gating/edit-vulnerability-assessment-rule.png" alt-text="Screenshot of Rule configuration panel with condition types and exemptions." lightbox="media/enablement-guide-runtime-gating/edit-vulnerability-assessment-rule.png":::

### Step 5: Define exemptions

Exemptions let trusted resources bypass gating rules.

**Supported exemption types**

| **Type**   | **Description**           |
|------------|---------------------------|
| CVE        | Specific vulnerability ID |
| Deployment | Targeted deployment       |
| Image      | Specific image digest     |
| Namespace  | Kubernetes namespace      |
| Pod        | Specific pod              |
| Registry   | Container registry        |
| Repository | Image repository          |

**Matching criteria**

- Equals
- Starts With
- Ends With
- Contains

**Time-bound configuration**

| **State** | **Behavior** |
|----|----|
| Default | Exclusion is indefinite |
| Time-Bound Enabled | A date picker appears. The exclusion expires at the end of the selected day |

Configure exemptions during rule creation. They apply to audit and deny rules.

:::image type="content" source="media/enablement-guide-runtime-gating/exemption-configuration-panel.png" alt-text="Screenshot of exemption configuration panel with time-bound toggle." lightbox="media/enablement-guide-runtime-gating/exemption-configuration-panel.png":::

### Step 6: Finalize and save

1.  Review the rule configuration.
1.  To save and activate the rule, select **Add Rule**.

## Deny mode configuration

Deny mode can introduce a one- or two-second delay during deployments because of real-time policy enforcement. When you select **Deny** as the action, a notification appears.

**\[Insert screenshot: Tooltip shown when Deny mode is selected\]**

## Admission monitoring

Gated Deployment events appear in the **Admission Monitoring** view in Defender for Cloud.  
This view provides visibility into rule evaluations, triggered actions, and affected resources.  
Use this view to track Audit and Deny decisions across your Kubernetes clusters.

:::image type="content" source="media/enablement-guide-runtime-gating/admission-monitoring.png" alt-text="Screenshot of Admission Monitoring view showing rule evaluations and actions." lightbox="media/enablement-guide-runtime-gating/admission-monitoring.png":::

## Best practices for rule design

- Start with Audit mode to monitor impact before enforcing Deny mode.
- Scope rules narrowly (for example, by namespace or deployment) to reduce false positives.
- Use time-bound exemptions to unblock critical workflows while maintaining oversight.
- Regularly review rule activity in the Admission Monitoring view to refine enforcement strategy.

## Disable or delete a Gated Deployment security rule

1.  **Disable a Gated Deployment security rule**

    - Select **Security Rules** in the **Microsoft Defender for Cloud Environment Settings** pane.
    - Select **Vulnerability Assessment** to view a list of defined Gated Deployment security rules.
    - Select a security rule and then select **Disable**.

1.  **Delete a Gated Deployment security rule**

    - Select **Security Rules** in the **Microsoft Defender for Cloud Environment Settings** pane.
    - Select **Vulnerability Assessment** to view a list of defined security rules.
    - Select a security rule and then select **Delete**.

## Related content

For more detailed guidance and support, see the following documentation:

- [Overview: Gated Deployment of Container Images to a Kubernetes Cluster](runtime-gated-overview.md)  
  Introduction to the feature, its benefits, key capabilities, and how it works

- [FAQ: Gated Deployment in Defender for Containers](faq-runtime-gated.md)  
  Answers to common customer questions about gated deployment behavior and configuration

- [Troubleshooting Guide: Gated Deployment and Developer Experience](troubleshooting-runtime-gated.md)  
  Help resolving onboarding issues, deployment failures, and interpreting developer-facing messages
