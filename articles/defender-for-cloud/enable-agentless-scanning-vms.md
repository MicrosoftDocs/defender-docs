---
title: Enable agentless scanning for VMs in Microsoft Defender for Cloud
description: Run agentless scanning on VMs for vulnerabilities and threats in Microsoft Defender for Cloud.
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 01/16/2024
---

# Enable agentless machine scanning

[Agentless machine scanning](concept-agentless-data-collection.md) in Microsoft Defender for Cloud improves the security posture of machines connected to Defender for Cloud. Agentless scanning doesn't need any installed agents or network connectivity, and doesn't effect machine performance.

Agentless machine scanning includes a number of components, including scanning for software inventory, vulnerabilities, secrets, and malware. You can turn agentless machine scanning on or off, but you can't turn off individual components

When you turn on Defender for Servers Plan 2, or the Defender Cloud Security Posture Management (CSPM) plan, agentless machine scanning is turned on by default. If needed, you can use the instructions in this article to turn on agentless machine scanning manually.

## Prerequisites

- To use agentless scanning the [Defender CSPM](concept-cloud-security-posture-management.md) plan, or [Defender for Servers Plan 2](defender-for-servers-introduction.md) must be enabled. 
- Malware scanning is only available when Defender for Servers Plan 2 is enabled.
- When you enable agentless scanning on either plan, the setting is enabled for both plans.
- Agentless machine scanning is available for Azure VMs, AWS/GCP machines connected to Defender for Cloud, and for on-premises machines onboarded as Azure Arc-enabled VMs.
- Agentless scanning is avilable on Azure standard VMs with:
    -  Maximum total disk size allowed: 4TB (the sum of all disks)
    - Maximum number of disks allowed: 6
    - Virtual machine scale set - Flex
    - Encryption: Unencrypted, Encrypted (managed disks using Azure Storage encryption with platform-managed keys (PMK)), Encrypted (customer-managed keys (preview))
- Agentless scanning is available on AWS as follows:
    - EC2
    - Auto Scale instances
    - Unencrypted, Encrypted (PMK), Encrypted (CMK)
- Agentless scanning is available on GCP as follows:
    - Compute instances
    - Instance groups (managed and unmanaged)
    - Google-managed encryption key, Customer-managed encryption key (CMEK)
- [Review the permissions](concept-agentless-data-collection.md#permissions-used-by-agentless-scanning) used by Defender for Cloud for agentless scannng.

## Enable agentless scanning on Azure

1. In Defender for Cloud, open **Environment settings**.
1. Select the relevant subscription.
1. For either the Defender CSPM plan, or Defender for Servers Plan 2, select **Settings**.

    :::image type="content" source="media/enable-vulnerability-assessment-agentless/defender-plan-settings-azure.png" alt-text="Screenshot of link for the settings of the Defender plans for Azure accounts." lightbox="media/enable-vulnerability-assessment-agentless/defender-plan-settings-azure.png":::


1. In **Settings and monitoring**, turn on **Agentless scanning for machines**.

   :::image type="content" source="media/enable-vulnerability-assessment-agentless/turn-on-agentless-scanning-azure.png" alt-text="Screenshot of settings and monitoring screen to turn on agentless scanning." lightbox="media/enable-vulnerability-assessment-agentless/turn-on-agentless-scanning-azure.png":::

1. Select **Save**.

## Enable for Azure VMs with CMK encrypted disks (preview)

For agentless scanning of Azure VMs with CMK encrypted disks, you need to grant Defender for Cloud additional permissions on Key Vaults used for CMK encryption for the VMs, to create a secure copy of the disks.

1. To manually assign the permissions on a Key Vault, do the following:

    - **Key vaults with non-RBAC permissions**: Assign "Microsoft Defender for Cloud Servers Scanner Resource Provider" (`0c7668b5-3260-4ad0-9f53-34ed54fa19b2`) these permissions: Key Get, Key Wrap, Key Unwrap.
    - **Key vaults using RBAC permissions**: Assign "Microsoft Defender for Cloud Servers Scanner Resource Provider” (`0c7668b5-3260-4ad0-9f53-34ed54fa19b2`) the [Key Vault Crypto Service Encryption User](/azure/key-vault/general/rbac-guide?preserve-view=true&tabs=azure-cli#azure-built-in-roles-for-key-vault-data-plane-operations) built-in role.

1. To assign these permissions at scale for multiple Key Vaults, use [this script](https://github.com/Azure/Microsoft-Defender-for-Cloud/tree/main/Powershell%20scripts/Agentless%20Scanning%20CMK%20support).


## Enable agentless scanning on AWS

1. In Defender for Cloud, open **Environment settings**.
1. Select the relevant account.
1. For either the Defender Cloud Security Posture Management (CSPM) or Defender for Servers P2 plan, select **Settings**.

    :::image type="content" source="media/enable-vulnerability-assessment-agentless/defender-plan-settings-aws.png" alt-text="Screenshot of link for the settings of the Defender plans for AWS accounts." lightbox="media/enable-vulnerability-assessment-agentless/defender-plan-settings-aws.png":::

    When you enable agentless scanning on either plan, the setting applies to both plans.

1. In the settings pane, turn on **Agentless scanning for machines**.

    :::image type="content" source="media/enable-vulnerability-assessment-agentless/agentless-scan-on-aws.png" alt-text="Screenshot of the agentless scanning status for AWS accounts." lightbox="media/enable-vulnerability-assessment-agentless/agentless-scan-on-aws.png":::

1. Select **Save and Next: Configure Access**.

1. Download the CloudFormation template.

1. Using the downloaded CloudFormation template, create the stack in AWS as instructed on screen. If you're onboarding a management account, you need to run the CloudFormation template both as Stack and as StackSet. Connectors will be created for the member accounts up to 24 hours after the onboarding.

1. Select **Next: Review and generate**.

1. Select **Update**.

After you enable agentless scanning, software inventory and vulnerability information are updated automatically in Defender for Cloud.

## Enable agentless scanning on GCP

1. In Defender for Cloud, select **Environment settings**.
1. Select the relevant project or organization.
1. For either the Defender Cloud Security Posture Management (CSPM) or Defender for Servers P2 plan, select  **Settings**.

    :::image type="content" source="media/enable-agentless-scanning-vms/gcp-select-plan.png" alt-text="Screenshot that shows where to select the plan for GCP projects." lightbox="media/enable-agentless-scanning-vms/gcp-select-plan.png":::

1. Toggle Agentless scanning to **On**.

    :::image type="content" source="media/enable-agentless-scanning-vms/gcp-select-agentless.png" alt-text="Screenshot that shows where to select agentless scanning." lightbox="media/enable-agentless-scanning-vms/gcp-select-agentless.png":::

1. Select **Save and Next: Configure Access**.
1. Copy the onboarding script.
1. Run the onboarding script in the GCP organization/project scope (GCP portal or gcloud CLI).
1. Select  **Next: Review and generate**.
1. Select  **Update**.


## Related content

Learn more about:

[Agentless scanning](concept-agentless-data-collection.md).
