---
title: Guidance for pen testing and BAS on Linux
description: Learn how to configure Microsoft Defender for Endpoint on Linux for penetration testing and breach and attack simulation (BAS), review evaluation results, and submit possible false negatives.
author: paulinbar
ms.author: painbar
ms.reviewer: rutujadange
ms.date: 05/25/2026
ms.topic: how-to
ms.service: defender-endpoint
ms.localizationpriority: medium
ai-usage: ai-assisted
---

# Overview

This article describes common challenges and potential misconfigurations that can arise during penetration testing or when using breach and attack simulation (BAS) tools on Linux, which often lead to poor evaluation outcomes.

This guidance explains how to enable Microsoft Defender for Endpoint on Linux to operate with **full protection coverage**, ensuring evaluations reflect Defender's true detection and prevention capabilities- rather than partial configurations. Specifically, it focuses on:

- **Enabling settings** that turns on the full set of protection capabilities, avoiding partial or fragmented coverage.

- **Including how to enrol for new preview protection capabilities** to ensure the most complete and up‑to‑date assessment of Defender's detection and prevention depth.

- **Ensuring platform readiness**, so evaluation results reflect product capability and not environmental issues.

- **Using a consistent process to submit potential false negatives** for investigation and signal improvement.

# Challenges → Solutions at a Glance

| Challenge | Impact | Recommendation |
| --- | --- | --- |
| Default settings or misconfigurations | Lack of protection or missed detections | Enable Real-Time Protection (RTP), Behavioral Monitoring (BM), cloud delivered protection, and advanced antivirus and sensor capabilities to ensure comprehensive coverage. |
| Early access to new capabilities disabled | No early access to new cutting-edge protection capabilities | Contact your Microsoft account executive for guided enablement of preview features. |
| Outdated platform or signatures | Reduced detection accuracy | Keep platform, engine, and signature updates current. |
| Not meeting minimum system requirements | High CPU or latency during tests | Ensure the minimum system requirements are met. |

# Detailed Guidance

It's common for penetration testers to use just the default mode or enable only limited settings of Microsoft Defender on Linux while executing their attack. For accurate BAS and penetration testing results, Microsoft Defender for Linux must run with the full protection stack enabled. Evaluations results are unsatisfactory when only limited default settings are active. To avoid incomplete signal coverage, ensure the following components are enabled before testing:

- **Real‑time protection (RTP)**: Ensures malicious activity is detected and remediated in real time.

- **Behavioural Monitoring (BM)**: Provides behaviour‑based detection for ransomware, reverse shells, suspicious child processes, and other attack techniques.

- **Cloud Delivered Protection:** Enables Defender to use cloud intelligence to analyse suspicious files and behaviours in real time, improving detection of new and unknown threats.

- **Remediate infected file (remediateInfectedFile):** Ensures that processes interacting with known malicious files are automatically remediated, helping contain threats during real‑time detection.

- **Additional antivirus and sensor capabilities**): These settings enable deeper inspection of file, process, and network activity, along with extended telemetry collection from the system. Together, they improve detection depth, increase visibility into attack techniques, and reduce the chances of missed signals during BAS and penetration testing by capturing more system-level events and enforcing stronger scanning behaviour.

