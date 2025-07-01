---
title: Submit an App Catalog update request
description: This article provides instructions for app owners and non-app owners on how to submit an update request for an app in the Defender for Cloud Apps catalog.
ms.date: 06/30/2025
ms.topic: how-to
---

# Submit an App Catalog update request

To maintain the accuracy and security of the Microsoft Defender for Cloud Apps (MDA) catalog, use the appropriate submission method based on your relationship to the app and the type of update required.

## App owners or verified vendors

If you're the verified owner or vendor of an app and want to do one of the following:

- Add a new app to the catalog

- Update risk attributes with accurate or current information

Complete the [Self-Attestation Questionnaire](https://forms.office.com/Pages/ResponsePage.aspx?id=v4j5cvGGr0GRqy180BHbR4CRHM-U7CtKpJma_QJAnSlUMEpLQzBaQ1hWNDMxUEhRNFI3Q0FZUkdWRC4u)

Your submission will be reviewed by the catalog team to validate the app and its attributes.


## Non-owners requesting updates

If you're not the app owner but want to do one of the following:

- Suggest a change to an app’s risk score.
- Request reprofiling of an app based on outdated data or new risk factors.

To request a risk score update:

1. Sign in to [Microsoft Defender XDR](https://security.microsoft.com).
1. Go to **Cloud apps > Cloud app catalog**.
1. Locate and select the app.
1. Select **Request score update**.

This triggers a review of the app’s risk factors and other data.
For official guidance, see [Customize the risk score](risk-score.md#customize-the-risk-score).


**Other requests**

This includes general inquiries, metadata corrections, or requests that require manual review.

> [!NOTE]
> Support tickets are reviewed case-by-case. They’re not an expedited path for catalog updates, but a mechanism to raise edge cases or routing gaps that might need broader investigation.

[Open support ticket](/defender-cloud-apps/support-and-ts)

After you submit a ticket:

- Allow time for support to review your request. They might contact you for extra context or documentation.
- If your request is valid, support forwards it to the catalog team for validation and processing.
- If approved, you receive an estimated timeline for when the update will appear in the catalog.
- If the request can't be fulfilled due to product design constraints, you receive a clear explanation.

## What you can do while waiting for an App Catalog update

While your request is being reviewed:

- If the app isn’t listed in the catalog, you can [add custom apps to cloud discovery](cloud-discovery-custom-apps.md) to track and manage it in your environment.
- If the app is listed but its risk score doesn’t reflect your organization’s security posture, you can [override the app’s risk score](risk-score.md#override-the-risk-score) manually.

## Validation and processing timeline

All catalog update requests undergo a thorough validation process to ensure accuracy and relevance. All app catalog requests must meet the following criteria:

-  The submitted domain must map to a known application.
- The app must qualify as a SaaS product.
- The request must include complete and verifiable information.

Once the request is validated and accepted by the catalog team, updates are processed manually. The standard turnaround time from request submission to catalog update is approximately three weeks.
