---
title: Connect Mend.io to Defender for Cloud
description: Learn how to connect Mend.io with Microsoft Defender for Cloud to enhance vulnerability analysis and gain visibility of critical vulnerabilities.
author: ElazarK
ms.author: elkrieger
ms.topic: how-to
ms.date: 04/24/2025
ai-usage: ai-assisted
#customer intent: As a user, I want to learn how to connect my ServiceNow account with Microsoft Defender for Cloud so that I can enhance the existing vulnerability analysis security capabilities that are provided by Defender for Cloud for comprehensive code to runtime visibility of critical vulnerabilities.
---

# Connect Mend.io to Defender for Cloud


# Connect Mend.io to Defender for Cloud

Microsoft Defender for Cloud integrates with Mend.io to enhance software application security by identifying and mitigating vulnerabilities in partner dependencies. This integration streamlines discovery and remediation processes, improving overall security.

This article explains the benefits and procedures to connect Mend.io to Defender for Cloud. By following the steps, security teams gain enhanced visibility and control over potential threats, from code development to runtime.

## Prerequisites

- You need a Microsoft Azure subscription. If you don't have an Azure subscription, you can sign up for a free subscription.
- Enable Microsoft Defender for Cloud on your Azure subscription.
- Enable Defender Cloud Security Posture Management (CSPM) on your Azure subscription.
- Connect your DevOps environments to Defender for Cloud:
    - Azure DevOps organizations
    - GitHub organizations
    - GitLab groups
- Have an account with Mend.io.
- Have an API key from Mend.io with read-only permissions. We recommend setting the expiration date to be 180 days.
- You must have the appropriate role to:
  - Create DevOps connectors: Security Admin or Contributor assigned at the subscription level through Azure role-based-access control (RBAC).
  - Create the Mend.io connector: Security Administrator or Global Administrator assigned at the tenant level through Microsoft Entra. Permissions can be granted through Privileged Identity Management.
  - View reachability analysis findings: Security Admin or Security Reader assigned at the subscription level through Azure role-based-access control (RBAC) on the subscription that hosts the DevOps connector.
- You can only have one connector to Mend.io per tenant.
- Findings from Mend.io will only be shown if the corresponding repository is also connected to Defender for Cloud.

## Connect Mend.io

To connect your Mend.io account to Defender for Cloud:

1. Sign in to the Azure portal.
2. Navigate to Microsoft Defender for Cloud > Environment settings.
3. Select Integrations.
4. Select Add integration > Mend.io.
   > **Note:** The option to add the Mend.io integration is not available if you don't have the appropriate permissions, or if you already have an existing connector to Mend.io.
5. Enter a Mend.io namespace, API key ID, and API secret.
6. Select Create.
   > A notice appears after the integration is successfully created. Defender for Cloud scans repositories connected to Mend.io and populates results after six hours.
