---
title: Gain application and end-user context for AI alerts
description: Learn how to enhance AI security by adding user context for alerts with Microsoft Defender for Cloud threat protection.
ms.topic: how-to
ms.date: 05/28/2026
#Customer intent: I want to learn how to enhance the security of my AI services by adding end-user context for AI alerts with Microsoft Defender for Cloud threat protection for AI services.
---

# Gain application and end-user context for AI alerts

Microsoft Defender for Cloud's threat protection for AI services lets you enhance the actionability and security value of generated AI alerts by providing both end-user and application context.

Most AI service scenarios are built as part of an application, so API calls to the AI service originate from a web application, compute instance, or AI gateway. This setup introduces complexity because investigators lack context when they review AI requests to determine the business application or end-user involved.

Together, Microsoft Defender for Cloud and Azure AI let you add parameters to Azure AI API calls so Defender for Cloud can capture critical end-user or application context in AI alerts. This leads to more effective triage and results. For example, when you add end-user IP or identity, you can block that user or correlate incidents and alerts by that user. When you add application context, you can prioritize or determine whether suspicious behavior is standard for that application in the organization.

:::image type="content" source="media/gain-end-user-context-ai/after-code.png" alt-text="Screenshot of the Defender XDR portal showing benefits from adding the code." lightbox="media/gain-end-user-context-ai/after-code.png":::

## Prerequisites

- Read up on [AI threat protection](ai-threat-protection.md).

- [Enable threat protection for AI services](ai-onboarding.md) on an AI application, with Azure OpenAI underlying model, directly through the Azure OpenAI Service. Note, this feature is currently not supported when applying models consumed through the [Azure AI model inference API](/azure/ai-studio/ai-services/model-inference).

## Add security parameters to your Azure OpenAI call

To receive AI security alerts with more context, you can add any or all of the following sample `UserSecurityContext` parameters to your [Azure OpenAI API](/azure/ai-services/openai/reference) calls.

All of the fields in the `UserSecurityContext` are optional. 

For end-user context, we recommend passing the `EndUserId` and `SourceIP` fields at a minimum. The `EndUserId` and `SourceIP` fields provide Security Operations Center (SOC) analysts the ability to investigate security incidents that involve AI resources and generative AI applications. 

For application context, pass the `applicationName` field, as a simple string.

If a field’s name is misspelled, the Azure OpenAI API call will still result in success. 

> [!NOTE]
> The EndUserId is the Microsoft Entra ID (formerly Azure Active Directory) user object ID used to authenticate end-users within the generative AI application. Sensitive personal information should not be included in this field.

## UserSecurityContext schema

The exact schema can be found in Azure OpenAI [REST API reference documentation](/azure/ai-services/openai/reference-preview). 

The [user security context object](/azure/ai-services/openai/reference-preview#usersecuritycontext) is part of the [request body](/azure/ai-services/openai/reference-preview#createchatcompletionrequest) of the chat completion API.

This feature is currently not supported when applying models deployed through the [Azure AI model inference API](/azure/ai-studio/ai-services/model-inference).

## Availability


| Source | Version support | Code Example | Comments |
|----|----| ----| ----|
|Azure OpenAI REST API|[2025-01-01 version](/azure/ai-services/openai/reference-preview)|-|-|
|Azure .NET SDK|[v2.2.0-beta.1 (2025-02-07) or higher](https://github.com/Azure/azure-sdk-for-net/blob/Azure.AI.OpenAI_2.2.0-beta.1/sdk/openai/Azure.AI.OpenAI/CHANGELOG.md)|[GitHub code example](https://github.com/Azure-Samples/signalr-ai-streaming/blob/main/src/AIStreaming/MsDefenderExtension.cs)|-|
|Azure Python SDK|[v1.61.1 or higher](https://github.com/openai/openai-python/releases/tag/v1.61.1)|[GitHub code example](https://github.com/microsoft/sample-app-aoai-chatGPT/blob/main/backend/security/ms_defender_utils.py)|The support is provided by appending to the `extra_body` object.|
|Azure JS/Node SDK|[v4.83.0 or higher](https://github.com/openai/openai-node/releases/tag/v4.83.0)|[GitHub code example](https://github.com/Azure-Samples/openai-secure-ui-js/blob/main/packages/api/src/functions/security/ms-defender-utils.ts)|The support is provided by appending to the `extra_body` object.|
|Azure Go SDK|[v0.7.2 or higher ](https://pkg.go.dev/github.com/Azure/azure-sdk-for-go/sdk/ai/azopenai@v0.7.2#UserSecurityContext)|-|-|



## Next step

> [!div class="nextstepaction"]
> [Overview - AI threat protection](ai-threat-protection.md)


