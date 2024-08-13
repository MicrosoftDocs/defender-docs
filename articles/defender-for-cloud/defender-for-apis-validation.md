---
title: Validate your Microsoft Defender for APIs alerts
description: Validate your Microsoft Defender for APIs alerts and ensure the security of your APIs with full lifecycle protection, detection, and response coverage.
ms.service: defender-for-cloud
ms.topic: how-to
ms.date: 08/13/2024
ms.custom: references_regions
#customer intent: As a user, I want to learn how to validate my Microsoft Defender for APIs alerts so that I can ensure the security of my APIs.
---

# Validate your Microsoft Defender for APIs alerts

Microsoft Defender for APIs offers full lifecycle protection, detection, and response coverage for APIs that are published in Azure API Management. One of the main capabilities is the ability to detect exploits of the Open Web Application Security Project (OWASP) API Top 10 vulnerabilities through runtime observations of anomalies using machine learning-based and rule-based detections.

This page walks you through the steps to trigger an alert for one of your API endpoints through Defender for APIs. In this scenario, the alert is for the detection of a suspicious user agent.

## Prerequisites

- [Create a new Azure API Management service instance in the Azure portal](/azure/api-management/get-started-create-service-instance)

- Check the [support and prerequisites for Defender for APIs deployment](defender-for-apis-prepare.md)

- [Import and publish your first API](/azure/api-management/import-and-publish)

- [Onboard Defender for APIs](defender-for-apis-deploy.md)

## Simulate an alert

It's important to validate that Defender for APIs is working as expected. To validate the API, you can simulate an alert by sending a request to your API endpoint with a suspicious user agent.

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

After some time, Defenders APIs will trigger an alert with detailed information about the simulated suspicious user agent activity.

## Next step


> [!div class="nextstepaction"]
> [Investigate API findings, recommendations, and alerts](defender-for-apis-posture.md)
