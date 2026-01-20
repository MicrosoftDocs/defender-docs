---
title: Customize Copilot for your organization
description: Learn how to upload your organization's specific guidelines to Microsoft Security Copilot to enhance guided response recommendations.
ms.service: defender-xdr
ms.author: guywild
author: guywi-ms
ms.localizationpriority: medium
ms.collection:
  - m365-security
  - tier1
  - security-copilot
  - magic-ai-copilot
ms.topic: install-set-up-deploy
search.appverid:
  - MOE150
  - MET150
ms.date: 11/18/2025
appliesto:
- Microsoft Defender XDR
- Microsoft Sentinel with Defender XDR in the Microsoft Defender portal
---

# Customize incident responses for your organization

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

[Microsoft Security Copilot](/security-copilot/microsoft-security-copilot) in the Microsoft Defender portal provides guided responses to support the response team in resolving incidents. Copilot in Defender uses AI and machine learning to contextualize an incident and learn from previous investigations to generate appropriate response actions.

This guide outlines how to upload your organization's specific guidelines to Microsoft Security Copilot to improve the guided response recommendations.

## Prerequisites

- You must be at least a security administrator to upload, approve, or delete files. Security operators can review the guidebooks but not manage them.
- Your organization-specific guidelines should be in a supported format (PDF, DOCX, TXT) and shouldn't exceed the maximum file size limit of 3 MB.

## Steps to customize Copilot's guided response using your organization's guidebook

Upload your guidebook from Copilot settings. You can get there in one of two ways:

- From the Microsoft Defender portal, select **System** > **Settings** > **Copilot in Defender** > **Custom guidebooks**.

    :::image type="content" source="./media/security-upload-guide/add-from-settings.png" alt-text="Screenshot of adding custom guidebooks from settings.":::

- From the Copilot tasks pane inside an incident, go to **Create tasks from your own guidebook** and select **Open Copilot settings**.

    :::image type="content" source="./media/security-upload-guide/add-from-incident.png" alt-text="Screenshot of opening Copilot settings from the tasks pane.":::

Then follow these steps:

1. Select **Add new guidebook**.
1. Select **Upload file**.
1. Browse to the file location, choose the file, and then select **Generate**.
1. After the file is uploaded, go to the **Pending review** tab.

    :::image type="content" source="./media/security-upload-guide/pending-review.png" alt-text="Screenshot of the pending review tab for uploaded guidebooks.":::

1. The pending review tab shows the new recommendations based on the uploaded guidebook. Review the file to ensure it meets your organization's standards. Select the guidebook name and review the suggested generated tasks.
1. If the guidebook meets your standards, select **Approve and activate** to make it available for use in guided responses. If it doesn't meet your standards, select **Delete** to remove it.

    :::image type="content" source="./media/security-upload-guide/approve-guidebook.png" alt-text="Screenshot of the approve and activate button for uploaded guidebooks.":::

1. Make sure the guidebook appears as active in the **Guidebooks** tab. To deactivate it later, select the guidebook and choose **Deactivate**.

    :::image type="content" source="./media/security-upload-guide/active-guidebooks.png" alt-text="Screenshot of the active guidebooks tab.":::

Copilot will prioritize your organization's custom guidebooks over the default ones provided by Microsoft. If multiple guidebooks are relevant, Copilot will use the one that best matches the incident context.

:::image type="content" source="./media/security-upload-guide/custom-responses.png" alt-text="Screenshot of suggested responses based on the custom guidebooks.":::

You have the opportunity to provide feedback on the effectiveness of the guided responses generated from your organization's guidebooks. This feedback helps improve future recommendations.

:::image type="content" source="./media/security-upload-guide/feedback.png" alt-text="Screenshot of the feedback window for guided responses.":::

## Best practices for creating effective guidebooks

For examples of Microsoft's own incident response playbooks, see [Incident response playbooks](/security/operations/incident-response-playbooks).

When creating your organization's guidebooks, keep in mind that the guidebook can only read text. Avoid using images, graphs, or complex formatting that may hinder text extraction.
