---
title: Understand just-in-time virtual machine access
description: Learn how just-in-time VM access in Microsoft Defender for Cloud reduces attack surface by locking down inbound management ports and allowing access only when needed.
ms.topic: how-to
ms.date: 07/03/2026
ms.custom: msecd-doc-authoring-1013
#customer intent: As a security administrator, I want to understand just-in-time VM access so that I can control access to my Azure virtual machines.
ai-usage: ai-assisted
---

# Just-in-time machine access in Microsoft Defender for Cloud

Microsoft Defender for Cloud's Defender for Servers Plan 2 offers the just-in-time machine access feature. Just-in-time protects your resources from threat actors actively hunting for machines with open management ports, such as Remote Desktop Protocol (RDP) or Secure Shell (SSH). All machines are potential targets for attacks. Once compromised, a machine can serve as an entry point to further attack resources in the environment.

To reduce attack surfaces, minimize open ports, especially management ports. However, legitimate users also need these ports, making it impractical to keep them closed.

Defender for Cloud's just-in-time machine access feature locks down inbound traffic to your virtual machines (VMs), reducing exposure to attacks while ensuring easy access when needed.

## Just-in-time access and network resources

<a name="azure"></a>
### Just-in-time access for Azure resources

In Azure, enable just-in-time access to block inbound traffic on specific ports.

- Defender for Cloud ensures "deny all inbound traffic" rules exist for your selected ports in the [network security group (NSG)](/azure/virtual-network/network-security-groups-overview#security-rules) and [Azure Firewall rules](/azure/firewall/rule-processing).
- These rules restrict access to your Azure VMs' management ports and defend them from attack.
- If other rules already exist for the selected ports, those existing rules take priority over the new "deny all inbound traffic" rules.
- If no existing rules are on the selected ports, the new rules take top priority in the NSG and Azure Firewall.

<a name="amazon-web-services"></a>
### Just-in-time access for AWS resources

In Amazon Web Services (AWS), enable just-in-time access to revoke the relevant rules in the attached EC2 security groups (for the selected ports), blocking inbound traffic on those specific ports.

- When a user requests access to a VM, Defender for Servers checks that the user has [Azure role-based access control (Azure RBAC)](/azure/role-based-access-control/role-assignments-portal) permissions for that VM.
- If the user's access request is approved, Defender for Cloud configures the NSGs and Azure Firewall to allow inbound traffic to the selected ports from the relevant IP address (or range) for the specified amount of time.
- In AWS, Defender for Cloud creates a new EC2 security group that allows inbound traffic to the specified ports.
- After the approved access period expires, Defender for Cloud restores the NSGs to their previous states.
- Connections that are already established aren't interrupted.

> [!NOTE]
> - Just-in-time access doesn't support VMs protected by Azure Firewalls controlled by [Azure Firewall Manager](/azure/firewall-manager/overview).
> - The Azure Firewall must be configured with Rules (Classic) and can't use Firewall policies.

## Identify VMs for just-in-time access

The following diagram shows the logic that Defender for Servers applies when deciding how to categorize your supported VMs:

### [**Azure**](#tab/jit-azure)

The following diagram shows the decision flow for Azure VMs:

:::image type="content" source="media/just-in-time-explained/jit-logic-flow.png" alt-text="Just-in-time (JIT) virtual machine (VM) logic flow." lightbox="media/just-in-time-explained/jit-logic-flow.png":::

### [**AWS**](#tab/jit-aws)

The following diagram shows the decision flow for AWS machines:

:::image type="content" source="media/just-in-time-explained/aws-jit-logic-flow.png" alt-text="A chart that explains the logic flow for the AWS just-in-time logic flow.":::

---

When Defender for Cloud finds a machine that can benefit from just-in-time access, it adds that machine to the recommendation's **Unhealthy resources** tab.

:::image type="content" source="media/just-in-time-explained/unhealthy-resources.png" alt-text="Screenshot that shows an unhealthy resource." lightbox="media/just-in-time-explained/unhealthy-resources.png":::

<a name="next-step"></a>
## Next steps

To configure just-in-time access, continue to the following article:

> [!div class="nextstepaction"]
> [Enable just-in-time access on VMs](just-in-time-access-usage.yml)

