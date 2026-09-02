---
title: Manage custom content with repository connections
titleSuffix: Microsoft Sentinel
description: This article explains custom Microsoft Sentinel content like GitHub or Azure DevOps repositories that can utilize source control features.
author: mberdugo
ms.author: monaberdugo
ms.service: microsoft-sentinel
ms.topic: article
ms.date: 3/30/2026
ai-usage: ai-assisted
ms.custom:
  - template-concept
  - build-2025
appliesto:
    - Microsoft Sentinel in the Microsoft Defender portal
    - Microsoft Sentinel in the Azure portal
ms.collection: usx-security

#Customer intent: As a SOC collaborator or MSSP analyst, I want to manage dynamic Microsoft Sentinel content as code based on source control repositories using CI/CD pipelines so that I can automate updates and ensure consistent configurations across workspaces. As an MSSP content manager, I want to deploy one solution to many customer workspaces and still be able to tailor custom content for their environments.

---

# Manage content as code with Microsoft Sentinel repositories

Microsoft Sentinel repositories let you deploy and manage custom Sentinel content from an external source control repository for continuous integration/continuous delivery (CI/CD). This automation removes the need for manual processes to update and deploy your custom content across workspaces. A subset of content as code is *detections* as code (DaC). Microsoft Sentinel **Repositories** implements DaC as well.

For more information on Sentinel content, see [About Microsoft Sentinel content and solutions](sentinel-solutions.md).

## How Microsoft Sentinel repositories work

You can deploy these Microsoft Sentinel custom content types from an external source control repository you connect to Microsoft Sentinel:

- Analytics rules
- Automation rules
- Custom detection rules (Preview)
- Hunting queries
- Parsers
- Playbooks
- Workbooks

Updates you make to the content in your Microsoft Sentinel repositories are synchronized to your Microsoft Sentinel workspace and  overwrite any changes you make to that content through the Microsoft Sentinel portal. Your Microsoft Sentinel repositories become your *single source of truth* for custom content in the connected workspaces.

## Plan your repository connection

Microsoft Sentinel repositories require careful planning to ensure you have the proper permissions from your workspace to the repository (repo) you want connected.

- Only connections to GitHub and Azure DevOps repositories are supported.
- Collaborator access to your GitHub repository or Project Administrator access to your Azure DevOps repository is required.
- The Microsoft Sentinel application needs authorization to your repo.
- Actions must be enabled for GitHub.
- Pipelines must be enabled for Azure DevOps.
- An Azure DevOps connection must be in the same tenant as your Microsoft Sentinel workspace.

Creating a connection to a repository requires an **Owner** role in the resource group that contains your Microsoft Sentinel workspace.

If you find content in a public repository where you aren't a contributor, first import, fork, or clone the content to a repo where you're a contributor. Then connect your repo to your Microsoft Sentinel workspace. For more information, see [Deploy custom content from your repository](ci-cd.md).

### Maximum connections and deployments

- Each Microsoft Sentinel workspace is currently limited to **five repository connections**.
- Each Azure resource group is limited to **800 deployments** in its deployment history. If you have a high volume of template deployments in one or more of your resource groups, you might see the `Deployment QuotaExceeded` error. For more information, see [DeploymentQuotaExceeded](/azure/azure-resource-manager/templates/deployment-quota-exceeded) in the Azure Resource Manager templates documentation.

## Plan your repository content

Microsoft Sentinel repositories support deployment of content you store as [Bicep files](/azure/azure-resource-manager/bicep/overview) or [Azure Resource Manager (ARM) templates](/azure/azure-resource-manager/templates/overview). We recommend using Bicep, which is more intuitive and makes it easier to describe Azure resources and Microsoft Sentinel content.

