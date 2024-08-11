---
title: Enable agentless scanning for VMs in Microsoft Defender for Cloud
description: Run agentless scanning on VMs for vulnerabilities and threats in Microsoft Defender for Cloud.
author: dcurwin
ms.author: dacurwin
ms.topic: how-to
ms.date: 01/16/2024
---

# Enable agentless scanning for VMs

Agentless machine scanning in Microsoft Defender for Cloud improves the security posture on Azure VMs, and on AWS and GCP machines connected to Defender for Cloud. Agentless scanning doesn't need any installed agents or network connectivity, and doesn't effect machine performance.

- [Learn more](concept-agentless-data-collection.md) about agentless scanning capabilities.
- [Learn more](auto-deploy-vulnerability-assessment.md) about agentless and agent-based machine vulnerability scanning, and how they fit together.




You can enable agentless scanning manually as needed.

## Prerequisites

- You need the [Defender Cloud Security Posture Management (CSPM)](concept-cloud-security-posture-management.md) plan, or the [Defender for Servers P2](defender-for-servers-introduction.md). When you enable one of these plans, agentless scanning is turned on by default.
- Agentless machine scanning is available for Azure VMs,and for AWS/GCP machines connected to Defender for Cloud.
- Malware scanning on machines if only available if you're running Defender for Servers Plan 2.
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

## Enable agentless scanning on Azure

1. From Defender for Cloud's menu, open **Environment settings**.
1. Select the relevant subscription.
1. For either the [Defender Cloud Security Posture Management (CSPM)](concept-cloud-security-posture-management.md) or Defender for Servers P2 plan, select **Settings**.

    :::image type="content" source="media/enable-vulnerability-assessment-agentless/defender-plan-settings-azure.png" alt-text="Screenshot of link for the settings of the Defender plans for Azure accounts." lightbox="media/enable-vulnerability-assessment-agentless/defender-plan-settings-azure.png":::

    The agentless scanning settings are shared by both Defender Cloud Security Posture Management (CSPM) or Defender for Servers P2. When you enable agentless scanning on either plan, the setting is enabled for both plans.

1. In the settings pane, turn on **Agentless scanning for machines**.

   :::image type="content" source="media/enable-vulnerability-assessment-agentless/turn-on-agentless-scanning-azure.png" alt-text="Screenshot of settings and monitoring screen to turn on agentless scanning." lightbox="media/enable-vulnerability-assessment-agentless/turn-on-agentless-scanning-azure.png":::

1. Select **Save**.

## Enable agentless scanning of CMK encrypted disks in Azure (preview)**:

For agentless scanning to cover Azure VMs with CMK encrypted disks, you need to grant Defender for Cloud additional permissions to create a secure copy of these disks. To do so, additional permissions are needed on Key Vaults used for CMK encryption for your VMs.

To manually assign the permissions, follow the below instructions according to your Key Vault type:

- For Key Vaults using non-RBAC permissions, assign "Microsoft Defender for Cloud Servers Scanner Resource Provider" (`0c7668b5-3260-4ad0-9f53-34ed54fa19b2`) these permissions: Key Get, Key Wrap, Key Unwrap.
- For Key Vaults using RBAC permissions, assign "Microsoft Defender for Cloud Servers Scanner Resource Provider” (`0c7668b5-3260-4ad0-9f53-34ed54fa19b2`) the [Key Vault Crypto Service Encryption User](/azure/key-vault/general/rbac-guide?preserve-view=true&tabs=azure-cli#azure-built-in-roles-for-key-vault-data-plane-operations) built-in role.

