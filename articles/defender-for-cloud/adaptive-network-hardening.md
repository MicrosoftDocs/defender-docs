---
title: Improve network security posture in Microsoft Defender for Cloud
description: Learn how to harden your network security groups (NSG) rules with adaptive network hardening in Microsoft Defender for Cloud
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 08/25/2024
---

# Improve network security posture

Use adaptive network hardening in the Defender for Servers plan in Microsoft Defender for Cloud to harden [network security groups (NSG)](/azure/virtual-network/network-security-groups-overview) rules.

In this article, learn how to configure and manage adaptive network hardening.

> [!NOTE]
> Adaptive network hardening will be deprecated at the end of August 2024. The following recommendation/alert will no longer be available.
> - Recommendation: "Adaptive network hardening recommendations should be applied on internet facing virtual machines"
> - Alert: "Traffic detected from IP addresses recommended for blocking"


NSGs control network traffic in Azure, providing deny and permit rules to filter traffic between resources on Azure virtual networks. Even with NSG rules in place to improve network security posture, there can still be some cases in which the actual traffic flowing through an NSG is a subset of the NSG rules defined. 

- Adaptive network hardening helps you to refine and further harden these rules, based on actual traffic patterns. It uses a machine learning algorithm that factors in actual traffic, known trusted configuration, threat intelligence, and other indicators of compromise, and then provides recommendations to allow traffic only from specific IP/port tuples.
- For example, if an NSG rule allows traffic from 140.20.30.10/24 on port 22, using traffic analysis, adaptive network hardening might recommend narrowing the range to allow traffic from 140.23.30.10/29, and deny all other traffic to that port.
-  Adaptive network hardening recommendations provides rules and alerts:
    - Rules specific the NSG rules that adaptive hardening recommends you add.
    - Alerts shows alerts generated due to traffic flowing to the rules that didn't correspond with recommendations. 

## Prerequisites

- Adaptive network hardening is agentless. Nothing needs to be installed on machines to use it.
- To use adaptive network hardening, [Defender for Servers Plan 2](defender-for-servers-introduction.md) must be enabled.
- You need write permissions on the machine's NSGs.
- Ports supported by adaptive network hardening (UDP and TCP) include: 13, 17, 19, 22, 23, 53, 69, 81, 111, 119, 123, 135, 137, 138, 139, 161, 162, 389, 445, 512, 514, 593, 636, 873, 1433, 1434, 1900, 2049, 2301, 2323, 2381, 3268, 3306, 3389, 4333, 5353, 5432, 5555, 5800, 5900, 5900, 5985, 5986, 6379, 6379, 7000, 7001, 7199, 8081, 8089, 8545, 9042, 9160, 9300, 11211, 16379, 26379, 27017, 37215
- When modifying rules, these limitations apply:
    - You can modify the parameters of **allow** rules only. You can't change **allow** rules to become **deny** rules.
    - Creating and modifying "deny" rules is done [directly on the NSG](/azure/virtual-network/manage-network-security-group).
    - A **Deny all traffic** rule is the only type of "deny" rule listed in a recommendation. It can't be modified but can be deleted.
    - A **Deny all traffic** rule is recommended when, as a result of running the algorithm, Defender for Cloud doesn't identify traffic that should be allowed, based on the existing NSG configuration.
        -  In this case the recommended rule is to deny all traffic to the specified port.
        - The name of this type of rule is displayed as "*System Generated*".
        - After enforcing this rule, its actual name in the NSG will be a string comprised of the protocol, traffic direction, "DENY", and a random number.


## View hardening recommendations

Adaptive network hardening is on by default in Defender for Servers Plan 2. You can view the recommendations it makes as follows:

1. In Defender for Cloud. In **Cloud Security**, select **Workload protections**.
1. Select **Enable adaptive network hardening** (2) in the insights panel to see the percentage of VMs currently protected with adaptive network hardening.
1. Select **Adaptive network hardening** (1) to drill down to recommendations.

    :::image type="content" source="./media/adaptive-network-hardening/traffic-hardening.png" alt-text="Accessing the adaptive network hardening tools." lightbox="./media/adaptive-network-hardening/traffic-hardening.png":::

1. The details page for the **Adaptive Network Hardening recommendations should be applied on internet facing virtual machines** recommendation opens with your network VMs grouped into three tabs:
   - **Unhealthy resources**: VMs that currently have recommendations and alerts that were triggered by running the adaptive network hardening algorithm.
   - **Healthy resources**: VMs without alerts and recommendations.
   - **Unscanned resources**: VMs that the adaptive network hardening algorithm cannot be run on because of one of the following reasons:
      - **VMs are Classic VMs**: Only Azure Resource Manager VMs are supported.
      - **Not enough data is available**: In order to generate accurate traffic hardening recommendations, Defender for Cloud requires at least 30 days of traffic data.
      - **VM is not protected by Microsoft Defender for Servers**: Only VMs protected with [Microsoft Defender for Servers](defender-for-servers-introduction.md) are eligible for this feature.

    :::image type="content" source="./media/adaptive-network-hardening/recommendation-details-page.png" alt-text="Details page of the recommendation Adaptive network hardening recommendations should be applied on internet facing virtual machines.":::

1. From the **Unhealthy resources** tab, select a VM to view its alerts and the recommended hardening rules to apply.

1. Select the rules that you want to apply on the NSG, and select **Enforce**.

    - If the allowed source IP ranges shows as 'None', it means that recommended rule is a *deny* rule, otherwise, it is an *allow* rule.

    :::image type="content" source="./media/adaptive-network-hardening/hardening-alerts.png" alt-text="Managing adaptive network hardening rules.":::

The enforced rules are added to the NSGs protecting the VM. A VM could be protected by an NSG that is associated to its NIC, or the subnet in which the VM resides, or both.

## Modify a rule

You might want to modify the parameters of a rule that has been recommended. For example, you might want to change the recommended IP ranges.

1. In **Manage Adaptive Network Hardening recommendations** > **Rules**, select on the three dots (...) at the end of the rule's row, and select **Edit**.

   ![Editing rule.](./media/adaptive-network-hardening/edit-hard-rule.png)

1. In the **Edit rule** window, update the details that you want to change, and select **Save**.

    ![Selecting Save.](./media/adaptive-network-hardening/edit-hard-rule-3.png)

    After selecting **Save**, you've successfully changed the rule. 

1. To apply the rule, select it in the list > **Enforce**.

    ![enforce rule.](./media/adaptive-network-hardening/enforce-hard-rule.png)

## Add a new rule

You can add an "allow" rule that was not recommended by Defender for Cloud.


1. In **Manage Adaptive Network Hardening recommendations**, select **Add rule**.

   ![add rule.](./media/adaptive-network-hardening/add-new-hard-rule.png)

1. In the **New rule** window, enter the details and select **Add**.

1. To apply the new rule, select it in the list > **Enforce**.

## Delete a rule

You can delete a recommended rule for the current session. For example, you might determine that applying a suggested rule could block legitimate traffic.

1. In **Manage Adaptive Network Hardening recommendations**, select the **Rules** tab.
1. Select the three dots (...) at the end of the rule's row, and select **Delete**.

    ![Deleting a rule.](./media/adaptive-network-hardening/delete-hard-rule.png)
