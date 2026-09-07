---
title: Microsoft Defender for IoT Feature Support and Retirement
description: Review Microsoft Defender for IoT feature support status and retirement timelines for different capabilities.
ms.date: 06/12/2026
ms.topic: how-to
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
---

# Microsoft Defender for IoT micro agent support and retirement

This article lists support status and retirement dates for Microsoft Defender for IoT micro agent features. Learn about the legacy Defender-IoT-micro-agent and its replacement. Find details on the end of support for C, C#, and Edge micro agent types.

## Legacy Defender for IoT micro-agent

The legacy Defender-IoT-micro-agent has been replaced by the new Defender for IoT micro agent.

To get started, see these tutorials:

- [Tutorial: Create a DefenderIotMicroAgent module twin (Preview)](tutorial-create-micro-agent-module-twin.md)
- [Tutorial: Install the Defender for IoT micro agent (Preview)](tutorial-standalone-agent-binary-installation.md)

[!INCLUDE [device-agents-note](../includes/device-agents-note.md)]

### Timeline

Microsoft Defender for IoT will continue to support the legacy Microsoft Defender for IoT experience under IoT hub until March 31, 2023.

## Defender for IoT C, C#, and Edge Defender-IoT-micro-agent deprecation

The new micro agent will replace the current C, C#, and Edge Defender-IoT-micro-agent.  

The new micro agent development is based on the knowledge, and experience gathered from the legacy security module development, customers, and feedback from partners with four important improvements:

- **Depth security value**: The new agent will run on the host level, which will provide more visibility to the underlying operations of the device, and to allow for better security coverage.

- **Improved device performance and reduced footprint**: Achieved by a small RAM, and ROM memory footprint as well as low CPU consumption.  

- **Plug and play**: The new micro agent has no kernel level dependencies anymore, and all of its software dependencies are provided as part of its package. The micro agent supports common CPU architecture.

- **Easy to deploy**: The micro agent supports different distribution models, through source code, and as a binary package.

### Timeline 

Defender for IoT will continue to support C, C#, and Edge until March 1, 2022.

## Micro agent preview support

During the preview the micro agent may experience breaking changes without notice.

## Related content

[Microsoft Defender for IoT agent frequently asked questions](resources-agent-frequently-asked-questions.md).
