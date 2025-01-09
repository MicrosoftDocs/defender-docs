---
title: Unmonitored domain controllers assessment
description: This article provides an overview of Microsoft Defender for Identity's unmonitored domain controllers identity security posture assessment report.
ms.date: 01/29/2023
ms.topic: how-to
---

# Security assessment: Unmonitored domain controllers

## What are unmonitored domain controllers?

An essential part of the Microsoft Defender for Identity solution requires that its sensors are deployed on all organizational domain controllers, providing a comprehensive view for all user activities from every device.

For this reason, Defender for Identity continuously monitors your environment to identify domain controllers without an installed Defender for Identity sensor, and reports on these unmonitored servers to assist you in managing full coverage of your environment.

## What risk do unmonitored domain controllers pose to an organization?

In order to operate at maximum efficiency, all domain controllers must be monitored with Defender for Identity sensors. Organizations that fail to remediate unmonitored domain controllers, reduce visibility into their environment and potentially expose their assets to malicious actors.

## How do I use this security assessment?

1. Review the recommended action at <https://security.microsoft.com/securescore?viewid=actions> to discover which of your domain controllers are unmonitored.

    ![Install Defender for Identity Sensor on all Domain Controllers.](media/cas-isp-unmonitored-domain-controller-1.png)
1. Take appropriate action on those domain controllers by [installing and configuring monitoring sensors](/defender-for-identity/sensor-settings#domain-controller-status).

> [!NOTE]
> While assessments are updated in near real time, scores and statuses are updated every 24 hours.  While the list of impacted entities is updated within a few minutes of your implementing the recommendations, the status may still take time until it's marked as **Completed**.
> 

## See Also

- [Monitoring your domain controller coverage](/defender-for-identity/sensor-settings)
- [Check out the Defender for Identity forum!](<https://aka.ms/MDIcommunity>)
