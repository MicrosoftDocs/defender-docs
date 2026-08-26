---
title: Deploy Microsoft Security Services for Unified Security Operations
description: Deploy Microsoft Defender portal services for unified security operations, including Microsoft Defender XDR, Microsoft Sentinel, and other Microsoft Defender services.
author: guywi-ms
ms.author: guywild
ms.topic: how-to #Don't change.
ms.date: 07/02/2026
ms.collection:
- usx-security
- zerotrust-solution
- msftsolution-secops
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016

#customer intent: As a security administrator, I want to deploy Microsoft Defender portal services for unified security operations.

---

# Deploy Microsoft security services for unified security operations

The Microsoft Defender portal brings together Microsoft Defender XDR, Microsoft Sentinel, and other services for unified security operations. Use Defender portal services to get a full view of your security posture. You can detect, investigate, and respond to threats across your organization.

Microsoft Security Exposure Management and Microsoft Threat Intelligence are available in any environment that meets the prerequisites, to users configured with required permissions.

## Prerequisites

- Before you deploy Microsoft Defender services for unified security operations, make sure you have a plan in place. Your plan should include a workspace design and an understanding of Microsoft Sentinel costs and billing.

  For more information, see [Planning guidance for unified security operations in the Microsoft Defender portal](overview-plan.md).

## Deploy Microsoft Defender XDR services

Microsoft Defender XDR unifies incident response by integrating key capabilities across services. These services include Microsoft Defender for Endpoint, Defender for Office 365, Defender for Cloud Apps, and Defender for Identity. Microsoft Defender XDR adds powerful features you can access in the Microsoft Defender portal.

1. Microsoft Defender XDR automatically turns on when eligible customers with the required permissions visit Microsoft Defender portal. For more information, see [Turn on Microsoft Defender XDR](/defender-xdr/m365d-enable).

1. Continue by deploying Microsoft Defender XDR services. We recommend using the following order:

    1. [Deploy Microsoft Defender for Identity](/defender-for-identity/deploy/quick-installation-guide).
    1. [Deploy Microsoft Defender for Office 365](/defender-xdr/pilot-deploy-defender-office-365?toc=%2Fdefender-office-365%2FTOC.json&bc=%2Fdefender-office-365%2Fbreadcrumb%2Ftoc.json).
    1. [Deploy Microsoft Defender for Endpoint](/defender-endpoint/mde-planning-guide). Add [Microsoft Defender Vulnerability Management](/defender-vulnerability-management/get-defender-vulnerability-management) and/or [Enterprise monitoring for IoT devices](/azure/defender-for-iot/organizations/eiot-defender-for-endpoint), as relevant for your environment.

    1. [Deploy Microsoft Defender for Cloud Apps](/defender-cloud-apps/general-setup).

## Configure Microsoft Entra ID Protection

Microsoft Defender XDR can ingest signals from Microsoft Entra ID Protection. This service evaluates risk data from billions of sign-in attempts and scores the risk of each sign-in to your environment. Microsoft Entra ID uses this data to allow or block account access, based on how Conditional Access policies are configured.

Configure Microsoft Entra ID Protection to enhance your security posture and add Microsoft Entra signals to your unified security operations. For more information, see [Configure your Microsoft Entra ID Protection policies](/entra/id-protection/how-to-deploy-identity-protection).

## Deploy Microsoft Defender for Cloud

Microsoft Defender for Cloud provides a unified security management experience for your cloud resources, and can also send signals to Microsoft Defender XDR. For example, you might want to start by connecting your Azure subscriptions to Microsoft Defender for Cloud, and then move on to other cloud environments.

For more information, see [Connect your Azure subscriptions](/azure/defender-for-cloud/connect-azure-subscription).

## Onboard to Microsoft Security Copilot

Onboard to Microsoft Security Copilot to enhance your security operations with advanced AI. Security Copilot helps you detect, investigate, and respond to threats. It provides insights and recommendations to help you stay ahead of risks. Use Security Copilot to automate routine tasks, reduce response times, and improve the efficiency of your security team.

For more information, see [Get started with Security Copilot](/copilot/security/get-started-security-copilot).

## Architect your workspace and onboard to Microsoft Sentinel

The first step in using Microsoft Sentinel is to create a Log Analytics workspace, if you don't have one already. A single Log Analytics workspace might be enough for many environments. However, some organizations create multiple workspaces to reduce costs and meet different business needs. The Defender portal supports a primary workspace and multiple secondary workspaces.

1. Create a Security resource group for governance purposes, which allows you to isolate Microsoft Sentinel resources and role-based access to the resource group.
1. Create a Log Analytics workspace in the Security resource group and onboard Microsoft Sentinel into it.

