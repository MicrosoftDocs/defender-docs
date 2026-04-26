---
author: paulinbar
ms.author: painbar
ms.date: 04/26/2026
ms.topic: include
ms.service: defender-endpoint
---

| Capability | Description | Remarks |
|---|---|---|
| **Basic response** | [Run antivirus scan](../respond-machine-alerts.md#run-microsoft-defender-antivirus-scan-on-devices), [collect file](../respond-file-alerts.md#download-or-collect-file), and [collect investigation package](../respond-machine-alerts.md#collect-investigation-package-from-devices). | The *Collect file* capability refers to retrieving a file from the **File** page in the portal, not the `GetFile` command available under Live Response. |
| **Advanced response** | [Isolate device](../respond-machine-alerts.md#isolate-devices-from-the-network), [restrict app execution](../respond-machine-alerts.md#restrict-app-execution), and [request remediation](/defender-vulnerability-management/tvm-remediation#request-remediation). | *Request remediation* allows security administrators to initiate remediation actions for identified vulnerabilities on a specific device. |
| **Live response** | Allows [live response sessions](../respond-machine-alerts.md#initiate-live-response-session) to the remote device. | |
| **Device protection** | Allows [automated investigation and response (AIR)](../respond-machine-alerts.md#initiate-automated-investigation) to be performed on the device. | |