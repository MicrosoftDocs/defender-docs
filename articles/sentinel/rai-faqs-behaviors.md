---
title: Responsible AI FAQ for the Microsoft Sentinel behaviors layer
description: This FAQ provides information about the AI technology used in Microsoft Sentinel, along with key considerations and details about how AI is used, how it was tested and evaluated, and any specific limitations.  
ms.date: 10/27/2025  
ms.custom:  
  - responsible-ai-faqs  
ms.topic: contributor-guide  
author: guywi-ms  
ms.author: guywild  
ms.reviewer: mschechter  
---

# Responsible AI FAQ for the Microsoft Sentinel behaviors layer

These frequently asked questions (FAQ) describe the AI impact of the Microsoft Sentinel behaviors layer feature in Microsoft Sentinel.


## What is the Microsoft Sentinel behaviors layer?

The Microsoft Sentinel behaviors layer is an AI-powered capability in Microsoft Sentinel that transforms fragmented raw logs into contextualized behavioral insights that explain “who did what to whom”.

- **Inputs:** Raw security logs from sources, such as the AWS CloudTrail and CommonSecurityLog tables.  
- **Outputs:** Structured behavior objects enriched with MITRE ATT&CK mappings, entity roles, and natural language explanations.

## What are the capabilities of the Microsoft Sentinel behaviors layer?

The Microsoft Sentinel behaviors layer provides these key capabilities:
- **Behavior aggregation:** Automatically groups and sequences related security events across multiple data sources. Instead of analysts manually correlating raw logs, the behaviors layer creates unified behavior objects that present “what happened” in a structured way.

- **Contextualization:** Each behavior is enriched with security context, including mapping to MITRE ATT&CK tactics and techniques. This helps analysts understand the intent behind an activity - for example, lateral movement, privilege escalation - without needing deep familiarity with every log format.

- **Explainability:**  Generates natural language summaries of behaviors, making investigations faster and more accessible. Analysts can quickly see what happened and why it matters.

- **Detection authoring:** Converts behavior hypotheses into Kusto Query Language (KQL) queries, simplifying the creation of detection rules. This reduces the complexity of writing queries from scratch and accelerates threat hunting and detection engineering.

- **Responsible AI checks:**  Built-in validation steps ensure queries reflect the intended behavior and do not expose sensitive data. LLM-based checks confirm query accuracy, successful execution, and compliance with privacy safeguards—embedding responsible AI principles into the workflow.


## What is the intended use of the Microsoft Sentinel behaviors layer?

The intended use is to accelerate threat detection and investigation by providing SOC analysts with a unified, AI-driven view of behaviors. It supports:  
- Threat hunting  
- Detection rule authoring  
- Incident investigation and triage  


## How was the Microsoft Sentinel behaviors layer evaluated? What metrics are used to measure performance?

Microsoft Sentinel behaviors layer evaluation included:  
- **Data source selection:** In collaboration with security researchers, we selected data sources that represent high-value telemetry for SOC workflows and allow testing across diverse event types.  
- **Sampling mechanism:** We sampled one log per activity type to ensure representative coverage of the data source. This approach avoids bias toward frequent activities and helps validate that the AI pipeline generalizes across different behaviors.  
- **AI pipeline testing:**  
    - Hypothesis generation: An agent generates hypotheses for behaviors that describe multiple related events, simulating real-world attack patterns.
    - Query conversion: A second agent converts these hypotheses into KQL queries that aim to capture the intended behaviors, ensuring operational usability.
    - LLM validation: Queries are validated using a large language model (LLM) to confirm they reflect the behavioral intent and compile successfully, reducing false positives and operational friction.
    - Sensitive data check: An additional LLM-based test ensures that sensitive data is not exposed in the KQL queries, embedding privacy safeguards and responsible AI principles into the process.  

## What are the limitations of the Microsoft Sentinel behaviors layer? How can users minimize the impact?

- **Limited data source coverage:** Currently supports CommonSecurityLogs and AWSCloudTrail.  
- **Dependence on log quality:** Incomplete or noisy logs can reduce accuracy.  
- **Preview feature:** Behavior schema and AI models may evolve.  
**Mitigation:** Ensure high-quality log ingestion, validate AI-generated queries, and use human review for critical detections.


## What operational factors and settings allow for effective and responsible use of the feature?

- **Enable supported connectors** for AWS and CommonSecurityLog sources.  
- **Review AI-generated outputs** before deploying detection rules.  
- **Monitor updates** as the feature expands to new sources and schemas.

## See also

- [Microsoft Sentinel behaviors layer](https://learn.microsoft.com/azure/sentinel/)  
