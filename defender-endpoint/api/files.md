---
title: File resource type
description: Retrieve recent Microsoft Defender for Endpoint alerts related to files.
ms.service: defender-endpoint
ms.author: painbar
author: paulinbar
ms.localizationpriority: medium
ms.collection:
- m365-security
- tier3
- must-keep
ms.topic: reference
ms.subservice: reference
ms.custom: api
ms.date: 11/12/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 1
  - Microsoft Defender for Endpoint Plan 2
---

# File resource type

## Properties

|Property | Type | Description |
|---|---|---|
|sha1 | String | Sha1 hash of the file content |
|sha256 | String | Sha256 hash of the file content |
|globalPrevalence | Nullable long | File prevalence across organization |
|globalFirstObserved | DateTimeOffset | First time the file was observed |
|globalLastObserved | DateTimeOffset | Last time the file was observed |
|size | Nullable long | Size of the file |
|fileType | String | Type of the file |
|isPeFile | Boolean | true if the file is portable executable (for example `DLL`, `EXE`, etc.) |
|filePublisher | String | File publisher |
|fileProductName | String | Product name |
|signer | String | File signer |
|issuer | String | File issuer |
|signerHash | String | Hash of the signing certificate |
|isValidCertificate | Boolean | Was signing certificate successfully verified by Microsoft Defender for Endpoint agent |
|determinationType | String | The determination type of the file |
|determinationValue | String | Determination value |

## Json representation

```json
{
    "sha1": "4388963aaa83afe2042a46a3c017ad50bdcdafb3",
    "sha256": "413c58c8267d2c8648d8f6384bacc2ae9c929b2b96578b6860b5087cd1bd6462",
    "globalPrevalence": 180022,
    "globalFirstObserved": "2017-09-19T03:51:27.6785431Z",
    "globalLastObserved": "2020-01-06T03:59:21.3229314Z",
    "size": 22139496,
    "fileType": "APP",
    "isPeFile": true,
    "filePublisher": "CHENGDU YIWO Tech Development Co., Ltd.",
    "fileProductName": "EaseUS MobiSaver for Android",
    "signer": "CHENGDU YIWO Tech Development Co., Ltd.",
    "issuer": "VeriSign Class 3 Code Signing 2010 CA",
    "signerHash": "6c3245d4a9bc0244d99dff27af259cbbae2e2d16",
    "isValidCertificate": false,
    "determinationType": "Pua",
    "determinationValue": "PUA:Win32/FusionCore"
}
```
