---
title: Ai model security
description: Learn about AI model security in Microsoft Defender for Cloud.
ms.topic: concept-article
ms.date: 01/12/2026
ms.author: elkrieger
author: Elazark
---

# AI model security

As more organizations adopt AI models for various applications, ensuring the security of these models becomes paramount. Security teams lack the visibility and control needed to assess the safety and compliance of AI models entering their environments, making it increasingly difficult to enforce internal standards. 

To address this issue Defender for Cloud's Defender for AI plan supports AI model scanning. AI model scanning provides visibility and control over all AI models in use, allowing security teams to proactively detect unsafe or malicious artifacts. The security teams can ensure secure and transparent deployments, and continuous monitoring for risks throughout the AI lifecycle.

Defender for AI's Model Security enables organizations to automatically scan AI models for security risks such as malware, unsafe operators, and exposed secrets before they are deployed. Integrated into Azure ML and CI/CD pipelines, it provides real-time findings and remediation guidance to prevent unsafe models from reaching production.

With AI model security:

- Security teams can scan custom AI models uploaded to Azure ML workspaces and registries including formats such as ONNX, Pickle, TorchScript, and others for threats like malware, unsafe operators, and exposed secrets.

- Scan results are surfaced in Microsoft Defender for Cloud, providing security teams with centralized visibility of security findings. These detailed insights include severity, remediation guidance, and model metadata to support effective triage and prioritization.

- Developers can trigger model scans during build or release stages using CLI tools integrated into Azure DevOps or GitHub pipelines. This CI/CD integration for static scanning enables early detection of risks before models reach production.

## Prerequisites

- You must have an Azure subscription that contains AI models registered in [Azure Machine Learning](/azure/machine-learning/quickstart-create-resources?view=azureml-api-2) (Azure ML) registries or workspaces.
- [Enable the Defender for Cloud Security Posture Management plan](tutorial-enable-cspm-plan.md).
- You must be able to [create an Azure ML registry](/azure/machine-learning/how-to-manage-registries?view=azureml-api-2&tabs=cli#create-a-registry) or have access to an existing Azure ML registry.
- The ability to register models within the Azure ML registry for scanning.
- Required permissions: **Owner** or **Contributor** on the Azure Machine Learning resources.
- Supported model file formats: `Pickle (.pkl)`, `HDF5 (.h5)`, `TorchScript (.pt)`, `ONNX (.onnx)`, `SafeTensors (.safetensors)`, `TensorFlow SavedModel / TFLite (FlatBuffers)`, `NumPy (.npy)`, `Arrow, MsgPack, dill, joblib`, `PMML, JSON, POJO, MOJO, GGUF`.
- File size limit: 10 GB. Model files larger than 10 GB can't be scanned. 

## Locate all AI models in your environment

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Search for and select **Microsoft Defender for Cloud**.

1. Select **Cloud Security Explorer**.

1. Select **AI & Mls** > **AI models**.

    :::image type="content" source="media/ai-models/ai-models.png" alt-text="Screenshot that shows where to select AI models from the drop down list in the Cloud Security Explorer." lightbox="media/ai-models/ai-models.png":::

1. Select **Done**.

1. Select **+**.

1. Select **Metadata** > **AI Model Metadata**.

    :::image type="content" source="media/ai-models/ai-models-metadata.png" alt-text="Screenshot that shows how to select the 'AI Models Metadata' option." lightbox="media/ai-models/ai-models-metadata.png":::

1. Select **Search**.

The Cloud Security Explorer displays all AI models in your environment. You can select view details to see more information about each selected model.

## Locate AI models with security findings

You can use the Cloud Security Explorer to locate AI models that have active security findings that need to be addressed.

1. Follow steps 1-7 from the [Locate all AI models in your environment](#locate-all-ai-models-in-your-environment) section.

1. Select **+**.

1. Select **Recommendations** > **All recommendations**.

    :::image type="content" source="media/ai-models/all-recommendations.png" alt-text="Screenshot that shows how to select the 'All recommendations' option." lightbox="media/ai-models/all-recommendations.png":::

1. Select **Search**.

1. Select

## Next step