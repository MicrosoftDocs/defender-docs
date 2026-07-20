---
title: Package and publish Microsoft Sentinel graph and notebook solutions
description: Package a SentinelLake zip, create a Partner Center SaaS offer, and publish a Microsoft Sentinel notebook or custom graph solution to the Microsoft Security Store.
author: EdB-MSFT
ms.author: edbaynash
ms.reviewer: smarapareddy
ms.service: microsoft-sentinel
ms.subservice: sentinel-platform
ms.topic: how-to
ms.date: 06/21/2026
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1012

#customer intent: As an ISV partner, I want to package my Microsoft Sentinel notebook and graph solution as a SentinelLake zip so that I can submit it to Microsoft Partner Center.
---

# Package a Microsoft Sentinel graph and notebook solution

Once your notebook or custom graph solution is ready, package it as a SentinelLake zip and submit it to Microsoft Partner Center. After Partner Center validation, the solution is published to the Microsoft Security Store.

Microsoft Partner Center accepts a single `.zip` package per offer. For Microsoft Sentinel platform solutions—notebook solutions and custom graph solutions—use package type `SentinelLake`. The package contains a root `PackageManifest.yaml` and a named subfolder that holds your solution artifacts.

## Create the folder structure

Create the folder structure before zipping. Both solution types use the same layout: a root manifest file, one named subfolder containing the solution files, and an optional `AzureResources/` folder for ARM templates.

```
|-- PackageManifest.yaml              # required — must be at root
|-- YourNotebookFolderName/           # required — one subfolder per solution
|   |-- entra-group-membership.ipynb  # the graph / notebook file name

```


## Author PackageManifest.yaml

Create `PackageManifest.yaml` at the root of the zip. The structure is the same for both solution types; only the `id` and `description` values differ.

```yaml
manifest:
  - id: "FailedSigninBaseline"
    description: "Baseline failed sign-in behavior per user and flag drift events"
    type: SentinelLake

schema:
  version: "1.0.0"
```

Key fields:

| Field | Description |
|---|---|
| `id` | Short, no-spaces identifier. Must exactly match the subfolder name. |
| `description` | One-line summary of the solution. |
| `type` | Must be `SentinelLake` for all Microsoft Sentinel platform solutions(notebooks and graphs). |
| `schema.version` | Package schema version. Use `"1.0.0"`. |

## Create and verify the zip

Create the zip from inside the package folder so that `PackageManifest.yaml` lands at the archive root, not inside a parent folder.


**Windows or Linux:**

```bash
cd /path/to/notebook or graph package
zip -r notebook-graph-package.zip .
```

**macOS** (excludes hidden and system files):

```bash
cd /path/to/notebook or graph package
zip -r notebook-graph-package.zip . -x ".*" -x "__MACOSX"
```

Verify the contents:

```bash
unzip -l notebook-graph-package.zip
```

Expected output:

```text
PackageManifest.yaml
YourNotebookFolderName/
YourNotebookFolderName/failed-signin-baseline.ipynb
```

> [!IMPORTANT]
> Partner Center validation fails if the zip contains hidden files such as `.DS_Store`, `__MACOSX/`, `.ipynb_checkpoints/`, or `.vscode/`. Always run `unzip -l` to confirm the zip contents before uploading. The macOS Finder **Compress** option silently includes hidden files and fails validation.

## Create a Partner Center offer

Follow these steps to create the SaaS offer in Partner Center.

### Gather required information

Before you start, have the following ready:

- Solution name and version. The solution name must not contain Microsoft product names such as Microsoft Sentinel, Defender, or Entra.
- Solution description of 1–2 sentences.
- Inputs and outputs: tables the solution reads and writes.
- Marketing or product page URL.
- User guide PDF explaining how to deploy and use the solution from the Security Store.
- Your ISV logo (216 × 216 px) and screenshots (1280 × 720 px).
- Webhook URL or a placeholder URL.
- At least one screenshot showing the solution in use: a notebook running with results, or the graph in Graph Explorer.

### Create a new SaaS offer

To create the offer, complete the following steps in Partner Center. For more information, see [How to publish a Microsoft Security Copilot Agent](publish-agent-to-security-store.md) and [Publish a Microsoft Security Copilot agent or Microsoft Sentinel Data Lake Notebook Job in Security Store](/security/store/partners/publish-a-security-copilot-agent-or-analytics-solution-in-security-store)

