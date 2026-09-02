---
title: Set up web content filtering in Microsoft Defender for Business
description: Learn how to set up, view, and edit your web content filtering policy in Microsoft Defender for Business.
author: chrisda
ms.author: chrisda
ms.date: 07/03/2026
ms.topic: how-to
ms.service: defender-business
ms.localizationpriority: medium
ms.reviewer: nehabha
ms.collection:
- SMB
- m365-security
- tier1
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
---

# Web content filtering in Microsoft Defender for Business

Web content filtering enables your security team to track and regulate access to websites based on content categories. When you set up your web content filtering policy, you enable web protection for your organization.

Web content filtering is available on the major web browsers, with blocks performed by Windows Defender SmartScreen (Microsoft Edge) and Network Protection (Chrome, Firefox, Brave, and Opera). For more information, see [Prerequisites for web content filtering](/defender-endpoint/web-content-filtering#prerequisites).

In Defender for Business, you can have one web content filtering policy applied to all users.

## Set up web content filtering

Before you begin, make sure your environment meets the [prerequisites for web content filtering](/defender-endpoint/web-content-filtering#prerequisites).

Use the following steps to create a web content filtering policy:

1. In the [Microsoft Defender portal](https://security.microsoft.com), go to **Settings** \> **Endpoints** \> **Rules** \> **Web content filtering**, and then select **+ Add policy**.

2. Specify a name and description for your policy.

3. Select the web content filtering categories to block (for example, **Adult content**, **High bandwidth**, **Legal liability**, or **Leisure**). Don't select **Uncategorized**. Use the expand icon to fully expand each parent category, and then select specific web content categories.

   To set up an audit-only policy that doesn't block any websites, don't select any categories.

4. Apply the policy to all users. (Scoping to specific devices isn't available in Defender for Business.)

5. Review the summary and save the policy. The policy refresh might take up to two hours to apply to your organization's devices.

> [!TIP]
> To learn more about web content filtering, see [Web content filtering](/defender-endpoint/web-content-filtering).

## Categories for web content filtering

Not all websites in the following categories are malicious. However, these websites might cause problems for your company due to compliance regulations, bandwidth usage, or other concerns.

You can start with an audit-only policy to better understand whether your security team should block any website categories. You can edit your policy later.

The following table describes web content categories you can choose for your web content filtering policy:

|Category|Description|
|---|---|
|**Adult content**|Sites that are related to cults, gambling, nudity, pornography, sexually explicit material, or violence|
|**High bandwidth**|Download sites, image sharing sites, or peer-to-peer hosts|
|**Legal liability**|Sites that include child abuse images, promote illegal activities, foster plagiarism or school cheating, or that promote harmful activities|
|**Leisure**|Sites that provide web-based chat rooms, online gaming, web-based email, or social networking|
|**Uncategorized**|Sites that have no content or that are newly registered. <br/><br/> As a best practice, don't select **Uncategorized**.|

## Next steps

- [Deployment and configuration methods for controlled folder access (CFA)](/defender-endpoint/controlled-folder-access-overview#deployment-and-configuration-methods-for-cfa)
- [Enable your attack surface reduction rules](mdb-asr.md).
- [Review settings for advanced features and the Microsoft Defender portal](mdb-portal-advanced-feature-settings.md).
