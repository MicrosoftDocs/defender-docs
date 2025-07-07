---
title: Add Advanced Hunting community queries to Microsoft Defender XDR and Microsoft Sentinel
description: Detailed steps to add Advanced Hunting community queries
ms.service: defender-office-365
f1.keywords:
  - NOCSH
ms.author: chrisda
author: chrisda
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection:
- m365-guidance-templates
- m365-security
- tier3
ms.topic: how-to
search.appverid: met150
ms.date: 06/12/2025
---

# Add Advanced Hunting community queries to Microsoft Defender XDR and Microsoft Sentinel

Creating and sharing Advanced Hunting queries in Microsoft Defender not only enhances your own security operations but also contributes to the broader community of Defender users. This guide walks you through the process of creating new or modifying existing queries, and publishing them to the **Community queries** section within the Microsoft Defender portal.

Following the steps in this article ensures your queries are accessible to all customers, which helps others detect threats more effectively while promoting collaboration and shared learning across the security ecosystem.

:::image type="content" source="../media/add-advanced-hunting-community-queries-in-advanced-hunting.png" alt-text="Screenshot of community queries in Advanced Hunting in the Microsoft Defender portal." lightbox="../media/add-advanced-hunting-community-queries-in-advanced-hunting.png":::

## Prerequisites

- A GitHub account.

