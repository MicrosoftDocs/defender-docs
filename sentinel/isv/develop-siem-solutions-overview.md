---
title: Develop a SIEM solution for Microsoft Sentinel
description: Learn how to develop a SIEM solution for Microsoft Sentinel.
ms.service: microsoft-sentinel
ms.subservice: sentinel-siem
author: EdB-MSFT
ms.author: edbaynash
ms.reviewer: rmoriarty
ms.topic: concept-article
ms.date: 06/30/2026
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1012
---

# Develop a SIEM solution for Microsoft Sentinel

Microsoft Sentinel solutions let independent software vendors (ISVs) and partners bundle a data connector with related security content such as workbooks, analytic rules, hunting queries, playbooks, and parsers into a single, installable package. Customers can then discover and deploy these solutions from the Microsoft Sentinel content hub and Azure Marketplace.

> [!NOTE]
> If you're an ISV building a Microsoft Sentinel integration, the Microsoft App Assure team might be able to assist throughout the process. To engage the team, send an email to [azuresentinelpartner@microsoft.com](mailto:azuresentinelpartner@microsoft.com).

| Phase | Activities |
|---|---|
| **Learn** | Learn about Sentinel, identify what to build, create publisher accounts, set up your environment |
| **Build** | Provision your environment, build your connector and solution content |
| **Test** | Package your solution, test it, submit a pull request, and resolve feedback |
| **Publish** | Create an offer in Partner Center, test the preview, and go live |
| **Preview** | Inform customers, resolve support issues, monitor for four weeks |
| **Go to Market** | Remove the preview flag, listen to customers, enhance your solution |

## Learn

Before you begin building, complete the following steps:

