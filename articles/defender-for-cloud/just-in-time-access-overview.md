---
title: Understand just-in-time virtual machine access
description: This document explains how just-in-time VM access in Microsoft Defender for Cloud helps you control access to your Azure virtual machines
ms.topic: how-to
ms.date: 06/29/2023
---

# Overview - Just-in-time machine access

Microsoft Defender for Cloud provides a just-in-time machine access feature.

Threat actors actively hunt accessible machines with open management ports, like RDP or SSH. All of your machines are potential targets for an attack. When a machine is successfully compromised, it's used as the entry point to attack further resources in the environment.

Like all cybersecurity prevention techniques, your goal should be to reduce the attack surface. In this case that means having fewer open ports especially management ports. Legitimate users also use these ports, so it's not practical to keep them closed.

To solve this dilemma, Defender for Cloud offers just-in-time machine access so that you can lock down the inbound traffic to your VMs, reducing exposure to attacks while providing easy access to connect to VMs when needed. Just-in-time access is available when Defender for Servers Plan 2 is enabled.


## Just-in-time access and network resources 

### Azure

In Azure, you can block inbound traffic on specific ports, by enabling just-in-time access. 

- Defender for Cloud ensures "deny all inbound traffic" rules exist for your selected ports in the [network security group (NSG)](/azure/virtual-network/network-security-groups-overview.#security-rules) and [Azure Firewall rules](/azure/firewall/rule-processing).
- These rules restrict access to your Azure VMs’ management ports and defend them from attack.
- If other rules already exist for the selected ports, then those existing rules take priority over the new "deny all inbound traffic" rules.
- If there are no existing rules on the selected ports, then the new rules take top priority in the NSG and Azure Firewall.

### AWS

In AWS, by enabling just-in-time access, the relevant rules in the attached EC2 security groups (for the selected ports) are revoked, blocking inbound traffic on those specific ports.

- When a user requests access to a VM, Defender for Servers checks that the user has [Azure role-based access control (Azure RBAC)](/azure/role-based-access-control/role-assignments-portal) permissions for that VM.
- If the request is approved, Defender for Cloud configures the NSGs and Azure Firewall to allow inbound traffic to the selected ports from the relevant IP address (or range), for the amount of time that was specified.
- In AWS, Defender for Cloud creates a new EC2 security group that allows inbound traffic to the specified ports.
- After the time has expired, Defender for Cloud restores the NSGs to their previous states
- Connections that are already established aren't interrupted.

> [!NOTE]
> - Just-in-time access doesn't support VMs protected by Azure Firewalls controlled by [Azure Firewall Manager](/azure/firewall-manager/overview).
> - The Azure Firewall must be configured with Rules (Classic) and can't use Firewall policies.

## Identifying VMs for just-in-time access

The following diagram shows the logic that Defender for Servers applies when deciding how to categorize your supported VMs:

### [**Azure**](#tab/defender-for-container-arch-aks)

:::image type="content" source="media/just-in-time-explained/jit-logic-flow.png" alt-text="Just-in-time (JIT) virtual machine (VM) logic flow." lightbox="media/just-in-time-explained/jit-logic-flow.png":::

### [**AWS**](#tab/defender-for-container-arch-eks)

:::image type="content" source="media/just-in-time-explained/aws-jit-logic-flow.png" alt-text="A chart that explains the logic flow for the AWS just-in-time logic flow.":::

---

When Defender for Cloud finds a machine that can benefit from just-in-time access, it adds that machine to the recommendation's **Unhealthy resources** tab.

![Just-in-time (JIT) virtual machine (VM) access recommendation.](./media/just-in-time-explained/unhealthy-resources.png)

## Next steps

[Enable just-in-time access on VMs](just-in-time-access-usage.yml).

