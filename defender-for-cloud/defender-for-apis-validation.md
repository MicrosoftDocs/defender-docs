---
title: Validate your Microsoft Defender for APIs alerts
description: Walk through triggering a test alert in Defender for APIs to validate detection capabilities by simulating suspicious user-agent activity.
ms.service: defender-for-cloud
ms.topic: how-to
ms.date: 07/03/2026
ms.custom: references_regions, sfi-image-nochange, msecd-doc-authoring-1013
#customer intent: As a user, I want to learn how to validate my Microsoft Defender for APIs alerts so that I can ensure the security of my APIs.
ai-usage: ai-assisted
---

# Validate your Microsoft Defender for APIs alerts

Microsoft Defender for APIs provides protection, detection, and response coverage for APIs published in Azure API Management. A key feature is the detection of OWASP API Top 10 vulnerabilities. It spots anomalies at runtime by using machine learning and rule-based methods.

This article walks you through how to trigger a test alert for one of your API endpoints. The alert covers detection of a suspicious user agent. Before you start, make sure you meet the [prerequisites](#prerequisites), including having an API published and Defender for APIs onboarded.

## Prerequisites

Before you begin, ensure that you've completed the following prerequisites:

- Create a service instance by following [Create a new Azure API Management service instance in the Azure portal](/azure/api-management/get-started-create-service-instance).

- Check the [support and prerequisites for Defender for APIs deployment](defender-for-apis-prepare.md)

- Import and publish your API by using [Import and publish your first API](/azure/api-management/import-and-publish).

- Deploy the feature by using [Onboard Defender for APIs](defender-for-apis-deploy.md).

## Simulate an alert

Validate that Defender for APIs is working as expected. Send a request to your endpoint with a suspicious user agent to simulate an alert.

1. Sign in to the [Azure portal](https://portal.azure.com).

1. Search for and select **API Management services**.

    :::image type="content" source="media/defender-for-apis-validation/api-management.png" alt-text="Screenshot that shows you where on the Azure portal to search for and select API Management service." lightbox="media/defender-for-apis-validation/api-management.png":::

1. Select the relevant API.

1. Select **APIs**.

    :::image type="content" source="media/defender-for-apis-validation/apis-section.png" alt-text="Screenshot that shows where to select APIs from the menu." lightbox="media/defender-for-apis-validation/apis-section.png":::

1. Select an API endpoint.

    :::image type="content" source="media/defender-for-apis-validation/api-endpoint.png" alt-text="Screenshot that shows where to select an API endpoint.":::

1. Select **Test** > **Get Retrieve resource (cashed)**.

1. In the Headers section, select **User-Agent** in the name drop-down menu.

    :::image type="content" source="media/defender-for-apis-validation/user-agent.png" alt-text="Screenshot of the Headers section of the APIs showing you how to select the User-Agent option under the name drop-down menu." lightbox="media/defender-for-apis-validation/user-agent.png":::

1. In the value field, enter `javascript:`.

1. Select **Send**

    A 200 OK appears, letting you know that it succeeded.

    :::image type="content" source="media/defender-for-apis-validation/200-ok.png" alt-text="Screenshot that shows the result 200 OK.":::

## Expected results

After some time, Defender for APIs triggers an alert with detailed information about the simulated suspicious user-agent activity.

<a name="next-step"></a>
## Next steps


> [!div class="nextstepaction"]
> [Investigate API findings, recommendations, and alerts](defender-for-apis-posture.md)

