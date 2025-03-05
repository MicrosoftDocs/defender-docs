---
title: Deploy Microsoft's unified SecOps platform | Microsoft Defender
description: Deploy Microsoft's unified security operations platform with the Microsoft Defender portal, Microsoft Sentinel, and other Microsoft Defender services.
author: batamig
ms.author: bagol
ms.service: unified-secops-platform
ms.topic: how-to #Don't change.
ms.date: 12/02/2024
ms.collection:
- usx-security


#customer intent: As a security administrator, I want to deploy Microosft's unified security operations platform so that I can access Microsoft Sentinel services together with other Microsoft Defender services in the Microsoft Defender portal.

---

# Deploy Microsoft's unified SecOps platform

Microsoft's unified security operations platform combines the capabilities of Microsoft Defender portal, Microsoft Sentinel, and other Microsoft Defender services. This platform provides a comprehensive view of your organization's security posture and helps you to detect, investigate, and respond to threats across your organization.

Microsoft Security Exposure Management and Microsoft Threat Intelligence are available in any environment that meets the prerequisites, to users configured with required permissions.

## Prerequisites

- Before you deploy Microsoft's unified security operations platform, make sure that you have a plan in place, including a workspace design and an understanding of Microsoft Sentinel costs and billing.

  For more information, see [Unified security operations platform planning overview](overview-plan.md).

## Deploy Microsoft Defender XDR services

Microsoft Defender XDR unifies incident response by integrating key capabilities across services, including Microsoft Defender for Endpoint, Microsoft Defender for Office 365, Microsoft Defender for Cloud Apps, and Microsoft Defender for Identity. This unified experience adds powerful features you can access in the Microsoft Defender portal.

1. Microsoft Defender XDR automatically turns on when eligible customers with the required permissions visit Microsoft Defender portal. For more information, see [Turn on Microsoft Defender XDR](/defender-xdr/m365d-enable).

1. Continue by deploying Microsoft Defender XDR services. We recommend using the following order:

    1. [Deploy Microsoft Defender for Identity](/defender-for-identity/deploy/quick-installation-guide).
    1. [Deploy Microsoft Defender for Office 365](/defender-xdr/pilot-deploy-defender-office-365?toc=%2Fdefender-office-365%2FTOC.json&bc=%2Fdefender-office-365%2Fbreadcrumb%2Ftoc.json).
    1. [Deploy Microsoft Defender for Endpoint](/defender-endpoint/mde-planning-guide). Add [Microsoft Defender Vulnerability Management](/defender-vulnerability-management/get-defender-vulnerability-management) and/or [Enterprise monitoring for IoT devices](/azure/defender-for-iot/organizations/eiot-defender-for-endpoint), as relevant for your environment.

    1. [Deploy Microsoft Defender for Cloud Apps](/defender-cloud-apps/general-setup).

## Configure Microsoft Entra ID Protection

Microsoft Defender XDR can ingest and include signals from Microsoft Entra ID Protection, which evaluates risk data from billions of sign-in attempts and evaluates the risk of each sign-in to your environment. Microsoft Entra ID Protection data is used by Microsoft Entra ID to allow or prevent account access, depending on how Conditional Access policies are configured.

Configure Microsoft Entra ID Protection to enhance your security posture and add Microsoft Entra signals to your unified security operations. For more information, see [Configure your Microsoft Entra ID Protection policies](/entra/id-protection/how-to-deploy-identity-protection).

## Deploy Microsoft Defender for Cloud

Microsoft Defender for Cloud provides a unified security management experience for your cloud resources, and can also send signals to Microsoft Defender XDR. For example, you might want to start by connecting your Azure subscriptions to Microsoft Defender for Cloud, and then move on to other cloud environments.

For more information, see [Connect your Azure subscriptions](/azure/defender-for-cloud/connect-azure-subscription).

## Onboard to Microsoft Security Copilot

Onboard to Microsoft Security Copilot to enhance your security operations by leveraging advanced AI capabilities. Security Copilot assists in threat detection, investigation, and response, providing actionable insights and recommendations to help you stay ahead of potential threats. Use Security Copilot to automate routine tasks, reduce the time to detect and respond to incidents, and improve the overall efficiency of your security team.

For more information, see [Get started with Security Copilot](/copilot/security/get-started-security-copilot).

## Architect your workspace and onboard to Microsoft Sentinel

