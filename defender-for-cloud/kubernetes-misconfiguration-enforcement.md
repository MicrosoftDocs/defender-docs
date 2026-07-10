---
title: Kubernetes misconfiguration enforcement
description: Learn how to enable and configure Kubernetes misconfiguration enforcement in Microsoft Defender for Containers to audit or block misconfigured workloads at deployment time.
#customer intent: As a Kubernetes administrator, I want to enforce Kubernetes security best practices at deployment time so that I can prevent misconfigured workloads from running in my clusters.
author: dlanger
ms.author: dlanger
ms.date: 07/01/2026
ms.topic: how-to
ai-usage: ai-assisted
---

# Kubernetes misconfiguration enforcement

Kubernetes misconfiguration enforcement is a Microsoft Defender for Containers capability that evaluates Kubernetes resources before they're admitted into a cluster. You can use it to audit or block deployments that don't meet Microsoft security best-practice rules.

After you enable the feature, Defender for Containers creates a default security rule named **Default K8s misconfiguration rule**. The default rule is created in **Audit** mode and applies to all Kubernetes clusters in scope. You can change the rule action to **Block**, configure individual rules and parameters, or create custom policies for specific scopes.

Use Kubernetes misconfiguration enforcement to help:

- Audit or block Kubernetes workloads with unsafe security configurations.
- Enforce non-root execution and approved user or group IDs.
- Prevent automatic mounting of Kubernetes API credentials.
- Block workloads from running in the default Kubernetes namespace.
- Prevent containers from sharing sensitive host namespaces, such as PID, IPC, or network.
- Restrict container images to trusted registries or approved patterns.
- Enforce CPU and memory limits.
- Require HTTPS for Kubernetes Ingress resources.
- Block privilege escalation and fully privileged containers.
- Require containers to use a read-only root filesystem.

## Prerequisites

Before you begin, make sure that:

- [Defender for Containers is enabled on the subscription or cloud account](defender-for-containers-enable-plan.md) where the Kubernetes cluster is running.

- Your Kubernetes cluster is supported.

- The cluster uses AKS, Azure Arc-enabled Kubernetes, EKS, or GKE.

- **If you are using automatic provisioning:** The required Defender for Containers components are enabled for your environment:

  - **AKS and Azure Arc-enabled Kubernetes**: Kubernetes API access is enabled.
  - **AWS and GCP**: Agentless threat protection is enabled to collect audit logs.

  > [!NOTE]
  > Agentless threat protection is enabled by default when you enable Defender for Containers for AWS or GCP. If it was disabled, enable it before you configure Kubernetes misconfiguration enforcement.

- **If you're using Helm for manual deployment:** Make sure [`helm`](https://helm.sh/docs/intro/install/) is installed and available in your command-line environment. Then, [manually enable misconfiguration enforcement with Helm](#manually-enable-misconfiguration-enforcement-with-helm).

- Kubernetes ValidatingAdmissionPolicy is enabled on the cluster. Kubernetes 1.30 and later versions enable this capability by default.

- You have the required permissions:

  - To enable and manage deployment-time enforcement policies, you need **Subscription Owner** or **Security Admin** permissions.
  - To view policies and monitoring information, you need **Security Reader** or equivalent permissions.

## Manually enable misconfiguration enforcement with Helm

To manually enable misconfiguarion enforcement with Helm:

1. Follow the [Helm installation guide for the Defender for Containers sensor](deploy-helm.md) for your environment.

1. During Helm chart installation, use the latest supported chart tag from the following Helm repository:

   ```bash
   oci://mcr.microsoft.com/azuredefender-preview/microsoft-defender-for-containers
   ```

1. Include the following value:

   ```bash
   defender-admission-controller.enableMisconfigurationPolicies=true
   ```

After misconfiguration enforcement is enabled, the default audit rule is created automatically in the portal.

## Create a misconfiguration enforcement policy

By default, Defender for Containers creates the **Default K8s misconfiguration rule** in **Audit** mode, scoped to all resources. While in **Audit** mode, the admission controller logs violations but allows deployments to continue. You can create custom policies scoped to specific subscriptions, clusters, or namespaces.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select **Security rules**.

    :::image type="content" source="media/kubernetes-misconfiguration-enforcement/security-rules.png" alt-text="Screenshot of the Security Rules tile in Environment Settings." lightbox="media/kubernetes-misconfiguration-enforcement/security-rules.png":::

1. Select **Gated deployment** > **Misconfigurations** to view available policies.

    :::image type="content" source="media/kubernetes-misconfiguration-enforcement/misconfigurations.png" alt-text="Screenshot of the Misconfiguration tab in Security Rules showing the default policy." lightbox="media/kubernetes-misconfiguration-enforcement/misconfigurations.png":::

1. Select **Create new policy**.

1. Enter a **Policy name**.

    :::image type="content" source="media/kubernetes-misconfiguration-enforcement/create-new-policy.png" alt-text="Screenshot of the Create new policy panel showing Policy name and Action fields." lightbox="media/kubernetes-misconfiguration-enforcement/create-new-policy.png":::

1. Select an **Action**:

   - **Audit**: Logs violations without blocking deployments.
   - **Block**: Denies noncompliant deployments.

   > [!NOTE]
   > Selecting **Block** mode can introduce a short delay during deployments because of real-time policy enforcement.

1. If needed, enter a **Rule description**.

1. Enter a **Scope name**.

1. Select the **Cloud scope**.

1. Under **Resource scope**, keep the default scope or select **Add condition** to narrow the rule scope.

1. Select **Next**.

1. Select the checkbox next to each rule that you want to enable.

    :::image type="content" source="media/kubernetes-misconfiguration-enforcement/choose-policy-rules.png" alt-text="Screenshot of the Rules tab showing individual rules that can be enabled or disabled." lightbox="media/kubernetes-misconfiguration-enforcement/choose-policy-rules.png":::

1. To configure parameters for a rule, select the rule name.

   Some rules include configurable parameters. If parameters are available, update them as needed, and then select **Save**.

    :::image type="content" source="media/kubernetes-misconfiguration-enforcement/configure-rule.png" alt-text="Screenshot of the rule configuration panel showing customizable parameters and their default values." lightbox="media/kubernetes-misconfiguration-enforcement/configure-rule.png":::

1. Select **Next**.

1. Review the policy configuration.

1. Select **Add policy**.

## Edit a misconfiguration enforcement policy

You can edit an existing misconfiguration enforcement policy to update its action, enabled rules, and configurable rule parameters.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select **Security rules**.

1. Select **Gated deployment** > **Misconfigurations**.

1. Select the checkbox next to the policy that you want to edit.

1. Select **Edit**.

1. Update the policy settings as needed.

1. Select **Save policy**.

### Default policy limitations

The built-in **Default K8s misconfiguration rule** has the following limitations:

- You can change the **Action** between **Audit** and **Block**.
- You can enable or disable individual rules.
- You can configure parameters for rules that support customization.
- You can't edit the policy name, description, or scope.

Custom policies you create don't have these restrictions.

## Built-in misconfiguration rules

Kubernetes misconfiguration enforcement includes built-in rules based on Microsoft security best practices.

Built-in rules help enforce controls for:

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

- [Enable Defender for Containers in Microsoft Defender for Cloud](defender-for-containers-enable-plan.md)

- [Install Defender for Containers sensor using Helm](deploy-helm.md)

- [Defender for Containers support matrix](support-matrix-defender-for-containers.md)

- [Gated deployment for Kubernetes container images](runtime-gated-overview.md)