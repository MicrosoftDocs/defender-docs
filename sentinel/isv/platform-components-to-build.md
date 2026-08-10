---
title: Microsoft Sentinel platform solution selection overview
description: Learn how ISV partners can choose Microsoft Sentinel platform building blocks that fit customer outcomes.
author: EdB-MSFT
ms.author: edbaynash
ms.date: 06/18/2026
ms.topic: concept-article
ms.service: microsoft-sentinel
ms.subservice: sentinel-platform
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1012

#customer intent: As an ISV partner, I want to choose the right Microsoft Sentinel platform building blocks so that I can design and publish a solution that fits my customer scenario.
---

# Microsoft Sentinel platform solution selection overview

A Microsoft Sentinel platform solution selection strategy is a planning approach that maps customer scenarios to Sentinel building blocks such as Security Copilot agents, Sentinel MCP server integrations, custom graphs, and Jupyter notebook jobs.

Use this guidance after you decide to integrate with Microsoft Sentinel and need to choose which building blocks to combine for your scenario.

## Prerequisites

- You have already decided to integrate with Microsoft Sentinel.

## Microsoft Sentinel platform building blocks

Microsoft Sentinel provides a normalized security data layer, an incident and entity investigation surface, and automation and AI capabilities. ISV partners can use these building blocks separately or combine them.

| Building block | What it is | Primary customer outcome |
|---|---|---|
| Sentinel data lake and connectors | Cost-efficient storage for raw and processed security telemetry, fed by Sentinel data connectors. | A data plane that downstream Sentinel platform and partner capabilities can analyze without rebuilding pipelines. |
| Security Copilot agent | A natural-language agent published to Microsoft Security Store. It uses Sentinel MCP tools and ISV-defined skills to investigate, summarize, and recommend actions. | SOC analysts get repeatable, evidence-backed triage and investigation narratives in chat without switching tools. |
| Sentinel MCP server and custom MCP tool collections | A Model Context Protocol endpoint that exposes built-in skills and ISV-published custom KQL tools that customer agents can call over JSON-RPC. | Programmatic, governed access to Sentinel data and ISV-curated KQL skills from any consuming agent. |
| Custom graph | A partner-defined graph instance (nodes, edges, properties) built from lake data and refreshed on a schedule. | Relationship-first investigation that answers blast-radius and reachability questions that table joins struggle to express efficiently. |
| Jupyter notebook jobs | Scheduled Spark notebooks that run in the Sentinel data lake. They perform heavy transformations, ML scoring, or graph construction and write results back as custom tables. | Deterministic, efficient batch processing for ML and aggregations without standing up external compute. |
| Sentinel SIEM content | Analytics rules, hunting queries, parsers (ASIM), workbooks, and playbooks published through the SIEM Content Hub. | Out-of-the-box detections, hunting, normalization, and response for the data the ISV ingests. |

## Build from the customer outcome

Start from customer outcome instead of technology. Choose building blocks by answering these questions:

- Does the analyst need interactive investigation, one-shot enrichment, relationship exploration, or a scheduled unattended workflow?
- Should the result be a natural-language narrative, a structured tool response, a graph traversal, or a recomputed dataset?
- Should heavy processing run at query time in the lake, in a precomputed graph, in a batch Spark job, or in an agent reasoning loop?

| If the customer wants to... | And the answer shape is... | Best-fit building block |
|---|---|---|
| Triage an alert or entity interactively in chat | A natural-language verdict with recommended action, grounded in Sentinel data | Security Copilot agent (often calling the Sentinel MCP server) |
| Let the ISV product agent call Sentinel programmatically | Structured JSON-RPC tool responses callable from any MCP-aware consuming agent | Custom MCP tool collection published to the Sentinel MCP server |
| Investigate relationships between identities, devices, workloads, or alerts | Graph traversals, such as blast radius or shortest path | Custom graph, queried from a Security Copilot agent or notebook |
| Run heavy aggregations, ML scoring, or scheduled enrichments over lake data | A new custom table refreshed on a schedule | Jupyter notebook job (often producing input for an agent or graph) |
| Detect new threats out of the box on ISV-ingested data | Alerts, incidents, and hunting starting points | SIEM content, including analytics rules, hunting queries, parsers, workbooks, and playbooks |
| Combine these capabilities into one SOC experience | An end-to-end investigation flow: detect, enrich, graph traverse, narrate, and act | Composed solution: connector, notebook job, custom graph, Security Copilot agent, and MCP tools |

