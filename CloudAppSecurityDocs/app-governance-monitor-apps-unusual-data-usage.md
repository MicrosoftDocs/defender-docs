---
title: Monitor and respond to apps with unusual data usage with app governance | Microsoft Defender for Cloud Apps
ms.date: 05/28/2023
ms.topic: conceptual
description: Monitor and respond to apps with unusual data usage using app governance in Microsoft Defender XDR with Microsoft Defender for Cloud Apps.
---

# Monitor and respond to apps with unusual data usage

App governance provides data usage information that can help you identify unwanted and potentially malicious app activity.

This article describes the data usage elements available on the **App governance** page in Microsoft Defender XDR.

## Data usage card

Located on the **Overview page**, the **Data usage** card provides total data usage over time, highlighting sudden spikes in total upload and download activity of all apps that access Microsoft 365 resources. 

This card also provides usage information separately for various resources, such as files and email, so you can pinpoint the resources that apps might be misusing.

## App details pane

Located on the right of an apps tab when you select an app, an app details pane provides app-specific data usage information by resource type and upload and download patterns over time.

## Policy conditions

Create policies that automatically flag and deactivate apps whose data usage matches the following conditions:

- **Data usage**: The total number of downloads and uploads exceeds your specified threshold
- **Data usage trend**: The percentage increase in the total number of downloads and uploads compared to the previous day reaches your specified threshold

## Next step

[Investigate anomaly detection alerts](app-governance-anomaly-detection-alerts.md)
