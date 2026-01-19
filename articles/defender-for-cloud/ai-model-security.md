---
title: Discover AI models
description: Learn about AI model security in Microsoft Defender for Cloud.
ms.topic: concept-article
ms.date: 01/19/2026
ms.author: elkrieger
zone_pivot_groups: defender-portal-experience
---

# AI model security

As Artificial Intelligence (AI) models are increasingly used across organizations to drive automation, insights, and intelligent decision‑making. These models are often embedded into application pipelines and production systems, often with broad access to data and infrastructure. Security teams need visibility and control to assess the safety and compliance of AI models entering their environments. Without these capabilities, it becomes increasingly difficult to enforce internal standards. 

Microsoft Defender for Cloud's Defender for AI security supports AI model scanning. AI model scanning provides proactive detection of unsafe or malicious artifacts and continuously monitors models for risk throughout the AI lifecycle.

AI model security automatically y scan AI models for security risks such as embedded malware, unsafe operators, and exposed secrets before those models ever reach production. Integrated directly with Azure Machine Learning and CI/CD pipelines, the service surfaces real‑time findings and actionable remediation guidance, allowing teams to stop risky models early in the development process.

With AI model security, security teams can scan custom AI models uploaded to Azure Machine Learning workspaces and registries, to identify threats like embedded malware, unsafe operators, and exposed secrets. Defender for Clou presents the results, giving teams visibility into security findings along with severity ratings, remediation guidance, and relevant model metadata to support effective triage and prioritization. Developers can also trigger model scans during build or release stages by using CLI tools integrated with Azure DevOps or GitHub pipelines, enabling static scanning and early risk detection before models reach production.

## Prerequisites

- You must have an Azure subscription that contains AI models registered in [Azure Machine Learning](/azure/machine-learning/quickstart-create-resources) (Azure Machine Learning) registries or workspaces.
- [Enable the Defender for Cloud Security Posture Management plan](tutorial-enable-cspm-plan.md).
- You must be able to [create an Azure Machine Learning registry](/azure/machine-learning/how-to-manage-registries) or have access to an existing Azure Machine Learning registry.
- The ability to register models within the Azure Machine Learning registry for scanning.
- Required permissions: **Owner** or **Contributor** on the Azure Machine Learning resources.
- Supported model file formats: `Pickle (.pkl)`, `HDF5 (.h5)`, `TorchScript (.pt)`, `ONNX (.onnx)`, `SafeTensors (.safetensors)`, `TensorFlow SavedModel / TFLite (FlatBuffers)`, `NumPy (.npy)`, `Arrow, MsgPack, dill, joblib`, `PMML, JSON, POJO, MOJO, GGUF`.
- File size limit: 10 GB. Model files larger than 10 GB can't be scanned. 

::: zone pivot="azure-portal"

## Locate all AI models in your environment

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Search for and select **Microsoft Defender for Cloud**.

1. Select **Cloud Security Explorer**.

1. Select **AI & Mls** > **AI models**.

    :::image type="content" source="media/ai-models/ai-models.png" alt-text="Screenshot that shows where to select AI models from the drop-down list in the Cloud Security Explorer." lightbox="media/ai-models/ai-models.png":::

1. Select **Done**.

1. Select **+**.

1. Select **Metadata** > **AI Model Metadata**.

    :::image type="content" source="media/ai-models/ai-models-metadata.png" alt-text="Screenshot that shows how to select the 'AI Models Metadata' option." lightbox="media/ai-models/ai-models-metadata.png":::

1. Select **Search**.

The Cloud Security Explorer displays all AI models in your environment. You can select **view details** to see more information about each selected model.

## Locate AI models with security findings

Use the Cloud Security Explorer to find AI models that have active security findings.

1. Follow steps 1-7 from the [Locate all AI models in your environment](#locate-all-ai-models-in-your-environment) section.

1. Select **+**.

1. Select **Recommendations** > **All recommendations**.

    :::image type="content" source="media/ai-models/all-recommendations.png" alt-text="Screenshot that shows how to select the 'All recommendations' option." lightbox="media/ai-models/all-recommendations.png":::

1. Select **Search**.

The Cloud Security Explorer displays all AI models in your environment that have active security findings. Select **view details** to see more information about each model and the associated findings.

::: zone-end

::: zone pivot="defender-portal"

## Locate all AI models in your environment

The Defender portal **Assets** page provides a comprehensive view of all AI models in your environment.

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com/).

1. Go to **Assets** > **Cloud** > **AI** > **AI models**.

    :::image type="content" source="media/ai-models/defender-ai-models.png" alt-text="Screenshot that shows how to navigate to the Defender portals asset page with all of the AI models presented." lightbox="media/ai-models/defender-ai-models.png":::

1. Select an AI model with recommendations.

    :::image type="content" source="media/ai-models/ai-models-recommendation.png" alt-text="Screenshot that shows AI models that have at least one recommendation affecting them.":::

1. Select **Open asset page**.

    :::image type="content" source="media/ai-models/asset-page.png" alt-text="Screenshot that shows where the 'Open asset page' button is located." lightbox="media/ai-models/asset-page.png":::

1. Select **Security recommendations** > the relevant recommendation.
 
1. Review and remediate the security finding as needed.
 
You can also manage the recommendation in the Azure portal. 

::: zone-end

## Next step

> [!div class="nextstep"]
> [Build queries with cloud security explorer](how-to-manage-cloud-security-explorer.md).