These are starting recommendations, not exclusive choices. Most production ISV solutions combine two or more building blocks.

## Security Copilot agent concepts

### When to choose a Security Copilot agent

Build a Security Copilot agent when the SOC analyst is the primary consumer and the outcome is a chat-driven investigation narrative.

- The interaction model is conversational and analyst-initiated.
- The output is a verdict, supporting evidence, and recommended next action.
- The investigation can be expressed as a bounded, time-windowed correlation in a small, defined set of tables, typically the last 24 hours.
- The agent will be discovered and consumed through Microsoft Security Store.

### Use cases that fit a Security Copilot agent

| ISV product type | Investigation scenario | Why an agent fits |
|---|---|---|
| Identity protection or ITDR | Determine whether a risky sign-in is part of an attack path by correlating identity risk, MFA logs, sign-in success and failure, geographic drift, and post-auth endpoint execution. | Identity-centric, last-24-hour correlation where analysts paste a UPN and need a verdict. |
| Backup, cyber resilience, and recovery | Determine whether threats detected in backup environments are corroborated by production telemetry on the same host or workload. | Cross-source corroboration in a defined time window where verdict drives clear next action. |
| Secure access, SSE, or ZTNA | Determine whether user activity is legitimate remote access or suspicious connectivity toward private apps. | Behavior-drift reasoning using access telemetry, MFA outcomes, and destination categories with narrative output. |
| EDR and runtime protection | Determine whether process execution is malicious or legitimate admin activity by linking process chain, signer, network behavior, and recent risky logons. | Multi-signal reasoning where analysts want classification, not a raw query. |
| Asset exposure, CSPM, or vulnerability | Determine exploitation likelihood and blast radius for a workload. | Combines exposure facts with alert activity and returns a resource-specific risk narrative. |
| Threat intelligence | Determine whether activity aligns with known attacker behavior and tracked campaigns. | Sequence-to-TTP mapping and IOC correlation where analysts want an adversary-aligned interpretation. |

### What to build in the agent

- A single primary input, such as UPN, hostname, IP, or alert ID.
- A closed allowlist of tables the agent KQL can query, usually a mix of ISV custom tables and native tables such as `SigninLogs`, `SecurityAlert`, `DeviceEvents`, and `EmailEvents`.
- Deterministic per-section KQL skills with enforced `ago(24h)` time windows, validated by using Sentinel MCP server before publishing.
- A deterministic scoring rubric that maps observed signals to `High`, `Medium`, or `Clean` verdicts.
- A structured response with explicit empty-state phrases and verdict rationale that cites table and column values with counts.

## Sentinel MCP server integration concepts

### When to integrate with the Sentinel MCP server

Integrate with Sentinel MCP server when the consumer is another agent, such as an ISV product agent or a customer custom agent, that needs parameterized KQL skills over JSON-RPC.

- The output must be structured JSON tool responses, not a chat narrative.
- You want a reusable set of KQL tools that MCP-aware clients can register with built-in collections.
- Each tool can be parameterized with `workspaceId` and other variables.

### Use cases that fit a custom MCP tool collection

| ISV product type | Custom MCP tool example | Consuming agent |
|---|---|---|
| Identity protection or ITDR | `get_user_signin_summary(UserPrincipalName, workspaceId)` | An ISV product console agent that enriches an alert without re-implementing KQL. |
| EDR or XDR | `get_process_tree_for_host(DeviceName, workspaceId)` | A customer custom agent that needs the same view in multiple workspaces. |
| Cloud workload protection | `get_workload_exposure(ResourceId, workspaceId)` | An ISV remediation orchestration agent that needs deterministic input before acting. |
| Threat intelligence | `match_iocs(IndicatorList, workspaceId)` | Any consuming agent that needs vendor-curated matching instead of raw KQL. |

### What to build for MCP integration