1. Sign in to [Microsoft Partner Center](https://partner.microsoft.com/dashboard/home) > **Marketplace offers**.
1. Select **New offer** > **Software as a Service (SaaS)**.
1. Start blank, or clone an existing offer (cloning saves time on logo, legal docs, and similar assets).
1. Enter a lowercase, hyphenated **Offer ID** (for example, `failed-signin-baseline`).
1. Enter a human-friendly **Alias** (for example, `Failed Signin Baseline`).

### Configure offer setup

1. Select **Yes** for **Would you like to sell through Microsoft?**.
1. Select **No** for **Would you like to use Microsoft license management?**.
1. Optionally configure **Customer leads** for CRM integration.
1. Under **Microsoft integrations**, select **My offer integrates with Microsoft Security services**.

   > [!IMPORTANT]
   > The **Microsoft Security services** tab doesn't appear if this checkbox is not selected. Save the draft and reload the page if the tab is missing after checking the box.

1. Select **Save draft**.




### Set offer properties

To set the offer category and legal terms, complete the following steps:

1. Under **Categories**, select **Security** or **Compliance**.
1. Leave **Industries** blank.
1. Under **Legal contract**, select **Standard Contract** or provide your own.

### Complete the offer listing

Enter the listing details that appear on the Security Store page:

1. Enter a one-line **Search-results summary**.
1. Write a structured **Description** that covers solution tasks, inputs, and outputs.
1. Upload your logo and screenshots at the required dimensions.
1. Upload the user guide PDF under **Product information documents**.
1. Add your marketing page URL under **Product information links**.

### Configure Microsoft Security services

Enter the Microsoft Security services details as follows:

1. Under **Integrated Security services**, select **Microsoft Sentinel**. Select additional products if your solution joins data from them.
1. Under **Product prerequisites**, add **Microsoft Sentinel** and any data sources the solution reads from.
1. Set **Solution type** to **Deployable solution**.
1. Under **Solution packages**, upload the `.zip` you created in [Create and verify the zip](#create-and-verify-the-zip).

### Complete the technical configuration

> [!TIP]
> Partner Center blocks the **Review and Publish** button if **Technical configuration** is incomplete—even when you don't use license management or webhooks. Use placeholder values now; you can update them by republishing later.

1. Set **Landing page URL** to `https://securitystore.microsoft.com/mysolutions`.
1. Enter your **Connection webhook** URL, or a placeholder URL if you haven't built one yet.
1. Enter your **Microsoft Entra Tenant ID**.
1. Enter your **Microsoft Entra Application ID**.

### Add preview audience

Add preview audience members in Partner Center to allow internal testing before publishing.

To add preview audience members, follow these steps:

1. Go to Preview audience in left menu
1. Enter Microsoft Entra IDs of internal users who will test: - Team members - QA testers
1. Select Save draft

### Access preview

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

For more information see [How to preview and test your offer listing for Security Store](/security/store/preview-and-test-your-offer-listing-for-security-store)

## Publish to Security Store

### Create a plan

Even a free solution requires a plan. To create a plan, complete the following steps:

1. Under **Plan overview**, select **Create new plan**.
1. Enter a descriptive **Plan name** (no Microsoft product names).
1. Enter a descriptive **Plan description** (no Microsoft product names).
1. Describe the data the graph or notebook models and any query capabilities it provides.
1. Select **Edit Markets** and select your target regions.
1. Set **Pricing model** to **Flat rate** and configure contract duration, billing frequency, and price. Set the price to $0 for free solutions.
1. Set **Plan visibility** to **Public**, or **Private** for select tenants.
1. Select **Save draft**.

### Add supplemental content

1. Select **SaaS solution is not hosted in Azure** for **SaaS scenarios**.
1. In the text box, for notebooks enter: `Offer listing is for a Microsoft Sentinel Notebook Solution in Microsoft Security Store`. For graphs, describe the graph solution and the data it models.
1. Upload an architecture diagram (recommended).

### Final review checklist

Before submitting, confirm the following apply to both solution types:

- All required fields are complete.
- Solution name doesn't contain Microsoft product names.
- Marketing or product page link is added.
- User guide PDF is uploaded.
- Logo is 216 × 216 px; screenshots are 1280 × 720 px.
- Technical configuration is filled in (placeholder values are acceptable).
- `PackageManifest` type is `SentinelLake` and the manifest `id` matches the subfolder name.
- The zip contains no hidden files (run `unzip -l` to verify).
- At least one screenshot shows the notebook/ graph actively running with results.

### Submit and go live

1. Select **Review and publish** (top right).
1. Review every section.
1. Select **Publish**—automated review begins.
1. When automated review passes, select **Go Live**—the offer moves to Security Store certification.
1. Return to **Marketplace offers** in Partner Center to monitor status: **In review** > **Changes required** > **Published**.
1. After publishing, verify your listing at the [Microsoft Security Store](https://securitystore.microsoft.com/).

## Related content

- [Develop notebook solutions](./develop-notebook-platform-solutions.md)
- [Develop custom graph platform solutions](develop-custom-graph-platform-solutions.md)
- [Publish a Security Copilot agent or analytics solution in Security Store](/security/store/partners/publish-a-security-copilot-agent-or-analytics-solution-in-security-store)
- [Microsoft Partner Center](https://partner.microsoft.com/dashboard/home)
