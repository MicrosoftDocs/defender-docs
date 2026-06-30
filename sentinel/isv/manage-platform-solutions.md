---
title: Manage Microsoft Sentinel platform solutions
description: Learn how to configure, update, and uninstall components installed by a Microsoft Sentinel platform solution.
ms.topic: how-to
ms.author: monaberdugo
author: mberdugo
ms.reviewer: tbeerthuis
ms.date: 06/15/2026
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1014
---

# Manage Microsoft Sentinel platform solutions

After you install a Microsoft Sentinel platform solution, you manage its components in different places. This article explains how to configure, update, and uninstall the main types of components.

## Security Copilot agents

<a name="configure"></a>
### Configure Security Copilot agents
Manage Security Copilot agents in the [Security Copilot portal](https://securitycopilot.microsoft.com), where you can enable, disable, or schedule them. For an overview of agent types, see [Microsoft Security Copilot agents overview](/copilot/security/agents-overview).

<a name="update"></a>
### Update Security Copilot agents
Agents update automatically when Microsoft releases a new version in the [Microsoft Security Store](https://security.microsoft.com/securitystore). Make sure your environment stays compatible to avoid breaking changes.

<a name="uninstall"></a>
### Uninstall Security Copilot agents
Uninstalling the solution doesn’t remove the agent from the catalog. Enabled or scheduled agents keep running until you disable them in the portal. This behavior prevents unexpected disruption.

## Notebooks and notebook jobs

<a name="configure-1"></a>
### Configure notebooks and notebook jobs
Use the Microsoft Sentinel Jobs page to enable, disable, schedule, or view notebook jobs. You can also review notebook content and execution history.

<a name="update-1"></a>
### Update notebooks and notebook jobs

> [!IMPORTANT]
> Installing the updated solution deletes local edits, such as changes made in Visual Studio Code.

To update notebooks or jobs, go to the [Microsoft Security Store](https://security.microsoft.com/securitystore), find the solution, and install the latest version. This deployment overwrites existing notebooks and jobs that share the same name. Each solution and publisher uses unique names to prevent conflicts.

<a name="uninstall-1"></a>
### Uninstall notebooks and notebook jobs
Uninstalling a solution doesn’t stop its notebook jobs. Jobs continue running until you disable them on the Microsoft Sentinel Jobs page.
