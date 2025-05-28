---
title: Microsoft Defender for Identity dashboard
description: This article describes how to work with the identity threat detection and response (ITDR) dashboard in Microsoft 365 Defender.
ms.date: 12/27/2023
ms.topic: how-to
---

# Work with Defender for Identity's ITDR dashboard

The Microsoft Defender for Identity **Dashboard** page shows data to help you better analyze your security posture, understand how well you're protected, identify vulnerabilities, and perform recommended actions.

Use the **Dashboard** page to view critical insights and real-time data about identity threat detection and response (ITDR). View graphs and widgets that showcase important information related to unauthorized access, account compromise, insider threats, and abnormal activities, and then proactively monitor and manage potential identity-related security risks.

## Prerequisites

To access this new dashboard, you need:

- A Microsoft Defender for Identity license and an Entra ID Identity Protection license

- A user role with at least the [Security Reader](/azure/active-directory/roles/permissions-reference#security-reader) permissions

To view a comprehensive list of recommendations and select all recommended action links, you need the [Global Administrator](/azure/active-directory/roles/permissions-reference#global-administrator) role.

> [!IMPORTANT]
> Microsoft recommends that you use roles with the fewest permissions. This helps improve security for your organization. Global Administrator is a highly privileged role that should be limited to scenarios when you can't use an existing role.

## Access the dashboard

To access the dashboard, sign into Microsoft 365 Defender and select **Identities > Dashboard**.

For example:

:::image type="content" source="media/dashboard/dashboard.gif" alt-text="An animated GIF showing a sample ITDR Dashboard page.":::

## Dashboard widget reference

This section describes the graphs and widgets available on the ITDR dashboard. 

Select links in the cards to just to more details, such as documentation, related recommendations in [Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score), and more.


|Name  |Description |
|---------|---------|
|**Identities overview (Sheild widget)** |Provides a quick overview of the number of users in hybrid, cloud, and on-premises environments (AD and Microsoft Entra ID). This feature includes direct links to the Advanced Hunting platform, offering detailed user information at your fingertips.|
|**Top insights** /<br>**Users identified in a risky lateral movement path** | Indicates any sensitive accounts with risky lateral movement paths, which are windows of opportunity for attackers and can expose risks.  <br><br>We recommend that you take action on any sensitive accounts found with risky lateral movement paths to minimize your risk. <br><br>For more information, see [Understand and investigate Lateral Movement Paths (LMPs) with Microsoft Defender for Identity](understand-lateral-movement-paths.md).|
|**Top insights** /<br>**Dormant Active Directory users who should be removed from sensitive groups** | Lists accounts that have been left unused for at least 180 days. <br><br>An easy and quiet path deep into your organization is through inactive accounts that are a part of sensitive groups, therefore we recommend removing those users from sensitive groups. <br><br>For more information, see [Security assessment: Riskiest lateral movement paths (LMP)](security-assessment-riskiest-lmp.md).|
|**ITDR deployment health**     |  Lists any sensor deployment progress, any health alerts, and license availability.     |
|**Identity posture (Secure score)** | The score shown represents your organization's security posture with a focus on the *identity* score, reflecting the collective security state of your identities. The score is automatically updated in real-time to reflect the data shown in graphs and recommended actions. <br><br>Microsoft Secure Score updates daily with system data with new points for each recommended action take.<br><br> For more information, see [Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score). |
| **Highly privileged entities** | Lists a summary of the sensitive accounts in your organization, including Entra ID security administrators and Global admin users. |
| **Identity related incidents** | Lists alerts from both Defender for Identity and [Microsoft Entra ID Protection](/azure/active-directory/identity-protection/overview-identity-protection), and any corresponding, relevant incidents from the last 30 days. |
|**Domains with unsecured configuration**     |  Lists Active Directory domains that have unsecured configuration settings. <br><br>Active Directory domains hold many security-related configurations, which, when misconfigured, can make organizations more susceptible to cyber-attacks. Make sure to configure your domains in accordance with security best practices to decrease the likelihood of identity compromise.  <br><br>For more information, see [Security assessment: Unsecure domain configurations](security-assessment-unsecure-domain-configurations.md)       |
| **Entra ID active users at risk** | Lists active user accounts that may be vulnerable to security threats, unusual activities, or potential compromises. <br><br>Identifying and managing users at risk is a crucial aspect of maintaining a secure IT environment. For more information see [Remediate risks and unblock users in Microsoft Entra ID Protection](/entra/id-protection/howto-identity-protection-remediate-unblock). |

## Next steps

For more information, see [Microsoft Defender for Identity in Microsoft 365 Defender](/microsoft-365/security/defender/microsoft-365-security-center-mdi?bc=/defender-for-identity/breadcrumb/toc.json&toc=/defender-for-identity/TOC.json).
