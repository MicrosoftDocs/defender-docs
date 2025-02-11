---
title: Review AI security alerts
description: Learn how to review AI security alerts in the Data and AI security dashboard in Microsoft Defender for Cloud.
ms.topic: how-to
ms.date: 02/10/2025
#customer intent: As a security analyst, I want to review AI security alerts so that I can identify and mitigate potential threats in my AI environments.
---

# Review AI security alerts

Microsoft Defender for Cloud's AI security alerts provide insights into potential threats and vulnerabilities in your AI environments. The alerts help you identify and respond to security issues quickly, enabling you to take proactive measures to mitigate risks.

By using the Data and AI security dashboard, you can easily navigate and access critical information about your AI environments. The dashboard integrates various features such as issue tracking, recommendations, and data threat analysis. You can view AI security alerts in one place, making it easier to manage your AI environments and improve your overall security posture.

## Prerequisites

- Enable [Defender Cloud Security Posture Management (CSPM)](tutorial-enable-cspm-plan.md).
- Enable [sensitive data discovery](tutorial-enable-cspm-plan.md#enable-the-components-of-the-defender-cspm-plan).
- Enable [threat protection for AI workloads](ai-onboarding.md).

## Locate all AI alerts

Alerts are generated when Defender for Cloud detects potential security issues in your AI environments. You can find AI security alerts in the Data and AI security dashboard.

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Navigate to **Defender for Cloud** > **Data and AI security dashboard**.

1. Locate the AI threat protection section and select **View all AI Threat protection alerts**.

    :::image type="content" source="media/review-ai-alerts/view-all-ai-alerts.png" alt-text="Screenshot of the Data and AI security dashboard that shows you where to select the view all AI alerts button is located." lightbox="media/review-ai-alerts/view-all-ai-alerts.png":::

Once you navigate to the alerts page, you can then [investigate each security alert](managing-and-responding-alerts.yml#investigate-a-security-alert), and [respond to the alerts](managing-and-responding-alerts.yml#respond-to-a-security-alert).

## Next step

> [!div class="nextstepaction"]
> [Manage and respond to security alerts](managing-and-responding-alerts.yml)
