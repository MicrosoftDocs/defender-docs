---
title: Move to scanning with Defender Vulnerability Management
description: Learn how to transition to the Microsoft Defender Vulnerability Management solution in Microsoft Defender for Cloud
ms.service: defender-for-cloud
ms.topic: how-to
ms.author: elkrieger
author: elazark
ms.date: 10/05/2025
---

# Move to scanning with Defender Vulnerability Management

Vulnerability scanning in Microsoft Defender for Cloud uses integrated Microsoft Defender Vulnerability Management, to scan machines for software inventory and vulnerabilities, and provide findings and insights in Defender for Cloud. If you're currently using a different vulnerability assessment solution, you can move to Defender Vulnerability Management using the instructions in this article. 

## Prerequisites

- Review [supported machines](/defender-vulnerability-management/tvm-supported-os)
- Make sure you have a Defender for Servers plan enabled (either Plan 1 or Plan 2) or Defender CSPM.
- If you have Defender for Servers Plan 1, it must have Defender for Endpoint integration enabled.
- You need Owner (resource group level) permissions to deploy.
- You need Security Reader permissions to view vulnerability findings.

## Transition with Azure policy for Azure VMs 

Follow these steps:

1. Sign in to the [Azure portal](https://portal.azure.com/).
1. Navigate to **Policy** > **Definitions**.
1. Search for `Setup subscriptions to transition to an alternative vulnerability assessment solution`. 
1. Select **Assign**.
1. Select a scope and enter an assignment name.
1. Select **Review + create**.
1. Review the information you entered and select **Create**.

   This policy ensures that all virtual machines (VM) within a selected subscription are safeguarded with the built-in Defender Vulnerability Management solution.

   Once you complete the transition to the Defender Vulnerability Management solution, you need to [Remove the old vulnerability assessment solution](#remove-the-old-vulnerability-assessment-solution).

## Transition in the Azure portal 

In the Azure portal, you have the ability to change the vulnerability assessment solution to the built-in Defender Vulnerability Management solution. 

1. Sign in to the [Azure portal](https://portal.azure.com/).
1. Navigate to **Microsoft Defender for Cloud** > **Environment settings**.
1. Select the relevant subscription.
1. Locate the Defender for Servers plan and select **Settings**.

   :::image type="content" source="media/how-to-migrate-to-built-in/settings-server.png" alt-text="Screenshot of the Defender for Cloud plan page that shows where to locate and select the settings button under the servers plan." lightbox="media/how-to-migrate-to-built-in/settings-server.png":::

1. Toggle `Vulnerability assessment for machines` to **On**.

   If `Vulnerability assessment for machines` was already set to **On**, select **Edit configuration**.

   :::image type="content" source="media/how-to-migrate-to-built-in/edit-configuration.png" alt-text="Screenshot of the servers plan that shows where the edit configuration button is located." lightbox="media/how-to-migrate-to-built-in/edit-configuration.png":::

1. Select **Microsoft Defender Vulnerability Management**.
1. Select **Apply**. 
1. Ensure that `Endpoint protection` or `Agentless scanning for machines` are toggled to **On**.

   :::image type="content" source="media/how-to-migrate-to-built-in/two-to-one.png" alt-text="Screenshot that shows where to turn on endpoint protection and agentless scanning for machines is located." lightbox="media/how-to-migrate-to-built-in/two-to-one.png":::

1. Select **Continue**.
1. Select **Save**.

   Once you complete the transition to the Defender Vulnerability Management solution, you need to [remove the old vulnerability assessment solution](#remove-the-old-vulnerability-assessment-solution).

## Transition with REST API

### REST API for Azure VMs

Using this REST API, you can easily migrate your subscription, at scale, from any vulnerability assessment solution to the Defender Vulnerability Management solution.

`PUT https://management.azure.com/subscriptions/{subscriptionId}/providers/Microsoft.Security/serverVulnerabilityAssessmentsSettings/AzureServersSetting?api-version=2022-01-01-preview`

```json
{
  "kind": "AzureServersSetting",
  "properties": {
    "selectedProvider": "MdeTvm"
  }
}
```

Once you complete the transition to the Defender Vulnerability Management solution, you need to [remove the old vulnerability assessment solution](#remove-the-old-vulnerability-assessment-solution).

### REST API for multicloud VMs

Using this REST API, you can easily migrate your subscription, at scale, from any vulnerability assessment solution to the Defender Vulnerability Management solution.

`PUT https://management.azure.com/subscriptions/{subscriptionId}/resourcegroups/{resourceGroupName}/providers/Microsoft.Security/securityconnectors/{connectorName}?api-version=2022-08-01-preview`

```json
{
  "properties": {
    "hierarchyIdentifier": "{GcpProjectNumber}",
    "environmentName": "GCP",
    "offerings": [
      {
        "offeringType": "CspmMonitorGcp",
        "nativeCloudConnection": {
          "workloadIdentityProviderId": "{cspm}",
          "serviceAccountEmailAddress": "{emailAddressRemainsAsIs}"
        }
      },
      {
        "offeringType": "DefenderCspmGcp"
      },
      {
        "offeringType": "DefenderForServersGcp",
        "defenderForServers": {
          "workloadIdentityProviderId": "{defender-for-servers}",
          "serviceAccountEmailAddress": "{emailAddressRemainsAsIs}"
        },
        "arcAutoProvisioning": {
          "enabled": true,
          "configuration": {}
        },
        "mdeAutoProvisioning": {
          "enabled": true,
          "configuration": {}
        },
        "vaAutoProvisioning": {
          "enabled": true,
          "configuration": {
            "type": "TVM"
          }
        },
        "subPlan": "{P1/P2}"
      }
    ],
    "environmentData": {
      "environmentType": "GcpProject",
      "projectDetails": {
        "projectId": "{GcpProjectId}",
        "projectNumber": "{GcpProjectNumber}",
        "workloadIdentityPoolId": "{identityPoolIdRemainsTheSame}"
      }
    }
  },
  "location": "{connectorRegion}"
}
```

### Remove the old vulnerability assessment solution

After migrating to the built-in Defender Vulnerability Management solution in Defender for Cloud, offboard each VM from their old vulnerability assessment solution. To delete the VM extension, you can use the [Remove-AzVMExtension PowerShell cmdlet](/powershell/module/az.compute/remove-azvmextension) or a [REST API Delete request](/rest/api/compute/virtual-machine-extensions/delete?tabs=HTTP).

## Next step

- [Common questions about vulnerability scanning questions](faq-scanner-detection.yml)

