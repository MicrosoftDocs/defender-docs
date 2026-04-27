# Protection & Posture Insights report

## Overview
The **Protection & Posture Insights** report is an on-demand, tenant-specific report in Microsoft Defender for Office 365. It helps you understand how effectively your organisation is protected against threats targeting email and collaboration workloads.

The report brings together **protection effectiveness**, **security posture**, and **threat activity** into a single, downloadable view. You can use it to assess risk, identify configuration gaps, and communicate security outcomes to stakeholders.

> This report is available to Microsoft Defender for Office 365 Plan 2 customers only.

---

## What the report contains
The report includes:

- Tenant-specific telemetry from Microsoft Defender for Office 365.
- Metrics covering threat detection, prevention, delivery outcomes, and policy coverage.
- Breakdowns of threats by type, confidence, detection technology, and user impact.

Together, these insights show both **which threats were present** and **how effectively your controls handled them**.

---

## Recommended actions
Use this report to:

- Identify configuration gaps, such as incomplete policy coverage or suboptimal threshold settings.
- Investigate scenarios where threats were delivered to the Inbox or Junk due to policy overrides or configuration choices.
- Understand whether Priority accounts (if configured) are being disproportionately targeted.
- Prioritise remediation for high-risk users and prevalent threat types.
- Support operational decision-making, posture improvements, and stakeholder communications.

---

## Report sections

- **Executive Summary** – Provides an overview of how many threats & unwanted messages were detected during the reporting period.
- **Effectiveness** – Provides complete transparency into the threats Defender for Office 365 blocked within email.
- **Threat Landscape** – Understand broader attacker behaviours and techniques via threat intelligence articles.
- **Threat Classification** – Breaks down threats detected with AI, attributing their intent and type using large language model (LLM) analysis 
- **Zero-Day Threats (Detonation)** – Highlights threats detected through sandboxing, indicating exposure to advanced attacks and evasion techniques.
- **Priority Accounts** – Highlights the top 5 users tagged as prioirty accounts that were targeted with Phish and Malware.
- **Policy Coverage** – Indicates whether your policy configuration ensures all users benefit from key protections.
- **Delivery Locations** – Reveals where threats ultimately land, directly reflecting user exposure.
- **Detection Trends** – Shows how threat activity and detection volumes changed over the reporting period.
- **Inbound Detection Technology** – Explains which detection layers are doing the work, helping assess defence-in-depth.
- **Phish Threshold Policy Level** – Connects detection aggressiveness to outcomes and false-positive risk.
- **Quarantine Statistics** – Demonstrates what percentage of emails that were quarantined ultimately ended up being released (likely false positives - FPs) to help you further tune your protection.

---

## FAQ

### How is policy coverage calculated?
Policy coverage is calculated by evaluating how often messages for each user were processed by Safe Attachments and Safe Links.

- **Protected**: More than 95% of messages were processed for sandboxing.
- **Partially protected**: Between 10% and 95% of messages were processed.
- **Unprotected**: Fewer than 10% of messages were processed.

If your overall policy coverage is lower than expected, review your policies to ensure the correct users, groups, and domains are included.

---

### Why doesn’t the Priority accounts insight show user names?
User identities are obfuscated and shown as Microsoft Entra account GUIDs. You can search for the displayed GUID in the Microsoft Entra admin centre to identify the corresponding user.

---

### How does this differ from the Defender portal dashboards?
This report provides a consolidated, point-in-time view focused on **outcomes and posture**, generated directly from tenant telemetry at the time the report is created.

---

### Can I validate these findings using Advanced Hunting?
Yes. Select **Go hunt** in the report to open relevant Advanced Hunting queries. Additional queries and insights will be added over time.

---

### How can I provide feedback on the report?
We continuously improve this report based on customer feedback. Submit feedback at  
https://aka.ms/PPIReportFeedback