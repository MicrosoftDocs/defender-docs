---
title: Guidance for configuring Defender for Endpoint on Linux for pen testing and BAS
description: Learn how to configure Microsoft Defender for Endpoint on Linux for penetration testing and breach and attack simulation (BAS), review evaluation results, and submit possible false negatives.
author: paulinbar
ms.author: painbar
ms.reviewer: rutujadange
ms.date: 05/27/2026
ms.topic: how-to
ms.service: defender-endpoint
ms.localizationpriority: medium
ms.custom: msecd-doc-authoring-1012
ai-usage: ai-assisted
#customer intent: As a penetration tester, I want to configure Defender for Endpoint on Linux with full protection so that my evaluation results reflect true detection capabilities.
---

# Guidance for configuring Microsoft Defender for Endpoint on Linux for penetration testing and BAS

Common challenges and potential misconfigurations can arise during penetration testing or when using breach and attack simulation (BAS) tools on Linux, which often lead to poor evaluation outcomes.

The following guidance explains how to enable Microsoft Defender for Endpoint on Linux to operate with **full protection coverage**, ensuring evaluations reflect Defender's true detection and prevention capabilities — rather than partial configurations. Specifically, it focuses on:

- **Enabling settings** that turn on the full set of protection capabilities, avoiding partial or fragmented coverage.

- **Enrolling for new preview protection capabilities** to ensure the most complete and up-to-date assessment of Defender's detection and prevention depth.

- **Ensuring platform readiness**, so evaluation results reflect product capability and not environmental issues.

- **Using a consistent process to submit potential false negatives** for investigation and signal improvement.

## In this article

