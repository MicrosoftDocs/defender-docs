---
title: Defender for Cloud CLI Syntax
description: Discover how to scan container images for security risks using Microsoft Container Security Scanner. Includes syntax, parameters, and examples.
#customer intent: As a DevOps engineer, I want to scan container images for vulnerabilities so that I can ensure the security of my deployments.
author: Elazark
ms.author: elkrieger
ms.reviewer: dacurwin
ms.date: 11/06/2025
ms.topic: concept-article
---

# Defender for Cloud CLI syntax

The Defender for Cloud CLI provides commands to scan container images for security vulnerabilities and export results in standard formats. This article describes the syntax, parameters, and usage examples for the image scan command.

## Image scan

### Command Group
`defender scan image`  

Scan container images for vulnerabilities by using Microsoft Defender Vulnerability Management (MDVM).  

### Syntax

```bash
defender scan image <image-name> [--defender-output <path>]
```

### Parameters
| Name                         | Required | Type   | Description                                                  |
| ---------------------------- | -------- | ------ | ------------------------------------------------------------ |
| \<image-name\>               | Yes      | String | The container image reference (for example, my-image:latest, registry.azurecr.io/app:v1). |
| \-\-defender-output          | No       | String | Path to write aggregated SARIF output file.                  |
| \-\-mdvm-OutputFile          | No       | String | Path to write Microsoft Container Security Scanner SARIF output file. |
| \-\-mdvm-result-summary-type | No       | String | Specifies whether and how to print findings to the console.  |
| \-\-help                     | No       | Flag   | Help Instructions with options and examples.                  |

### Examples

#### Scan a local image

```bash
defender scan image my-image:latest
```
#### Scan and export SARIF results

```bash
defender scan image my-image:latest --defender-output results.sarif
```