- The procedures in this article use [Visual Studio Code](https://code.visualstudio.com/) (VS Code) for forking, cloning, creating, and synchronizing queries to and from the Azure Sentinel GitHub repository. Different tools with different instructions are available for all of these tasks.

- A Microsoft 365 subscription that includes Advanced Hunting. For example:
  - Microsoft Defender XDR
  - Microsoft Sentinel
  - Microsoft Defender for Office 365 Plan 2

## Step 1: Fork the Azure Sentinel GitHub repository to your GitHub account

Because you don't have admin permissions to the Azure Sentinel GitHub repository, you need to fork the repository, and the only available destination is your GitHub account.

1. Open the Azure Sentinel GitHub repository at <https://github.com/Azure/Azure-Sentinel/>.

2. Select **Fork** to create your own copy of the repository. On the **Create a new fork** page that opens, review the following default settings:
   - **Owner**: Verify your GitHub account name is shown.
   - **Repository name**: Verify the value **Azure-Sentinel**.
   - **Description**: Verify the description text.
   - **Copy the main branch only**: Verify this option is selected.

   When you're finished on the **Create a new fork page**, select **Create new fork**.

   :::image type="content" source="../media/add-advanced-hunting-community-queries-fork-repo.png" alt-text="Screenshot of the top of the Azure Sentinel GitHub repository with Fork selected." lightbox="../media/add-advanced-hunting-community-queries-fork-repo.png":::

   :::image type="content" source="../media/add-advanced-hunting-community-queries-create-new-fork.png" alt-text="Screenshot of the Create a new fork page." lightbox="../media/add-advanced-hunting-community-queries-create-new-fork.png":::

3. After the fork is successfully created, you're taken to the URL of the Azure-Sentinel repository fork in your GitHub account: `https://github.com/<YourGitHubAccountName>/Azure-Sentinel`. On this page, select **Code**. On the **Local** tab of the drop-down that opens, select :::image type="icon" source="../media/github-copy-url-to-clipboard-icon.png" border="false"::: **Copy url to clipboard** from the **HTTPS** tab of the **Clone** section. The copied URL is: `https://github.com/<YourGitHubAccountName>/Azure-Sentinel.git`.

   :::image type="content" source="../media/add-advanced-hunting-community-queries-clone-fork.png" alt-text="Screenshot of Copy url to clipboard from the Code button on your forked copy of the Azure-Sentinel page." lightbox="../media/add-advanced-hunting-community-queries-clone-fork.png":::

## Step 2: Clone the GitHub repository to your local computer

After you fork the Azure Sentinel GitHub repository to your GitHub account, you need to create a local clone of the repository on your computer to work out of.

1. Open VS Code. If you're not already in a clean session without other files opened, select **File** \> **New Window** or press CTRL+Shift+N.

2. Select **Source Control** or press CTRL+Shift+G

   :::image type="content" source="../media/add-advanced-hunting-community-queries-vs-code-source-control.png" alt-text="Screenshot of Visual Studio Code with Source Control selected." lightbox="../media/add-advanced-hunting-community-queries-vs-code-source-control.png":::

3. In the **Source Control** flyout that opens, select **Clone Repository**.

   :::image type="content" source="../media/add-advanced-hunting-community-queries-vs-code-clone-repo.png" alt-text="Screenshot of Clone Repository in Visual Studio Code with Clone Repository selected." lightbox="../media/add-advanced-hunting-community-queries-vs-code-clone-repo.png":::

4. In the dialog that opens, paste the `https://github.com/<YourGitHubAccountName>/Azure-Sentinel.git` URL you copied in Step 1.3 into the box, and then select **Clone from URL** that appears beneath the box.

   :::image type="content" source="../media/add-advanced-hunting-community-queries-vs-code-clone-from-url.png" alt-text="Screenshot of the Clone Repository dialog in Visual Studio Code with the forked GitHub URL entered and Clone from URL selected." lightbox="../media/add-advanced-hunting-community-queries-vs-code-clone-from-url.png":::

5. In the **Choose a folder to clone `https://github.com/<YourGitHubAccountName>/Azure-Sentinel.git` into** dialog that opens, find or create a local parent folder (for example, `C:\GitHub`) for the cloned fork of the repository, and then select **Select as Repository Destination**. The local clone of the forked repository is contained in the `<ParentFolder>\<RepositoryName>` folder (for example, `C:\GitHub\Azure-Sentinel`).

   :::image type="content" source="../media/add-advanced-hunting-community-queries-vs-code-cloned-repo-destination.png" alt-text="Screenshot of the Choose a folder to clone into dialog with a destination parent folder selected and highlighted." lightbox="../media/add-advanced-hunting-community-queries-vs-code-cloned-repo-destination.png":::

6. Wait several minutes for the cloning of the Azure-Sentinel repository to complete.

   :::image type="content" source="../media/add-advanced-hunting-community-queries-vs-code-cloning-repo.png" alt-text="Screenshot of the progress dialog in Visual Studio Code as the Azure-Sentinel repository is being cloned." lightbox="../media/add-advanced-hunting-community-queries-vs-code-cloning-repo.png":::

7. After cloning completes, a **Would you like to open the clone repository?** dialog opens. Select **Open** to open the cloned repository in VS Code (for example, the `C:\GitHub\Azure-Sentinel` folder and its contents).

   :::image type="content" source="../media/add-advanced-hunting-community-queries-vs-code-open-cloned-repo.png" alt-text="Screenshot of the Would you like to open the clone repository? dialog from Visual Studio Code dialog that opens after cloning the repository completes, with Open highlighted." lightbox="../media/add-advanced-hunting-community-queries-vs-code-open-cloned-repo.png":::

8. If you recently created the folder structure on your local drive, you might receive a **Do you trust the authors of the files in this folder?**, which refers to the `Azure-Sentinel` folder (you trust them).

   To trust any future repositories that you clone in the parent folder (for example, `C:\GitHub`), select **Trust the authors of all files in the parent folder `<ParentFolderName>`**.

   To continue, select **Yes, I trust the authors**.

     :::image type="content" source="../media/add-advanced-hunting-community-queries-vs-code-trust-authors.png" alt-text="Screenshot of the Do you trust the authors of the files in this folder? dialog from Visual Studio Code dialog that might open, with Yes, I trust the authors highlighted." lightbox="../media/add-advanced-hunting-community-queries-vs-code-trust-authors.png":::

## Step 3: Create a working branch in the cloned repository on your local computer

After you select **Yes, I trust the authors**, VS Code opens in **Explorer** view with the `Azure-Sentinel` folder selected. You can see all files and folders from the parent repository on GitHub.

By default the **master** (main) branch is active when you open your cloned fork of the repository. Don't make updates in the **master** branch. Instead, create a working branch in your locally cloned, forked copy of the repository to work out of.

1. In VS Code, select the active branch name in the bottom left corner (which is likely **master**).

   :::image type="content" source="../media/add-advanced-hunting-community-queries-vs-code-select-active-branch.png" alt-text="Screenshot of the active (open) branch highlighted in Visual Studio Code." lightbox="../media/add-advanced-hunting-community-queries-vs-code-select-active-branch.png":::

2. In the dialog that opens, select :::image type="icon" source="../media/m365-cc-sc-create-icon.png" border="false"::: **Create new branch from...**, and then select **master** (other available branches also appear in the list).

   :::image type="content" source="../media/add-advanced-hunting-community-queries-vs-code-clone-create-new-branch-from.png" alt-text="Screenshot of the dialog that opens after you select the active (open) branch in Visual Studio Code with Create new branch from... highlighted." lightbox="../media/add-advanced-hunting-community-queries-vs-code-clone-create-new-branch-from.png":::

   :::image type="content" source="../media/add-advanced-hunting-community-queries-vs-code-create-new-branch-from-master.png" alt-text="Screenshot of the dialog that opens after you select Create new branch from... in Visual Studio Code with the master branch highlighted." lightbox="../media/add-advanced-hunting-community-queries-vs-code-create-new-branch-from-master.png":::

3. In the **Please provide a new branch name** dialog that opens, enter a suitable name for the branch (for example, `new-mdo-queries`), and then press Enter to confirm.

   :::image type="content" source="../media/add-advanced-hunting-community-queries-vs-code-enter-new-branch-name.png" alt-text="Screenshot of the Please provide a new branch name dialog that opens in Visual Studio Code, with the value new-mdo-queries entered." lightbox="../media/add-advanced-hunting-community-queries-vs-code-enter-new-branch-name.png":::

The active branch changes from **master** to the new branch you created.

To separate your work on different queries, you can create multiple working branches with different names by repeating the previous steps in this section.

Go to the next section to actually start creating or modifying queries.

## Step 4: Create Advanced Hunting queries in the working branch in the cloned repository on your local computer

When you open VS Code to create or update queries, always verify your desired working branch is the active branch (not **master**):

   :::image type="content" source="../media/add-advanced-hunting-community-queries-vs-code-verify-active-branch.png" alt-text="Screenshot of the active (open) branch highlighted in Visual Studio Code, which is now the new branch that you created in the previous step." lightbox="../media/add-advanced-hunting-community-queries-vs-code-verify-active-branch.png":::

If it isn't, select the active branch name in the bottom left corner, and then select the working branch from the **branches** section.

1. Now you can create hunting queries in your working branch. For example, the following Kusto Query Language (KQL) query is a basic report of recipients who receive the most phishing messages.

   ```kusto
   EmailEvents
   | where ThreatTypes has "Phish" and EmailDirection == "Inbound"
   | summarize count() by RecipientEmailAddress
   | sort by count_
   | top 15 by count_
   ```

2. Test the query on the **Advanced Hunting** page in the Defender portal at <https://security.microsoft.com/v2/advanced-hunting> to ensure the query contains no mistakes and it returns data as expected.

   :::image type="content" source="../media/add-advanced-hunting-community-queries-test-query-in-advanced-hunting.png" alt-text="Screenshot of the Advanced Hunting page in the Defender portal with the previous example query and results without error." lightbox="../media/add-advanced-hunting-community-queries-test-query-in-advanced-hunting.png":::

3. In the **Explorer** view of VS Code, go to one of the following parent folders based on the usage and availability of the query in the Defender portal:

   - `\Azure-Sentinel\Hunting Queries\Microsoft 365 Defender\Email Queries`: Available in the **Community queries** section on the **Queries** tab of the **Advanced hunting** page in the Defender portal at <https://security.microsoft.com/v2/advanced-hunting>.
   - `\Azure-Sentinel\Solutions\Microsoft Defender XDR\Hunting Queries\Email Queries`: Available as Sentinel queries (Microsoft Defender XDR Solution).

   In most cases, you should ultimately create the query file in both locations so you can use the query in both scenarios.

4. In VS Code, create a new .yaml file in the appropriate subfolder of those locations. There are many subfolders to choose from. In our example, a logical name and location for our new query file is `Top users receiving phish.yaml` in the `Phish` subfolder.

   You can find more information on the requirements and structure of the .yaml file at [Query Style Guide](https://github.com/Azure/Azure-Sentinel/wiki/Query-Style-Guide) on the Azure-Sentinel repository wiki.

   Use the [New-Guid](/powershell/module/microsoft.powershell.utility/new-guid) cmdlet in Windows PowerShell to create a unique GUID for the **id** property of the query file (for example, 36f68d74-3e45-44d8-9915-0d35b7567bcf).

   The finished `Top users receiving phish.yaml` file looks something like this:

   ```yml
   id: 36f68d74-3e45-44d8-9915-0d35b7567bcf
   name: Friendly name describing the query
   description: |
     A short description of what the query does.
   description-detailed: |
     A much longer description of the intention of the query within Defender for Office 365.
   requiredDataConnectors:
   - connectorId: MicrosoftThreatProtection
     dataTypes:
     - EmailEvents
   tactics:
     - InitialAccess
   relevantTechniques:
     - T1566
   query: |
     EmailEvents
     | where ThreatTypes has "Phish" and EmailDirection == "Inbound"
     | summarize count() by RecipientEmailAddress
     | sort by count_
     | top 15 by count_
   version: l.0.0
   ```

5. After you complete and save the query file in one location, copy the file to the other location so you can use the query in both Advanced Hunting and Microsoft Sentinel.

## Step 5: Synchronize the changes from your local computer to the fork in your GitHub account

After you add .yaml query files in the cloned repository on your local computer, you need to synchronize those updates back to the forked copy of the Azure Sentinel repository in your GitHub account.

1. In VS Code, select the **Source Control** view.

   :::image type="content" source="../media/add-advanced-hunting-community-queries-vs-code-select-source-control.png" alt-text="Screenshot of Visual Studio Code with the Source Control view highlighted." lightbox="../media/add-advanced-hunting-community-queries-vs-code-select-source-control.png":::

2. In the dialog that opens, a **Changes** section lists all files modified in the current branch:

   :::image type="content" source="../media/add-advanced-hunting-community-queries-vs-code-source-control-changes.png" alt-text="Screenshot of the Source Control view in Visual Studio Code with Changes highlighted." lightbox="../media/add-advanced-hunting-community-queries-vs-code-source-control-changes.png":::

   - If you click on the filename, the modified file opens with the modified text highlighted. You can review the changes for issues or mistakes before you continue.

   - In the **Message** box, enter a brief description of the changes. Use concise language. For example, **Added a query to list top Phish recipients**. When you're finished, select **Commit**.

     :::image type="content" source="../media/add-advanced-hunting-community-queries-vs-code-source-control-message-and-commit.png" alt-text="Screenshot of the Source Control view in Visual Studio Code with the Message box filled out and the Commit button highlighted." lightbox="../media/add-advanced-hunting-community-queries-vs-code-source-control-message-and-commit.png":::

   - If you're synchronizing the working branch and its updates into the fork in your GitHub account for the first time, you're presented with **Publish Branch** which you should select.

     :::image type="content" source="../media/add-advanced-hunting-community-queries-vs-code-source-control-publish-branch.png" alt-text="Screenshot of the Source Control view in Visual Studio Code with the Publish Branch button highlighted." lightbox="../media/add-advanced-hunting-community-queries-vs-code-source-control-publish-branch.png":::

    In the future, when you synchronize local changes in the working branch into the fork in your GitHub account, you're presented with **Sync Changes** instead.

## Step 6: Create a pull request from the fork in your GitHub account to the public Azure Sentinel repository

After you synchronize the updates to the forked copy of the repository in your GitHub account, you then create a pull request to merge those changes back into the public Azure Sentinel GitHub repository.

> [!TIP]
> As long as the pull request hasn't been merged, you can repeat [Step 4](#step-4-create-advanced-hunting-queries-in-the-working-branch-in-the-cloned-repository-on-your-local-computer) and [Step 5](#step-5-synchronize-the-changes-from-your-local-computer-to-the-fork-in-your-github-account) to update the source files in the forked copy of the repository, which modifies the active pull request.

1. Go to the `https://github.com/<YourGitHubAccountName>/Azure-Sentinel` link from [Step 1](#step-1-fork-the-azure-sentinel-github-repository-to-your-github-account).

2. If necessary, refresh the page to see the notification that the working branch you synchronized in the previous step has recent changes. Select **Compare & pull request**. branch has recent changes.

   :::image type="content" source="../media/add-advanced-hunting-community-queries-create-pull-request.png" alt-text="Screenshot of the Compare & pull request page." lightbox="../media/add-advanced-hunting-community-queries-create-pull-request.png":::

3. Follow the guidance provided in the description and answer as appropriate.

4. If you need to make further changes, you can select **Create draft pull request** to indicate the pull request isn't ready to be reviewed and approved. However, you can usually select **Create pull request** to proceed.

5. Someone with the permissions to merge the pull request will review your changes. The reviewer might request additional changes to conform with the standards of the repository. You can use [Step 4](#step-4-create-advanced-hunting-queries-in-the-working-branch-in-the-cloned-repository-on-your-local-computer) and [Step 5](#step-5-synchronize-the-changes-from-your-local-computer-to-the-fork-in-your-github-account) to make requested changes on your local computer and synchronize them back into your fork so they're included in the pull request.

## See also

- Azure Sentinel Community - [Getting Started guide](https://github.com/Azure/Azure-Sentinel/blob/master/GettingStarted.md).
- Query Template structure - [Guidance](https://github.com/Azure/Azure-Sentinel/wiki/Query-Style-Guide).
