---
title: Package a SIEM solution for Microsoft Sentinel
description: Learn how to package a SIEM solution for Microsoft Sentinel.
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

# Package a SIEM solution for Microsoft Sentinel

After you've developed and tested your Microsoft Sentinel solution components, packaging is the next critical step in the solution lifecycle. The packaging tool consolidates all your solution content—data connectors, parsers, workbooks, analytic rules, hunting queries, Azure Logic apps custom connectors, and playbooks—into a standardized format for deployment. This automated packaging process generates the necessary ARM templates and configuration files, validates the package structure, and prepares your solution artifact for submission to Partner Center. Packaging ensures your solution is properly formatted, complete, and ready for customers to deploy into their Sentinel environments.


## Package your solution

The packaging tool provides an easy way to generate your solution package in an automated manner and validates the generated package. You can package different types of Microsoft Sentinel content that includes a combination of data connectors, parsers, workbooks, analytic rules, hunting queries, Azure Logic apps custom connectors, and playbooks.

The V3 package creation tool produces the following files:
- `mainTemplate.json` A single ARM template combining all solution content
- `createUIDefinition.json` The content hub install wizard definition
- A versioned `.zip` of the two files. This is the artifact you submit to Partner Center.

From the repository root in PowerShell:

```powershell
cd Tools\Create-Azure-Sentinel-Solution\V3
.\createSolutionV3.ps1
```

