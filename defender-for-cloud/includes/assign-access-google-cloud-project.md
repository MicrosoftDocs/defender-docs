---
ms.service: defender-for-cloud
ms.topic: include
ms.date: 02/18/2024
ai-usage: ai-assisted
---

```bash
resources 
| where type == "microsoft.security/securityconnectors" 
| extend source = tostring(properties.environmentName)  
| where source == "GCP" 
| project name, subscriptionId, resourceGroup, projectId = properties.hierarchyIdentifier, cloud = properties.environmentName  
```
