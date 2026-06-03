---
title: Kubernetes Misconfiguration Enforcement (preview)
description: Learn how to enable and configure Kubernetes Misconfiguration Enforcement in Microsoft Defender for Containers to audit or block misconfigured workloads at deployment time.
#customer intent: As a Kubernetes administrator, I want to enforce Kubernetes security best practices at deployment time so that I can prevent misconfigured workloads from running in my clusters.
author: dlanger
ms.author: dlanger
ms.date: 06/03/2026
ms.topic: how-to
ai-usage: ai-assisted
---

# Kubernetes Misconfiguration Enforcement (preview)

> [!IMPORTANT]
> Kubernetes Misconfiguration Enforcement is currently in public preview. This feature is available only in commercial clouds. It isn't available in national or sovereign clouds, including US Government, China Government, and other sovereign regions.

Microsoft Defender for Cloud extends Kubernetes security from detection to prevention with Kubernetes Misconfiguration Enforcement. This capability lets organizations audit or block insecure Kubernetes configurations at deployment time, helping teams stop misconfigurations before they become incidents. Misconfiguration Enforcement evaluates Kubernetes resources during deployment and enforces Microsoft security best-practice rules consistently across clusters without relying on post-deployment scans or fragmented policy tools.

After you enable the feature, a default security rule named **Default K8s misconfiguration rule** is automatically created in Audit mode and applied globally to all your Kubernetes clusters. You can modify it to Block mode or create additional scoped policies to actively prevent non-compliant deployments.

## Scope

- Applies to Kubernetes resource evaluation at deployment time.
- Supports Audit and Block (enforcement) modes.
- Enforces Microsoft security best-practice rules across clusters.

## Use cases

Kubernetes Misconfiguration Enforcement helps you:

- Stop risky Kubernetes workloads before deployment by blocking containers with unsafe or non-compliant configurations.
- Enforce non-root execution and approved user/group IDs so containers can't run with excessive OS privileges.
- Prevent containers from automatically mounting Kubernetes API credentials to reduce blast radius if a pod is compromised.
- Block use of the default Kubernetes namespace to reduce accidental exposure and privilege leakage.
- Protect the host by preventing containers from sharing sensitive host namespaces such as PID, IPC, or network.
- Reduce supply-chain risk by allowing only container images from trusted registries or approved patterns.
- Prevent denial-of-service and noisy-neighbor scenarios by enforcing CPU and memory limits on all containers.
- Protect data in transit by requiring HTTPS for Kubernetes Ingress resources.
- Enforce least privilege at runtime by blocking containers that allow privilege escalation to root.
- Prevent high-impact security incidents by blocking fully privileged containers entirely.
- Stop runtime tampering and persistence by requiring containers to run with a read-only root filesystem.

## Prerequisites

**Environmental requirements**

| **Requirement** | **Details** |
|-----------------|-------------|
| Defender plan | Enable Defender for Containers on the subscription or cloud account where the Kubernetes cluster is running. |
| Defender sensor (Azure) | Defender sensor must be enabled in the plan, or Kubernetes API Access must be enabled. |
| Agentless Threat Protection (AWS/GCP) | Agentless Threat Protection should also be enabled in the plan for AWS and GCP scenarios. |
| Kubernetes cluster | Supported cluster running in a commercial cloud environment: AKS, EKS, or GKE. |
| VAP policies | The Kubernetes cluster must have VAP policies enabled. These are enabled by default from Kubernetes 1.30 and later. |

**Required roles and permissions**

| **Role** | **Access** |
|----------|------------|
| Subscription Owner or Security Admin | Required to enable and manage deployment-time enforcement policies. |
| Security Reader or equivalent | Required for visibility and monitoring only. |

**Supported cloud environments**

- Available in commercial clouds: Azure, AWS, and GCP.
- Not available in national or sovereign clouds, including US Government, China Government, and other sovereign regions.

## Enable the feature

Kubernetes Misconfiguration Enforcement requires the Defender for Containers sensor (version 0.11) to be deployed to your cluster with misconfiguration policies enabled.

1. Follow the [Helm installation guide for the Defender for Containers sensor](defender-for-containers-deploy-azure-cli.md) for your environment. Use the latest `0.11.*` tag from the following Helm repository:

    ```
    oci://mcr.microsoft.com/azuredefender-preview/microsoft-defender-for-containers
    ```

1. When installing the chart, include the following value in addition to those specified in the general guide:

    ```
    defender-admission-controller.enableMisconfigurationPolicies=true
    ```

After the sensor is deployed with this value, the feature is active and the default audit rule is created automatically in the portal.

## Configure misconfiguration enforcement rules

