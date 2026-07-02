---
title: Submit an App Catalog update request
description: Learn how app owners and nonapp owners can submit update requests for apps in the Defender for Cloud Apps catalog.
ms.date: 06/16/2026
ms.topic: how-to
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1014
---

# Submit an App Catalog update request

To keep the Microsoft Defender for Cloud Apps (MDA) catalog accurate, use the submission method that fits your role and the type of update you need. App owners can submit updates through a self-attestation questionnaire, while other users can request risk score changes or suggest catalog corrections. This article explains each submission path and what to expect during processing.

## App owners or verified vendors

If you're a verified app vendor or developer, complete the [Self-Attestation Questionnaire](https://forms.office.com/Pages/ResponsePage.aspx?id=v4j5cvGGr0GRqy180BHbR4CRHM-U7CtKpJma_QJAnSlUMEpLQzBaQ1hWNDMxUEhRNFI3Q0FZUkdWRC4u) to:

- Add a new app to the catalog.

- Update risk attributes.

**While we review your request:**

- If the app isn’t in the catalog, you can [add it as a custom app](cloud-discovery-custom-apps.md) in Cloud Discovery to monitor its usage in your environment.
- If the app is listed but its risk score doesn’t reflect your organization’s security posture, you can manually [override the app’s risk score](risk-score.md#override-the-risk-score).

## Nonowners requesting updates

Even if you're not the app owner, you can help improve the app catalog's accuracy:

- You can [request a risk score update](risk-score.md#customize-the-risk-score) for apps in use by your organization.
- You can [suggest a change to the cloud app catalog](risk-score.md#suggest-a-change-to-the-cloud-app-catalog) if you find a new app in your environment that hasn't been scored by Defender for Cloud Apps, or if you want to request a review for a new risk factor, a score update, or outdated app data.

## Validation and processing timeline

We thoroughly validate all catalog update requests to ensure accuracy and relevance. All app catalog requests must meet these criteria:

- The submitted domain must map to a known application.
- The app must qualify as a SaaS product.
- The request must include complete and verifiable information.

After we validate and accept your request, the standard turnaround time for a catalog update is approximately seven weeks.

## All other requests

For general inquiries, metadata corrections, or update requests that don’t fall into the previous categories, [open a support ticket](/defender-cloud-apps/support-and-ts)

> [!NOTE]
> We review support tickets on a case-by-case basis. They aren’t a fast track for catalog updates but help capture edge cases or routing issues needing broader investigation.


## Related articles

For more information, see the following articles:

- [Find your cloud app and calculate risk scores](risk-score.md)
- [Attest your apps](attest-your-app.md)
- [Add custom apps to cloud discovery](cloud-discovery-custom-apps.md)
