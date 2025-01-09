---
title: Quarterly or ad hoc operational guide - Microsoft Defender for Identity
description: Learn about the Microsoft Defender for Identity activities that we recommend for your team on a quarterly or ad-hoc basis.
ms.date: 01/29/2024
ms.topic: how-to
#customerIntent: As a Microsoft Defender for Identity customer, I want to know the recommended activities for my team on a quarterly or ad-hoc basis.
---

# Quarterly / ad hoc operational guide - Microsoft Defender for Identity

This article reviews the Microsoft Defender for Identity activities we recommend for your team on a quarterly or ad-hoc basis, depending on your organization's needs and processes.

Perform ad hoc activities as issues arise in your organization, or as part of a quarterly operational review.

## Review Microsoft service health

**Where**: Check the following locations:

- In the Microsoft 365 admin center, select **Health > Service health**
- [Microsoft 365 Service health status](https://status.office365.com/)
- X: https://twitter.com/MSFT365status

**Persona**: Security and compliance administrators

If you're experiencing issues with a cloud service, we recommend checking service health updates to determine whether it's a known issue, with a resolution in progress, before you call support or spend time troubleshooting.

For more information, see [Review Defender for Identity health issues](ops-guide-daily.md#review-defender-for-identity-health-issues).

## Review server setup process to include sensors

**Where**: Your organization's internal process documentation

**Persona**: Security administrators

We recommend that you periodically verify your organization's server setup process to make sure that it includes installing the Defender for Identity sensor. This ensures that all new domain controllers, AD CS, and AD FS servers are protected right away.

For more information, see [Deploy Microsoft Defender for Identity with Microsoft Defender XDR](../deploy/deploy-defender-identity.md).

## Check domain configuration via PowerShell

**Where**: PowerShell on your Defender for Identity sensor machines

**Persona**: Security administrators

We recommend that you periodically run the **Test-MDIConfiguration** PowerShell command to test whether your domain controller Advanced Audit Policy settings are configured correctly. Misconfigured Advanced Audit Policy settings can cause gaps in the Event Log and incomplete Defender for Identity coverage.

For more information, see:

- [Configure audit policies for Windows event logs](../deploy/configure-windows-event-collection.md)
- [Test-MDIConfiguration](/powershell/module/defenderforidentity/test-mdiconfiguration) PowerShell documentation


## Related content

For more information, see:

- [Microsoft Defender XDR Security operations overview](/security/operations/overview)
- [Microsoft Defender for Identity operational guide](ops-guide.md)
- [Daily operational guide - Microsoft Defender for Identity](ops-guide-daily.md)
- [Weekly operational guide - Microsoft Defender for Identity](ops-guide-weekly.md)
- [Monthly operational guide - Microsoft Defender for Identity](ops-guide-monthly.md)
