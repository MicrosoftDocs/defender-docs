---
title: Agentless machine scanning in Microsoft Defender for Cloud
description: Learn how Defender for Cloud can gather information about multicloud machine without installing an agent.
author: dcurwin
ms.author: dacurwin
ms.service: defender-for-cloud
ms.topic: concept-article
ms.date: 02/19/2025
ms.custom: template-concept
#customer intent: As a user, I want to understand how agentless machine scanning works in Defender for Cloud so that I can effectively collect data from my machines.
---

# Agentless machine scanning

Agentless machine scanning in Microsoft Defender for Cloud improves the security posture of machines connected to Defender for Cloud.

Agentless scanning doesn't need any installed agents or network connectivity, and doesn't affect machine performance. Agentless machine scanning:

- **Scans endpoint detection and response (EDR) settings**: Scan machines to assess whether they're running an EDR solution, and whether settings are correct if machines integrate with Microsoft Defender for Endpoint. [Learn more](endpoint-detection-response.md)
- **Scans software inventory**: Scan your [software inventory](/defender-vulnerability-management/tvm-software-inventory) with integrated Microsoft Defender Vulnerability Management.
- **Scans for vulnerabilities**: [Assess machines for vulnerabilities](auto-deploy-vulnerability-assessment.md) using integrated Defender Vulnerability Management.
- **Scans for secrets on machines**: Locate plain text secrets in your compute environment with agentless [secrets scanning](secrets-scanning.md).
- **Scans for malware**: [Scan machines for malware and viruses](agentless-malware-scanning.md) using [Microsoft Defender Antivirus](/microsoft-365/security/defender-endpoint/microsoft-defender-antivirus-windows).
- **Scans VMs running as Kubernetes nodes**: [Vulnerability assessment and malware scanning is available for VMs running as Kubernetes nodes](kubernetes-nodes-overview.md) when Defender for Servers Plan 2 or the Defender for Containers plan is enabled. Available in commercial clouds only.

Agentless scanning is available in the following Defender for Cloud plans:

