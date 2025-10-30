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

# Enablement Guide: Configure Gated Deployment in Defender for Containers

This guide shows how to enable and configure Gated Deployment for Kubernetes clusters by using Microsoft Defender for Containers.

Gated Deployment enforces container image security policies at deployment time, based on vulnerability scan results from supported container registries, including Azure Container Registry (ACR), Amazon Elastic Container Registry (ECR), and Google’s Artifact Registry. It integrates with the Kubernetes admission controller to evaluate container images before they are admitted into the cluster.

Supported Kubernetes platforms include:

- Azure Kubernetes Service (AKS)

- Amazon Elastic Kubernetes Service (EKS)

- Google Kubernetes Engine (GKE)

## Prerequisites

| **Requirement** | **Details** |
|-----------------|-------------|
| Defender Plan | Defender for Containers must be enabled |
| Plan Extensions | Defender Sensor, Security Findings, and Registry Access<br/>!Note: You can configure these three Defender for Containers plan extensions (enable or disable) through the Defender for Containers plan setting. New Defender for Containers enabled environments have these extensions enabled by default upon plan enablement. |
| Kubernetes Version | AKS must be version 1.31 or higher |
| Registry Support | Azure Container Registry (ACR), Amazon Elastic Container Registry (ECR), and Google Artifact Registry are supported |
| Permissions | To create and modify Gated Deployment policies, you need Security Admin or higher permissions on the tenant. To view Gated Deployment policies, you need Security Reader or higher permissions on the tenant. |

## Step-by-Step: Enable Gated Deployment and Create a Security Rule

### Step 1: Enable required plan extensions

1.  Go to **Microsoft Defender for Cloud** > **Environment Settings**.
1.  Select the relevant subscription, AWS account, or GCP projects.
1.  Under **Settings & Monitoring**, ensure the following toggles are enabled:

    - Defender Sensor

    - Registry Access

    - Security Findings

**\[Insert screenshot: Environment Settings showing enabled toggles\]**

:::image type="content" source="media/enablement-guide-runtime-gating/image1.png" alt-text="Screenshot of Environment Settings showing enabled toggles in Microsoft Defender for Cloud.":::

### Step 2: Access security rules

1.  In the Environment Settings view, go to **Security Rules** tile.
1.  Select the **Vulnerability Assessment** tab.

**\[Insert screenshot: Security Rules pane with Vulnerability Assessment tab\]**

:::image type="content" source="media/enablement-guide-runtime-gating/image2.png" alt-text="Screenshot of Security Rules pane with Vulnerability Assessment tab in Microsoft Defender for Cloud.":::

:::image type="content" source="media/enablement-guide-runtime-gating/image3.png" alt-text="Screenshot of a computer":::

### Step 3: Create a new rule


> [!NOTE]
> By default, if you meet all prerequisites (for example, enabling Defender plans and required extensions), the portal automatically creates a default Audit rule to flag images with High or Critical vulnerabilities.

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

**\[Insert screenshot: Rule creation wizard – basic configuration\]**

### Step 4: Define conditions

1.  Under **Scan Configurations**, specify:

    - **Trigger Rule Conditions**: Choose vulnerability severity levels or specific CVE IDs

**\[Insert screenshot: Rule configuration panel with condition types and exemptions\]**

### Step 5: Define exclusions

Exclusions allow trusted resources to bypass gating rules.

**Supported exclusion types**

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

You configure exemptions during rule creation. They apply to both Audit and Deny mode rules.

**\[Insert screenshot: Exemption configuration panel with time-bound toggle\]**

### Step 6: Finalize and save

1.  Review the rule configuration.
1.  Select **Add Rule** to save and activate the rule.

**\[Insert screenshot: Confirmation screen after rule creation\]**

## Deny mode configuration

Deny mode can introduce a one- or two-second delay during deployments because of real-time policy enforcement. When you select **Deny** as the action, a proper note appears.

**\[Insert screenshot: Tooltip shown when Deny mode is selected\]**

## Admission monitoring

Gated Deployment events appear in the **Admission Monitoring** view in Defender for Cloud.  
This view provides visibility into rule evaluations, triggered actions, and affected resources.  
Use this view to track Audit and Deny decisions across your Kubernetes clusters.

**\[Insert screenshot: Admission Monitoring view showing rule evaluations and actions\]**

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

## Additional resources

For more detailed guidance and support, see the following documentation:

- **Overview: Gated Deployment of Container Images to a Kubernetes Cluster**  
  Introduction to the feature, its benefits, key capabilities, and how it works

- **FAQ: Gated Deployment in Defender for Containers**  
  Answers to common customer questions about gated deployment behavior and configuration

- **Troubleshooting Guide: Gated Deployment and Developer Experience**  
  Help resolving onboarding issues, deployment failures, and interpreting developer-facing messages