- **Learn about Microsoft Sentinel.** Understand how Microsoft Sentinel works, what a solution is, and how customers discover and install solutions from the content hub. See [What is Microsoft Sentinel?](/azure/sentinel/overview) and browse the [solutions catalog](https://aka.ms/sentinelsolutionscatalog).

- **Identify what to build.** Decide which connector type you plan to use and which SIEM content types you want to include in your solution. SIEM content types include workbooks, analytic rules, hunting queries, playbooks, and parsers. See [Build a data connector](#build-a-data-connector) for guidance on connector types.

- **Review the docs.** Review the [general contribution guidelines for Microsoft Sentinel](https://aka.ms/sentinelgithubcontributionguidelines) and the [Microsoft Sentinel GitHub wiki](https://github.com/Azure/Azure-Sentinel/wiki#get-started).

- **Become a Cloud Partner and create a publisher account.** Solutions are published through the [Microsoft Partner Center](/partner-center/overview). You need a publisher account before you can submit your solution to Azure Marketplace. For more information, see [Create a commercial marketplace account in Partner Center](/azure/marketplace/create-account).

## Build

In the build phase, you set up your development environment, then create your connector and solution content.

### Provision your environment

Before building, configure your development environment so you can author, test, and submit solution content.

#### Fork and clone the repository

To fork and clone the Azure-Sentinel repository, follow these steps:

1. In GitHub, go to the [Azure-Sentinel repository](https://github.com/Azure/Azure-Sentinel) and select **Fork**.
1. Clone your fork to your local machine:

   ```bash
   git clone https://github.com/<your-github-username>/Azure-Sentinel.git
   cd Azure-Sentinel
   ```

1. Add the upstream remote so you can pull in the latest changes:

   ```bash
   git remote add upstream https://github.com/Azure/Azure-Sentinel.git
   ```

#### Set up a dev/test workspace

You need a working Microsoft Sentinel workspace to develop and validate your connector and content before submitting. See [Onboard Microsoft Sentinel](/azure/sentinel/quickstart-onboard).

After your workspace is provisioned, assign the following permissions:

- **Microsoft Sentinel Contributor** on the workspace to deploy and manage resources
- **Log Analytics Contributor** on the workspace to create and manage custom tables and data collection rules (DCRs)
- **Contributor** on the resource group to deploy ARM templates during testing

#### Onboard to the Defender portal

Onboard your workspace to the [Defender portal](https://security.microsoft.com/) in order to validate your solution installation, ensure seamless ingestion into the Unified Security Operations Platform, and test end-to-end before publishing. For more information, see [Microsoft Sentinel in the Microsoft Defender portal](/azure/sentinel/microsoft-sentinel-defender-portal). 


### Build a solution

A Microsoft Sentinel solution is a folder of connector and content files that the packaging tool assembles into a deployable package. Create the folder structure, add the packaging files, then build each content type.

#### Create your solution folder structure in GitHub

To set up your solution's folder structure, follow these steps:

1. Create and switch to a new branch on your fork. Use a descriptive name such as `add-<YourSolutionName>-solution`:

   ```powershell
   git checkout -b add-<YourSolutionName>-solution
   ```

1. Create a folder with your solution name under `Solutions/`:

   ```
   Solutions/<YourSolutionName>/
   ├── Data/
   │   └── Solution_<YourSolutionName>.json
   ├── SolutionMetadata.json
   ├── ReleaseNotes.md
   ├── Data Connectors/
   ├── Workbooks/
   ├── Analytic Rules/
   ├── Hunting Queries/
   ├── Playbooks/
   └── Parsers/
   ```

   | File / Folder |Required |Contents |
   |---|---|---|
   | `Data/Solution_<YourSolutionName>.json` | Required | Solution manifest that lists every content file in the solution and drives the package creation tool |
   | `SolutionMetadata.json` | Required | Publisher and marketplace metadata: publisher ID, offer ID, categories, and support info |
   | `ReleaseNotes.md` | Required | Versioned change history table, required for every package submission |
   | `Data Connectors/` | Optional | Connector JSON files, or Azure Functions code for function-based connectors |
   | `Workbooks/` | Optional | Workbook JSON files and black/white preview screenshots |
   | `Analytic Rules/` | Optional | YAML analytic rule templates |
   | `Hunting Queries/` | Optional | YAML hunting query templates |
   | `Playbooks/` | Optional | Playbook JSON files and Azure Logic Apps custom connector definitions |
   | `Parsers/` | Optional | YAML Kusto function/parser definitions |

   The content subfolders are optional. Only create the folders that apply to your solution. You aren't required to include every content type, but meeting the minimum content requirements improves your quality score. 

   For an example of a complete folder structure, open the [Solutions/](https://github.com/Azure/Azure-Sentinel/tree/master/Solutions) folder in the repository and browse some of the existing solutions.

#### Create the solution packaging files

**`Data/Solution_<YourSolutionName>.json`**

This file drives the V3 packaging tool. It lists every content file in your solution and controls how they're assembled into `mainTemplate.json`. Each content type is an array. Add one entry per file for each piece of content you have. For more information on the packaging tool, see [Package your solution](#package-your-solution).

In the following example, the solution has two analytic rules, so the `"Analytic Rules"` array has two entries. If for example, you aren't creating any playbooks, remove the `"Playbooks"` key from the file entirely.

```json
{
  "Name": "Contoso MyProduct",
  "Author": "Contoso - support@contoso.com",
  "Logo": "<img src=\"https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/Logos/contoso.svg\" width=\"75px\" height=\"75px\">",
  "Description": "The Contoso MyProduct solution for Microsoft Sentinel enables you to ingest MyProduct logs into Microsoft Sentinel.",
  "BasePath": "C:/GitHub/Azure-Sentinel/Solutions/Contoso MyProduct",
  "Version": "1.0.0",
  "Metadata": "SolutionMetadata.json",
  "TemplateSpec": true,
  "Data Connectors": [
    "Data Connectors/ContosoMyProduct.json"
  ],
  "Workbooks": [
    "Workbooks/ContosoMyProductWorkbook.json"
  ],
  "Analytic Rules": [
    "Analytic Rules/ContosoMyProductSuspiciousLogin.yaml",
    "Analytic Rules/ContosoMyProductDataExfiltration.yaml"
  ],
  "Hunting Queries": [
    "Hunting Queries/ContosoMyProductThreatHunt.yaml"
  ],
  "Parsers": [
    "Parsers/ContosoMyProduct.yaml"
  ],
  "Playbooks": [
    "Playbooks/ContosoMyProduct-EnrichIncident/azuredeploy.json"
  ]
}
```



| Field | Notes |
|---|---|
| `Name` | Alphanumeric and spaces only. No hyphens, underscores, or symbols. |
| `Author` | Format: `Organization - email@domain.com` |
| `Logo` | HTML `<img>` tag pointing to your logo SVG at the raw GitHub URL under `Logos/`. See [Add your logo](#add-your-logo) for file requirements and validation rules. |
| `BasePath` | Your local repo path to the solution folder. Not used at runtime. |
| `Version` | Must match `SolutionMetadata.json` and `mainTemplate.json`. |
| `TemplateSpec` | Check existing solutions in the repo for the correct value for your connector type. |
| Content arrays | One entry per file. Add all files for a given content type to its array. Remove the key entirely if you have no content of that type. Don't leave an empty array. Paths are relative to `BasePath`. |

**`SolutionMetadata.json`**

This file contains the marketplace and publisher metadata used during Partner Center certification.

```json
{
  "publisherId": "contoso",
  "offerId": "contoso-myproduct-sentinel",
  "firstPublishDate": "2026-06-15",
  "lastPublishDate": "2026-06-15",
  "providers": [
    "Contoso"
  ],
  "categories": {
    "domains": [
      "Security - Threat Intelligence"
    ]
  },
  "support": {
    "name": "Contoso",
    "email": "support@contoso.com",
    "tier": "Partner",
    "link": "https://support.contoso.com"
  }
}
```

`publisherId` and `offerId` come from your Partner Center offer. `support.tier` should be `"Partner"` for ISV solutions. For valid `categories.domains` values, see the [solutions catalog](/azure/sentinel/sentinel-solutions#categories-for-microsoft-sentinel-out-of-the-box-content-and-solutions).

| Field | Notes |
|---|---|
| `publisherId` | Your Partner Center publisher ID. |
| `offerId` | Your Partner Center offer ID. This value is set when you create the offer in Partner Center and **cannot be changed after creation**. The value must match the Offer ID in Partner Center exactly. A mismatch causes certification failure. See [Package a SIEM solution for Microsoft Sentinel](package-siem-solutions-overview.md#publish) for how the offer ID is created. |
| `firstPublishDate` | ISO 8601 date. Set once and don't change it after initial publishing. |
| `lastPublishDate` | Update to match each new release. |
| `providers` | Array of vendor/product provider names. |
| `categories.domains` | One or more domain categories from the solutions catalog. |
| `categories.verticals` | Optional industry verticals. Omit if not applicable. |
| `support.tier` | `"Partner"` for ISV, `"Microsoft"` for Microsoft, `"Community"` for community. |

**`ReleaseNotes.md`**

The `ReleaseNotes.md` file records the change history for your solution. This file is validated during PR checks. Missing or malformed entries cause PR rejection.

The table must have exactly three columns with these exact header names (including the bold markers):

```markdown
| **Version** | **Date Modified (DD-MM-YYYY)** | **Change History** |
|---|---|---|
| 1.0.1 | 12-06-2026 | Updated analytic rule query to fix false positives. |
| 1.0.0 | 01-06-2026 | Initial solution release. |
```

**Validation rules**

- Version format: `X.Y.Z` Don't include a `v` prefix. All three parts are required.
- Versions are listed in descending order with the newest in the row first
- Date format: `DD-MM-YYYY` with hyphens (not `YYYY-MM-DD`)
- Column headers must match exactly, including the `**bold**` markers
- Change History cell must not be empty
- Add a new row for every version bump, including typo fixes

The version in `ReleaseNotes.md` must match the version in `SolutionMetadata.json`, `Data/Solution_*.json`, and the Package zip filename.

#### Add your logo

Place your logo at `Logos/<YourProductName>.svg` in the root of the repository. Reference it in `Data/Solution_<YourSolutionName>.json` using an HTML `<img>` tag pointing to the raw GitHub URL:

```json
"Logo": "<img src=\"https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/Logos/YourProductName.svg\" width=\"75px\" height=\"75px\">"
```

The SVG file must meet the following requirements:

| Check | Requirement |
|---|---|
| File format | `.svg` extension only. PNG, JPEG, or other formats aren't allowed. |
| File size | ≤ 5 KB |
| `style=` attribute | Not allowed. Remove all inline `style="..."` attributes from elements. |
| `cls=` attribute | Not allowed |
| `xmlns:xlink` namespace | Not allowed. Remove from the `<svg>` root element. |
| `data-name` attribute | Not allowed. Illustrator adds these attributes as layer names. They must be removed. |
| `xlink:href` | Not allowed. Use inline SVG paths instead of embedded image references. |
| `<title>` tag | Not allowed. Remove any `<title>...</title>` elements. |
| Embedded PNG | Not allowed. Any `<image>` elements referencing `.png` files are rejected |
| Element `id` values | If any `id="..."` attributes are present, every value must be a valid UUID (for example, `id="a1b2c3d4-e5f6-4789-abcd-0123456789ab"`). Human-readable IDs like `id="Layer_1"` fail. All IDs must be unique within the file. |

> [!CAUTION]
> SVG files exported directly from Adobe Illustrator, Figma, or Inkscape without cleanup almost always fail validation. Common export artifacts that must be removed include the following:
> - `style="stroke: none; fill: rgb(0,0,0); ..."` on every element: replace with direct `fill` and `stroke` attributes, or remove if default
> - `data-name="Layer 1"`: Illustrator layer name attribute; remove from every `<g>` element
> - `xmlns:xlink="http://www.w3.org/1999/xlink"`: On the `<svg>` root; remove the entire attribute
> - `<title>Layer 1</title>`: Inside the first `<g>`; remove the tag
> - Non-GUID IDs like `id="Layer_1"` or `id="cls-1"`: Replace with a UUID or remove the `id` attribute entirely if it isn't referenced

A clean logo uses only `fill` and `stroke` attributes directly on path elements, with no `id` attributes unless referencing a `<defs>` element. For a minimal valid example, see [`Logos/XBOW.svg`](https://github.com/Azure/Azure-Sentinel/blob/master/Logos/XBOW.svg).

#### Build a data connector

If you're building a connector using the AI agent workflow, see [Create custom connectors using AI agent in Microsoft Sentinel](create-custom-connector-builder-agent.md) instead of following the steps below.

##### Choose your connector type

Microsoft Sentinel supports several connector types, many of which use the Codeless Connector Framework (CCF). Choose the one that best fits your data source and desired customer experience.

| Connector type | Best for | Guidance |
|---|---|---|
| **CCF polling** | REST APIs that your connector calls on a schedule. Fully SaaS, with no agent or VM required. Includes built-in health monitoring and full Microsoft support. | [Create a codeless connector for Microsoft Sentinel](/azure/sentinel/create-codeless-connector) |
| **CCF push** | Data sources that push logs to a Microsoft Sentinel endpoint. | [Microsoft Sentinel CCF push connectors (preview)](/azure/sentinel/create-push-codeless-connector) |
| **CCF blob** | Data sources that write logs to Azure Blob Storage or Azure Data Lake Storage. | [Set up the Azure Storage connector](/azure/sentinel/setup-azure-storage-connector) |
| **CCF GCP** | Data sources that write logs to Google Cloud Storage. | [GCP data connector reference](/azure/sentinel/data-connection-rules-reference-gcp) |
| **CEF** | On-premises appliances that emit Common Event Format logs. Data lands in the well-known `CommonSecurityLog` table. | [Connect CEF-formatted logs](/azure/sentinel/connect-common-event-format) |
| **Syslog** | On-premises appliances that can only emit raw Syslog. Least preferred; queries require KQL parsing. | [Collect syslog data sources](/azure/sentinel/connect-syslog) |
| **Azure Functions** *(legacy)* | REST APIs when CCF isn't viable due to technical limitations. Use only as a last resort. Contact [azuresentinelpartner@microsoft.com](mailto:azuresentinelpartner@microsoft.com) before building to confirm eligibility. | [Azure Functions connector template](https://github.com/Azure/Azure-Sentinel/blob/master/DataConnectors/Templates/Connector_REST_API_AzureFunctionApp_template/DataConnector_API_AzureFunctionApp_template.json) |

<!--Uncomment when the nested API polling article is published.
For advanced CCF polling scenarios such as chaining sequential API calls, see [Use nested API polling in CCF connectors for Microsoft Sentinel](/azure/sentinel/ccf-nested-api-polling).-->

##### Build the connector definition

Detailed build steps are specific to each connector type. Detailed build steps are specific to each connector type.  Follow the guidance for your chosen type from the [connector type table](#choose-your-connector-type). . 

Use the following solutions in the Azure-Sentinel repository as references for each connector type.

| Connector type | Reference example |
|---|---|
| CCF polling | [SentinelOne CCF polling connector](https://github.com/Azure/Azure-Sentinel/tree/master/Solutions/SentinelOne/Data%20Connectors/SentinelOne_ccp) |
| CCF push | [Jamf Protect CCF push connector](https://github.com/Azure/Azure-Sentinel/tree/master/Solutions/Jamf%20Protect/Data%20Connectors/JamfProtect_ccp) |
| CCF blob | [Cloudflare CCF blob connector](https://github.com/Azure/Azure-Sentinel/tree/master/Solutions/Cloudflare/Data%20Connectors/CloudflareLog_CCF) |
| CCF GCP | [Google Cloud Platform audit logs connector](https://github.com/Azure/Azure-Sentinel/tree/master/Solutions/Google%20Cloud%20Platform%20Audit%20Logs/Data%20Connectors/GCPAuditLogs_ccp) |
| CEF / Syslog | [Cisco ISE CEF and Syslog connectors](https://github.com/Azure/Azure-Sentinel/tree/master/Solutions/Cisco%20ISE/Data%20Connectors) |

When your connector JSON is complete, place it in the `Data Connectors/` subfolder of your solution folder and name it `ProviderNameApplianceName.json` (no spaces).

##### Test your connector

> [!IMPORTANT]
> Before building workbooks, analytic rules, and other content, verify that your connector is sending data to the expected table and that queries return results. It's easier to catch data flow and schema issues at this stage than after you have built dependent content on top of them. See the [Test your package](#test-your-package) section for how to package and deploy your connector to a dev workspace.

#### Build your content

In addition to the data connector, enrich your solution with SIEM content that helps customers get immediate value from your data.
Additional SIEM content includes:

- Workbooks
- Analytic rules
- Hunting queries
- Playbooks 
- Parsers

This content is optional but recommended. For minimum requirements and quality scoring, see [Microsoft Sentinel solution quality guidelines](./sentinel-siem-solution-quality-guidance.md).    

#### Create workbooks

Workbooks are dashboards and visualizations that help customers understand their data. To create a workbook, see [Create workbooks for Microsoft Sentinel](sentinel-workbook-creation.md). 

See the following reference examples in the Azure-Sentinel repository for guidance on workbook design and layout:

- [Microsoft Entra ID - AzureActiveDirectorySignins.json](https://github.com/Azure/Azure-Sentinel/blob/master/Solutions/Microsoft%20Entra%20ID/Workbooks/AzureActiveDirectorySignins.json)
- [XBOW - XBOW.json](https://github.com/Azure/Azure-Sentinel/blob/master/Solutions/XBOW/Workbooks/XBOW.json)
- [PaloAlto-PAN-OS - PaloAltoOverview.json](https://github.com/Azure/Azure-Sentinel/blob/master/Solutions/PaloAlto-PAN-OS/Workbooks/PaloAltoOverview.json)


#### Create analytic rules

Analytic rules are templates that detect threats in your data. Each rule is a YAML file. To create an analytic rule, see [Create analytic rules for Microsoft Sentinel](sentinel-analytic-rules-creation.md).

See the following reference examples in the Azure-Sentinel repository for guidance on analytic rule design and layout:

- [Microsoft Entra ID - FailedLogonToAzurePortal.yaml](https://github.com/Azure/Azure-Sentinel/blob/master/Solutions/Microsoft%20Entra%20ID/Analytic%20Rules/FailedLogonToAzurePortal.yaml)
- [CrowdStrike Falcon - CriticalOrHighSeverityDetectionsByUser.yaml](https://github.com/Azure/Azure-Sentinel/blob/master/Solutions/CrowdStrike%20Falcon%20Endpoint%20Protection/Analytic%20Rules/CriticalOrHighSeverityDetectionsByUser.yaml)
- [XBOW - XbowCriticalHighFindings.yaml](https://github.com/Azure/Azure-Sentinel/blob/master/Solutions/XBOW/Analytic%20Rules/XbowCriticalHighFindings.yaml)


#### Create hunting queries

Hunting queries are templates that help customers proactively search for threats in their data. They appear in the **Hunting** blade for analysts to run manually. They share the same YAML structure as analytic rules, but are not automated; scheduled execution fields don't apply and cause a review failure if included. To create a hunting query, see [Create hunting queries for Microsoft Sentinel](sentinel-hunting-rules-creation.md).

See the following reference examples in the Azure-Sentinel repository for guidance on hunting query design and layout:

- [Okta Single Sign-On - AdminPrivilegeGrant.yaml](https://github.com/Azure/Azure-Sentinel/blob/master/Solutions/Okta%20Single%20Sign-On/Hunting%20Queries/AdminPrivilegeGrant.yaml)
- [PaloAlto-PAN-OS - Palo Alto - potential beaconing detected.yaml](https://github.com/Azure/Azure-Sentinel/blob/master/Solutions/PaloAlto-PAN-OS/Hunting%20Queries/Palo%20Alto%20-%20potential%20beaconing%20detected.yaml)
- [Azure Firewall - Azure Firewall - First Time Source IP to Destination Using Port.yaml](https://github.com/Azure/Azure-Sentinel/blob/master/Solutions/Azure%20Firewall/Hunting%20Queries/Azure%20Firewall%20-%20First%20Time%20Source%20IP%20to%20Destination%20Using%20Port.yaml)

#### Create playbooks

Playbooks are automated response workflows that help customers respond to threats in their data. Each playbook is an Azure Logic Apps workflow exported as an ARM template. The two required files are `azuredeploy.json` and `readme.md`, placed in `Solutions/<YourSolutionName>/Playbooks/<PlaybookName>/`. To create a playbook, see [Create playbooks for Microsoft Sentinel](sentinel-playbook-creation.md).

See the following reference examples in the Azure-Sentinel repository for guidance on playbook design and layout:

- [Microsoft Entra ID - Block-AADUser (incident + alert + entity triggers)](https://github.com/Azure/Azure-Sentinel/tree/master/Solutions/Microsoft%20Entra%20ID/Playbooks/Block-AADUser)
- [CrowdStrike Falcon - CrowdStrike_Base (Key Vault + base playbook pattern)](https://github.com/Azure/Azure-Sentinel/tree/master/Solutions/CrowdStrike%20Falcon%20Endpoint%20Protection/Playbooks/CrowdStrike_Base)
- [Okta Single Sign-On - OktaCustomConnector (custom connector ARM template)](https://github.com/Azure/Azure-Sentinel/tree/master/Solutions/Okta%20Single%20Sign-On/Playbooks/OktaCustomConnector)


#### Create parsers

A parser is a Kusto function saved to your Log Analytics workspace that sits in front of raw log data and normalizes it into clean, queryable fields. Instead of writing field extraction logic in every query, customers call the parser alias once and get structured results. Parsers are defined as YAML files and deployed automatically when a customer installs your solution. To create a parser, see [Create parsers for Microsoft Sentinel](sentinel-parsers-creation.md).

See the following reference examples in the Azure-Sentinel repository for guidance on parser design and layout:

- [Cloudflare CCF - Cloudflare.yaml](https://github.com/Azure/Azure-Sentinel/blob/master/Solutions/Cloudflare%20CCF/Parsers/Cloudflare.yaml)
- [CrowdStrike Falcon - CrowdStrikeReplicatorV2.yaml](https://github.com/Azure/Azure-Sentinel/blob/master/Solutions/CrowdStrike%20Falcon%20Endpoint%20Protection/Parsers/CrowdStrikeReplicatorV2.yaml)


## Test your package

Testing follows the **package → deploy → enable → validate** cycle. The cycle is the same regardless of how much content you've built. The V3 packaging tool converts your solution files into a deployable ARM template (`mainTemplate.json`). Deploy the template to a Microsoft Sentinel development workspace, enable each content type, and confirm it works before submitting a PR.

Repeat this cycle as you build. You don't need to finish all content types before you start testing. Package and deploy as you complete each content type, verify it works, then add more content and repackage.

If your solution includes a data connector, test the connector first before building dependent content like analytic rules and workbooks. All SIEM content depends on data flowing into the right tables with the correct schema. If the connector isn't working or the schema doesn't match what your rules expect, you'll need to rework the dependent content. Make sure the data is flowing first to save time.

> [!NOTE]
> **CCF polling connectors only:** Before packaging, you can validate your connector polling configuration without deploying to a live workspace. In the Microsoft Sentinel extension for Visual Studio Code, right-click your connector definition file and select **Test Connector**. See [Step 4: Validate the connector configuration](/azure/sentinel/create-custom-connector-builder-agent#validate-the-connector-configuration) for details.

## Package your solution

After you've developed and tested your Microsoft Sentinel solution components, packaging is the next critical step in the solution lifecycle. The packaging tool consolidates all your solution content—data connectors, parsers, workbooks, analytic rules, hunting queries, Azure Logic apps custom connectors, and playbooks—into a standardized format for deployment. For more information, see [Package a SIEM solution for Microsoft Sentinel](package-siem-solutions-overview.md).

## Go to market

When you select **Go live**, the solution goes through a final certification check before becoming publicly available. After certification, the solution is listed in the **Microsoft Sentinel content hub** and visible in every customer tenant's Sentinel workspace under **Content hub**. It'ss also discoverable in the **Azure Marketplace**. The solution is now available to all Microsoft Sentinel customers. For more information, see [Publish SIEM solutions to Microsoft Sentinel](publish-sentinel-solutions.md).

From this point, any update to the solution, such as content changes, bug fixes, and version bumps requires a new GitHub PR, a new package version, and a new Partner Center submission with the updated zip. For tracking post-publish status and support issues, see [Track your solution after publishing in Partner Center](sentinel-solutions-post-publish-tracking.md).

## Related content

- [Package a SIEM solution for Microsoft Sentinel](package-siem-solutions-overview.md).
- [Create a codeless connector for Microsoft Sentinel](create-codeless-connector.md)
- [Microsoft Sentinel solutions catalog](https://aka.ms/sentinelsolutionscatalog)
- [General contribution guidelines for Microsoft Sentinel](https://github.com/Azure/Azure-Sentinel#contribution-guidelines)