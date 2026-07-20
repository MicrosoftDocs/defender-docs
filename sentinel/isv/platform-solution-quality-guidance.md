---
title: Microsoft Sentinel platform solution quality guidelines
description: Learn quality guidance for Microsoft Sentinel platform solutions that use the data lake, graph, notebook jobs, MCP tools, and Security Copilot experiences.
ms.author: monaberdugo
author: mberdugo
ms.reviewer: smarapareddy
ms.service: microsoft-sentinel
ms.topic: best-practice
ms.date: 05/25/2026
ms.custom: msecd-doc-authoring-1012
ai-usage: ai-assisted
#customer intent: As an ISV partner, I want quality guidance for Microsoft Sentinel platform solutions so that I can deliver secure and reliable data lake, graph, and Copilot-based experiences.
---

# Microsoft Sentinel platform solution quality guidelines

Use these guidelines to build platform solutions that rely on Microsoft Sentinel data lake, graph, notebook jobs, Model Context Protocol (MCP) tools, and Microsoft Security Copilot integrations.

## Use Microsoft Sentinel data lake and graph intentionally

Platform solutions use the Microsoft Sentinel data lake to maximize long-term data coverage. Define which scenarios require data lake tables, graph access, or both, and document those dependencies in your solution description.

When you design data access:

- Use only required tables and graph entities for each scenario.
- Document retention and freshness assumptions for each required data source.
- Validate query cost and runtime for large datasets before publishing.

## Build Security Copilot and MCP experiences securely

For Security Copilot and MCP-based experiences, reduce authentication burden while maintaining least privilege.

- **Use Security Copilot plugins first** when a plugin already supports your scenario. For Microsoft plugins, Security Copilot handles authentication. See [Security Copilot plugins overview](/copilot/security/plugin-overview).
- **Use delegated auth when supported** to avoid storing client secrets and passwords. See [API plugins documentation for Security Copilot](/copilot/security/plugin-api).
- **Use secret-based auth only when needed** and store secrets by using a secure store such as [Azure Key Vault](/azure/key-vault/general/overview).
- **Scope permissions to minimum access** and require multifactor authentication for identities that install or run agents.

## Create notebook jobs for deterministic data processing

[Notebook jobs](/azure/sentinel/datalake/notebook-jobs) transform data and support advanced machine learning workflows. Notebook output can be written to custom data lake tables and used by Copilot and MCP experiences.

When you build notebook jobs, use these best practices:

- Author notebook jobs by using the [Visual Studio Code Sentinel extension](/azure/sentinel/datalake/notebooks-overview).
- Review [example notebooks](../datalake/notebook-examples.md) to speed up design and implementation.
- Add workspace autodetection logic when your solution might run in multiple workspaces.
- Use the System tables workspace when your solution needs a dependable write target.
- Document all notebook dependencies, schedules, and expected outputs.

## Define platform prerequisites and permissions

Before customers install your platform solution, provide a clear prerequisites section that includes:

- Required roles and permissions. For more information, see [Roles and permissions in the Microsoft Sentinel platform](/azure/sentinel/roles).
- Data lake or graph dependencies required for each feature.
- Any external services, identities, or API endpoints your solution requires.

## Maintain platform solutions after publishing

After publication, maintain and update your platform solution regularly:

- Plan for service or feature deprecations at least six months before end-of-life milestones.
- Keep the solution description page accurate and fix broken links quickly.
- Address GitHub CodeQL alerts in a timely manner.
