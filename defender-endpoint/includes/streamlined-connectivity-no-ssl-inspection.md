---
author: paulinbar
ms.author: painbar
ms.date: 07/02/2026
ms.topic: include
ms.service: defender-endpoint
---

For streamlined connectivity, exclude traffic to `*.endpoint.security.microsoft.com` from SSL/TLS inspection, HTTPS interception, and man-in-the-middle (MITM) proxying. If you enable SSL inspection, Defender for Endpoint sensors might fail to communicate with backend services, resulting in onboarding or connectivity failures.
