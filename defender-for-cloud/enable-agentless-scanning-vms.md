---
title: Enable agentless machine scanning
description: Run agentless scanning on Virtual Machines (VMs) for vulnerabilities and threats in Microsoft Defender for Cloud.
ms.topic: how-to
ms.date: 07/03/2026
ms.custom: sfi-image-nochange, msecd-doc-authoring-1013

#customer intent: As a security administrator, I want to enable agentless scanning for VMs so that I can identify vulnerabilities and threats without impacting performance.
ai-usage: ai-assisted
---

# Enable agentless machine scanning

Agentless machine scanning finds vulnerabilities, secrets, malware, and installed software on cloud machines. It works without agents on the machines. In Microsoft Defender for Cloud, scanning runs through your cloud connectors. Security teams can scale coverage with low overhead and little effect on performance. This article shows how to turn on scanning for Azure, AWS, and GCP. Before you begin, confirm that Defender CSPM or Defender for Servers Plan 2 is enabled and that the [required permissions](concept-agentless-data-collection.md#permissions-used-by-agentless-scanning) are granted.

## Overview

[Agentless machine scanning](concept-agentless-data-collection.md) in Microsoft Defender for Cloud helps protect your machines. It scans for software inventory, vulnerabilities, secrets, and malware.

- No agents or network access are needed. Scanning doesn't affect machine performance.
- You can turn agentless scanning on or off, but you can't turn off single scan types.
- Only running VMs are scanned. VMs that are off during a scan are skipped.
- Scans run once every 24 hours on a fixed schedule.

When you turn on Defender for Servers Plan 2 or Defender CSPM, agentless scanning is on by default. To turn it on by hand, use the steps in this article.

## Prerequisites

Before you enable agentless scanning, review the following requirements.

|**Requirement** | **Details**|
|--- | ---|
|**Plan** | To use agentless scanning, the [Defender cloud security posture management (Defender CSPM)](concept-cloud-security-posture-management.md) plan or [Defender for Servers Plan 2](defender-for-servers-introduction.md) must be enabled.<br/><br/> When you enable agentless scanning on either plan, agentless scanning is enabled for both plans.|
|**Malware scanning** | Malware scanning is only available when Defender for Servers Plan 2 is enabled.<br/><br/> For malware scanning of Kubernetes node VMs, either Defender for Servers Plan 2 or the Defender for Containers plan is required.|
| **Supported machines** | You can scan Azure virtual machines (VMs), Amazon Web Services (AWS) Elastic Compute Cloud (EC2) instances, and Google Cloud Platform (GCP) compute instances without installing an agent, if they're connected to [Microsoft Defender for Cloud](/azure/defender-for-cloud/). |
|**Azure VMs** | Agentless scanning is available on Azure standard VMs with:<br/><br/>- Maximum total disk size of 4 TB (sum of all disks). If this limit is exceeded, only the OS disk is scanned when the OS disk is less than 4 TB.<br/>- Maximum number of disks allowed: 14<br/>- Virtual machine scale set - Flex<br/><br/> Support for disks that are:<br/> - Unencrypted<br/> - Encrypted (managed disks using Azure Storage encryption with platform-managed keys (PMK))<br/>- Encrypted with customer-managed keys.|
|**AWS** | Agentless scanning is available on EC2, Auto Scale instances, and disks that are unencrypted, encrypted (PMK), and encrypted (CMK). AMIs requiring third-party licensing, for example from AWS Marketplace, are not supported.|
|**GCP** | Agentless scanning is available on compute instances, instance groups (managed and unmanaged), with Google-managed encryption keys, and customer-managed encryption key (CMEK)|
|**Kubernetes nodes** | Agentless scanning for vulnerabilities and malware in Kubernetes node VMs is available.<br/><br/> For [vulnerability assessment](kubernetes-nodes-va.md), Defender for Servers Plan 2, the Defender for Containers plan, or the Defender cloud security posture management (Defender CSPM) plan is required.<br/><br/> For [malware scanning](kubernetes-nodes-malware.md), Defender for Servers Plan 2 or Defender for Containers is required.|
|**Permissions** | Verify that the required [permissions used by agentless scanning](concept-agentless-data-collection.md#permissions-used-by-agentless-scanning) are granted in Defender for Cloud.|
|**Unsupported** | Disk type - If any of the VM's disks are on this list, the VM isn't scanned: <br> - UltraSSD_LRS <br> - PremiumV2_LRS <br> - Azure Kubernetes Service (AKS) Ephemeral OS Disks <br> <br> Resource type: <br> - Databricks VM <br> <br> File systems: <br> - UFS (Unix File System) <br> - ReFS (Resilient File System) <br> - ZFS (ZFS Member) <br> <br> RAID and Block storage formats: <br> - OracleASM (Oracle Automatic Storage Management) <br> - DRBD (Distributed Replicated Block Device) <br> - Linux_Raid_Member <br> <br> Integrity mechanisms: <br> - DM_Verity_Hash <br> - Swap|

## Enable agentless scanning on Azure

To enable agentless scanning on Azure:

1. In Defender for Cloud, open **Environment settings**.
1. Select the relevant subscription.
1. For either the Defender CSPM plan, or Defender for Servers Plan 2, select **Settings**.

    :::image type="content" source="media/enable-vulnerability-assessment-agentless/defender-plan-settings-azure.png" alt-text="Screenshot of link for the settings of the Defender plans for Azure accounts." lightbox="media/enable-vulnerability-assessment-agentless/defender-plan-settings-azure.png":::

1. In Settings and monitoring, turn on **Agentless scanning for machines**.

   :::image type="content" source="media/enable-vulnerability-assessment-agentless/turn-on-agentless-scanning-azure.png" alt-text="Screenshot of settings and monitoring screen to turn on agentless scanning." lightbox="media/enable-vulnerability-assessment-agentless/turn-on-agentless-scanning-azure.png":::

1. Select **Save**.

## Enable for Azure VMs with CMK encrypted disks

Azure VMs that use customer-managed keys (CMK) require extra Key Vault permissions before agentless scanning can access encrypted disks. You need to grant Defender for Cloud permissions on the Key Vaults used for CMK encryption so it can create a secure copy of the disks.

1. To manually assign the permissions on a Key Vault:

    - **Key vaults with non-RBAC permissions**: Assign "Microsoft Defender for Cloud Servers Scanner Resource Provider" (`0c7668b5-3260-4ad0-9f53-34ed54fa19b2`) these permissions: Key Get, Key Wrap, Key Unwrap.
    - **Key vaults using RBAC permissions**: Assign "Microsoft Defender for Cloud Servers Scanner Resource Provider” (`0c7668b5-3260-4ad0-9f53-34ed54fa19b2`) the [Key Vault Crypto Service Encryption User](/azure/key-vault/general/rbac-guide?preserve-view=true&tabs=azure-cli#azure-built-in-roles-for-key-vault-data-plane-operations) built-in role.

1. To assign the required CMK Key Vault permissions at scale across multiple Key Vaults, use the [Agentless Scanning CMK support PowerShell script](https://github.com/Azure/Microsoft-Defender-for-Cloud/tree/main/Powershell%20scripts/Agentless%20Scanning%20CMK%20support).

## Enable agentless scanning on AWS

To enable agentless scanning on AWS:

1. In Defender for Cloud, open **Environment settings**.
1. Select the relevant account.
1. For either Defender cloud security posture management (Defender CSPM) or Defender for Servers Plan 2, select **Settings**.

    :::image type="content" source="media/enable-vulnerability-assessment-agentless/defender-plan-settings-aws.png" alt-text="Screenshot of link for the settings of the Defender plans for AWS accounts." lightbox="media/enable-vulnerability-assessment-agentless/defender-plan-settings-aws.png":::

    When you enable agentless scanning on either plan, the setting applies to both plans.

1. In the settings pane, turn on **Agentless scanning for machines**.

    :::image type="content" source="media/enable-vulnerability-assessment-agentless/agentless-scan-on-aws.png" alt-text="Screenshot of the agentless scanning status for AWS accounts." lightbox="media/enable-vulnerability-assessment-agentless/agentless-scan-on-aws.png":::

1. Select **Save and Next: Configure Access**.

1. Download the CloudFormation template.

1. Use the downloaded CloudFormation template to create the stack in AWS. Follow the on-screen steps. For a management account, run the template as both a Stack and a StackSet. Connectors for member accounts are created within 24 hours.

1. Select **Next: Review and generate**.

1. Select **Update**.

After you enable agentless scanning, software inventory and vulnerability information are updated automatically in Defender for Cloud.

## Enable agentless scanning on GCP

To enable agentless scanning on Google Cloud Platform (GCP):

1. In Defender for Cloud, select **Environment settings**.
1. Select the relevant project or organization.
1. For either Defender CSPM or Defender for Servers Plan 2, select **Settings**.

    :::image type="content" source="media/enable-agentless-scanning-vms/gcp-select-plan.png" alt-text="Screenshot that shows where to select the plan for GCP projects." lightbox="media/enable-agentless-scanning-vms/gcp-select-plan.png":::

1. Set Agentless scanning to **On**.

    :::image type="content" source="media/enable-agentless-scanning-vms/gcp-select-agentless.png" alt-text="Screenshot that shows where to select agentless scanning." lightbox="media/enable-agentless-scanning-vms/gcp-select-agentless.png":::

1. Select **Save and Next: Configure Access**.
1. Copy the onboarding script.
1. Run the script in your GCP organization or project scope. Use the GCP portal or the gcloud CLI.
1. Select **Next: Review and generate**.
1. Select **Update**.

<a name="next-step"></a>
## Next steps

> [!div class="nextstepaction"]
> [Review agentless scanning support and permissions](concept-agentless-data-collection.md)
