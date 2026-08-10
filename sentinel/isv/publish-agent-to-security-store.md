---
title: How to publish a Microsoft Security Copilot Agent
description: Learn how to package, configure, and publish a Microsoft Security Copilot agent to the Microsoft Security Store and make it available to customers.
ms.author: edbaynash
author: EdB-MSFT
ms.reviewer: smarapareddy
ms.date: 06/29/2026
ms.topic: how-to
ms.service: microsoft-sentinel
ms.subservice: sentinel-platform
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1012

#customer intent: As an ISV developer, I want to publish my Security Copilot agent to the Microsoft Security Store so that customers can discover and deploy my security investigation agent.
---

# Publish your Microsoft Security Copilot agent to the Microsoft Security Store

Package and publish your Microsoft Security Copilot agent to the Microsoft Security Store. After building and testing your agent, you'll create a deployment package, configure your offer in Microsoft Partner Center, and submit it for review and certification.

This article is part of a series that walks you through [ingesting test data to the data lake](ingest-sample-data.md), [developing an agent](build-agent-security-copilot.md) and [publishing](publish-agent-to-security-store.md) the example *IdentityDrift* platform solution. The solution includes a Security Copilot agent that correlates identity, endpoint, and cloud security signals to automate threat investigations.

## Prerequisites

- A working Security Copilot agent
- Microsoft Partner Center account

## Publishing overview

Publishing process follows the following flow:

1. Agent Development
1. Create Deployment Package (.zip)
1. Create SaaS Offer in Partner Center
1. Configure Offer Metadata & Listing
1. Review and publish
1. Live in Security Store

## Create the deployment package

Create a deployment package for your agent that includes the required manifest files. 

### Prepare your package structure

Create a folder structure for your agent with the following layout:

```
agent-package/
├── PackageManifest.yaml (required)
└── YourAgentName/
    └── AgentManifest.yaml (required)
```

### Create PackageManifest.yaml

The manifest file describes your package structure and contents. Create `PackageManifest.yaml` in the root:

```yaml
manifest:
  - id: "IdentityDriftInvestigationAgent"
    description: "Agent to investigate Identity Threats"
    type: CopilotAgent
schema:
  version: "1.0.0"
```

**Key fields:**

- `id`: Name of your Security Copilot Agent (with no spaces)
- `type`: `CopilotAgent` for Security Copilot agents (other types: `SentinelLake` (for notebooks))

### Download agent manifest