By default, the **Default K8s misconfiguration rule** is created in Audit mode, scoped to all resources. While in Audit mode, the admission controller logs violations but still allows deployments to proceed. You can modify the default rule's action or create additional rules scoped to specific subscriptions, clusters, or namespaces.

1. Go to **Microsoft Defender for Cloud** > **Environment Settings**.
1. Select the relevant subscription, AWS account, or GCP project.
1. Select the **Security Rules** tile.

    :::image type="content" source="media/kubernetes-misconfiguration-enforcement/security-rules.png" alt-text="Screenshot of the Security Rules tile in Environment Settings." lightbox="media/kubernetes-misconfiguration-enforcement/security-rules.png":::

1. Select the **Misconfiguration** tab to view available policies.

    :::image type="content" source="media/kubernetes-misconfiguration-enforcement/misconfigurations.png" alt-text="Screenshot of the Misconfiguration tab in Security Rules showing the default policy." lightbox="media/kubernetes-misconfiguration-enforcement/misconfigurations.png":::

1. Open an existing policy to edit it, or select **Create new policy** to create a scoped policy.

    :::image type="content" source="media/kubernetes-misconfiguration-enforcement/create-new-policy.png" alt-text="Screenshot of the Create new policy panel showing Policy name and Action fields." lightbox="media/kubernetes-misconfiguration-enforcement/create-new-policy.png":::

1. Configure the policy:
    - **Policy name**: Enter a unique name.
    - **Action**: Choose **Audit** to log violations without blocking, or **Block** to deny non-compliant deployments.
    - **Scope**: Select the cloud scope (Azure subscription, AWS account, or GCP project) and Kubernetes scope (cluster, namespace) to target.
1. Select the **Rules** tab. Enable or disable individual rules and configure parameters for rules that support customization.

    :::image type="content" source="media/kubernetes-misconfiguration-enforcement/choose-policy-rules.png" alt-text="Screenshot of the Rules tab showing individual rules that can be enabled or disabled." lightbox="media/kubernetes-misconfiguration-enforcement/choose-policy-rules.png":::

1. To configure parameters for a specific rule, select the rule name.

    :::image type="content" source="media/kubernetes-misconfiguration-enforcement/configure-rule.png" alt-text="Screenshot of the rule configuration panel showing customizable parameters and their default values." lightbox="media/kubernetes-misconfiguration-enforcement/configure-rule.png":::

1. Select **Save** to activate the policy. The updated parameters appear in the **Rules** table.

> [!NOTE]
> Selecting **Block** mode can introduce a short delay during deployments because of real-time policy enforcement.

### Default policy limitations

The built-in **Default K8s misconfiguration rule** has the following constraints:

- You can change the **Action** between Audit and Block.
- You can enable or disable individual rules and configure their parameters.
- You can't edit the policy name, description, or scope.

Custom policies you create don't have these restrictions.

## Built-in misconfiguration rules

Misconfiguration Enforcement includes built-in rules based on Microsoft Defender security best practices. These rules cover:

- **Container resource limits (CPU and memory)**: Ensures containers don't exceed specified limits to prevent resource exhaustion.
- **Privilege and capability management**: Prevents containers from running with elevated privileges, unnecessary Linux capabilities, or privilege escalation paths.
- **Non-root execution**: Enforces non-root user and group IDs so containers can't run with excessive OS privileges.
- **API credential mounting**: Prevents containers from automatically mounting Kubernetes API credentials.
- **Default namespace**: Blocks workloads from running in the default Kubernetes namespace.
- **Host namespace isolation**: Blocks containers from sharing the host PID, IPC, or network namespace.
- **Trusted image sources**: Restricts container images to trusted registries or approved patterns.
- **Network security**: Enforces HTTPS for Kubernetes Ingress resources.
- **Runtime security**: Requires containers to use a read-only root filesystem and blocks fully privileged containers.

You can enable or disable individual rules within a policy and configure parameters for rules that support customization.

## Related content

- [Enable gated deployment in Defender for Containers](enablement-guide-runtime-gated.md)
  Configuration steps for gated deployment, which enforces container image vulnerability policies at deployment time.

- [Overview: Gated Deployment of Container Images to a Kubernetes Cluster](runtime-gated-overview.md)
  Introduction to gated deployment, its benefits, key capabilities, and how it works.

- [FAQ: Gated Deployment in Defender for Containers](faq-runtime-gated.md)
  Answers to common questions about gated deployment behavior and configuration.

- [Troubleshooting Guide: Gated Deployment and Developer Experience](troubleshooting-runtime-gated.md)
  Help resolving onboarding issues, deployment failures, and interpreting developer-facing messages.

