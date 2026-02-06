---
title: Defender for Cloud CLI Syntax
description: Discover how to scan container images for security risks using Microsoft Container Security Scanner. Includes syntax, parameters, and examples.
#customer intent: As a DevOps engineer, I want to scan container images for vulnerabilities so that I can ensure the security of my deployments.
author: Elazark
ms.author: elkrieger
ms.date: 11/06/2025
ms.topic: concept-article
---

# Defender for Cloud CLI syntax

The Defender for Cloud CLI provides commands to scan container images for security vulnerabilities and export results in standard formats. This article describes the syntax, parameters, and usage examples for the image and SBOM scan commands.

## Image Scan

Use the `defender scan image` command to scan container images for vulnerabilities using Microsoft Defender Vulnerability Management (MDVM).

### Usage

```bash
defender scan image <image-name> [--defender-output <path>]
```

### Options
| Name                         | Required | Type   | Description                                                  |
| ---------------------------- | -------- | ------ | ------------------------------------------------------------ |
| \<image-name\>               | Yes      | String | The container image reference (for example, `my-image:latest`, `registry.azurecr.io/app:v1`). |
| \-\-defender-output          | No       | String | Path to write aggregated SARIF output file.                  | 

### Examples

#### Scan a local image

```bash
defender scan image my-image:latest
```
#### Scan and export SARIF results

```bash
defender scan image my-image:latest --defender-output results.sarif
```

## SBOM Scan

Use the `defender scan sbom` command to scan filesystem or container images to generate a Software Bill of Materials (SBOM). This command also identifies malicious packages.

### Usage

```bash
defender scan sbom <target> [--sbom-format <format>]
```

### Options
| Name                         | Required | Type   | Description                                                  |
| ---------------------------- | -------- | ------ | ------------------------------------------------------------ |
| \<target\>                   | Yes      | String | The container image reference or filesystem (for example, `my-image:latest`, `/home/src/`). |
| \-\-sbom-format              | No       | String | SBOM output format. Default: `cyclonedx1.6-json` | 

#### Valid format options:
- `cyclonedx1.4-json`, `cyclonedx1.4-xml`
- `cyclonedx1.5-json`, `cyclonedx1.5-xml`
- `cyclonedx1.6-json`, `cyclonedx1.6-xml`
- `spdx2.3-json`

### Examples

#### Create SBOM of a container image

```bash
defender scan sbom my-image:latest
```
#### Create SBOM from local filesystem

```bash
defender scan sbom /home/src --sbom-format cyclonedx1.6-xml
```