You can enable all of the above settings by creating the managed JSON configuration profile (\'mdatp_managed.json\') on the path [/etc/opt/microsoft/mdatp/managed]{.mark}. Copy the following content to \'*mdatp_managed.json\'*. Path can differ if you are using a custom path for installation. Refer:

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

- For details refer: [Configure security settings in Microsoft Defender for Endpoint on Linux - Microsoft Defender for Endpoint \| Microsoft Learn](https://learn.microsoft.com/en-us/defender-endpoint/linux-preferences)

- You can deploy this configuration file through your management tool or manually

- Once done, run *mdatp health* command to verify device health.

- **Note 1:** Some of these advanced sensor settings will be progressively enabled by default in the Defender for Endpoint agent to simplify configuration for administrators. As this rollout continues, explicit configuration will no longer be required for those capabilities, and they will be gradually removed from documentation.

- **Note 2:** Evaluation guidance enables additional advanced antivirus and sensor capabilities to maximize detection coverage and visibility. These settings can increase resource usage. For best results, use them in adequately sized environments. Low‑resource environments may experience performance degradation or reduced evaluation accuracy.

## Enable New Protection Capabilities Currently in Preview

To obtain the most current and comprehensive assessment of Defender's detection and prevention depth, customers are encouraged to enable new protection capabilities that might be in preview. These capabilities incorporate protections for emerging threats and evolving attack techniques, ensuring that BAS and penetration‑test exercises reflect Defender's latest security advancements. To know more and get **early access to new protection capabilities currently in preview**:

- Contact Microsoft account executive for guided enablement (Preview feature).

- Ensure prerequisites: System prerequisites, latest platform, engine, and signature updates applied.

## Keep Defender Up to Date

Running an older Linux Defender version means the agent will **continue to operate** and receive **security intelligence updates**. However, you will **not receive latest features, bug fixes and optimizations** from Microsoft. This puts your environment at greater risk for **new threats and operational issues**, as the agent won't be improved with latest capabilities.

**To maintain the highest level of security, support, and reliability,** upgrade to the latest **agent version** as soon as possible. Refer to official guidance to upgrade:

- <https://learn.microsoft.com/en-us/defender-endpoint/linux-updates>

- <https://learn.microsoft.com/en-us/defender-endpoint/linux-update-mde-linux>

## Recommended System Requirements 

Resource bottlenecks can impact detection accuracy and evaluation results. Before running BAS or penetration tests, ensure your environment meets following recommended system requirements for best results.

- **CPU:** 4 CPU cores.

- **Disk Space:** 2 GB minimum. For high-performance workloads, more disk space might be needed.

- **Memory:** 2 GB of RAM minimum. For high-performance workloads, more memory might be needed.

- Verify system requirements using official prerequisites: <https://learn.microsoft.com/defender-endpoint/linux-prerequisites>

## Review your exclusions

Before starting penetration testing, breach and attack simulation (BAS), or product evaluations, review any existing exclusions configured in Microsoft Defender.

In some environments, exclusions added for performance tuning or legacy workloads can unintentionally suppress Defender telemetry or protections, leading to missed detections and inaccurate evaluation outcomes. To ensure results accurately reflect Defender's detection and prevention capabilities- not environmental configuration- customers are advised to validate and temporarily remove or adjust unnecessary exclusions prior to testing. This helps ensure that evaluation and test results represent Defender's true protection depth.

# How to Interpret Evaluation Results

After running BAS or penetration testing scenarios, it is important to correctly interpret the results in the Microsoft Defender portal to understand both detection coverage and attacker behaviour.

To help with this, refer to the video below, followed by key guidance on how to analyse results.

![Linux evals final.mp4](media/image1.NnOvMcjSU_-vtgceBd3kspUmDPb72b21V86BNb18Nj0){width="7.5in" height="4.21875in"}

# How to submit possible false negatives for investigation

## Step 1: Gather the Microsoft Defender for Endpoint diagnostic logs

**Use the MDE Client Analyzer log:** You can collect using [Live Response](https://learn.microsoft.com/en-us/defender-endpoint/run-analyzer-linux) or [locally](https://learn.microsoft.com/en-us/defender-endpoint/run-analyzer-linux).

**Microsoft Defender Antivirus diagnostic data (MpSupport.cab)**

1.  On the device, open Terminal (shell session).

2.  Run the following command: [mdatp log level set\--level debug]{.mark}.

3.  And re-run the scenarios.

4.  Run the following command to collect the logs: [sudo mdatp diagnostic create.]{.mark}

For more information, see [Microsoft Defender for Endpoint on Linux resources](https://learn.microsoft.com/en-us/defender-endpoint/linux-resources)

## Step 2: Gather information

Ensure you have the following information ready

- **Microsoft Defender Org ID**. In the [Microsoft Defender portal](https://security.microsoft.com/), go to **Settings** \> **Microsoft Defender XDR** \> **Account** \> **Org ID**.

- **Device ID**. In the [Microsoft Defender portal](https://security.microsoft.com/), open the device page.

- Binary names.

- Start and end of when testing was done in HH:MM:SS UTC format.

- It would be highly beneficial if you could provide the steps to reproduce the issue, along with a sample of the payload.

## Step 3: Submit data to Microsoft as soon as possible

It\'s crucial to report to Microsoft as soon as possible. The advanced hunting telemetry data wraps around and overwrites itself after 30 days. You can use either the Microsoft Defender Security Intelligence (MDSI) portal or the Microsoft Defender portal to submit your files.

| Portal | Description |
| --- | --- |
| MDSI portal | The MDSI portal is a service provided by Microsoft Defender Security Intelligence. It allows users to submit files for malware analysis. Microsoft Defender security researchers analyse these files to determine if they’re threats, unwanted applications, or normal files. The portal is used to report detection concerns to Microsoft Defender Research, submit files for analysis, and track the results of submissions. |
| Microsoft Defender portal | If you have a subscription to Microsoft Defender XDR, or your subscription includes Defender for Endpoint Plan 2, you can use the **Submissions** page in the Microsoft Defender portal. |

1.  Submit the data you gathered during steps 1-2 by using either the MDSI portal or the Microsoft Defender portal.

    - **MDSI portal**: Go to the [MDSI portal](https://www.microsoft.com/en-us/wdsi), and then select **Submit files**. Follow the guidance on the page.

    - **The Microsoft Defender portal**: See [Use admin submission for submitting files in Microsoft Defender for Endpoint](https://learn.microsoft.com/en-us/defender-endpoint/admin-submissions-mde).

<!-- -->

1.  After you upload the files, note the Submission ID for your sample submission (for example, 7c6c214b-17d4-4703-860b-7f1e9da03f7f).

2.  Wait for an update. After Microsoft receives the submission, Microsoft Defender research teams analyse the data to assess detection behaviour and protection coverage. If gaps or issues are identified, appropriate actions may be taken to improve detection and prevention capabilities.

3.  Use the Submission ID to track the status of your submission.

4.  If you have questions, [contact support](https://learn.microsoft.com/en-us/defender-endpoint/contact-support).