The first step in using Microsoft Sentinel is to create a Log Analytics workspace, if you don't have one already. A single Log Analytics workspace might be sufficient for many environments, but many organizations create multiple workspaces to optimize costs and better meet different business requirements. Microsoft's unified security operations platform supports only a single workspace.

1. Create a Security resource group for governance purposes, which allows you to isolate Microsoft Sentinel resources and role-based access to the collection.
1. Create a Log Analytics workspace in the Security resource group and onboard Microsoft Sentinel into it.

For more information, see [Onboard Microsoft Sentinel](/azure/sentinel/quickstart-onboard).

## Configure roles and permissions

Provision your users based on the access plan you'd [prepared earlier](overview-plan.md#plan-roles-and-permissions). To comply with Zero Trust principles, we recommend that you use role-based access control (RBAC) to provide user access only to the resources that are allowed and relevant for each user, instead of providing access to the entire environment.

For more information, see:

- [Activate Microsoft Defender XDR Unified role-based access control (RBAC)](/defender-xdr/activate-defender-rbac)
- [Assign Microsoft Entra ID roles to users](/entra/identity/role-based-access-control/manage-roles-portal)
- [Grant a user access to Azure roles](/azure/role-based-access-control/quickstart-assign-role-user-portal)

## Onboard to unified SecOps

When you onboard Microsoft Sentinel to the Defender portal, you unify capabilities with Microsoft Defender XDR like incident management and advanced hunting, creating a unified SecOps platform.

1. Install the **Microsoft Defender XDR** solution for Microsoft Sentinel from the **Content hub**. For more information, see [Deploy and manage out-of-the-box-content](/azure/sentinel/sentinel-solutions-deploy).
1. Enable the **Microsoft Defender XDR** data connector to collect incidents and alerts. For more information, see [Connect data from Microsoft Defender XDR to Microsoft Sentinel](/azure/sentinel/connect-microsoft-365-defender).
1. Onboard to Microsoft's unified SecOps platform. For more information, see [Connect Microsoft Sentinel to Microsoft Defender](microsoft-sentinel-onboard.md).

## Fine-tune system configurations

Use the following Microsoft Sentinel configuration options to fine-tune your deployment:

### Enable health and auditing

Monitor the health and audit the integrity of supported Microsoft Sentinel resources by turning on the auditing and health monitoring feature in Microsoft Sentinel's Settings page. Get insights on health drifts, such as the latest failure events or changes from success to failure states, and on unauthorized actions, and use this information to create notifications and other automated actions.

For more information, see[Turn on auditing and health monitoring for Microsoft Sentinel](/azure/sentinel/enable-monitoring?tabs=azure-portal).

### Configure Microsoft Sentinel content

Based on the [data sources you selected](overview-plan.md#plan-microsoft-sentinel-costs-and-data-sources) when planning your deployment, install Microsoft Sentinel solutions and configure your data connectors. Microsoft Sentinel provides a wide range of built-in solutions and data connectors, but you can also build custom connectors and set up connectors to ingest CEF or Syslog logs.

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

Enable the out-of-the-box Microsoft Threat Intelligence analytics rule and verify that [this rule matches your log data with Microsoft-generated threat intelligence](/azure/sentinel/understand-threat-intelligence#detect-threats-with-threat-indicator-analytics). Microsoft has a vast repository of threat intelligence data, and this analytic rule uses a subset of it to generate high fidelity alerts and incidents for SOC (security operations centers) teams to triage.

### Avoid duplicate incidents

After you [connect Microsoft Sentinel to Microsoft Defender](microsoft-sentinel-onboard.md), a bi-directional sync between Microsoft Defender XDR incidents and Microsoft Sentinel is automatically established. To avoid creating duplicate incidents for the same alerts, we recommend that you turn off all Microsoft incident creation rules for Microsoft Defender XDR-integrated products, including Defender for Endpoint, Defender for Identity, Defender for Office 365, Defender for Cloud Apps, and Microsoft Entra ID Protection.

For more information, see [Microsoft incident creation ](/azure/sentinel/microsoft-365-defender-sentinel-integration?tabs=azure-portal).

### Conduct a MITRE ATT&CK crosswalk

With fusion, anomaly, and threat intelligence analytic rules enabled, conduct a MITRE Att&ck crosswalk to help you decide which remaining analytic rules to enable and to finish implementing a mature XDR (extended detection and response) process. This empowers you to detect and respond throughout the lifecycle of an attack.

For more information, see [Understand security coverage](/azure/sentinel/mitre-coverage).

