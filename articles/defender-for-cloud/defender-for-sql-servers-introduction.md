---
title: Overview of Microsoft Defender for SQL servers on machines
description: Learn how Microsoft Defender for SQL servers on machines secures your SQL databases. It works on Azure, AWS, GCP, and on-premises. It finds vulnerabilities and detects threats.
ms.date: 12/10/2024
ms.topic: concept-article
ms.author: dacurwin
author: dcurwin
#customer intent: As a security administrator, I want to understand how Microsoft Defender for SQL servers on machines works so that I can protect my SQL databases from potential threats.
---

# Overview of Microsoft Defender for SQL servers on machines

Microsoft Defender for Cloud's Defender for Databases plan provides protection for SQL servers on machines. Defender for SQL servers on machines protects SQL servers hosted on Azure, Amazon Web Service (AWS), Google Cloud Project (GCP), and on premises machines. Defender for SQL servers on machines helps you identify and mitigate potential database vulnerabilities and detect anomalous activities that could indicate threats to your databases.

## What are the benefits of Defender for SQL servers on machines?

Defender for SQL servers on machines provides the following features:

- [Vulnerability assessment](sql-azure-vulnerability-assessment-overview.md): Scan databases to discover, track, and remediate vulnerabilities.
- [Advanced threat protection](/azure/azure-sql/database/threat-detection-overview?toc=/azure/defender-for-cloud/toc.json): Mitigate threats by receiving detailed security alerts and recommended actions based on SQL Advanced Threat Protection.

When you [enable Defender for SQL servers on machines](defender-for-sql-usage.md), all supported resources that exist within the subscription are protected. Future resources created on the same subscription ware also be protected.

Defender for SQL servers on machines allows you to [explore vulnerability assessment reports](defender-for-sql-on-machines-vulnerability-assessment.md#explore-vulnerability-assessment-reports) via scans that occur every 12 hours. The vulnerability assessment reports provide an overview of your SQL machines' security state and details of any security findings. Defender for SQL servers on machines helps you identify and mitigate potential database vulnerabilities, and detect anomalous activities that could indicate threats to your databases.

You can also [set a baseline](defender-for-sql-on-machines-vulnerability-assessment.md#set-a-baseline) to mark the current state of your SQL servers on machines and compare it to the state of your SQL servers on machines at a later time. This process allows you to track changes in your SQL servers on machines' security state over time.

Results can also be [exported to a CSV file](defender-for-sql-on-machines-vulnerability-assessment.md#export-results) for further analysis, or you can [view vulnerabilities in graphical, interactive reports](defender-for-sql-on-machines-vulnerability-assessment.md#view-vulnerabilities-in-graphical-interactive-reports).

Advanced Threat Protection can identify **Potential SQL injection**, **Access from unusual location or data center**, **Access from unfamiliar principal or potentially harmful application**, and **Brute force SQL credentials**.

With all of these features, Defender for SQL servers on machines helps you to protect your SQL servers on machines from potential threats and vulnerabilities.

## Related resources

> [Enable Microsoft Defender for SQL servers on machines](defender-for-sql-usage.md)