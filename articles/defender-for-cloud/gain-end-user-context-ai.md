---
title: Gain end-user context for AI alerts
description: Learn how to enhance AI security by adding user context for alerts with Microsoft Defender for Cloud threat protection.
ms.topic: how-to
ms.date: 11/25/2024
#Customer intent: I want to learn how to enhance the security of my AI workloads by adding end-user context for AI alerts with Microsoft Defender for Cloud threat protection for AI workloads.
---

# Gain application and end-user context for AI alerts

Microsoft Defender for Cloud's threat protection for AI workloads allows you to enhance the actionability and security value of the generated AI alerts by providing both end-user and application  context.

For the majority of cases, scenarios leveraging AI services are built as part of an application, so the API calls to the AI service are originating from a web application, compute instance or an AI gateway. This architecture setup introduces complexity of lack of context when investigating the AI requests to determine the business application or the end-user involved.

Defender for Cloud together with Azure AI enable adding parameters to your Azure AI API calls to propagate critical end-user and\or application context to Defender for Cloud's AI alerts. This in turn leads to more effective triaging and results. For example, when adding end-user IP or identity you can block that user or correlate incidents and alerts by that user. When adding application context, you can prioritize or ascertain whether suspicious behavior could be considered standard for that application in the organization.

:::image type="content" source="media/gain-end-user-context-ai/after-code.png" alt-text="Screenshot of the Defender XDR portal that shows all of the additional benefits gained by adding the code." lightbox="media/gain-end-user-context-ai/after-code.png":::

## Prerequisites

- Read up on [Overview - AI threat protection](ai-threat-protection.md).

- [Enable threat protection for AI workloads (preview)](ai-onboarding.md) on an AI application, with Azure OpenAI underlying model, directly through the Azure OpenAI Service. Note, this feature is currently not supported when leveraging models deployed through the [Azure AI model inference API](/azure/ai-studio/ai-services/model-inference).

## Add security parameters to your Azure OpenAI call

To receive AI security alerts with more context, you can add any or all of the following sample `SecurityContext` parameters to your [Azure OpenAI API](/azure/ai-services/openai/reference) calls.

All of the fields in the `SecurityContext` are optional. 

For end-user context, we recommend passing the `EndUserId` and `SourceIP` fields at a minimum. The `EndUserId` and `SourceIP` fields provide Security Operations Center (SOC) analysts the ability to investigate security incidents that involve AI resources and generative AI applications. 

For application context, simply pass the `applicationName` field, as a simple string.

If a field’s name is misspelled, the Azure OpenAI API call will still succeed. The `SecurityContext` schema doesn't require validation to pass through the Azure OpenAI user field. Application developers should ensure that a valid JSON is passed to the `user` field in every request made by the application to Azure OpenAI.

## SecurityContext schema

The exact schema can be found in Azure OpenAI [REST API reference documentation](/azure/ai-services/openai/reference-preview). 

The [user security context object](/azure/ai-services/openai/reference-preview#usersecuritycontext) is part of the[ request body ](/azure/ai-services/openai/reference-preview#createchatcompletionrequest)of the chat completion API.

Note, this feature is currently not supported when leveraging models deployed through the [Azure AI model inference API](/azure/ai-studio/ai-services/model-inference).

## Next step

> [!div class="nextstepaction"]
> [Overview - AI threat protection](ai-threat-protection.md)