- A `tools.json` manifest with KQL payloads that define tool name, description, parameterized `queryFormat`, and required arguments. Include `workspaceId` in every tool.
- A Microsoft Entra app registration for the consuming agent identity, granted `SentinelPlatform.DelegatedAccess` (admin-consented) and Sentinel Reader on the workspace.
- A deployment guide that explains how to register the collection with built-in MCP collections in the consuming agent MCP client.

Security Copilot agents and custom MCP tool collections are distinct delivery surfaces. The same ISV can publish both, and a Security Copilot agent can call a custom MCP tool collection.

## Custom graph concepts

### When to choose a custom graph

Build a custom graph when the customer question is primarily a relationship question, such as:

- Which assets did this identity access?
- What is the blast radius of this compromise?
- Which high-privilege paths reach this workload?

Custom graphs fit when:

- Investigations traverse relationships between two or more entity types, such as identity, device, workload, and alert.
- The same relationships are reused in many investigations, so precomputation on a schedule is valuable.
- Traversal depth of 2 to 5 hops makes ad-hoc KQL joins slow.
- Downstream consumers benefit from a stable graph schema.

### Use cases that fit a custom graph

| ISV product type | Graph to build | Question the graph answers |
|---|---|---|
| Identity protection or ITDR | Identity to Device to Workload access graph with risk levels and recent alerts | What infrastructure did a high-risk identity touch in the last 24 hours, and which systems triggered critical alerts? |
| Asset exposure or CSPM | Asset to Network path to Identity graph weighted by exposure and effective privileges | From an internet-facing workload, which crown-jewel databases are reachable through privilege escalation paths? |
| Application security | Application to Service principal to API permission graph | Which third-party apps in the tenant have over-privileged access to sensitive Graph permissions? |
| Data security or DLP | Data store to Sensitivity label to User access graph | Which users accessed labeled-sensitive data, and through which paths? |

### What to build for custom graphs

- A graph notebook job that reads relevant lake tables, projects nodes and edges, and publishes a graph instance on a daily or configurable schedule.
- A stable graph schema with nodes, edges, and named properties that downstream consumers can depend on.
- Agents that call GQL through REST APIs, such as a Security Copilot agent that takes a UPN and traverses identity-access graph paths to return blast radius.

## Jupyter notebook job concepts

### When to choose a notebook job

Use a notebook job for deterministic, scheduled, compute-heavy workloads that run in the Sentinel data lake and produce outputs consumed by other building blocks.

- Heavy aggregations or feature engineering that are too expensive at query time.
- Machine-learning scoring, such as anomaly detection, classification, or scoring.
- Periodic enrichment that writes a new custom table for analytic use.
- Cross-table joins and summarizations that downstream agents or custom graphs use as precomputed facts.

### Use cases that fit a notebook job

| ISV product type | Notebook job to build | Downstream consumer |
|---|---|---|
| UEBA or behavior analytics | Daily user-behavior baseline scoring written back as `UserBehaviorScores_CL` | A Security Copilot agent that classifies sign-in activity as expected or drift. |
| Cyber resilience or backup | Daily aggregation of backup threat-scan events joined with production telemetry per host | An agent that takes a hostname and returns a corroboration verdict. |
| Vulnerability or exposure | Nightly recompute of asset-reachability graph with current exposure facts | A custom graph queried by an agent for blast-radius questions. |
| Threat intelligence | Hourly IOC enrichment that joins indicators with sighting data in native tables | An MCP tool that returns sightings for a list of indicators. |

### What to build for notebook jobs

- A notebook that reads lake data with Spark, runs transformations or models, and writes results to a custom table or graph instance.
- A schedule that matches downstream freshness requirements, such as hourly, daily, or weekly.
- A clear output contract, table schema, or graph schema, that agents, MCP tools, and custom graphs can depend on.

## Solution composition patterns

The highest-impact ISV solutions combine building blocks. The following patterns are common in ISV engagements.

### Pattern 1: Connector plus analytics rules plus Security Copilot agent

The ISV publishes a Sentinel data connector, analytics rules over that data, and a Security Copilot agent that takes a primary entity and returns a verdict-and-evidence narrative grounded in ingested data and correlated native tables.