The `AgentManifest.yaml` is exported from Microsoft Security Copilot after building and running your agent. Download it from [Security Copilot](https://securitycopilot.microsoft.com) under the agent **Build** tab and select the agent.

:::image type="content" source="./media/publish-agent-to-security-store/download-agent-manifest.png" alt-text="Screenshot of the Security Copilot agent Build tab showing the option to download the agent manifest." lightbox="./media/publish-agent-to-security-store/download-agent-manifest.png":::


<details>
  <summary><b>Select to expand</b>: IdentityDrift-Investigation- Agent `AgentManifest.yaml` file.</summary><pre>

```yml
Descriptor:
  Name: IdentityDrift-Investigation-Agent
  Description: >-
    Investigates identity risk by correlating authentication signals, access
    telemetry, endpoint activity, and security alerts
  DisplayName: IdentityDrift-Investigation-Agent
  CatalogScope: UserWorkspace
  Enabled: true
  Prerequisites:
    - MCP.Sentinel
  Icon: ''
SkillGroups:
  - Format: Agent
    Skills:
      - Name: IdentityDrift-Investigation-Agent
        DisplayName: IdentityDrift-Investigation-Agent
        Description: >-
          Investigates identity risk by correlating authentication signals,
          access telemetry, endpoint activity, and security alerts
        Inputs:
          - Name: UserPrincipalName
            Description: User Principal Name to investigate
            DefaultValue: ''
            Required: true
        Settings:
          Instructions: >-
            1. Accept User Principal Name (UPN) Input
            Accept a User Principal Name (UPN) or identifying string as input
            from the prompt. Ensure to use that UPN throughout the analysis.
            2. Global Query Rule (MANDATORY)
            Every query MUST filter to the last 24 hours:
            | where TimeGenerated > ago(24h)
            Never use 7 days, 30 days, or "all time." Always 24h. To avoid
            oversized responses, summarize and limit outputs (do not return raw
            event dumps).
            3. Query Data Lake for CommonSecurity_ID_KQL_CL
            IMPORTANT:
            - Do NOT assume the existence of any specific columns such as
            Action, EventType, or Application
            - Use only columns that exist in the query result
            - Prefer the following safe fields when available:
              - TimeGenerated
              - SourceUserName
              - SourceIP
              - DestinationHostName
              - AdditionalExtensions
              - DeviceCustomString1

            Search CommonSecurity_ID_KQL_CL table records for events that match
            the provided user input (use SourceUserName as the identifier).

            Sample KQL Query (replace {{UserPrincipalName}}):

            CommonSecurity_ID_KQL_CL

            | where TimeGenerated > ago(24h)
                and SourceUserName has '{{UserPrincipalName}}'
            | summarize
                TotalEvents=count(),
                MFA_Approved=countif(DeviceCustomString1 has "Approved"),
                PrivilegedActions=countif(DeviceCustomString1 has "Privilege"),
                SensitiveAccess=countif(DeviceCustomString1 has "Sensitive"),
                Activities=makeset(AdditionalExtensions),
                TargetResources=makeset(DestinationHostName),
                IPs=makeset(SourceIP)
                by SourceUserName

            4. Query Data Lake SigninLogs_KQL_CL Table
            - Same user input
            - Filter last 24 hours
            - Extract:
              - Sign-in success vs failure
              - IP diversity
              - Result descriptions

            5. Query Data Lake AADRiskyUsers_KQL_CL Table

            - Same user input
            - Filter last 24 hours
            - Extract:
              - RiskLevel
              - RiskState
              - RiskLastUpdatedDateTime

            6. Query Data Lake DeviceProcessEvents_KQL_CL Table
            - Same user input
            - Filter last 24 hours

            - Identify suspicious post-authentication activity

            Guidance:
            - Remove domain from UPN to derive AccountName
            - Look for LOLBins in FileName column 
              - powershell.exe
              - cmd.exe
              - kubectl.exe
              - az.exe

            7. Query Microsoft Defender for Cloud SecurityAlert Table

            Query SecurityAlert to identify confirmed runtime threats related to
            Kubernetes or cloud workloads that may correlate with identity
            activity.

            - Alerts generated by Microsoft Defender for Cloud
            Kubernetes‑related alert types such as:
              - K8S.NODE_MalwareBlocked
              - K8S.NODE_DriftBlocked

            Guidance:

            - Filter to last 24 hours

            - Do NOT expect user identity fields in SecurityAlert

            - Extract:
              - AlertType
              - AlertSeverity
              - CompromisedEntity (ClusterName)
              - Context from ExtendedProperties

            8. Correlation & Reasoning

            Use the Sentinel Data Exploration MCP tool to correlate activity
            between CommonSecurity_ID_KQL_CL , SigninLogs_KQL_CL,
            AADRiskyUsers_KQL_CL, DeviceProcessEvents_KQL_CL and
            SecurityAlert_KQL_CL

            Match overlapping:
            - User identifiers

            - IP addresses

            - Device names

            - Authentication privilege escalation

            - Suspicious endpoint execution post authentication compromise

            9. Surface Key Insights

            Identify:

            - Risky sign-ins followed by privileged access

            - Unexpected MFA approvals

            - Access to vulnerable or high-value workloads

            - Privilege escalation preceding endpoint activity and Kubernetes
            control‑plane actions

            - Suspicious endpoint or Kubernetes tooling execution

            - Defender for Cloud alerts occurring after identity or
            control‑plane activity


            10. Provide Summary Findings

            Summarize:

            - MFA outcomes

            - Sign-in success vs failure trends

            - Identity risk posture

            - Privileged access highlights

            - Endpoint execution signals

            - Defender for Cloud security alerts and their timing


            Highlight discrepancies or noteworthy observations across identity,
            access, and endpoint telemetry.


            ### Sample Automation Flow (Short Version)

            1. Query **CommonSecurity_ID_KQL_CL** for identity access context

            2. Query **SigninLogs_KQL_CL** and **AADRiskyUsers_KQL_CL** for
            authentication and risk posture

            3. Query **DeviceProcessEvents_KQL_CL** for endpoint behavior

            4. Query **SecurityAlert_KQL_CL** for Defender for Cloud runtime
            threats

            5. Correlate all signals using Sentinel MCP and surface actionable
            security insights
        ChildSkills:
          - list_sentinel_workspaces
          - search_tables
          - query_lake
AgentDefinitions:
  - Name: IdentityDrift-Investigation-Agent
    DisplayName: IdentityDrift-Investigation-Agent
    Description: >-
      Investigates identity risk by correlating authentication signals, access
      telemetry, endpoint activity, and security alerts
    Product: IdentityDrift
    Publisher: IdentityDrift
    Settings:
      - Name: UserPrincipalName
        Description: User Principal Name to investigate
        Required: true
    Triggers:
      - Name: DefaultTrigger
        DefaultPollPeriodSeconds: 0
        ProcessSkill: IdentityDrift-Investigation-Agent.IdentityDrift-Investigation-Agent
    RequiredSkillsets:
      - MCP.Sentinel
      - IdentityDrift-Investigation-Agent
    PreviewState: Private
    PublisherSource: Custom
    AgentSingleInstanceConstraint: None
```
</pre>
</details>
  

### Best practices for AgentManifest.yaml

The Security Store review team runs a thorough validation on `AgentManifest.yaml` before approving offer. The following are the **most common failure points** observed:

- The `product` and `publisher` must be the ISV name, not generic values.
  The `product` and `publisher` fields under `AgentDefinitions` must reflect the ISV's **actual product name and company name**. Do NOT leave them as default values like `"Custom"` after downloading **AgentManifest.yaml** from [Security Copilot](https://securitycopilot.microsoft.com/).

  ```yaml
  # Incorrect - do not use generic placeholders
  AgentDefinitions:
     Product: Custom
     Publisher: Custom
  
   # Correct - use actual ISV product and publisher name
   AgentDefinitions:
     Product: Contoso ThreatOps
     Publisher: Contoso Inc.
  ```

- Settings key names must exactly match skill input names, case-sensitive with no spaces.
  If your Skill declares an input named `UserPrincipalName`, the `Settings` section under `AgentDefinitions` must use exactly `UserPrincipalName`. Don't use `User Principal Name` or `userprincipalname` or other variation. 

  ```yaml
  # Incorrect — Spaces in input names are not allowed.
  Settings:
    - Name: User Principal Name
  
  # Correct — Matches input key name exactly. No spaces, case-sensitive.
  Settings:
    - Name: UserPrincipalName
  ```

- Input fields must include a `Description` property.
  Every input/setting field must have a meaningful `Description` that helps the user understand what value to provide. Without descriptions, users hovering over input fields in Security Copilot see nothing.

- Skill names must be descriptive and not version labels or random characters.
  When defining Custom Skills in Security Copilot Agent, skill names like `"Agent v3"`, or `"Skill_01"` are rejected because they do not describe what the skill does. Name skills after their action and target, for example,`"GetSignInLogsForUser"`, `"QueryRiskyUsersTable"`, or `"CorrelateEndpointActivity"`.

- `RequiredSkillsets` must include all integrated Microsoft products.
  If your agent integrates with Microsoft Sentinel Data Exploration or other Sentinel MCP tools, add `MCP.Sentinel` to `RequiredSkillsets`. This is important not just for standards alignment. When `MCP.Sentinel` is listed, Sentinel visibly appears under the **Plugins** section in the agent run view.

  ```yaml
  RequiredSkillsets: 
   - MCP.Sentinel
  ```

- Don't hardcode time windows in KQL — use input parameters.
  KQL queries with hardcoded values such as `ago(7d)` are flagged as inflexible. Replace them with input parameters so the time window is configurable.

  ```yaml
  # Incorrect — hardcoded time window, inflexible for users and reviewers.
  Template: >-
    SigninLogs | where TimeGenerated > ago(7d) ...
  
  #  Correct — parameterized time window.
  Template: >-
    SigninLogs | where TimeGenerated > ago({{TimeRange}}) ...
  ```

- Grammar and spelling audit.
  The review team checks every text field: `Descriptor.Description`, `SkillGroups` skill descriptions, input descriptions, and `DisplayName` fields. Grammatical errors, for example using redundant phrasing like "for a specific given username",  or unnecessary capitalization, are flagged. Run a full grammar check on all YAML text fields before packaging.

### Create the ZIP package

For Windows/Linux:

```bash
cd agent-package
zip -r agent-package.zip .
```

For Mac, avoid hidden files:

```bash
cd /path/to/agent-package
zip -r agent-package.zip . -x ".*" -x "__MACOSX"
```

This command creates `agent-package.zip` while excluding:

- Hidden files (starting with `.`)
- macOS system folders (`__MACOSX`)

Verify package contents:

```bash
unzip -l agent-package.zip
```

You should see:

```
PackageManifest.yaml
YourAgentName/
YourAgentName/AgentManifest.yaml
```

## Prepare for Partner Center publication

Partner Center is the Microsoft commercial marketplace where you create your offer listing for your Security Copilot agent. Gather the following information and assets:
- Agent name and version. The name must not contain Microsoft product names.
- Agent description of 1-2 sentences describing the agent's purpose and value proposition.
- Agent tasks - a list of what the agent does.
- Agent workflow — explicit inputs and outputs with data sources and table names.
- Marketing or product page URL for the Links section.
- A PDF user guide describing how to install and use the agent from the Security Store.
- ISV Logo (216×216 px) and Agent Screenshots (1280×720 px) showing full agent execution and results.
- Webhook URL for order notifications.
- Pricing model - free or paid.
- SCU consumption estimate.

### Prepare the agent description before starting in Partner Center

The Security Store review team requires the offer description to include a structured format covering Agent Tasks, Inputs, and Outputs. The expected format is as follows:

```
[Agent name] is a security investigation agent that integrates with Microsoft Sentinel to [brief purpose statement].

Agent Tasks:
 - Task 1 (e.g., Identity threat triage)
 - Task 2 (e.g., Authentication analysis)
 - Task 3 (e.g., Cross-telemetry correlation and anomaly detection)

Agent Workflow:
Input:
 - UserPrincipalName (UPN) — the user account to investigate
 - Access to Microsoft Sentinel data lake tables (TableA_CL, TableB_CL, ...)
 - Time range used for queries: TimeGenerated > ago(24h)

 Output:
 - MFA activity summary
 - Sign-in success and failure summary with distinct IP addresses
 - User risk level and risk state summary
 - Suspicious process execution summary
 - Correlated identity-to-endpoint insights
 - Concise triage summary report with investigation-ready findings

```

Refer to existing published agents in the [Security Store](https://securitystore.microsoft.com) such as [Silverfort Identity Threat Triage Agent](https://securitystore.microsoft.com/solutions/silverfort.silverfort-scp-agent) for formatting examples.

### Measure SCU consumption

The plan description in Partner Center is required to include an SCU consumption estimate. Before creating your offer in Partner Center, run your agent 3–5 times under typical scenarios and record the SCU usage shown after each run in Security Copilot. Take the average and round up. You will add this to the plan description, for example, *"This agent typically consumes 1.0 SCU per analysis run."*

## Create and configure your offer in Partner Center

Create a new SaaS offer in Microsoft Partner Center and configure the offer metadata, listing, and technical configuration. 

### Access Microsoft Partner Center

To access Microsoft Partner Center, follow these steps:

1. Go to [Microsoft Partner Center](https://partner.microsoft.com/dashboard)
1. Sign in with your credentials
1. Navigate to **Marketplace offers**

### Create new SaaS offer or clone existing offer

To create a new offer, follow these steps:

1. Select **New offer**
1. Select **Software as a Service (SaaS)** as the offer type
1. Select **Start with a blank offer** or **Clone an existing offer**

    > [!TIP]
    > If you have an existing SaaS offer in Partner Center, clone it to reduce setup time. Cloning automatically carries forward your logo, legal documentation, privacy policy links, and other common metadata. You only need to update the Security Copilot agent specific content.

1. Enter your offer details, using these values as a reference:
   - **Offer ID:** `identity-drift-agent` (lowercase, hyphens)
   - **Alias:** `IdentityDrift Investigation Agent`
1. Select **Create**

### Configure offer setup

Set up your offer in Partner Center by filling in the required fields. For an overview see [Publish a Security Copilot Agent in Security Store](/security/store/partners/publish-a-security-copilot-agent-or-analytics-solution-in-security-store).

On the Offer setup page enter the following values:

1. **Would you like to sell through Microsoft?**, Select **Yes**
1. **Would you like to use Microsoft license management?**, Select **No**
1. **Customer leads:** Optional. Connect your CRM if desired
1. **Microsoft integrations:** Check *"My offer integrates with Microsoft Security services"*
1. Select **Save draft**

> [!IMPORTANT]
> **Enable Microsoft Security Services Integration**  
> Checking **"My offer integrates with Microsoft Security services"** is required. Without enabling this checkbox, the **"Microsoft Security services"** option won't appear in the left navigation menu of your offer. This is the section where you upload your agent package `.zip` file.

### Fill in the metadata properties

To configure metadata properties, follow these steps:

1. Go to **Properties**
1. Under **Categories:** Select **Security or Compliance** (primary category)
1. **Industries:** Leave blank
1. **Legal contract:** Choose Standard Contract or provide your own
1. Select **Save draft**

### Configure the offer listing

To fill in the offer listing, follow these steps:

1. Go to **Offer listing** in the left menu
1. Fill in the required fields as follows:

  **Search results summary** (single line):
  "Investigation agent that automates security incident investigation and response"

  **Description**: prepared earlier in a structured format outlining agent tasks, inputs, and outputs.

1. Add images:
   - Logo (216 x 216 px)
   - Screenshots (1280 x 720 px)
1. Upload the user guide under **Product information documents**
1. Select **Save draft**

### Best practices for offer setup

> [!IMPORTANT]
> **Agent names must not contain Microsoft product names.**
>  The third-party agent name in Partner Center must not contain any Microsoft product names, including `"Security Copilot"`, `"Microsoft Sentinel"`, `"Microsoft Defender"`, `"Entra"`, etc.
>
>    - Incorrect: "Contoso Security Copilot Investigation Agent" - Contains "Security Copilot"
>    - Correct: "Contoso Identity Threat Triage Agent" 
>
>   Check all locations including the offer name, the plan name, and the description text.

- **Offer listing: links and user guide.**

> [!TIP]
> The following two fields in the offer listing that are commonly missed and cause review failures:
>
>   - **Marketing/Product page link:** Under **Offer listing > Supplemental product information for customers > Product information links > Links**, add the URL to your product marketing page or documentation page.
>
>   - **User guide document:** Upload user guide PDF under **Offer listing > Supplemental product information for customers > Product information documents**. This document must include details for users to learn more about the agent and find instructions to install or use it.
>
>  For reference, see the [Silverfort Identity Threat Triage Agent User Guide](https://catalogartifact.azureedge.net/publicartifacts/silverfort.silverfort-scp-agent-fe6c572a-80dc-491c-974e-412163852c84/Artifacts/Documents/Silverfort-Identity-Threat-Triage-Agent-User-Guide.pdf)

 

- **Screenshots must show full agent execution and results.**
  Screenshots are validated by the review team. Screenshots that show only configuration screens, setup pages, or UI without a running agent are rejected. At least one screenshot must:
    - Show the agent **actively running** and returned results.
    - Show the integrated Microsoft product (e.g., **Microsoft Sentinel**) visibly listed under the **Plugins** section in the agent view
    - Screenshot resolution must be **1280×720 px**. Use [https://imageresizer.com](https://imageresizer.com) to resize if needed.

- **To get Microsoft Sentinel to appear under Plugins,**
  Add `MCP.Sentinel` to `RequiredSkillsets` in your `AgentManifest.yaml`.

### Add Microsoft Security services metadata

To configure the Microsoft Security services section, follow these steps:

1. Go to **Microsoft Security services** in left menu
1. Configure metadata as follows:

   | Field | Value |
   |-------|-------|
   | **Integrated Security services** | Microsoft Security Copilot Microsoft Sentinel (as applicable) |
   | **Product prerequisites** | Microsoft Security Copilot Microsoft Sentinel, Microsoft Defender, Microsoft Entra (as applicable)  |
   | **Solution type** | Deployable solution |
   | **License management** | Choose based on your model |

1.  Check "Security Copilot agent"

1. **Upload Solution Package:**
   - Select **Upload .zip package**
   - Select your `agent-package.zip` file
    
1. Select **Save draft**

> [!TIP]
> The **Integrated Microsoft Security Products** selection must accurately reflect what your agent actually integrates with in the description and in practice. Common mismatches that are hard fails are as follows:
>
>  - Agent description mentions Sentinel data lake queries but only "Security Copilot" is selected → Add "Microsoft Sentinel"
>  - Agent description mentions Defender alerts but "Microsoft Sentinel" is selected → Add "Microsoft Defender"
>
> The selection drives which filter the agent appears under in the Security Store (for example, users filtering by "Microsoft Sentinel" will only see agents that have Microsoft Sentinel selected here).

## Add preview audience

To add preview audience members, follow these steps:

1. Go to **Preview audience** in left menu
1. Enter Microsoft Entra IDs of internal users who will test:
   - Team members
   - QA testers
1. Select **Save draft**

## Access preview

Invited preview audience members can access the offer listing as follows:

1. Users added to preview audience can access:
   - Landing page
   - Offer listing
   - Full deployment flow
1. Share preview URL with test audience
1. Gather feedback on:
   - Listing accuracy
   - Deployment steps
   - Documentation

**Reference**: [How to preview and test your offer listing for Security Store](/security/store/preview-and-test-your-offer-listing-for-security-store)

## Technical configuration

To configure technical settings, follow these steps:

1. Go to **Technical configuration** in left menu
1. Fill in required fields:

   | Field | Value |
   |-------|-------|
   | **Landing page URL** | `https://securitystore.microsoft.com/mysolutions` |
   | **Connection webhook** | Your webhook URL for order/subscription notifications |
   | **Microsoft Entra tenant ID** | Your tenant ID |
   | **Microsoft Entra app ID** | Your app ID |

1. Select **Save draft**

Technical Configuration is mandatory and blocks submission. Partner Center will block the "Review and Publish" button if the technical configuration is not fully filled in, even if your organization does not plan to use telemetry or license management webhooks. This is a required section for all SaaS offers on the Microsoft commercial marketplace. If you are not ready to implement a webhook:

  - Use dummy/placeholder values for the landing page URL, webhook, tenant ID, and app ID
  - These values can be updated later by modifying and republishing the same offer

For webhook implementation guidance, see [Implementing a webhook on the SaaS service - Marketplace publisher](/partner-center/marketplace-offers/pc-saas-fulfillment-webhook).

## Create plan and pricing

### Free agents

To configure a free agent plan, follow these steps:

1. Go to **Plan overview** in left menu
1. Select **Create new plan**
1. Enter the **Plan name:** `Identity Drift Investigation Agent plan`. Don't include Microsoft product names in plan name.
1. Enter the **Plan description:** `Free tier offering of our agent`. Include the SCU consumption estimate.
1. Select **Edit Markets**
1. Select regions where you want to offer (recommend **Select all**)
1. Set **Pricing model:** *Flat rate*
1. Set **Contract duration**, **Billing Frequency**, **Price per charge:**  to $0 USD
1. Set **Plan visibility** to **Public** (or **Private** for specific customers)
1. Select **Save draft**

### Paid agents

In addition to the steps in the [Free agents](#free-agents) section, include the following steps to configure a paid agent plan:

1. **Pricing model:** Choose between:
   - **Flat rate** - Fixed monthly/annual fee
   - **Per user** - Price per licensed user
1. **Contract duration:** 1 month, 1 year, 3 years, etc.
1. **Billing frequency:** Monthly or annual
1. **Price per charge:** Set your pricing
1. Optional: Check **Free trial** for 1-month trial period
1. **Plan visibility:** Set to **Public** (or **Private** for specific customers)
1. Select **Save draft**

### Best practices for plan and pricing

- **Plan description must include SCU consumption estimate.**
  The plan description is required to include an estimate of SCU consumption. Add a clear statement such as:
 *"This agent typically consumes 1.0 SCU per analysis run."*

To learn more about how to estimate SCU usage, see [Manage usage - Microsoft Security Copilot](/copilot/security/manage-usage).

The following is a sample full plan description:

  The Contoso Identity Threat Triage Agent is available at no cost. This agent typically consumes 1.0 SCU per analysis run. SCU consumption may vary depending on the volume of data in your Microsoft Sentinel workspace and the complexity of the investigation.


## Add supplemental content

To add supplemental content, follow these steps:

1. Select **SaaS Scenarios** - SaaS solution is not hosted in Azure.
1. In the **text box**, enter the following note: **Offer listing is for Security Copilot Agent in Microsoft Security Store.**
1. Upload Product documentation and select category **Architecture diagram**

## Publish your agent

### Final review checklist

Before publishing, verify:

- All required fields completed
- Offer listing is grammatically correct and accurate
- Agent name does NOT contain Microsoft product names ("Security Copilot", "Microsoft Sentinel", etc.)
- Marketing/product page link added under Offer Listing → Links
- User guide document uploaded under Product information documents
- Logo (216×216 px) and screenshots (1280×720 px)
- At least one screenshot shows full agent execution with integrated product visible under Plugins
- In AgentManifest.yaml file - in AgentDefinition section `product` and `publisher` fields reflect actual ISV name (not "Custom")
- Plan description includes SCU consumption estimate
- Technical configuration has all required values
- ZIP package is valid and up to date
- Terms and privacy policy links work

### Submit for publication

To submit your offer for publication, follow these steps:

1. Select **Review and publish** (top right of Partner Center)
1. Review all sections
1. If all validation passes, select **Publish**
1. Your offer enters automated review process
1. After the automated review, select **Go Live** to move the request to Security Store team for review and certification

### Monitor publication status

To monitor the status of your publication, follow these steps:

1. Return to Partner Center → **Marketplace Offers**
1. Find your offer
1. Review status indicators:
   - **In review** - Being validated by Security Store team
   - **Changes required** - Review feedback received, corrections needed
   - **Published** - Live in Security Store

### Verify live listing

Once published, verify your listing at [Security Store](https://securitystore.microsoft.com/agents).

Check:

- Agent description displays correctly
- Screenshots are visible
- Links are working

## Troubleshooting

### Package zip file rejected or fails validation

| Symptom | Solution |
|---------|---------|   
|**Invalid package structure**| Verify `PackageManifest.yaml` is in root directory with correct formatting
|**Hidden files included in ZIP**|  On Mac, use: `zip -r package.zip . -x ".*" -x "__MACOSX"`
|**Agent name contains Microsoft product name**|  Remove `"Security Copilot"`, `"Microsoft Sentinel"`, `"Microsoft Defender"`, `"Entra"`, or any Microsoft product name from the agent name field in Partner Center.<p>  - Check all locations: the Offer name, Plan name, and description text body<p>  - Resubmit after renaming<p>|    
|**Screenshots rejected — "do not depict functionality of the agent"**|  Screenshots must show a full agent execution run, not just configuration or setup pages<p>  - At minimum one screenshot must show: (1) agent actively running/returning results, (2) integrated Microsoft product (for example, Microsoft Sentinel) visible under Plugins<p>  - Add `MCP.Sentinel` to `RequiredSkillsets` in `AgentManifest.yaml` if Sentinel is not appearing in agent view<p>|


Your agent is now published to the Microsoft Security Store and available for customers. Monitor agent adoption and usage metrics, and use customer feedback to refine agent instructions and expand capabilities.

## Related content

For more detailed information, see:

- [Publish a Security Copilot Agent in Security Store - Microsoft Learn](/security/store/publish-a-security-copilot-agent-or-analytics-solution-in-security-store)
- [Microsoft Security Store](https://securitystore.microsoft.com/)
- [Microsoft Partner Center](https://partner.microsoft.com/)
- [Manage SCU Usage - Microsoft Security Copilot](/copilot/security/manage-usage)
- [SaaS Fulfillment Webhook - Partner Center](/partner-center/marketplace-offers/pc-saas-fulfillment-webhook)