To assign these permissions at scale, you can also use [this script](https://github.com/Azure/Microsoft-Defender-for-Cloud/tree/main/Powershell%20scripts/Agentless%20Scanning%20CMK%20support).

For more information, see [agentless scanning permissions](faq-permissions.yml#which-permissions-are-used-by-agentless-scanning-).

## Enable agentless scanning on AWS

1. From Defender for Cloud's menu, open **Environment settings**.
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

## Test agentless malware scanning

Security alerts appear on the portal only in cases where threats are detected on your environment. If you do not have any alerts it might be because there are no threats on your environment. You can test to see that the device is properly onboarded and reporting to Defender for Cloud by creating a test file.

### Create a test file for Linux

1. Open a terminal window on the VM.

1. Execute the following command:

    ```bash
    # test string  
    TEST_STRING='$$89-barbados-dublin-damascus-notice-pulled-natural-31$$'  
     
    # File to be created  
    FILE_PATH="/tmp/virus_test_file.txt"  
     
    # Write the test string to the file  
    echo -n $TEST_STRING > $FILE_PATH  
     
    # Check if the file was created and contains the correct string  
    if [ -f "$FILE_PATH" ]; then  
        if grep -Fq "$TEST_STRING" "$FILE_PATH"; then  
            echo "Virus test file created and validated successfully."  
        else  
            echo "Virus test file does not contain the correct string."  
        fi  
    else  
        echo "Failed to create virus test file."  
    fi
    ```

The alert `MDC_Test_File malware was detected (Agentless)` will appear within 24 hours in the Defender for Cloud Alerts page and in the Defender XDR portal.

:::image type="content" source="media/enable-agentless-scanning-vms/test-alert.jpg" alt-text="Screenshot of the test alert that appears in Defender for Cloud for Linux." lightbox="media/enable-agentless-scanning-vms/test-alert.jpg":::

### Create a test file for Windows with a text document


1. Create a text file on your VM.

1. Paste the text `$$89-barbados-dublin-damascus-notice-pulled-natural-31$$` into the text file.

    > [!IMPORTANT]
    > Ensure that there are no extra spaces or lines in the text file.

1. Save the file.

1. Open the file to validate that it contains the content from stage 2.

The alert `MDC_Test_File malware was detected (Agentless)` will appear within 24 hours in the Defender for Cloud Alerts page and in the Defender XDR portal.

:::image type="content" source="media/enable-agentless-scanning-vms/test-alert.jpg" alt-text="Screenshot of the test alert that appears in Defender for Cloud for Windows because of the text file that was created." lightbox="media/enable-agentless-scanning-vms/test-alert.jpg":::

### Create a test file for Windows with PowerShell

1. Open PowerShell on your VM.

1. Execute the following script.

```powershell
# Virus test string
$TEST_STRING = '$$89-barbados-dublin-damascus-notice-pulled-natural-31$$'

# File to be created
$FILE_PATH = "C:\temp\virus_test_file.txt"

# Create "temp" directory if it does not exist
$DIR_PATH = "C:\temp"
if (!(Test-Path -Path $DIR_PATH)) {
   New-Item -ItemType Directory -Path $DIR_PATH
}

# Write the test string to the file without a trailing newline
[IO.File]::WriteAllText($FILE_PATH, $TEST_STRING)

# Check if the file was created and contains the correct string
if (Test-Path -Path $FILE_PATH) {
    $content = [IO.File]::ReadAllText($FILE_PATH)
    if ($content -eq $TEST_STRING) {
      Write-Host "Test file created and validated successfully."
    } else {
       Write-Host "Test file does not contain the correct string."
    }
} else {
    Write-Host "Failed to create test file."
}
```

The alert `MDC_Test_File malware was detected (Agentless)` will appear within 24 hours in the Defender for Cloud Alerts page and in the Defender XDR portal.

:::image type="content" source="media/enable-agentless-scanning-vms/test-alert.jpg" alt-text="Screenshot of the test alert that appears in Defender for Cloud for Windows with because of the PowerShell script." lightbox="media/enable-agentless-scanning-vms/test-alert.jpg":::

## Exclude machines from agentless scanning

Agentless scanning applies to all of the eligible machines in the subscription. To prevent specific machines from being scanned, you can exclude machines from agentless scanning based on your pre-existing environment tags. When Defender for Cloud performs the continuous discovery for machines, excluded machines are skipped.

**To configure machines for exclusion**:

1. In Defender for Cloud, select **Environment settings**.
1. Select the relevant subscription or multicloud connector.
1. For either the Defender Cloud Security Posture Management (CSPM) or Defender for Servers P2 plan, select **Settings**.
1. For agentless scanning, select **Edit configuration**.

    :::image type="content" source="media/enable-vulnerability-assessment-agentless/agentless-scanning-edit-configuration.png" alt-text="Screenshot of the link to edit the agentless scanning configuration." lightbox="media/enable-vulnerability-assessment-agentless/agentless-scanning-edit-configuration.png":::

1. Enter the tag name and value that applies to the machines that you want to exempt. You can enter `multiple tag:value` pairs.

    :::image type="content" source="media/enable-vulnerability-assessment-agentless/agentless-scanning-exclude-tags.png" alt-text="Screenshot of the tag and value fields for excluding machines from agentless scanning.":::

1. Select **Save**.

## Related content

Learn more about:

[Agentless scanning](concept-agentless-data-collection.md).