Best for any ISV that already has a Sentinel solution in Content Hub and wants to extend it with an agent.

### Pattern 2: Connector plus notebook job plus custom table plus Security Copilot agent

The notebook job sits between ingestion and the agent. It precomputes a behavior baseline, ML score, or aggregation and writes a custom table. The Security Copilot agent reads the precomputed table at query time to keep responses fast and deterministic.

Best for UEBA, anomaly scoring, or scenarios where per-run KQL is too expensive or non-deterministic.

### Pattern 3: Connector plus notebook job plus custom graph plus Security Copilot agent

Pattern 2 is extended with a custom graph. The notebook builds an entity-relationship graph from lake tables. The Security Copilot agent calls GQL endpoints to answer reachability and blast-radius questions and narrates findings for analysts.

Example: an agent takes a UPN, traverses an Identity to Device to Workload to Alert graph built daily by a graph notebook job, and explains analyst-relevant findings.

Reference architecture layers:

| Layer | Purpose |
|---|---|
| Layer 4: Security Copilot agent | Interactive investigation interface. Calls custom graph and Sentinel MCP tools. |
| Layer 3: Custom graph instance | Typed nodes and edges. Refreshed daily by a notebook job. |
| Layer 2: Scheduled notebook job | Reads lake tables and projects nodes and edges. |
| Layer 1: Sentinel data lake | Stores ISV custom tables and Microsoft native tables. |

Best for ISVs whose value proposition depends on relationship reasoning, such as identity blast radius, asset reachability, and application permission graphs.

### Pattern 4: Custom MCP tool collection plus ISV product agent

The ISV publishes a custom MCP tool collection with parameterized KQL skills against Sentinel data. The ISV product agent, or a customer custom agent, registers that collection together with Microsoft built-in Sentinel MCP collections.

Best for ISVs that already ship their own agent and want deterministic, governed access to Sentinel data in each customer tenant.

### Pattern 5: Security Copilot agent that calls a custom MCP tool collection

This pattern combines pattern 1 and pattern 4. The ISV publishes both a Security Copilot agent and a custom MCP tool collection so the agent, and other agents, can call the same vendor-curated KQL skills.

## Decision checklist

Use this checklist to narrow building blocks for your scenario.

| Question | If yes, consider |
|---|---|
| Is the data not yet in Sentinel? | A Sentinel data connector first. Other building blocks depend on this. |
| Is the primary consumer a SOC analyst who will paste an entity into chat? | Security Copilot agent. |
| Is the primary consumer another agent that needs structured JSON-RPC responses? | Custom MCP tool collection. |
| Does investigation require relationship traversal between two or more entity types? | Custom graph built by a notebook job. |
| Is per-run KQL too expensive, too slow, or non-deterministic inside an agent skill? | Notebook job that precomputes a custom table consumed at query time. |
| Do you need semantic alignment between chat agent and product agent? | Publish a custom MCP tool collection and have the Security Copilot agent call it. |

## Next steps

After you choose building blocks, continue with capability-specific guidance:

- Security Copilot agents on Sentinel data lake: design, author, validate KQL, and publish to Microsoft Security Store.
- Sentinel MCP server and custom MCP tool collections: author `tools.json`, validate over JSON-RPC, and document consuming-agent deployment.
- Custom graphs: design graph schema, build graph notebook jobs, schedule refresh, and query from agents.
- Jupyter notebook jobs: author scheduled notebook jobs that write custom tables or graphs.

If you need help selecting building blocks for your scenario, use the Sentinel Advisory Service intake form.

## Related content

- [Guide to build and publish Microsoft Sentinel solutions](sentinel-siem-platform-solution-introduction.md)
- [Microsoft Sentinel integration guide](sentinel-integration-guide.md)
- [Develop SIEM solutions overview](develop-siem-solutions-overview.md)
- [Develop a Security Copilot agent platform solution](build-agent-security-copilot.md)
- [Develop custom Graph platform solutions](develop-custom-graph-platform-solutions.md)
- [Develop notebook platform solutions](publish-notebook-solutions.md)
- [Sentinel MCP overview](../datalake/sentinel-mcp-overview.md)
