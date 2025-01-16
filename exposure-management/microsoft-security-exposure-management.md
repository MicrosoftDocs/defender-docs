---
title: What is Microsoft Security Exposure Management?
description: Learn how Microsoft Security Exposure Management enhances and extends security posture management.
author: dlanger
ms.author: dlanger
manager: rayne-wiselman
ms.topic: overview
ms.service: exposure-management
ms.date: 11/04/2024
---


# What is Microsoft Security Exposure Management?

Microsoft Security Exposure Management is a security solution that provides a unified view of security posture across company assets and workloads. Security Exposure Management enriches asset information with security context that helps you to proactively manage attack surfaces, protect critical assets, and explore and mitigate exposure risk.

> [!NOTE]
> Microsoft Security Exposure Management data and capabilities are currently unavailable in U.S Government clouds - GCC, GCC High and DoD.

## Who uses Security Exposure Management?

Security Exposure Management is aimed at:

- Security and compliance admins responsible for maintaining and improving organizational security posture.
- Security operations (SecOps) and partner teams who need visibility into data and workloads across organizational silos to effectively detect, investigate, and mitigate security threats.
- Security architects responsible for solving systematic issues in overall security posture.
- Chief Information Security Officers (CISOs) and security decision makers who need insights into organizational attack surfaces and exposure in order to understand security risk within organizational risk frameworks.

## What can I do with Security Exposure Management?

With Security Exposure Management you can:

- **Get a unified view across the organization**: Security Exposure Management continuously discovers assets and workloads, and gathers discovered data into a unified and up-to-date view of your inventory and attack surface.

- **Manage and investigate attack surfaces**: Visualize, analyze, and manage cross-workload attack surfaces.
  - The enterprise exposure graph gathers information to provide a comprehensive view of security posture and exposure across the business.
  - Graph schemas provide contextual information about specific organizational entities such as devices, identities, machines, and storage.
  - Query the enterprise exposure graph to explore assets, assess risk, and hunt for threats across on-premises, hybrid, and multicloud environments.
  - Visualize your environment and graph queries with the attack surface map.

- **Discover and safeguard critical assets**: Security Exposure Management marks predefined assets and assets you customize, as critical. This enables you to focus and prioritize on those critical assets to ensure security and business continuity.

- **Manage exposure**: Security Exposure Management provides tools to manage security exposure, and mitigate exposure risk.
  - Exposure insights aggregate security posture data, and provide rich context around the security posture state of your asset inventory.
  - You leverage these insights to prioritize security efforts and investments.
  - Insights include security events, recommendations, metrics, and security initiatives.
  - As you manage exposure risk, attack paths show you how an attacker might breach your attack surface.
    - Security Exposure Management generates attack paths based on data collected across assets and workloads. It simulates attack scenarios, and identifies weaknesses that an attacker could exploit.
    - You can use the enterprise exposure graph and attack surface map to visualize and understand potential threats.
    - You can also focus on choke points through which many attack paths flow.
    - Actionable recommendations help you to mitigate identified attack paths.

- **Connect your data**: Security Exposure Management supports a variety of data connectors to integrate with different security solutions and data sources.
  - Consolidate security data from multiple sources into a single, unified view.
  - Gain deeper insights into your security posture by integrating data from various environments.
  - Simplify the management of security data across different platforms and solutions.

## What's integrated into Security Exposure Management?

Currently, Security Exposure Management consolidates security posture information and insights from workloads that include:

- Microsoft Defender for Endpoint
- Microsoft Defender for Identity
- Microsoft Defender for Cloud Apps
- Microsoft Defender for Office
- Microsoft Defender for IoT
- Microsoft Secure Score  
- Microsoft Defender Vulnerability Management  
- Microsoft Defender for Cloud
- Microsoft Entra ID  
- Microsoft Defender External Attack Surface Management (EASM)

In addition to Microsoft services, Security Exposure Management allows you to connect to external data sources to further enrich and extend your security posture management.
For more information on data connectors, see [Data connectors overview](overview-data-connectors.md).

## How do I buy Microsoft Security Exposure Management?

Exposure Management is available in the Microsoft Defender portal at [https://security.microsoft.com](https://security.microsoft.com)

Access to the exposure management blade and features in the Microsoft Defender portal is available with any of these licenses:

- Microsoft 365 E5 o*r A5*
- Microsoft 365 E3
- Microsoft 365 E3 with the Microsoft Enterprise Mobility + Security E5 add-on
- Microsoft 365 A3 with the Microsoft 365 A5 security add-on
- Microsoft Enterprise Mobility + Security E5 or A5
- Microsoft Defender for Endpoint (Plan 1 and 2)
- Microsoft Defender for Identity
- Microsoft Defender for Cloud Apps
- Microsoft Defender for Office 365 (Plans 1 and 2)
- Microsoft Defender Vulnerability Management

Integration of data from the above tools and other Microsoft Security tools like Microsoft Defender for Cloud, Microsoft Defender Cloud Security Posture Management and Microsoft Defender External Attack Surface Management is available with those licenses.

Integration of non-Microsoft security tools will be a consumption-based cost based on number of assets in the connected security tool. The external connectors are free during public preview, and pricing will be announced before starting to bill for external connectors at GA.

### Data freshness, retention, and related functionality

We currently ingest and process supported data from first-party Microsoft products, making it available within the enterprise exposure graph and applicable Microsoft Security Exposure Management experiences built on top of graph data within 72 hours of its production at the source product.

Microsoft product data is retained for no less than 14 days in the enterprise exposure graph and/or Microsoft Security Exposure Management. Only the latest data snapshot received from Microsoft products is retained; we do not store historical data.

Some enterprise exposure graph and/or Microsoft Security Exposure Management experiences data is available for querying via Advanced Hunting and is subject to Advanced Hunting service limitations.

We reserve the right to modify some or all of these parameters in the future, including:

- Data ingestion frequency and freshness: We may increase the current 72-hour latency (decrease the frequency of data ingestion) for some or all Microsoft data sources.
- Data retention period: We may decrease the current 14-day data retention period.
- Service features and functionality: We may alter, limit, or discontinue specific features, capabilities, or functionalities of the service built on top of the enterprise exposure graph and/or Microsoft Security Exposure Management data.
- Data query limits: We may impose limitations on the number, frequency, or type of data queries that can be performed against enterprise exposure graph or Microsoft Security Exposure Management data.

 We will make reasonable efforts to provide advance notice of any significant changes to the service. However, you acknowledge and agree that you are solely responsible for monitoring any such notifications.

## Next steps

Review [prerequisites](prerequisites.md) to get started with Security Exposure Management.