The script prompts you for the path to your `Data/` folder (for example `C:\GitHub\Azure-Sentinel\Solutions\<YourSolutionName>\Data`). See the [solutions packaging tool guidance](https://github.com/Azure/Azure-Sentinel/blob/master/Tools/Create-Azure-Sentinel-Solution/V3/README.md) for full details.

> [!NOTE]
> ARM-TTK runs as part of packaging. You might see one expected failure: **IDs Should Be Derived From ResourceIDs**. This is a known false positive from Sentinel-specific resource ID patterns that ARM-TTK doesn't recognize. All other ARM-TTK checks must pass.

## Deploy and enable

Deploy `mainTemplate.json` to your dev/test Microsoft Sentinel workspace using the Azure portal:

1. In the [Azure portal](https://portal.azure.com), search for **Deploy a custom template** and select it.
1. Select **Build your own template in the editor**, paste the contents of `mainTemplate.json`, and save.
1. Fill in the parameters. Select your subscription, resource group, and the workspace where Microsoft Sentinel is deployed.
1. Select **Review + create**, then **Create**.

You can also deploy via Azure CLI:

```bash
az deployment group create \
  --resource-group <your-resource-group> \
  --template-file Package/mainTemplate.json \
  --parameters workspaceName=<your-workspace-name> location=<your-location>
```

After the deployment completes, enable and exercise each content type in order:

1. **Data connector** Go to **Data Connectors**, find your connector, open the connector page, and enable it. Follow the configuration steps to start sending data to your workspace.

1. **Verify data ingestion** After enabling the connector, query your table to confirm records are arriving:

   ```kql
   <YourTable_CL>
   | take 10
   ```

   Initial ingestion can take up to 30 minutes. If no data appears, check the connector status page and review any error messages before continuing.

1. **Analytic rules** Go to **Analytics**, find your rules under **Rule templates**, and enable them. Confirm the rules generate alerts or incidents with your test data.

1. **Hunting queries** Go to **Hunting**, find your queries, and run them against your ingested data. Confirm results are returned and entity mappings surface correctly.

1. **Playbooks** Deploy any playbooks, authorize the Logic App connections, and attach to an automation rule or analytics rule. Trigger a test incident to verify end-to-end execution.

1. **Workbooks** Go to **Workbooks**, find your workbook template, and save an instance. Confirm all visualizations populate with your ingested data.

1. **Parsers**  Run the parser function alias directly in Log Analytics to confirm field extraction is correct:

   ```kql
   <YourParserAlias>
   | take 10
   ```

Use Sentinel health monitoring to observe connector activity and diagnose ingestion issues. Go to **Settings** > **Health** or query the `SentinelHealth` and `SentinelAudit` tables. See [Auditing and health monitoring in Microsoft Sentinel](/azure/sentinel/health-audit) for details.

### Run local validations

Two types of checks help you get through a PR successfully. 
+ The local validation script runs automated checks against your solution files and catches most structural and schema issues before you open a PR. 
+ The [pre-submission checklist](#pre-submission-checklist) covers manual checks, for example, verifying your connector description is meaningful, links resolve, and your table schema is locked. These are checks that the local validation script can't evaluate on your behalf. Run both before submitting.

Run the local validation suite from the repository root:

**Prerequisites (first time only):**

```powershell
npm install
npm run tsc
```

**Run validations against your branch changes:**

```powershell
# From the repository root — auto-diffs your branch against main/master
node .script/local-validation/validate.js

# Or validate everything in your solution folder regardless of git status
node .script/local-validation/validate.js --path "Solutions/<YourSolutionName>"
```

| Area | Validation scope |
|---|---|
| JSON and YAML files | Syntax validity in all solution files |
| Data connector | Schema structure, `id` uniqueness, data type name format, permissions block match against connector type template |
| Logo | SVG format, file size ≤5 KB, no illegal attributes, GUID-format element IDs |
| Workbook | `fromTemplateId` and `$schema` fields present, `WorkbooksMetadata.json` schema, unique keys, matching preview image filenames |
| Playbook | ARM template schema, `PlaybookName` parameter present, metadata block present |
| Solution metadata | Valid `categories.domains`, support object, branding |
| Analytic rules and hunting queries | YAML schema structure, KQL syntax, non-ASCII characters |
| ARM templates | ARM-TTK best practices (same checks run by GitHub CI) |

Fix all failures before opening your PR. Failures in this step appear as failed CI checks and block the merge.

### Pre-submission checklist

Before opening a PR, confirm each applicable item below.

#### Verify solution packaging

Verify that your solution package is complete, correct, and ready for submission. The following checks are required for every solution submission.

**Versioning and naming**

- Package version and package zip filename are the same (for example, `3.1.0.zip` for version `3.1.0`).
- Version is incremented from the previous release and is the same in `SolutionMetadata.json`, `Data/Solution_*.json`, `ReleaseNotes.md`, and the package zip filename.
- `offerId` and `publisherId` in `SolutionMetadata.json` and `mainTemplate.json` are lowercase and match your Partner Center offer exactly.
- `ReleaseNotes.md` entry is present for this version with correct format. See [Release notes](develop-siem-solutions-overview.md#create-the-solution-packaging-files) for the required column headers and date format.

**Content and branding**

- All text in the package uses "Microsoft Sentinel", not "Azure Sentinel". Check both `mainTemplate.json` and `createUiDefinition.json`.
- Solution name doesn't contain "MS Sentinel" or "Microsoft Sentinel" as a prefix (exception: names ending with "solution for Microsoft Sentinel" are acceptable).
- Component counts in the `createUiDefinition.json` basics section are correct and in this order: Data Connectors, Parsers, Workbooks, Analytic Rules, Hunting Queries, Watchlists, Custom Azure Logic Apps Connector, Playbooks.
- Description text in `createUiDefinition.json` is complete, grammatically correct, and includes links to the relevant product documentation that resolve correctly.
- Images referenced in `createUiDefinition.json` load correctly and are not broken.
- All `aka.ms` short links in `mainTemplate.json` and `createUiDefinition.json` resolve. Test each one before submitting.

**mainTemplate.json**

- `metadata` node is present with `"kind": "Solution"` and `"type": "Microsoft.OperationalInsights/workspaces/providers/metadata"`.
- Support information, author, and provider details are correct.
- `categories.domains` values are valid. See [solution categories](/azure/sentinel/sentinel-solutions#categories-for-microsoft-sentinel-out-of-the-box-content-and-solutions).
- Content schema version in `mainTemplate.json` is `3.0.0`.
- The zip doesn't contain files from an older package version. Verify the zip contents before submitting.
- Validate `mainTemplate.json` using [Custom deployment](https://portal.azure.com/#create/Microsoft.Template) in the Azure portal to catch ARM template errors before submitting.

**createUiDefinition.json**

- Validate using the [Create UI Definition Sandbox](https://portal.azure.com/#view/Microsoft_Azure_CreateUIDef/SandboxBlade) to confirm the install wizard renders correctly.

**CI registrations**

- Every custom log table (`*_CL`) referenced in rules, queries, or parsers has a schema JSON in [`.script/tests/KqlvalidationsTests/CustomTables/`](https://github.com/Azure/Azure-Sentinel/tree/master/.script/tests/KqlvalidationsTests/CustomTables) . KQL validation fails with "The name 'YourTable_CL' doesn't refer to any known table" if the schema is missing or malformed.
- Your connector `id` is registered in [`.script/tests/detectionTemplateSchemaValidation/ValidConnectorIds.json`](https://github.com/Azure/Azure-Sentinel/blob/master/.script/tests/detectionTemplateSchemaValidation/ValidConnectorIds.json) This is required for analytic rules and hunting queries to pass schema validation.
- `WorkbooksMetadata.json` at the repo root has an entry for your workbook.

**If updating an existing solution**

- Confirm that no existing content is accidentally overridden. If you rebased or pulled latest, review the diff carefully before submitting.
- If an Azure Functions connector already exists and you're adding a CCF connector, don't remove the Azure Functions connector without explicit confirmation from the Connector team. Removing it might break existing customers.

#### Verify the logo

Verify that your logo meets the requirements.

- Logo meets all file and SVG requirements.For more information, see [Add your logo](develop-siem-solutions-overview.md#add-your-logo).
- The logo renders cleanly at 75×75 px. Preview it at that size before submitting.

#### Verify the data connector

Verify that your connector JSON meets the requirements.

**File and naming**

- JSON filename is `ProviderNameApplianceName.json` without any spaces
- `id` field matches the filename base for example, file `ContosoFW.json` → `id: "ContosoFW"` There must be no spaces and it must be unique among all connectors in the repo.
- `title` is the provider and appliance name with spaces for example, `"Contoso Firewall"`.
- `publisher` is the provider/vendor name
- Verify the provider and appliance names are current Companies and products are often renamed or acquired so confirm the names are still accurate before submitting.

**Description and instructions**

- `descriptionMarkdown` meaningfully explains what data the connector brings in, in what format, and links to the vendor's product documentation — a generic description will be flagged during review
- Instruction steps are customized for the specific product. They shouldn't be placeholder text from the template
- All instruction steps are grammatically correct and spell-checked
- All URLs in the connector JSON resolve, including any `aka.ms` short links. Broken links are one of the most common blockers in PR review. Verify every link works before submitting

**Data types**

- Data type names follow the correct format for your connector type and have no spaces in `DATATYPE_NAME`:
  - CEF: `CommonSecurityLog (DATATYPE_NAME)`
  - Syslog: `Syslog (DATATYPE_NAME)`
  - REST API (CCF or Azure Functions): `DATATYPE_NAME_CL`
- `DATATYPE_NAME` represents the provider, appliance, and optionally the data category. It should be descriptive, not generic.

**Permissions**

- `permissions` block matches the relevant connector type template exactly. Compare property by property against [DataConnectors/Templates/](https://github.com/Azure/Azure-Sentinel/tree/master/DataConnectors/Templates). Don't add, remove, or modify individual properties.

**KQL**

- Every `graphQuery`, `connectivityCriteria`, and `sampleQuery` entry runs without errors in Log Analytics against your data.

**Metadata**

- `metadata` block is present in the connector JSON
- `metadata.id` is a GUID. Generate a GUID with `[guid]::NewGuid()` in PowerShell and confirm it doesn't already exist anywhere in the repo.
- `metadata.support` includes either an `email` or a `link` attribute.

**Parser dependency**

- If the connector depends on a parser for customers to query the data as is required for Syslog and CEF and applies to any connector type where raw data isn't directly queryable, the parser YAML is in `Solutions/<Name>/Parsers/`, and the connector JSON references it in both `instructionSteps` notes and `additionalRequirementBanner` with a link to the Kusto function.

**Additional checks for Azure Functions connectors**

- `azuredeploy_DataConnector_API_AzureFunctionApp_template.json` is present in `Data Connectors/`.
- `run.ps1` or `run.py` and all supporting files are present.
- A `.zip` of all Function App files is present; Python function zips must include a `.python_packages` folder.
- The `FunctionName` parameter has both `minLength` and `maxLength` properties
- The ARM template doesn't contain a `Microsoft.Web/sites/hostNameBindings` resource. Remove it if present.
- The encoded Azure Deploy URL in the connector JSON works end to end through the Azure portal deploy experience.
- The function script runs without syntax errors.

#### Verify workbooks

Verify that your workbook JSON meets the requirements.

**WorkbooksMetadata.json entry**

- `WorkbooksMetadata.json` at the repo root has a new entry for this workbook. A missing or malformed entry blocks merge.
- `workbookKey` is unique. No existing entry in the file uses the same key.
- `description` is filled in and is grammatically correct.
- `logoFileName` points to your SVG logo file; the logo file is included in the PR and passes the [logo checklist](#verify-the-logo).
- `dataTypesDependencies` lists all tables the workbook queries: `"CommonSecurityLog"` for CEF connectors, `"Syslog"` for Syslog connectors, `"DATATYPE_CL"` for custom log connectors. Multiple types are valid, for example, `["CommonSecurityLog", "Contoso_CL"]`.
- `dataConnectorsDependencies` matches the `id` field in your connector JSON exactly. Multiple connectors are valid, for example, `["ContosoFW", "ContosoCloud"]`.
- `previewImagesFileNames` lists the preview image filenames; each file is present in `Solutions/<Name>/Workbooks/Images/Preview/` and the filenames match exactly what is in the metadata.
- `version` field is present; if this is an update to an existing workbook, the version is incremented.
- `title` is the display name shown in the Workbooks gallery. Parentheses in the title aren't allowed.
- `templateRelativePath` matches the actual workbook JSON filename, for example, `"ContosoFirewall.json"`.
- `provider` is your company/vendor name.
- `WorkbooksMetadata.json` is valid JSON. Validate with a JSON linter before submitting. A trailing comma or duplicate key causes an immediate build failure.

**Preview images**

- At least one dark-background and one light-background screenshot are included.
- Images are PNG format.
- Dark background filenames contain `"Black"`, for example, `ContosoFirewallBlack.png`; light background filenames contain `"White"`, for example, `ContosoFirewallWhite.png`.
- Multiple screenshots per theme are numbered with a suffix: `ContosoFirewallBlack1.png`, `ContosoFirewallBlack2.png`.

**Workbook content**

- All queries in the workbook run without KQL syntax errors.
- The workbook has at least 4 charts or visualizations.
- The workbook JSON file is in `Solutions/<YourSolutionName>/Workbooks/`, not in the root `Workbooks/` folder.
- After packaging, confirm `createUiDefinition.json` references the workbook filename as a static string, not a dynamic ARM expression like `[steps('workbooks').workbook1.workbook1-name]`.
- All `aka.ms` short links in the workbook resolve. Verify each one before submitting.
- If the workbook requires a parser, include a note in the workbook description or instruction text telling customers to deploy the parser and save it as a function named `<FunctionName>`. Without this note, workbook queries that reference the function alias fail.
- If the workbook uses `ThreatIntelligenceIndicator`, follow the TI Matching guidelines in addition to these criteria.

#### Verify analytic rules

Verify that your analytic rule YAML meets the requirements.

- `id` is a GUID. Search the repo to confirm it doesn't already exist before submitting.
- `requiredDataConnectors[].connectorId` matches the `id` in your connector JSON exactly.
- Each entry in `relevantTechniques` belongs to at least one of the listed `tactics`.
- `entityMappings` is present with at least one mapping.
- There's no `metadata` block. Remove it if the rule was copied from a standalone rule in `Detections/`.

#### Verify hunting queries

Verify that your hunting query YAML meets the requirements.

**Structure and fields**

- File extension is `.yaml`, not `.yml`.
- `id` is a GUID and doesn't already exist in the repo.
- No analytic rule-specific fields are present: `kind`, `severity`, `queryFrequency`, `queryPeriod`, `triggerOperator`, `triggerThreshold`, `alertDetailsOverride`, `eventGroupingSettings`.
- There's no `metadata` block Remove it if the query was copied from a standalone query in `Hunting Queries/`; if submitting standalone content outside a solution, the `metadata.source.kind` must be `"Community"`.

**Name and description**

- `name` is 50 characters or fewer.
- `name` matches or is very close to the filename.
- `description` reflects the actual intent of the query, not a copy of the name, and not placeholder text.
- `description` is 255 characters or fewer.
- `description` includes references or links where applicable, for example, vendor documentation, MITRE technique page.

**Tactics and techniques**

- At least one `tactics` entry is present.
- At least one `relevantTechniques` entry is present; include sub-technique designations where applicable, for example, `T1078.004` not just `T1078`.
- Each technique belongs to at least one of the listed tactics.

**Required data connectors**

- `requiredDataConnectors[].connectorId` matches the `id` in your connector JSON exactly.
- All data types queried in the KQL are listed in `requiredDataConnectors[].dataTypes`.
- If the query uses a custom table (`*_CL`), a schema JSON for that table is present in [`.script/tests/KqlvalidationsTests/CustomTables/`](https://github.com/Azure/Azure-Sentinel/tree/master/.script/tests/KqlvalidationsTests/CustomTables).

**Query quality**

- Query runs without errors against your ingested data
- Query doesn't include a hardcoded time filter. The Hunting blade injects the analyst's selected time range at runtime.
- `StartTime` and `EndTime` are used in `summarize` to surface time bounds in results (not `StartTimeUtc`/`EndTimeUtc`).
- `summarize` includes `count()` or `dcount()` where appropriate.
- `project` or `summarize` output is limited to contextual fields. Don't surface every raw column.
- Use `has` instead of `contains` where possible. `has` is index-aware and faster on large tables. Only use `contains` when a substring match is genuinely required.
- Use case-insensitive operators (`=~`, `in~`, `!~`) where appropriate.
- Parameterize repeated values using `let` statements where appropriate.
- Review the query against the [Query Style Guide](https://github.com/Azure/Azure-Sentinel/wiki/Query-Style-Guide) before submitting.
- All `aka.ms` short links resolve. Verify each one before submitting.
- **If the query uses `ThreatIntelligenceIndicator`:** follow the TI Matching guidelines in addition to these criteria.

#### Verify playbooks

Verify that your playbook ARM template and readme meet the requirements.

- `readme.md` has all required sections: title and description, Quick Deployment buttons, Prerequisites (write `None` if there are none), Post-deployment steps, Screenshots
- Workflow resource `name` is `"[parameters('PlaybookName')]"`, not hardcoded
- All connection variable names are derived from `PlaybookName` using `concat()`
- ARM template `$schema` is the `2019-04-01` deployment template URI
- No hardcoded subscription IDs, tenant IDs, or resource group names
- `metadata.releaseNotes` array is present in the workflow resource

#### Verify parsers

Verify that your parser YAML meets the requirements.

- `Function.Version` and `Function.LastUpdated` are quoted strings, for example  `'1.0.0'` not `1.0.0`, `'2026-06-15'` not `2026-06-15`.
- Sample data is available for testing the parser in a dev workspace.
- The parser deploys without errors to Log Analytics as a Kusto function.
- Running the parser against sample data returns results with the expected fields populated. If you're using custom log ingestion for testing, confirm the parser still handles the actual ingestion format your connector produces.
- All `aka.ms` short links in the parser YAML resolve. Verify each one before submitting.
- If the parser uses `ThreatIntelligenceIndicator`, follow the TI Matching guidelines in addition to these criteria before submitting.
- If the parser maps to an ASIM schema (optional but recommended), relevant source fields are mapped to the correct ASIM schema columns, and both the parameter-less (`ASim<Schema><Product>.yaml`) and parameterized (`vim<Schema><Product>.yaml`) variants are registered in the corresponding unifying parser under `Parsers/ASim<Schema>/`.

### Open a GitHub pull request

When your solution is tested, local validations pass, and you've verified end-to-end data flow, commit your files and open a pull request from your fork against the `master` branch of the Azure-Sentinel repository. If you haven't forked and cloned the repository and created a branch, see [Fork and clone the repository](develop-siem-solutions-overview.md#fork-and-clone-the-repository) in the Provision your environment section.

#### Commit your files

Stage and commit all solution files from the repository root. For a new solution, this includes:

```powershell
git add Solutions/<YourSolutionName>/
git add Logos/<YourLogo>.svg
git add Solutions/<YourSolutionName>/Package/

# If adding custom table schemas or connector ID registration:
git add .script/tests/KqlvalidationsTests/CustomTables/<YourTable_CL>.json
git add .script/tests/detectionTemplateSchemaValidation/ValidConnectorIds.json

git commit -m "Add <YourSolutionName> solution"
git push origin <your-branch-name>
```

#### What to include in your PR

Your PR must contain all of the following:

- All solution content files under `Solutions/<YourSolutionName>/`
- Your logo SVG in `Logos/`
- The packaged solution under `Solutions/<YourSolutionName>/Package/` (`mainTemplate.json`, `createUIDefinition.json`, and the `.zip`)
- Any custom table schema files added to `.script/tests/KqlvalidationsTests/CustomTables/`
- Your connector `id` added to `.script/tests/detectionTemplateSchemaValidation/ValidConnectorIds.json`

#### PR description

Open the PR against `Azure:master`. The PR template has required fields. Fill them out before submitting. Delete the guidance block (the section between the dashed lines) before you submit:

```markdown
Change(s):
- Added <YourSolutionName> solution with data connector, analytic rules, and workbook.

Reason for Change(s):
- New solution for <Your Product> integration with Microsoft Sentinel.

Version updated:
- Yes — <version>

Testing Completed:
- Yes — deployed mainTemplate.json to dev workspace, confirmed data ingestion in <YourTable_CL>, analytic rules active, workbook loads.

Checked that the validations are passing and have addressed any issues that are present:
- Yes — ran local validation suite, all checks pass.
```

#### CI checks and manual review

When you open the PR, automated CI checks run against your files. Review any failures in the **Checks** tab and push fixes to your branch. Ensure local validation passes before opening the PR — CI failures on submission delay the review queue.

After CI checks pass, a Microsoft Sentinel team member will review your PR within **five business days** of initial submission. Any findings are left as comments on the PR. After you push fixes, follow-up reviews are completed within **two business days**.

The review might include:

- Technical feedback on connector configuration, schema, or content quality
- Requests to update metadata, fix broken links, or correct formatting
- Questions about the data source or connector behavior

The PR is approved and merged to `master` after the full review is successful.

> [!IMPORTANT]
> The package you submit for Marketplace certification must exactly match the content in the GitHub `master` branch. Don't submit to Partner Center until your PR is approved and merged.

## Publish

After your PR is merged to `master`, create and configure your offer in [Microsoft Partner Center](https://partner.microsoft.com/) to make the solution available in the marketplace.

**Prerequisites before starting:**
- PR merged to `master` and package available at `Solutions/<YourSolutionName>/Package/` on the `master` branch
- Commercial marketplace account in Partner Center. Sign up early. Don't wait until the solution is ready. See [Create a commercial marketplace account in Partner Center](/partner-center/account-settings/create-account#create-a-partner-center-account-and-enroll-in-the-commercial-marketplace).

**Create the offer:**

1. In Partner Center, select **Marketplace offers** > **New offer** > **Azure application**.
1. Set the **Offer ID** to match the `offerId` in your `SolutionMetadata.json`, for example, `azure-sentinel-solution-<yourproduct>`. This can't be changed after creation.
1. Select your **Publisher ID** . It  must match `publisherId` in `SolutionMetadata.json`.

**Key offer configuration:**

| Tab | What to fill in |
|---|---|
| Offer setup | Alias (use `<Company> <Product> for Microsoft Sentinel`); leave Test Drive unchecked |
| Properties | Primary category: **Security**; Application type: Default |
| Offer listing | Name, short description, full description include content count and prerequisites, search keywords. It must include GUID **`f1de974b-f438-4719-b423-8bf704ba2aef`** or the solution won't appear in Sentinel; privacy policy link; screenshots of workbooks |
| Preview audience | Add Azure Subscription IDs for preview testers (see Preview phase below) |
| Plan overview | Plan type: **Solution template**; Azure regions: **Azure Global**; Plan visibility: **Public**, not hidden. A hidden plan doesn't appear in the content hub |
| Technical configuration | Version: must match your package version; Package file: upload the `<version>.zip` from your `Package/` folder |

For full field-by-field guidance, see [Publish a Microsoft Sentinel solution](/azure/sentinel/publish-sentinel-solutions).

## Preview

After submitting the offer in Partner Center, your solution enters **Preview** before going live to all customers. In this phase, the solution is available only to the Azure subscription IDs you added in the **Preview audience** tab.

Use the preview period to:
- Install the solution from the marketplace in your test subscriptions and validate the full customer install experience
- Confirm that the `mainTemplate.json` deploys cleanly, all content appears in the Sentinel blades, and the connector connects successfully
- Share with select design partner customers using their subscription IDs for early feedback

After you and any preview customers have validated the solution, select **Go live** in Partner Center to move to Go to Market.


## Related content

- [Develop a Microsoft Sentinel solution](develop-siem-solutions-overview.md)
- [Create a codeless connector for Microsoft Sentinel](/azure/sentinel/isv/create-codeless-connector)
- [Microsoft Sentinel solutions catalog](https://aka.ms/sentinelsolutionscatalog)
- [General contribution guidelines for Microsoft Sentinel](https://github.com/Azure/Azure-Sentinel#contribution-guidelines)