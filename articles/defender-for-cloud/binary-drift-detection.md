---
title: Binary drift detection and blocking
description: Learn how binary drift detecting and blocking can help you detect unauthorized external processes within containers.
ms.topic: how-to
author: Elazark
ms.author: elkrieger
ms.date: 02/22/2026
#customer intent: As a user, I want to understand how binary drift detection and blocking can help me detect unauthorized external processes within containers.
---

# Binary drift detection and blocking

Binary drift happens when a container runs an executable that didn't come from the original image. This drift can be intentional and legitimate, or it can indicate an attack. Since container images should be immutable, you should evaluate any processes that start from binaries not included in the original image as suspicious activity and block them to prevent potential security threats.

The binary drift detection feature alerts you when there's a difference between the workload that comes from the image and the workload running in the container. It alerts you about potential security threats by detecting unauthorized external processes within containers. You can define drift policies to specify conditions under which alerts should be generated, helping you distinguish between legitimate activities and potential threats.

Binary drift blocking blocks the execution of unauthorized external processes within containers. When enabled, this feature enforces the policies you define, ensuring that only approved processes can run. This proactive approach helps maintain the integrity of your containerized applications and reduces the risk of security breaches.

Check out the availability of [binary drift and blocking](support-matrix-defender-for-containers.md#runtime-protection-features).

> [!NOTE]
> Binary drift blocking is currently in preview

## Prerequisites

- Run the Defender for Container sensor.
- **Binary drift blocking (Preview) only**:
    - AKS: Helm provisioning with sensor version **0.10.1**.
    - Multicloud: Helm provisioning with sensor version **0.10.1** or the ARC extension using `release train=preview`.
- [Enable the Defender for Container sensor](defender-for-containers-azure-enable-portal.md#configure-plan-components) on the subscriptions and connectors.
- The following roles and permissions:
    - **To create and modify drift policies**: Security Admin or higher permissions on the tenant. 
    - **To view drift policies**: Security Reader or higher permissions on the tenant.

## Configure drift and block policies

Create drift and block policies to define when alerts should be generated. Each policy consists of rules that define the conditions for generating alerts. This structure lets you tailor the feature to your specific needs and reduce false positives. You can create exclusions by setting higher priority rules for specific scopes or clusters, images, pods, Kubernetes labels, or namespaces.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select **Containers drift policy**.

    :::image type="content" source="media/binary-drift-detection/select-containers-drift-policy.png" alt-text="Screenshot of Select Containers drift policy in Environment settings." lightbox="media/binary-drift-detection/select-containers-drift-policy.png":::

1. Select the applicable rule:
    - **Alert on Kube-System namespace** - can be modified like any other rule.
    - **Default binary drift** - applies to everything if no other rule matches. You can only modify the actions to either **Drift detection alert**, **Drift detection blocking**, or **Ignore drift detection** (default).

        :::image type="content" source="media/binary-drift-detection/default-rule.png" alt-text="Screenshot of Default rule appears at the bottom of the list of rules." lightbox="media/binary-drift-detection/default-rule.png":::

## Add a new rule

Binary drift rules define what behavior is considered suspicious, what to alert on, and what to block. Add a new rule to enforce better control, different enforcement levels, or more granular security behavior for specific workloads. You can also set blocking rules to prevent unauthorized processes from running in your containers.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select **Containers drift policy**.

1. Select **Add rule**.

    :::image type="content" source="media/binary-drift-detection/add-rule.png" alt-text="Screenshot of Select Add rule to create and configure a new rule." lightbox="media/binary-drift-detection/add-rule.png":::

1. Define the following fields:

    - **Rule name**: A descriptive name for the rule.
    
    - **Action**: 
        - **Drift detection alert** if the rule should generate an alert.
        - **Drift detection blocking** if the rule should block the drifted process.
        - **Ignore drift detection** to exclude it from alert generation.
        
    - **Scope description**: A description of the scope to which the rule applies.
    
    - **Cloud scope**: The cloud provider to which the rule applies. You can choose any combination of Azure, Amazon Web Services (AWS), or Google Cloud Platform (GCP). If you expand a cloud provider, you can select specific subscription. If you don't select the entire cloud provider, new subscriptions added to the cloud provider aren't included in the rule.
    
    - **Resource scope**: Add conditions based on the following categories: **Container name**, **Image name**, **Namespace**, **Pod labels**, **Pod name**, or **Cluster name**. Then choose an operator: **Starts with**, **Ends with**, **Equals**, or **Contains**. Finally, enter the value to match. You can add as many conditions as needed by selecting **+Add condition**.
    
    - **Allow list for processes**: A list of processes that are allowed to run in the container. Any process not on this list detected, generates an alert.

        Sample rule that allows the `dev1.exe` process to run in containers in the Azure cloud scope, whose image names start with either *Test123* or *env123*:
    
        :::image type="content" source="media/binary-drift-detection/rule-configuration.png" alt-text="Example of a rule configuration with all the fields defined." lightbox="media/binary-drift-detection/rule-configuration.png":::

1. Select **Apply**.

1. Assign priority to the rule by moving the rule up or down on the list. The rule with the highest priority is evaluated first. If there's a match, the evaluation stops. If no match is found, the next rule is evaluated. If there's no match for any rule, the default rule is applied.

1. Select **Save**.

Within 30 minutes, the sensors on the protected clusters update by using the new policy.

## Manage a rule

Binary drift policies are flexible and customizable, allowing you to manage and adjust them as needed. You can edit rules to refine their conditions or actions, duplicate rules to create similar ones with minor changes, or delete rules that are no longer necessary. Regularly reviewing and managing your rules ensures that your binary drift detection and blocking policies remain effective and aligned with your security needs.

### [Edit rule](#tab/edit-rule)

Rules can be edited to refine their conditions or actions. This flexibility allows you to adjust your policies based on the alerts you receive and your review of them, ensuring that they effectively balance security needs with operational efficiency.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select **Containers drift policy**. 

1. Select a rule.

1. Select **Edit**.

1. Select **Save**.

Within 30 minutes, the sensors on the protected clusters update by using the new policy.

### [Duplicate rule](#tab/duplicate-rule)

Rules can be duplicated to create similar ones with minor changes. This option is useful if you want to create a new rule that is similar to an existing one, allowing you to save time and maintain consistency in your policies.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select **Containers drift policy**. 

1. Select a rule.

1. Select **Duplicate rule**.

1. Select **Save**.

Within 30 minutes, the sensors on the protected clusters update by using the new policy.

### [Delete rule](#tab/delete-rule) 

Rules can be deleted when they are no longer necessary or if they generate too many false positives. Regularly reviewing and cleaning up your rules helps maintain the effectiveness of your binary drift detection and blocking policies.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Go to **Microsoft Defender for Cloud** > **Environment settings**.

1. Select **Containers drift policy**. 

1. Select a rule.

1. Select **Delete rule**.

1. Select **Save**.

Within 30 minutes, the sensors on the protected clusters update by using the new policy.

---

## Additional information

Defender for Cloud's alerts notify you of any binary drifts, so you can maintain the integrity of your container images. If the system detects an unauthorized external process that matches your defined policy conditions, it generates a high-severity alert for you to review. If you configure blocking rules, the system blocks the execution of those unauthorized processes.

Based on the alerts generated and your review of them, you might need to adjust your rules in the binary drift or blocking policy. This adjustment could involve refining conditions, adding new rules, or removing ones that generate too many false positives. The goal is to ensure that the defined binary drift and blocking policies with their rules effectively balance security needs with operational efficiency.

The effectiveness of binary drift detection and blocking relies on your active engagement in configuring, monitoring, and adjusting policies to suit your environment's unique requirements.

## Related content

- [Overview of Container security in Microsoft Defender for Containers](defender-for-containers-introduction.md)