The template for each content type has a specific structure and parameter name, as documented in the [Sentinel resources template reference](/azure/templates/microsoft.securityinsights/allversions). For samples of each content type, see [RepositoriesSampleContent repository](https://github.com/SentinelCICD/RepositoriesSampleContent).

We provided a sample repository with templates for each of the content types listed. The repo also demonstrates how to use advanced features of repository connections. For more information, see [Microsoft Sentinel CI/CD repositories sample](https://github.com/SentinelCICD/RepositoriesSampleContent).

:::image type="content" source="media/ci-cd-custom-content/repositories-connection-success.png" alt-text="Screenshot of a successful repository connection. The RepositoriesSampleContent is shown. This screenshot is after the sample was imported from the SentinelCICD repo to a private GitHub repo in the FourthCoffee organization." lightbox="media/ci-cd-custom-content/repositories-connection-success.png":::

Although you can build templates from scratch, it's often easier to start from either the Sentinel Public GitHub repository YAML files or from out-of-the-box Microsoft Sentinel content. This table outlines how to convert an ARM template for use with Microsoft Sentinel Repositories.

|Content Type|Convert from Sentinel Public YAML|Export from Sentinel|Template Reference|Sample Templates|
|---|---|---|---|---|
|**Analytic rules**|[PowerShell script](https://github.com/Azure/Azure-Sentinel/blob/master/Tools/ConvertYamlToJson/ConvertSentinelRuleFrom-Yaml.ps1)|[Export feature](/azure/sentinel/import-export-analytics-rules#export-rules) or [PowerShell script](https://github.com/Azure/Azure-Sentinel/tree/master/Tools/Az.SecurityInsights-Samples/Alert%20Rules/Export%20Analytics%20Rules)|[Reference](/azure/templates/microsoft.securityinsights/2025-03-01/alertrules)|[ARM Templates](https://github.com/Azure/Azure-Sentinel/tree/master/Tools/ARM-Templates/AnalyticsRules)|
|**Automation rules**|N/A|[Export feature](/azure/sentinel/import-export-automation-rules#export-rules) or [PowerShell scripts](https://github.com/garybushey/MicrosoftSentinelAutomation/tree/main)|[Reference](/azure/templates/microsoft.securityinsights/2025-03-01/automationrules)|N/A|
|**Hunting queries**|[PowerShell script](https://github.com/SentinelCICD/RepositoriesSampleContent/blob/main/Hunting/ConvertHuntingQueryFromYamlToArm.ps1)|[Azure CLI commands](/cli/azure/monitor/log-analytics/workspace/saved-search)|[Reference](/azure/templates/microsoft.operationalinsights/2020-08-01/workspaces/savedsearches)|[Sample Content](https://github.com/SentinelCICD/RepositoriesSampleContent)|
|**Parsers**|[ASIM PowerShell script](https://github.com/Azure/Azure-Sentinel/tree/master/ASIM/dev/ASimYaml2ARM)|[Azure CLI commands](/cli/azure/monitor/log-analytics/workspace/saved-search)|[Reference](/azure/templates/microsoft.operationalinsights/2020-08-01/workspaces/savedsearches)|[Templates](https://github.com/Azure/Azure-Sentinel/tree/master/Tools/ARM-Templates/ParserQuery)|
|**Playbooks**|N/A|[PowerShell utility](https://github.com/Azure/Azure-Sentinel/tree/master/Tools/Playbook-ARM-Template-Generator)|[Reference](/azure/logic-apps/logic-apps-azure-resource-manager-templates-overview)|N/A|
|**Workbooks**|N/A|[Exporting workbooks as ARM templates](/azure/azure-monitor/visualize/workbooks-automate#arm-template-for-deploying-a-workbook-template)|[Reference](/azure/azure-monitor/visualize/workbooks-automate#arm-template-for-deploying-a-workbook-template)|N/A|

> [!IMPORTANT]
> Bicep considerations:
>
> - To use Bicep files, your repositories connection needs to be updated if your connection was created before November 1, 2024. Repositories connections must be [removed](ci-cd.md#remove-a-repository-connection) and recreated in order to update.
> - Bicep files don't support the `id` property. When decompiling ARM JSON to Bicep, make sure you don't have this property. For example, analytic rule templates exported from Microsoft Sentinel have the `id` property that needs removal.
> - Change the ARM JSON schema to version `2019-04-01` for best results when decompiling.
>
> Analytic rules deployed using the Microsoft Sentinel **Repositories** feature can use cross-workspace queries only if the destination workspace is in the same Resource Group as the workspace connected to the repository.

For information on creating custom content from scratch, see the relevant [Microsoft Sentinel GitHub wiki](https://github.com/Azure/Azure-Sentinel/wiki#get-started) for each content type.

## Deploy custom detection rules as code (Preview)

> [!IMPORTANT]
> Custom detection rules support in Microsoft Sentinel Repositories is currently in **Preview**. See the [Supplemental Terms of Use for Microsoft Azure Previews](https://azure.microsoft.com/support/legal/preview-supplemental-terms/) for legal terms that apply to Azure features that are in beta, preview, or otherwise not yet released into general availability.

You can manage [custom detection rules](/defender-xdr/custom-detections-overview) as code in your repository using the Microsoft Security BICEP extension. Custom detection rules use a different BICEP extension and resource provider than other Microsoft Sentinel content types.

### Prerequisites for custom detection rules

In addition to the standard [repository connection prerequisites](ci-cd.md#prerequisites), custom detection rules require:

- A Microsoft 365 E5 license (or equivalent license that includes Microsoft Defender XDR).
- Microsoft Sentinel workspaces onboarded to the Microsoft Defender portal.

### Configure the Microsoft Security BICEP extension

Custom detection rules require the Microsoft Security BICEP extension. Create a `bicepconfig.json` file in the root of your repository:

```json
{
  "extensions": {
    "MicrosoftSecurity": "br:mcr.microsoft.com/bicep/extensions/microsoftsecurity:v1.0.1"
  }
}
```

This configuration is required for both repository-based sync and direct BICEP deployment.

### Create a custom detection rule BICEP file

Define a custom detection rule using the `Microsoft.Security/detectionRules` resource type. Create a `.bicep` file (for example, `detectionRule.bicep`) with the following structure:

```bicep
extension MicrosoftSecurity

resource detectionRule 'Microsoft.Security/detectionRules@2026-06-01-preview' = {
  id: 'custom-rule-id'
  displayName: 'Custom Rule Display Name'
  status: 'enabled'
  queryCondition: {
    queryText: 'DeviceProcessEvents | take 10 | project DeviceId, Timestamp, FileName'
  }
  schedule: {
    frequency: 'PT1H'
  }
  detectionAction: {
    alertTemplate: {
      title: '<ruleTitle>'
      description: 'Custom detection rule'
      severity: 'medium'
      tactics: [
        {
          tactic: 'Execution'
          techniques: [
            {
              technique: 'T1059'
            }
          ]
        }
      ]
      entityMappings: {
        hosts: [
          {
            id: 'h'
            deviceIdColumn: 'DeviceId'
          }
        ]
      }
    }
  }
}
```

Rules are uniquely identified by their **ID**, which must be provided in the template.

### Deploy custom detection rules

You can deploy custom detection rules using one of the following methods.

|Deployment method|Description|Who runs the deployment|
|---|---|---|
|**Microsoft Sentinel Repositories (sync)**|Automatic sync from your GitHub or Azure DevOps repository to Microsoft Sentinel.|Sentinel runs the deployment automatically on each commit.|
|**BICEP CLI (direct)**|Deploy using `az deployment group create` from Azure CLI.|You run the deployment manually or from a custom pipeline.|

#### Option 1: Deploy using Microsoft Sentinel Repositories

1. Commit the BICEP file and `bicepconfig.json` to your GitHub or Azure DevOps repository.
1. In the Microsoft Defender portal, navigate to **Microsoft Sentinel** > **Content management** > **Repositories**.
1. Create a new repository connection or edit an existing one.
1. In the connection settings, select **Custom Detection Rules** under **Content Types**.
1. Save the connection.

Once enabled, Microsoft Sentinel syncs custom detection rules from the repository automatically.

#### Option 2: Deploy using BICEP directly

Run the following Azure CLI command:

```azurecli
az deployment group create \
  --resource-group <RESOURCE_GROUP> \
  --template-file detectionRule.bicep \
  --name mtp-deployment
```

Verify the deployment completed successfully in the resource group.

### Validate the deployment

After deployment with either option:

1. Confirm the detection rule appears in your list of custom detection rules in the Microsoft Defender portal.
1. Verify the rule is enabled and producing expected results.
1. If you used repository sync (Option 1), make changes in the repository to validate sync behavior.

### Preview limitations

During the preview:

- Custom frequency for Microsoft Sentinel data isn't supported.
- Custom details aren't supported.

## Improve performance with smart deployments

> [!TIP]
> To ensure smart deployments works in GitHub, Workflows must have read and write permissions on your repository. For more information, see [Managing GitHub Actions settings for a repository](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/enabling-features-for-your-repository/managing-github-actions-settings-for-a-repository).

The **smart deployments** feature is a back-end capability that improves performance by actively tracking modifications made to the content files of a connected repository. It uses a CSV file within the `.sentinel` folder in your repository to audit each commit. The workflow avoids redeploying content that wasn't modified since the last deployment. This process improves your deployment performance and prevents tampering with unchanged content in your workspace, such as resetting dynamic schedules of your analytics rules.

Smart deployments are enabled by default on newly created connections. If you prefer all source control content deployed every time a deployment is triggered, whether that content was modified or not, modify your workflow to disable smart deployments. For more information, see [Customize the workflow or pipeline](ci-cd-custom-deploy.md#customize-the-workflow-or-pipeline).

## Consider deployment customization options

Consider the following customization options when deploying content with Microsoft Sentinel repositories.

### Customize the workflow or pipeline

Customize the workflow or pipeline in one of the following ways:

- configure different deployment triggers
- deploy content only from a specific root folder for a given workspace
- schedule the workflow to run periodically
- combine different workflow events together
- turn off smart deployments

These customizations are defined in a .yml file specific to your workflow or pipeline. For more information on how to implement, see [Customize repository deployments](ci-cd-custom-deploy.md#customize-the-workflow-or-pipeline)

### Customize the deployment

Once the workflow or pipeline is triggered, the deployment supports the following scenarios:

- prioritize content to be deployed before the rest of the repo content
- exclude content from deployment
- specify ARM template parameter files

These options are available through a feature of the PowerShell deployment script called from the workflow or pipeline. For more information on how to implement these customizations, see [Customize repository deployments](ci-cd-custom-deploy.md#customize-your-connection-configuration).

## Manage Microsoft Sentinel repositories using the API

For information on managing Microsoft Sentinel repositories using the API, see the [Source Control](/rest/api/securityinsights/source-control) and [Source Controls](/rest/api/securityinsights/source-controls) actions in the Microsoft Sentinel REST API.

> [!IMPORTANT]
> Starting **June 2026**, older API versions used by Microsoft Sentinel repositories will no longer be supported. If you're using APIs to create and manage repository connections, transition to API version **2025-09-01**, **2025-06-01**, or **2025-07-01-preview** before June 15, 2026 to avoid service disruption. Existing repository connections aren't affected.

## Next steps

Get more examples and step by step instructions on deploying Microsoft Sentinel repositories.

- [Deploy custom content from your repository](ci-cd.md)
- [Microsoft Sentinel CI/CD sample repository](https://github.com/SentinelCICD/RepositoriesSampleContent)
- [Automate Sentinel integration with DevOps](/azure/architecture/example-scenario/devops/automate-sentinel-integration#microsoft-sentinel-repositories)
