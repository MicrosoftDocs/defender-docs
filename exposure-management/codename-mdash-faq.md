---
title: Codename MDASH - FAQ
description: Frequently asked questions for the Codename MDASH - Agentic code scanner Microsoft Defender.
ms.topic: faq
ms.date: 07/14/2026
ai-usage: ai-assisted
---

# Codename MDASH - FAQ

## What does Codename MDASH do?

Codename MDASH is the Microsoft Security multi-model agentic scanning system, built by Microsoft's Autonomous Code Security team. It uses large language models to analyze source code and help assess potential exploitability. It: helps increases confidence in finding zero-day and logic-flaw vulnerabilities; correlates code findings with runtime deployment context to prioritize real-world exposure; uses independent AI models to cross-check findings and helps increase confidence in exploitability; and triages findings into Critical, Important, or other severity tiers using AI.

## How does Codename MDASH work at a high level?

A useful mental model is a structured pipeline that takes a code base and emits validated findings with supporting evidence:

- **Prepare**: Ingests the source target, builds language-aware indices, and maps the attack surface and threat models by analyzing past git commits and building a graph.
- **Scan**: Runs specialized auditor agents over candidate code paths, emitting candidate findings with hypotheses and evidence.
- **Validate**: A second cohort of agents (debaters) argue for and against each finding's reachability and exploitability.
- **Dedupe**: Collapses semantically equivalent findings (for example, patch-based grouping).
- **Prove**: Constructs and executes triggering inputs where the bug class allows, validating the pre-condition dynamically to prove the vulnerability exists.

## What kinds of vulnerabilities is Codename MDASH designed to find?

It targets vulnerabilities in source code, especially deep, complex bugs that are hard to detect with pattern matching: use-after-free, double-free, buffer overflows, and other memory-safety issues where the exploit path requires reasoning across multiple files, calls, and branches. It's applied to some of the most complex code Microsoft builds, including Windows, Hyper-V, Azure virtualization and infrastructure, and Active Directory Domain Services. It does not replace static analysis or manual review; it adds a layer of deep, reasoning-capable analysis.

## On May 12, 2026, what did Microsoft announce about its new AI scanning system?

Microsoft announced advancements in agentic cyber defense: Codename MDASH helped researchers identify vulnerabilities in limited internal testing scenarios across the Windows networking and authentication stack, including four critical remote-code-execution flaws in components such as the Windows kernel TCP/IP stack and the IKEv2 service. Compared with some single-model approaches, codename MDASH orchestrates a large number of specialized AI agents across an ensemble of frontier and distilled models to discover, debate, and prove exploitable vulnerabilities end-to-end. It's in use by Microsoft engineering teams and tested by a small set of customers currently in private preview.

## Is Codename MDASH signature-based, and can it find zero-day vulnerabilities?

