---
title: Ai model security
description: Learn about AI model security in Microsoft Defender for Cloud.
ms.topic: concept-article
ms.date: 01/05/2026
ms.author: elkrieger
author: Elazark
---

# AI model security

As more organizations adopt AI models for various applications, ensuring the security of these models becomes paramount. Security teams lack the visibility and control needed to assess the safety and compliance of AI models entering their environments, making it increasingly difficult to enforce internal standards. 

To address this issue Defender for Cloud's Defender for AI plan supports AI model scanning. AI model scanning provides visibility and control over all AI models in use, allowing security teams to proactively detect unsafe or malicious artifacts. The security teams can ensure secure and transparent deployments, and continuous monitoring for risks throughout the AI lifecycle.

Defender for AI's Model Security enables organizations to automatically scan AI models for security risks such as malware, unsafe operators, and exposed secrets before they are deployed. Integrated into Azure ML and CI/CD pipelines, it provides real-time findings and remediation guidance to prevent unsafe models from reaching production.



## Use Cases

- Scan Custom AI Models in Azure ML: Security teams can scan models uploaded to Azure ML workspaces and registries including formats such as ONNX, Pickle, TorchScript, and others for threats like malware, unsafe operators, and exposed secrets.

- Centralized Visibility of Security Findings: Scan results are surfaced in Microsoft Defender for Cloud, providing security teams with detailed insights including severity, remediation guidance, and model metadata to support effective triage and prioritization.

- CI/CD Integration for Static Scanning: Developers can trigger model scans during build or release stages using CLI tools integrated into Azure DevOps or GitHub pipelines, enabling early detection of risks before models reach production.

## Next step