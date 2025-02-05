---
title: Review data security alerts
description: Learn how to review data security alerts in the Data and AI security dashboard in Microsoft Defender for Cloud.
ms.topic: how-to
ms.date: 02/05/2025
#customer intent: As a security analyst, I want to review data security alerts so that I can identify and mitigate potential threats in my environments.
---

# Review data security alerts

Microsoft Defenders for Cloud's data security alerts provide insights into potential threats and vulnerabilities in your data environments. The alerts help you quickly identify and respond to security issues, enabling you to take proactive measures to mitigate risks.

## Prerequisites

- Enable [Defender Cloud Security Posture Management (CSPM)](tutorial-enable-cspm-plan.md).
- Enable [sensitive data discovery](tutorial-enable-cspm-plan.md#enable-the-components-of-the-defender-cspm-plan).
- Enable [Defender for Storage](tutorial-enable-storage-plan.md).
- Enable [Defender for Databases](tutorial-enable-databases-plan.md).

**Roles and permissions**: 

- **Permissions**:

    - Microsoft.Security/assessments/read
    - Microsoft.Security/assessments/subassessments/read
    - Microsoft.Security/alerts/read

- **Role** - the minimum required privileged role-based access control role of **Security explorer**.

- Register each relevant Azure subscription to the [Microsoft.Security resource provider](/azure/azure-resource-manager/management/resource-providers-and-types#register-resource-provider).

## View data security alerts

Data security alerts in Defender for Cloud help you identify potential threats and vulnerabilities in your data environments. Review alerts to understand security issues and take necessary actions to mitigate risks.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Navigate to **Defender for Cloud** > **Data and AI security dashboard**.

1. Locate the Data closer look section and select either **View all managed databases alerts** or **View all storage alerts**.  

Once you navigate to the alerts page, you can then [investigate each security alert](managing-and-responding-alerts.yml#investigate-a-security-alert), and [respond to the alerts](managing-and-responding-alerts.yml#respond-to-a-security-alert).

## Next steps

> [!div class="nextstepaction"]
> [Manage and respond to security alerts](managing-and-responding-alerts.yml)