Codename MDASH isn't signature-based. It's designed to use AI/LLM reasoning to analyze code for vulnerability patterns rather than a database of known signatures (though it draws on a knowledge base of past CVEs and patches to inform analysis). Because of this, it might help identify previously unknown vulnerabilities, including zero-day vulnerabilities. [Read more in the blog announcement](https://www.microsoft.com/security/blog/2026/05/12/defense-at-ai-speed-microsofts-new-multi-model-agentic-security-system-tops-leading-industry-benchmark/).

## Does Codename MDASH analyze source code or compiled binaries?

It operates on source code, but doesn't support compiled binaries or JAR files.

## What languages and environments does Codename MDASH support, including OT/PLC code?

Codename MDASH operates across codebases generically. It has 100+ agents with different roles and expertise, and we continually tune it to deepen expertise across languages and environments, including domain-specific languages used in industrial controllers and PLCs (OT). Codename MDASH is continually adding new agents and expertise. Currently, individual agents have been trained with particularly deep expertise in languages such as C, C++, Java, C#.

## Is codename MDASH only available on Windows, or does it also work on Mac and Linux?

The Defender CLI is available on Windows, Mac, and Linux.

## If Codename MDASH uses multiple models, do results just depend on which model is best at any moment?

This is exactly why the architecture is model-agnostic by design. When a better model becomes available, Codename MDASH can integrate it without rebuilding the pipeline. Targeting logic, validation stages, agent configuration, and prove infrastructure all carry over. The value is not any one model, it's the orchestration; how Codename MDASH structures model outputs, debates and validates findings, and turns hypotheses into confirmed, proven vulnerabilities.

## Which AI models does Codename MDASH use?

Codename MDASH uses a variety of models to which customers provision access in Microsoft Foundry, giving customers visibility and transparency over the models used. It's multimodel by design and can switch models over time. Through Microsoft Foundry, customers can see how many tokens each model consumes.

## Can customers choose or bring their own models or agents (BYOA)?

Currently, no. Customers can select from models supported within Foundry, but they can't bring their own models. In addition, Codename MDASH doesn't support creating or importing custom agents (BYOA).

## Does Codename MDASH modify the customer environment or remediate?

No. Codename MDASH is read-only; it discovers vulnerabilities and produces findings with remediation guidance, but doesn't modify the environment, apply fixes, open PRs, or push remediations on its own. Remediation is a separate, optional, developer-initiated step. The Defender CLI includes a **defender fix** option that proposes code changes to speed remediation, but those changes should be reviewed and approved by developers.

## Does Codename MDASH provide fixes, PRs, or remediation guidance, and in what output format?

Yes, as guidance, not automatic changes. Findings are delivered as machine-readable SARIF (Static Analysis Results Interchange Format) for tooling ingestion and a rich HTML view, with human-readable remediation guidance for each finding. Both are reviewable in the Defender portal via the AI code scanning initiative. Separately, the you can use the Defender CLI with GitHub Copilot to generate a local fix; Codename MDASH doesn't apply fixes automatically. Customers should review and validate any proposed change before approving and merging.

## What integration steps are required for the autofix workflow, and is it a Foundry flow?

Autofix requires the Defender CLI, the GitHub Copilot CLI, and a completed codename MDASH scan with SARIF output. It uses the SARIF findings to generate suggested code fixes in your local repository. It's a separate, developer-initiated flow (not a Foundry flow), and changes should be reviewed and approved by developers.

## What if the customers don't use GitHub?

Customers can scan any git-based repository, which they clone locally to trigger a scan. However, autofix requires GitHub Copilot for the local code changes.

## Does Codename MDASH provide remediation beyond simple code fixes (for example, architectural redesign or structural recommendations)?

Codename MDASH is a discovery and validation engine. Its remediation is code-level, not architectural. It allows grouping related findings so they can be addressed in a single fix and offers a Copilot-driven autofix that generates a function-level fix on a new branch for developer review.

## Can Codename MDASH suggest alternative remediation strategies beyond code-level patches?

No.

## Can Codename MDASH integrate into CI/CD pipelines?

Yes. Scan locally with the Defender CLI using an interactive login, or integrate into CI/CD by creating an Entra app registration with a client secret for non-interactive authentication. CI/CD integration is best suited for asynchronous security review rather than deterministic build-blocking gates, because scans can be long-running and AI-based analysis is non-deterministic.

## How much effort and expertise is needed to set up Codename MDASH correctly?

Customers accept the preview terms and conditions for Codename MDASH, configure Foundry for inference, download the CLI to run scans, or connect their GitHub repository and initiate a scan from Defender portal. This requires some expertise across security admins, developers, and DevOps teams.

## Is Codename MDASH suitable for continuous usage or only for periodic/batch analysis?

There's no fixed duration. Scan time varies with codebase size (lines of code), programming language, repository complexity, and the number of findings produced. Scans can be long-running and run asynchronously.

## Does Codename MDASH support on-prem and cloud code repositories?

Yes, both are supported. During the current validation phase, the scanned repository needs to be cloned to the test machine running the scanner.

## Is read-only access to the repository sufficient to execute the assessment?

Yes.

## What are the current scale limits?

Approximately 256 MB per repo (subject to change). One concurrent scan per tenant at this stage (subject to change; might vary by environment). Capacity is the primary constraint in preview; scans are deliberately rate-limited to protect quality.

## How is the confidentiality of submitted code ensured?

Customer source code is encrypted at rest and securely stored in the customer's Defender XDR tenant. Microsoft employee access to that source code is restricted by operational and security controls. Scans are completed by pretrained models hosted in Microsoft Foundry, and Microsoft acts as the data processor for prompts and outputs sent to or generated by these models (subject to applicable service terms).

## Where is customer data processed and stored (data residency)?

Customer source code and scan results are stored encrypted at rest within the customer's Defender XDR tenant, in the same region as that tenant. This data is processed in the same region, and inference over the source code runs in the region the customer specifies when connecting codename MDASH to their Microsoft Foundry endpoints (subject to applicable service terms).

## Is Codename MDASH covered under Microsoft's Data Protection Addendum (DPA)? Are there any deviations or exclusions?

For the private preview, the **Previews** section of the DPA applies, which incorporates deletion. Specific retention and deletion timelines are covered separately.

## How is uploaded data classified: Cache, Persistent, or Backup?

Persistent.

## Is customer code used to train models?

No. Source code is processed by models in Microsoft Foundry. These models are stateless; the model doesn't store source code or generated output, and submitted code isn't used to train, retrain, or improve the base models. Data handling is subject to applicable Microsoft agreements and service terms.

## For compliance approval, we need to understand whether Microsoft enables any detailed or verbose logging. If so, what data is captured, where is it processed, and how is it retained or protected?

Codename MDASH logs activity via an audit trail. It captures privileged-user actions across the scan lifecycle (CLI onboarding, Foundry connect/disconnect, scan start/cancel/upload/view/export), with timestamp, user, client IP, scan ID, code target, source surface, and result. Source code isn't logged. Audit events stay in the customer's Entra tenant log (queried via Microsoft Purview).

## What are the licensing prerequisites? How will Codename MDASH be licensed?

Customers must have an eligible Microsoft Defender XDR plan, and Codename MDASH must be enabled and configured through the Microsoft Defender portal. Customers with Defender XDR access through an eligible license are qualified for participation in MDASH.

## Related content

- [Codename MDASH overview](ai-code-security-overview.md)
- [Codename MDASH - Agentic code scanner initiative](mdash-initiative.md)