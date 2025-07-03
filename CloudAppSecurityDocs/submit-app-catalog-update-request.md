---
title: Submit an App Catalog update request
description: This article provides instructions for app owners and nonapp owners on how to submit an update request for an app in the Defender for Cloud Apps catalog.
ms.date: 06/30/2025
ms.topic: how-to
---

# Submit an App Catalog update request

To maintain the accuracy and security of the Microsoft Defender for Cloud Apps (MDA) catalog, use the appropriate submission method based on your relationship to the app and the type of update required.

## App owners or verified vendors

If you're a verified app vendor or developer, complete the [Self-Attestation Questionnaire](https://forms.office.com/Pages/ResponsePage.aspx?id=v4j5cvGGr0GRqy180BHbR4CRHM-U7CtKpJma_QJAnSlUMEpLQzBaQ1hWNDMxUEhRNFI3Q0FZUkdWRC4u) to:

- Add a new app to the catalog.

- Update risk attributes.

The catalog team reviews your submission for validation and accuracy.

**While your request is being reviewed:**

- If the app isn’t listed in the catalog, you can [add it as a custom app](cloud-discovery-custom-apps.md) in Cloud Discovery to monitor usage in your environment.
- If the app is listed but its risk score doesn’t reflect your organization’s security posture, you can manually [override the app’s risk score](risk-score.md#override-the-risk-score).


## Nonowners requesting updates

You're not the app owner, but you want to help improve the accuracy of the app catalog:

- You can [request a risk score update](risk-score.md#customize-the-risk-score) for apps in use by your organization.
- You can [suggest a change to the cloud app catalog](risk-score.md#suggest-a-change-to-the-cloud-app-catalog) if you find a new app in your environment that hasn't been scored by Defender for Cloud Apps, or if you want to request a review for a new risk factor, a score update, or outdated app data.

**All other requests**

For general inquiries, metadata corrections, or update requests that don’t fall into the previous categories, [open a support ticket](/defender-cloud-apps/support-and-ts)

> [!NOTE]
> Support tickets are reviewed on a case-by-case basis. They aren’t an expedited path for catalog updates but are used to capture edge cases or routing issues that require broader investigation.


## Validation and processing timeline

All catalog update requests undergo a thorough validation process to ensure accuracy and relevance. All app catalog requests must meet the following criteria:

- The submitted domain must map to a known application.
- The app must qualify as a SaaS product.
- The request must include complete and verifiable information.

Once the request is validated and accepted by the catalog team, updates are processed manually. The standard turnaround time from request submission to catalog update is approximately three weeks.

After you submit a support ticket, the support team reviews your request and might contact you for additional context or documentation. Valid requests are escalated to the catalog team for further validation and processing. If approved, you’ll receive an estimated timeline for when the update will appear in the catalog. If the request can’t be fulfilled due to product design constraints, support will provide a clear explanation.

## Related articles

- [Find your cloud app and calculate risk scores](risk-score.md)
- [Attest your apps](attest-your-app.md)
- [Add custom apps to cloud discovery](cloud-discovery-custom-apps.md)
