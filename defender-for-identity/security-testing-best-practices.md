---
title: Offensive Security Testing for Microsoft Defender for Identity
description: Learn about best practices for Offensive Security Testing for Microsoft Defender for Identity.
ms.date: 11/30/2025
ms.topic: article
#customerIntent: To learn about the best practices for Offensive Security Testing for Microsoft Defender for Identity.
ms.reviewer: martin77s
---

# Best Practices before Offensive Security Testing for Microsoft Defender for Identity

This article summarizes the best practices to put in place before you begin Offensive Security Testing for Microsoft Defender for Identity.

|Recommendation |Description  |Tasks  |
|---------|---------|---------|
|Check that Defender for Identity is deployed on all domain controllers    |Deployment on all domain controllers ensures that you are getting all of the signals for threat detection. Not having full coverage can lead to missed detections or false positives.   |[Microsoft Defender for Identity deployment overview](deploy/deploy-defender-identity.md).   |
|Check that Defender for Identity is deployed on all AD FS, AD CS, and Microsoft Entra Connect servers     |Deployment on all domain controllers ensures that you are getting all of the signals for threat detection. Not having full coverage can lead to missed detections or false positives.| [Configure sensors for AD FS, AD CS, and Microsoft Entra Connect](deploy/active-directory-federation-services.md)  |
|Check the health of your Defender for Identity sensors     |It is critical that your sensor is healthy and reporting as expected to ensure optimal performance.  Having an unhealthy sensor can lead to missed detections. Review all health alerts before running any tests.  |[Microsoft Defender for Identity health issues](health-alerts.md) |
|Consider integrating with Microsoft XDR|Defender for Identity proveds alerting on identity based threats. Integrating with Microsoft Defender XDR allows you to correlate these alerts with other signals for a more comprehensive view of threats and potential solutions.<br></br>Microsoft Defender XDR is a unified pre- and post-breach enterprise defense suite that natively coordinates detection, prevention, investigation, and response across endpoints, identities, email, and applications to provide integrated protection against sophisticated attacks.   |[[https://learn.microsoft.com/defender-xdr/microsoft-365-defender](https://learn.microsoft.com/defender-xdr/microsoft-365-defender)  |
|Check windows event collection configuration|Optimal event collection is essential for Defender for Identity to analyze and detect threats effectively. Check your configuration before running any tests. |- [Configure windows event collection for domain controllers](deploy/configure-windows-event-collection.md#configure-windows-event-auditing-for-domain-controllers)</br> - [Configure windows event collection for AD CS](deploy/configure-windows-event-collection.md#configure-auditing-on-ad-cs)</br> - [Configure windows event collection for AD FS](deploy/configure-windows-event-collection.md#configure-auditing-on-ad-fs)</br> - [Configure windows event collection for Entra connect](deploy/configure-windows-event-collection.md#configure-auditing-on-microsoft-entra-connect)</br> - [Use Powershell to check your configuration](https://www.powershellgallery.com/packages/DefenderForIdentity/1.0.0.4)|
|Check that NNR is configured correctly|NNR is a critical component of Defender for Identity. Defender for Identity uses NNR to correlate between raw activities containing IP addresses, and the computers involved in each activity. Defender for Identity profiles entities, including computers, and generates security alerts for suspicious activities. It is important for NNR to be configured correctly for a successful deployment and to help detect advanced threats.|[Configure Network Name Resolution (NNR) for Microsoft Defender for Identity](deploy/configure-nnr.md)|



## Related content

- The Microsoft Defender XDR [Security operations overview](/security/operations/overview).