For more information, see [Onboard Microsoft Sentinel](/azure/sentinel/quickstart-onboard) and [Multiple Microsoft Sentinel workspaces in the Defender portal](https://go.microsoft.com/fwlink/p/?linkid=2310579).

## Configure roles and permissions

Provision your users based on your documented [roles and permissions access plan](overview-plan.md#plan-roles-and-permissions). To follow Zero Trust principles, use role-based access control (RBAC) to give each user access only to the resources they need. Don't provide access to the entire environment.

[!INCLUDE [mininum-access-requirements](includes/mininum-access-requirements.md)]

For more information, see:

- [Onboarding prerequisites](microsoft-sentinel-onboard.md#prerequisites)
- [Assign Microsoft Entra ID roles to users](/entra/identity/role-based-access-control/manage-roles-portal)
- [Grant a user access to Azure roles](/azure/role-based-access-control/quickstart-assign-role-user-portal)
- [Managing unified RBAC in Microsoft Defender](https://aka.ms/defender_RBAC) (video demo)

## Onboard to the Defender portal

Onboard Microsoft Sentinel to the Defender portal to combine it with Microsoft Defender XDR. This gives you unified incident management and advanced hunting. For more information, see [Connect Microsoft Sentinel to Microsoft Defender](microsoft-sentinel-onboard.md).

## Fine-tune system configurations

Use the following Microsoft Sentinel configuration options to fine-tune your deployment:

### Enable health and auditing

Turn on the auditing and health monitoring feature in the Microsoft Sentinel Settings page. This feature monitors the health and integrity of supported Microsoft Sentinel resources. Get insights on health drifts, such as recent failure events or changes from success to failure states. You can also track unauthorized actions and use the audit data to create notifications and automated actions.

For more information, see [Turn on auditing and health monitoring for Microsoft Sentinel](/azure/sentinel/enable-monitoring?tabs=azure-portal).

### Configure Microsoft Sentinel content

Based on your [planned Microsoft Sentinel costs and data sources](overview-plan.md#plan-microsoft-sentinel-costs-and-data-sources), install the corresponding Microsoft Sentinel solutions and configure your data connectors. Microsoft Sentinel provides a wide range of built-in solutions and data connectors, but you can also build custom connectors and set up connectors to ingest CEF or Syslog logs.

For more information, see:

- [Configure content](/azure/sentinel/configure-content)
- [Discover and manage Microsoft Sentinel out-of-the-box content](/azure/sentinel/sentinel-solutions-deploy?tabs=azure-portal)
- [Find your data connector](/azure/sentinel/data-connectors-reference)

### Enable User and Entity Behavior Analytics (UEBA)

After setting up data connectors in Microsoft Sentinel, make sure to enable user entity behavior analytics to identify suspicious behavior that could lead to phishing exploits and eventually attacks such as ransomware. For more information, see [Enable UEBA in Microsoft Sentinel](/azure/sentinel/enable-entity-behavior-analytics?tabs=azure).

### Set up interactive and long-term data retention

Set up interactive and long-term data retention to make sure your organization retains the data that's important in the long term. For more information, see [Configure interactive and long-term data retention](/azure/sentinel/configure-data-retention-archive).  

### Enable analytics rules

Analytics rules tell Microsoft Sentinel to alert you to events using a set of conditions that you consider to be important. The out-of-the-box decisions Microsoft Sentinel makes are based on user entity behavioral analytics (UEBA) and on correlations of data across multiple data sources. When turning on analytic rules for Microsoft Sentinel, prioritize enabling by connected data sources, organizational risk, and MITRE tactic.

For more information, see [Threat detection in Microsoft Sentinel](/azure/sentinel/threat-detection).

### Review anomaly rules

Microsoft Sentinel anomaly rules are available out-of-the-box and enabled by default. Anomaly rules are based on machine learning models and UEBA that train on the data in your workspace to flag anomalous behavior across users, hosts, and others. Review the anomaly rules and anomaly score threshold for each one. If you're observing false positives for example, consider duplicating the rule and modifying the threshold.

For more information, see [Work with anomaly detection analytics rules](/azure/sentinel/work-with-anomaly-rules#tune-anomaly-rules).

### Use the Microsoft Threat Intelligence analytics rule

Enable the out-of-the-box Microsoft Threat Intelligence analytics rule and verify that it matches your log data with Microsoft-generated threat intelligence. For more information, see [Detect threats with threat indicator analytics](/azure/sentinel/understand-threat-intelligence#detect-threats-with-threat-indicator-analytics). Microsoft has a vast repository of threat intelligence data. The Microsoft Threat Intelligence analytics rule uses a subset of that data to generate high-fidelity alerts and incidents for SOC (security operations centers) teams to triage.

### Avoid duplicate incidents

After you [connect Microsoft Sentinel to Microsoft Defender](microsoft-sentinel-onboard.md), a bi-directional sync between Microsoft Defender XDR incidents and Microsoft Sentinel is automatically established. To avoid creating duplicate incidents for the same alerts, we recommend that you turn off all Microsoft incident creation rules for Microsoft Defender XDR-integrated products, including Defender for Endpoint, Defender for Identity, Defender for Office 365, Defender for Cloud Apps, and Microsoft Entra ID Protection.

For more information, see [Microsoft incident creation ](/azure/sentinel/microsoft-365-defender-sentinel-integration?tabs=azure-portal).

### Conduct a MITRE ATT&CK crosswalk

With fusion, anomaly, and threat intelligence analytic rules enabled, conduct a MITRE Att&ck crosswalk to help you decide which remaining analytic rules to enable and to finish implementing a mature XDR (extended detection and response) process. This empowers you to detect and respond throughout the lifecycle of an attack.

For more information, see [Understand security coverage](/azure/sentinel/mitre-coverage).
