---
title: Microsoft Defender Identity Security dashboard (Preview)
description: This article describes how to work with the identity threat detection and response (ITDR) dashboard in Microsoft Defender.
ms.date: 03/17/2026
ms.topic: how-to
ms.reviewer: maelgami 
---

# The Identity Security dashboard (Preview)

The Microsoft Defender for Identity **Dashboard** page shows data to help you better analyze your security posture, understand how well you're protected, identify vulnerabilities, and perform recommended actions.

Use the **Dashboard** page to view critical insights and real-time data about identity threat detection and response (ITDR). View graphs and widgets that showcase important information related to unauthorized access, account compromise, insider threats, and abnormal activities, and then proactively monitor and manage potential identity-related security risks.

## Prerequisites

To access this new dashboard, you need:

- A Microsoft Defender for Identity license and an Entra ID Identity Protection license.
- A user role with at least the [Security Reader](/azure/active-directory/roles/permissions-reference#security-reader) permissions.
- To view a full list of recommendations and select all recommended action links, you need the [Global Administrator](/azure/active-directory/roles/permissions-reference#global-administrator) role.

> [!IMPORTANT]
> Microsoft recommends that you use roles with the fewest permissions. This helps improve security for your organization. Global Administrator is a highly privileged role that should be limited to scenarios when you can't use an existing role.

## Access the dashboard

To access the dashboard, sign into Microsoft Defender and select **Identities > Dashboard**.

:::image type="content" source="media/dashboard/dashboard.png" alt-text="A screenshot showing the Defender Identoty security Dashboard page.":::

## Summary cards

The top of the dashboard shows five rotating summary cards that correspond to the coverage source categories. Select links in the cards to go to more details, such as documentation, related recommendations in [Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score), and more.

Each card shows identity counts and a coverage score gauge:

| Name | Description |
| -------- | ------- |
| **Identity Providers** | Shows the count of human identities, non-human identities, and agentic identities (Preview) from connected identity providers like Microsoft Entra ID, along with the coverage score. |
| **On-premises** | Shows the count of human identities and non-human identities from on-premises Active Directory environments, along with the coverage score. |
| **SaaS Identities** | Shows the count of human identities and non-human identities from connected SaaS applications, along with the coverage score. |
| **PAM & IGA** | Shows the status of privileged access management (PAM) and identity governance and administration (IGA) integrations, and prompts you to connect available solutions. |
| **Non-human identities** | Shows a donut chart of non-human identities (OAuth apps and service accounts) broken down by source: Entra ID, SaaS, and On-Premises. |

## Top insights

| Name | Description |
| ----- | ---- |
| **Users identified in a risky lateral movement path** | Indicates any sensitive accounts with risky lateral movement paths, which are windows of opportunity for attackers and can expose risks.<br><br>We recommend that you take action on any sensitive accounts found with risky lateral movement paths to minimize your risk. <br><br>For more information, see [Understand and investigate Lateral Movement Paths (LMPs) with Microsoft Defender for Identity](understand-lateral-movement-paths.md). |
| **Dormant Active Directory users** | Lists accounts that have been left unused for at least 180 days. <br><br>Inactive accounts that are a part of sensitive groups provide an easy path into your organization. We recommend removing those users from sensitive groups. |

## Dashboard widgets

| Name | Description |
| ----- | ---- |
| **Identity Security Deployment Status** | Shows the number of identities that are Protected, Need Attention, and Not Protected, giving you a quick view of your identity protection deployment progress. Select **Configure your identity protection** to review and improve your deployment.  |
| **Identity posture (Secure score)** | The score shown represents your organization's security posture with a focus on the *identity* score, reflecting the collective security state of your identities. The score is automatically updated in real-time to reflect the data shown in graphs and recommended actions. <br><br>Microsoft Secure Score updates daily with system data with new points for each recommended action taken.<br><br> For more information, see [Microsoft Secure Score](/microsoft-365/security/defender/microsoft-secure-score). |
| **Highly privileged identities** | Lists a summary of the sensitive accounts in your organization, including Microsoft Entra ID Global Admins, Security Administrators, and accounts tagged as sensitive. Select **View all identities** to go to the identity inventory. |
| **Identity related incidents** | Lists alerts from both Defender for Identity and [Microsoft Entra ID Protection](/azure/active-directory/identity-protection/overview-identity-protection), and any corresponding, relevant incidents from the last 30 days. |
| **Useful guides** | Provides links to key documentation, including introductions to Microsoft Defender for Identity, Zero Trust with Microsoft Defender XDR, and Microsoft Conditional Access. |
| **Domains with unsecured configurations** |  Lists Active Directory domains that have unsecured configuration settings. <br><br>Active Directory domains hold many security-related configurations, which, when misconfigured, can make organizations more susceptible to cyber-attacks. Make sure to configure your domains in accordance with security best practices to decrease the likelihood of identity compromise.  <br><br>For more information, see [Security assessment: Unsecure domain configurations](security-posture-assessments/identity-infrastructure.md#resolve-unsecure-domain-configurations). |
| **Active users at risk** | Lists active user accounts that may be vulnerable to security threats, unusual activities, or potential compromises. <br><br>Identifying and managing users at risk is a crucial aspect of maintaining a secure IT environment. Select **View all users** to investigate further. For more information, see [Remediate risks and unblock users in Microsoft Entra ID Protection](/entra/id-protection/howto-identity-protection-remediate-unblock). |

## Next steps

For more information, see [Microsoft Defender for Identity in Microsoft 365 Defender](/microsoft-365/security/defender/microsoft-365-security-center-mdi?bc=/defender-for-identity/breadcrumb/toc.json&toc=/defender-for-identity/TOC.json).