- [Challenges and solutions at a glance](#challenges-and-solutions-at-a-glance)
- [Detailed guidance](#detailed-guidance)
  - [Enable Full Protection Settings](#enable-full-protection-settings)
  - [Enable new protection capabilities currently in preview](#enable-new-protection-capabilities-currently-in-preview)
  - [Keep Defender up to date](#keep-defender-up-to-date)
  - [Ensure your environment meets recommended system requirements](#ensure-your-environment-meets-recommended-system-requirements)
- [Review your exclusions](#review-your-exclusions)
- [Interpret evaluation results](#interpret-evaluation-results)
- [Submit possible false negatives for investigation](#submit-possible-false-negatives-for-investigation)
  - [Step 1: Gather the Microsoft Defender for Endpoint diagnostic logs](#step-1-gather-the-microsoft-defender-for-endpoint-diagnostic-logs)
  - [Step 2: Gather information](#step-2-gather-information)
  - [Step 3: Submit data to Microsoft as soon as possible](#step-3-submit-data-to-microsoft-as-soon-as-possible)

## Challenges and solutions at a glance

| Challenge | Impact | Recommendation |
| --- | --- | --- |
| Default settings or misconfigurations | Lack of protection or missed detections | Enable Real-Time Protection (RTP), Behavioral Monitoring (BM), cloud delivered protection, and advanced antivirus and sensor capabilities to ensure comprehensive coverage. |
| Early access to new capabilities disabled | No early access to new cutting-edge protection capabilities | Contact your Microsoft account executive for guided enablement of preview features. |
| Outdated platform or signatures | Reduced detection accuracy | Keep platform, engine, and signature updates current. |
| Not meeting minimum system requirements | High CPU or latency during tests | Ensure the minimum system requirements are met. |

## Detailed guidance

For accurate BAS and penetration testing results, Microsoft Defender for Endpoint on Linux should run with the full protection stack enabled, the latest platform updates applied, and adequate system resources available. See the following sections for guidance regarding each requirement.

### Enable Full Protection Settings

It's common for penetration testers to use just the default mode or enable only limited settings of Microsoft Defender for Endpoint on Linux while executing their attack. For accurate BAS and penetration testing results, Microsoft Defender for Endpoint on Linux must run with the full protection stack enabled. Evaluation results are unsatisfactory when only limited default settings are active. To avoid incomplete signal coverage, ensure the following components are enabled before testing:

- **Real-time protection (RTP)**: Ensures malicious activity is detected and remediated in real time.

- **Behavioral Monitoring (BM)**: Provides behavior-based detection for ransomware, reverse shells, suspicious child processes, and other attack techniques.

- **Cloud Delivered Protection:** Enables Defender to use cloud intelligence to analyze suspicious files and behaviors in real time, improving detection of new and unknown threats.

- **Remediate infected file (remediateInfectedFile):** Ensures that processes interacting with known malicious files are automatically remediated, helping contain threats during real-time detection.

- **Additional antivirus and sensor capabilities**: These settings enable deeper inspection of file, process, and network activity, along with extended telemetry collection from the system. Together, they improve detection depth, increase visibility into attack techniques, and reduce the chances of missed signals during BAS and penetration testing by capturing more system-level events and enforcing stronger scanning behavior.

Enable all of the protection settings listed above by creating the managed JSON configuration profile (`mdatp_managed.json`) on the path `/etc/opt/microsoft/mdatp/managed`. Copy the following content to `mdatp_managed.json`. The path can differ if you use a custom path for installation. For more information, see [Set preferences for Microsoft Defender for Endpoint on Linux](/defender-endpoint/linux-preferences).

```json
{
    "antivirusEngine": {
        "enforcementLevel": "real_time",
        "behaviorMonitoring": "enabled",
        "scanFileModifyPermissions": true,
        "scanNetworkSocketEvent": true
    },
    "cloudService": {
        "enabled": true
    },
    "features": {
        "remediateInfectedFile": "enabled",
        "enableAntivirusEngineCache": "enabled",
        "supplementarySensorConfigurations": {
            "enableFilePermissionEvents": "enabled",
            "enableRawSocketEvent": "enabled",
            "sendLowfiEvents": "enabled"
        }
    }
}
```

After deploying the configuration file, verify device health:

- You can deploy this configuration file through your management tool or manually.

- Run the `mdatp health` command to verify device health.

> [!NOTE]
> Some of these advanced sensor settings will be progressively enabled by default in the Defender for Endpoint agent to simplify configuration for administrators. As this rollout continues, explicit configuration will no longer be required for those capabilities, and they'll be gradually removed from documentation.

> [!NOTE]
> Evaluation guidance enables additional advanced antivirus and sensor capabilities to maximize detection coverage and visibility. These settings can increase resource usage. For best results, use them in adequately sized environments. Low-resource environments might experience performance degradation or reduced evaluation accuracy.

### Enable new protection capabilities currently in preview

To get the most current and comprehensive assessment of Defender's detection and prevention depth, enable new protection capabilities that might be in preview. These capabilities incorporate protections for emerging threats and evolving attack techniques, ensuring that BAS and penetration-test exercises reflect Defender's latest security advancements. To get **early access to new protection capabilities currently in preview**:

- Contact your Microsoft account executive for guided enablement (Preview feature).

- Ensure prerequisites: System prerequisites, latest platform, engine, and signature updates applied.

### Keep Defender up to date

Running an older Defender for Endpoint on Linux version means the agent continues to operate and receive security intelligence updates. However, you don't receive the latest features, bug fixes, and optimizations from Microsoft. An outdated agent puts your environment at greater risk for new threats and operational issues, because the agent won't be improved with the latest capabilities.

To maintain the highest level of security, support, and reliability, upgrade to the latest agent version as soon as possible. For upgrade guidance, see the following articles:

- [Deploy updates for Microsoft Defender for Endpoint on Linux](/defender-endpoint/linux-updates)

- [Update Microsoft Defender for Endpoint on Linux](/defender-endpoint/linux-update-mde-linux)

### Ensure your environment meets recommended system requirements

Resource bottlenecks can impact detection accuracy and evaluation results. Before running BAS or penetration tests, ensure your environment meets the following recommended system requirements for best results.

- **CPU:** 4 CPU cores.

- **Disk Space:** 2 GB minimum. For high-performance workloads, more disk space might be needed.

- **Memory:** 2 GB of RAM minimum. For high-performance workloads, more memory might be needed.

- Verify system requirements using official prerequisites: [Microsoft Defender for Endpoint on Linux system prerequisites](/defender-endpoint/mde-linux-prerequisites)

## Review your exclusions

Before starting penetration testing, BAS, or product evaluations, review any existing exclusions configured in Microsoft Defender.

In some environments, exclusions added for performance tuning or legacy workloads can unintentionally suppress Defender telemetry or protections, leading to missed detections and inaccurate evaluation outcomes. To ensure results accurately reflect Defender's detection and prevention capabilities — not environmental configuration — validate and temporarily remove or adjust unnecessary exclusions prior to testing. This approach helps ensure that evaluation and test results represent Defender's true protection depth.

## Interpret evaluation results

After running BAS or penetration testing scenarios, correctly interpret the results in the Microsoft Defender portal by reviewing alerts, incidents, and the Device timeline, enabling clear understanding of detected threats and attack behaviors.

## Submit possible false negatives for investigation

### Step 1: Gather the Microsoft Defender for Endpoint diagnostic logs

**Use the MDE Client Analyzer log:** You can collect logs by using [Live Response](/defender-endpoint/run-analyzer-linux) or [locally](/defender-endpoint/run-analyzer-linux).

**Microsoft Defender Antivirus diagnostic data (MpSupport.cab)**

To collect diagnostic data, follow these steps:

1. On the device, open Terminal (shell session).

1. Run the following command: `mdatp log level set --level debug`.

1. Rerun the scenarios.

1. Run the following command to collect the logs: `sudo mdatp diagnostic create`.

For more information, see [Microsoft Defender for Endpoint on Linux resources](/defender-endpoint/linux-resources).

### Step 2: Gather information

Ensure you have the following information ready:

- **Microsoft Defender Org ID**. In the [Microsoft Defender portal](https://security.microsoft.com/), go to **Settings** \> **Microsoft Defender XDR** \> **Account** \> **Org ID**.

- **Device ID**. In the [Microsoft Defender portal](https://security.microsoft.com/), open the device page.

- **Binary names**.

- **Testing timeframe**. Start and end times in HH:MM:SS UTC format.

- **Reproduction steps**. Provide the steps to reproduce the issue and a sample of the payload if possible.

### Step 3: Submit data to Microsoft as soon as possible

Report to Microsoft promptly. The advanced hunting telemetry data wraps around and overwrites itself after 30 days. You can use either the Microsoft Defender Security Intelligence (MDSI) portal or the Microsoft Defender portal to submit your files.

| Portal | Description |
| --- | --- |
| MDSI portal | The MDSI portal is a service provided by Microsoft Defender Security Intelligence. It allows users to submit files for malware analysis. Microsoft Defender security researchers analyze these files to determine if they're threats, unwanted applications, or normal files. The portal is used to report detection concerns to Microsoft Defender Research, submit files for analysis, and track the results of submissions. |
| Microsoft Defender portal | If you have a subscription to Microsoft Defender XDR, or your subscription includes Defender for Endpoint Plan 2, you can use the **Submissions** page in the Microsoft Defender portal. |

Submit the data you gathered in Steps 1 and 2 by using either the MDSI portal or the Microsoft Defender portal:

1. **MDSI portal**: Go to the [MDSI portal](https://www.microsoft.com/wdsi), and then select **Submit files**. Follow the guidance on the page.

1. **The Microsoft Defender portal**: See [Use admin submission for submitting files in Microsoft Defender for Endpoint](/defender-endpoint/admin-submissions-mde).

1. After you upload the files, note the Submission ID for your sample submission (for example, aaaa0000-bb11-2222-33cc-444444dddddd).

1. Wait for an update. After Microsoft receives the submission, Microsoft Defender research teams analyze the data to assess detection behavior and protection coverage. If gaps or issues are identified, appropriate actions might be taken to improve detection and prevention capabilities.

1. Use the Submission ID to track the status of your submission.

1. If you have questions, [contact support](/defender-endpoint/contact-support).