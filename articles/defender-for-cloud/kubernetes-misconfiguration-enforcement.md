---
title: Kubernetes Misconfiguration Enforcement (preview)
description: Learn how to configure Kubernetes Misconfiguration Enforcement in Microsoft Defender for Containers to block or audit misconfigured workloads at deployment time.
#customer intent: As a Kubernetes administrator, I want to enforce Kubernetes security best practices at deployment time so that I can prevent misconfigured workloads from running in my clusters.
author: Elazark
ms.author: elkrieger
ms.date: 06/03/2026
ms.topic: how-to
ai-usage: ai-assisted
---

# Kubernetes Misconfiguration Enforcement (preview)

> [!IMPORTANT]
> Kubernetes Misconfiguration Enforcement is currently in public preview. This feature is available only in commercial clouds. It isn't available in national or sovereign clouds, including US Government, China Government, and other sovereign regions.

Kubernetes Misconfiguration Enforcement extends Kubernetes security in Microsoft Defender for Containers by evaluating resource configurations at admission time and enforcing Microsoft Defender security best practice rules. It complements existing post-deployment monitoring with proactive enforcement at the point of deployment, letting you audit or block misconfigured workloads before they reach production.

After you enable the feature, a default security rule is automatically created in Audit mode. You can configure rules to use Block mode to actively prevent non-compliant deployments.

## Use cases

Kubernetes Misconfiguration Enforcement helps you:

- Enforce workload standards by blocking containers with unsafe or non-compliant configurations.
- Stop unauthorized image sources by preventing containers from running unless they meet approved patterns.
- Prevent containers from accessing host resources such as the host network, PID namespace, or IPC namespace.
- Protect data in transit by enforcing HTTPS for Kubernetes Ingress resources.
- Stop high-impact security incidents by blocking containers from sharing namespaces such as IPC, PID, or network with the host.
- Prevent denial of service and noisy neighbor issues by enforcing CPU and memory limits on all containers.
- Stop runtime tampering by requiring containers to use read-only root filesystems.

## Prerequisites

| **Requirement** | **Details** |
|-----------------|-------------|
| Defender plan | Enable Defender for Containers. |
| Kubernetes cluster | Cluster must be running in a commercial cloud (AKS, EKS, or GKE). |
| AKS policies | Kubernetes cluster must have AKS policies enabled. They're enabled by default. |
| Permissions | Create or change rules with Subscription Owner or Security Admin role. View rules with Security Reader or higher. |

## Configure misconfiguration enforcement rules

1. Go to **Microsoft Defender for Cloud** > **Environment Settings**.
1. Select the relevant subscription, AWS account, or GCP project.
1. Select the **Security Rules** tile.

    :::image type="content" source="media/kubernetes-misconfiguration-enforcement/security-rules.png" alt-text="Screenshot of the Security Rules tile in Environment Settings." lightbox="media/kubernetes-misconfiguration-enforcement/security-rules.png":::

1. Select the **Misconfiguration** tab to view available policies.

    :::image type="content" source="media/kubernetes-misconfiguration-enforcement/misconfigurations.png" alt-text="Screenshot of the Misconfiguration tab in Security Rules." lightbox="media/kubernetes-misconfiguration-enforcement/misconfigurations.png":::

1. To create a new policy, select **Create new policy**.

    :::image type="content" source="media/kubernetes-misconfiguration-enforcement/create-new-policy.png" alt-text="Screenshot of the Create new policy panel showing Policy name and Action fields." lightbox="media/kubernetes-misconfiguration-enforcement/create-new-policy.png":::

1. Configure the policy:
    - **Policy name**: Enter a unique name.
    - **Action**: Choose **Audit** to monitor violations, or **Block** to deny non-compliant deployments.
1. Under the rules list, enable or disable individual rules and configure parameters for rules that support customization.

    :::image type="content" source="media/kubernetes-misconfiguration-enforcement/choose-policy-rules.png" alt-text="Screenshot of the rules list showing individual rules that can be enabled or disabled." lightbox="media/kubernetes-misconfiguration-enforcement/choose-policy-rules.png":::

1. To configure parameters for a specific rule, select the rule.

    :::image type="content" source="media/kubernetes-misconfiguration-enforcement/configure-rule.png" alt-text="Screenshot of the rule configuration panel showing customizable parameters." lightbox="media/kubernetes-misconfiguration-enforcement/configure-rule.png":::

1. Select **Save** to activate the policy.

> [!NOTE]
> Selecting **Block** mode can introduce a short delay during deployments because of real-time policy enforcement.

### Default policy specific limitations

When editing an existing policy, the following constraints apply:

- You can enable or disable individual rules within the policy.
- You can configure parameters for rules that support customization.
- You can't change the policy scope after creation.

## Built-in misconfiguration rules

Misconfiguration Enforcement includes built-in rules based on Microsoft Defender security best practices. These rules cover areas such as:

- **Container resource limits (CPU and memory)**: Ensures containers don't exceed specified limits.
- **Privilege and capability management**: Prevents containers from running with elevated privileges or unnecessary Linux capabilities.
- **Host namespace isolation**: Blocks containers from sharing the host network, PID, or IPC namespace.
- **Network security**: Enforces HTTPS for Kubernetes Ingress resources.
- **Runtime security**: Requires containers to use a read-only root filesystem.

You can enable or disable individual rules within a policy and configure parameters for rules that support customization.

### Example: Kubernetes cluster containers CPU and memory resource limits

| **Property** | **Value** |
|---|---|
| **Description** | Enforces CPU and memory resource limits on containers to prevent resource exhaustion attacks in a Kubernetes cluster. |
| **Remediation** | Configure resource limits on all containers in the pod spec. |

## Related content

- [Enable gated deployment in Defender for Containers](enablement-guide-runtime-gated.md)
  Configuration steps for gated deployment, which enforces container image vulnerability policies at deployment time.

- [Overview: Gated Deployment of Container Images to a Kubernetes Cluster](runtime-gated-overview.md)
  Introduction to gated deployment, its benefits, key capabilities, and how it works.

- [FAQ: Gated Deployment in Defender for Containers](faq-runtime-gated.md)
  Answers to common questions about gated deployment behavior and configuration.

- [Troubleshooting Guide: Gated Deployment and Developer Experience](troubleshooting-runtime-gated.md)
  Help resolving onboarding issues, deployment failures, and interpreting developer-facing messages.
