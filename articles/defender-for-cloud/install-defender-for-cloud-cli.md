---
title: Install the Defender for Cloud CLI
description: Learn how to download and install the Defender for Cloud CLI on Windows, macOS, and Linux.
author: Elazar
ms.author: elkrieger
ms.topic: how-to
ms.date: 01/08/2026
# customer intent: As a developer or security engineer, I want to install the Defender for Cloud CLI so I can run security scans locally and in CI/CD pipelines.
---

# Install the Defender for Cloud CLI

This article explains how to download and install the Defender for Cloud CLI on supported operating systems.

## Download the CLI

The Defender for Cloud CLI is distributed as a standalone executable. Download the binary that matches your operating system and CPU architecture.

| Operating system | Architecture | Download |
|---|---|---|
| Windows | x64 (64-bit) | [Download for Windows x64](https://aka.ms/defender-cli_win-x64) |
| Windows | x86 (32-bit) | [Download for Windows x86](https://aka.ms/defender-cli_win-x86) |
| Windows | ARM64 | [Download for Windows ARM64](https://aka.ms/defender-cli_win-arm64) |
| macOS | Apple silicon (M-series) | [Download for macOS ARM64](https://aka.ms/defender-cli_osx-arm64) |
| macOS | Intel | [Download for macOS x64](https://aka.ms/defender-cli_osx-x64) |
| Linux | x64 | [Download for Linux x64](https://aka.ms/defender-cli_linux-x64) |
| Linux | ARM64 | [Download for Linux ARM64](https://aka.ms/defender-cli_linux-arm64) |

## Set execution permissions (Linux and macOS)

On Linux and macOS, you must grant the downloaded binary permission to run.

From the directory that contains the downloaded file, run:

```bash
chmod +x defender
```

> [!TIP]
> On macOS, you might see a **Developer cannot be verified** warning when running the CLI for the first time. To allow the binary, go to **System Settings** > **Privacy & Security**, and then select **Open Anyway**.

## Add the CLI to your PATH (recommended)

Adding the CLI to your system PATH lets you run the `defender` command from any directory.

### Linux and macOS

Move the binary to a directory that’s already included in your PATH, such as `/usr/local/bin`:

```bash
sudo mv defender /usr/local/bin/defender
```

### Windows

1. Create a folder. 
   For example, `C:\tools\defender`

1. Move `defender.exe` into that folder.

1. In Windows Search, select **Edit the system environment variables**.

1. Select **Environment Variables**, then edit the **Path** variable under **System variables**.

5. Add the path to the folder you created. 
   For example, `C:\tools\defender`

1. Save your changes.

## Verify the installation

Open a new terminal or command prompt window and run:

```bash
defender --version
```
If the CLI is installed correctly, the command returns the current version.

## Next steps

- [Configure Defender for Cloud CLI authentication](defender-cli-authentication.md)

- Review the [CLI command reference](/azure/defender-for-cloud/defender-cli-syntax)

- [Integrate the CLI into CI/CD pipelines](/azure/defender-for-cloud/ci-cd-pipeline-scanning-with-defender-cli)
