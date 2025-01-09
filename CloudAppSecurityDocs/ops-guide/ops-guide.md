---
title: Operational guide - Microsoft Defender for Cloud Apps
description: This article provides operational recommendations to help security operations teams to plan and run security activities.
ms.date: 12/13/2023
ms.topic: reference
---

# Microsoft Defender for Cloud Apps operational guide

This section of the Microsoft Defender for Cloud Apps documentation helps security operations (SOC) teams and security administrators to plan and run regular security activities with Microsoft Defender for Cloud Apps.

## Prerequisites

The activities in this article assume that you deployed Defender for Cloud Apps. For more information, see [Basic setup for Defender for Cloud Apps](../general-setup.md) and the [Defender for Cloud Apps Ninja training](https://aka.ms/MDCANinjaTraining).

## Activity reference

The following table lists activities that we recommend you perform regularly with Defender for Cloud Apps:

|Frequency  |Activities  |
|---------|---------|
|**Daily**     | - [Review alerts and incidents](ops-guide-daily.md#review-alerts-and-incidents) <br>  - [Review threat detection data](ops-guide-daily.md#review-threat-detection-data) <br>  - [Review application governance](ops-guide-daily.md#review-application-governance) <br>  - [Review Conditional Access app control](ops-guide-daily.md#review-conditional-access-app-control)<br>  - [Review shadow IT - cloud discovery](ops-guide-daily.md#review-shadow-it---cloud-discovery)<br>  - [Review the cloud discovery dashboard](ops-guide-daily.md#review-the-cloud-discovery-dashboard)<br>  - [Review information protection](ops-guide-daily.md#review-information-protection)     |
|**Weekly**     | - [Review SaaS security posture management](ops-guide-weekly.md#review-saas-security-posture-management) <br>  - [Check app connectors, log collectors, and SIEM agent health](ops-guide-weekly.md#check-app-connectors-log-collectors-and-siem-agent-health)<br>  - [Track new changes in Microsoft Defender XDR](ops-guide-weekly.md#track-new-changes-in-microsoft-defender-xdr)<br>  - [Review the governance log](ops-guide-weekly.md#review-the-governance-log)       |
|**Monthly**     | - [Review policy assessments](ops-guide-monthly.md#review-policy-assessments) <br>  -  [Review activity logs](ops-guide-monthly.md#review-activity-logs)       |
|**Ad-hoc**     |   - [Review Microsoft service health](ops-guide-ad-hoc.md#review-microsoft-service-health) <br>  - [Run advanced hunting queries](ops-guide-ad-hoc.md#run-advanced-hunting-queries)<br>  - [Review file quarantines](ops-guide-ad-hoc.md#review-file-quarantines)<br>  - [Review app risk scores](ops-guide-ad-hoc.md#review-app-risk-scores)<br>  - [Delete cloud discovery data](ops-guide-ad-hoc.md#delete-cloud-discovery-data) <br>  - [Generate a cloud discovery executive report](ops-guide-ad-hoc.md#generate-a-cloud-discovery-executive-report)<br>  - [Generate a cloud discovery snapshot report](ops-guide-ad-hoc.md#generate-a-cloud-discovery-snapshot-report)    |

## Related content

- [Integrating Microsoft Defender XDR into your security operations](/microsoft-365/security/defender/integrate-microsoft-365-defender-secops?bc=%2Fsecurity%2Foperations%2Fbreadcrumb%2Ftoc.json&toc=%2Fsecurity%2Foperations%2Ftoc.json)
- [Microsoft Defender for Office 365 Security Operations Guide](/microsoft-365/security/office-365-security/mdo-sec-ops-guide?bc=%2Fsecurity%2Foperations%2Fbreadcrumb%2Ftoc.json&toc=%2Fsecurity%2Foperations%2Ftoc.json)
- [Microsoft Entra security operations guide](/entra/architecture/security-operations-introduction?bc=%2Fsecurity%2Foperations%2Fbreadcrumb%2Ftoc.json&toc=%2Fsecurity%2Foperations%2Ftoc.json)