- [Defender Cloud Security Posture Management (CSPM)](concept-cloud-security-posture-management.md).
- [Defender for Servers Plan 2](defender-for-servers-overview.md#defender-for-servers-plans).
- Malware scanning is only available in Defender for Servers Plan 2.
- Agentless scanning is available for Azure VMs, AWS EC2 and GCP compute instances connected to Defender for Cloud.

## Agentless scanning architecture

Here's how agentless scanning works:

1. Defender for Cloud takes snapshots of VM disks and performs an out-of-band, deep analysis of the operating system configuration and file system stored in the snapshot.

    - The copied snapshot remains in the same region as the VM.
    - The scan doesn't affect the VM.

1. After Defender for Cloud gets the necessary metadata from the copied disk, it immediately deletes the copied snapshot of the disk and sends the metadata to relevant Microsoft engines to detect configuration gaps and potential threats. For example, in vulnerability assessment, the analysis is done by Defender Vulnerability Management.

1. Defender for Cloud displays scanning results, which consolidates both the agent-based and agentless results on the Security alerts page.

1. Defender for Cloud analyses disks in a scanning environment that's regional, volatile, isolated, and highly secure. Disk snapshots and data unrelated to the scan aren't stored longer than is necessary to collect the metadata, typically a few minutes.

:::image type="content" source="media/concept-agentless-data-collection/agentless-scanning-process.png" alt-text="Diagram of the process for collecting operating system data through agentless scanning.":::

## Permissions used by agentless scanning

Defender for Cloud used specific roles and permissions to perform agentless scanning.

- In Azure, these permissions are automatically added to your subscriptions when you enable agentless scanning.
- In AWS, these permissions are [added to the CloudFormation stack in your AWS connector](enable-agentless-scanning-vms.md#enable-agentless-scanning-on-aws).
- In GCP, these permissions are [added to the onboarding script in your GCP connector](enable-agentless-scanning-vms.md#enable-agentless-scanning-on-gcp).

### Azure permissions

The built-in role **VM scanner operator** has read-only permissions for VM disks that are required for the snapshot process. The detailed list of permissions is:

- `Microsoft.Compute/disks/read`
- `Microsoft.Compute/disks/beginGetAccess/action`
- `Microsoft.Compute/disks/diskEncryptionSets/read`
- `Microsoft.Compute/virtualMachines/instanceView/read`
- `Microsoft.Compute/virtualMachines/read`
- `Microsoft.Compute/virtualMachineScaleSets/instanceView/read`
- `Microsoft.Compute/virtualMachineScaleSets/read`
- `Microsoft.Compute/virtualMachineScaleSets/virtualMachines/read`
- `Microsoft.Compute/virtualMachineScaleSets/virtualMachines/instanceView/read`

When coverage for CMK encrypted disks is enabled, more permissions are required:

- `Microsoft.KeyVault/vaults/keys/read`
- `Microsoft.KeyVault/vaults/keys/wrap/action`
- `Microsoft.KeyVault/vaults/keys/unwrap/action`

### AWS permissions

The role **VmScanner** is assigned to the scanner when you enable agentless scanning. This role has the minimal permission set to create and clean up snapshots (scoped by tag) and to verify the current state of the VM. The detailed permissions are:

| Attribute | Value |
| ---------|---------|
| SID | **VmScannerDeleteSnapshotAccess** |
| Actions | ec2:DeleteSnapshot |
| Conditions | ```"StringEquals":{"ec2:ResourceTag/CreatedBy”:<br>"Microsoft Defender for Cloud"}``` |
| Resources | arn:aws:ec2:::snapshot/ |
| Effect | Allow |

| Attribute | Value |
|---------|---------|
| SID | **VmScannerAccess** |
| Actions | ec2:ModifySnapshotAttribute <br> ec2:DeleteTags <br> ec2:CreateTags <br> ec2:CreateSnapshots <br> ec2:CopySnapshots <br> ec2:CreateSnapshot |
| Conditions | None |
| Resources | arn:aws:ec2:::instance/ <br> arn:aws:ec2:::snapshot/ <br> arn:aws:ec2:::volume/ |
| Effect | Allow |

| Attribute | Value |
|---------|---------|
| SID | **VmScannerVerificationAccess** |
| Actions | ec2:DescribeSnapshots <br> ec2:DescribeInstanceStatus |
| Conditions | None |
| Resources | * |
| Effect | Allow |

| Attribute | Value |
|---------|---------|
| SID | **VmScannerEncryptionKeyCreation** |
| Actions | kms:CreateKey |
| Conditions | None |
| Resources | * |
| Effect | Allow |

| Attribute | Value |
|---------|---------|
| SID | **VmScannerEncryptionKeyManagement** |
| Actions | kms:TagResource <br> kms:GetKeyRotationStatus <br> kms:PutKeyPolicy <br> kms:GetKeyPolicy <br> kms:CreateAlias <br> kms:ListResourceTags |
| Conditions | None |
| Resources | ```arn:aws:kms::${AWS::AccountId}: key/ <br> arn:aws:kms:*:${AWS::AccountId}:alias/DefenderForCloudKey```|
| Effect | Allow |

| Attribute | Value |
|---------|---------|
| SID | **VmScannerEncryptionKeyUsage** |
| Actions | kms:GenerateDataKeyWithoutPlaintext <br> kms:DescribeKey <br> kms:RetireGrant <br> kms:CreateGrant <br> kms:ReEncryptFrom |
| Conditions | None |
| Resources | arn:aws:kms::${AWS::AccountId}: key/ |
| Effect | Allow |

### GCP permissions

During onboarding, a new custom role is created with minimal permissions required to get instances status and create snapshots.

In addition, permissions to an existing GCP KMS role are granted to support scanning disks that are encrypted with CMEK. The roles are:

- roles/MDCAgentlessScanningRole granted to Defender for Cloud’s service account with permissions: compute.disks.createSnapshot, compute.instances.get
- roles/cloudkms.cryptoKeyEncrypterDecrypter granted to Defender for Cloud’s compute engine service agent

## Next steps

[Enable agentless machine scanning](enable-vulnerability-assessment-agentless.md).
