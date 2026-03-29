---
title: Defender Sensor for Defender for Containers Changelog
description: Learn about the version history and updates for the Defender sensor in Microsoft Defender for Containers.
ms.service: defender-for-cloud
ms.topic: reference
ms.date: 03/17/2026
ai-usage: ai-assisted
---

# Sensor for Defender for Containers release notes

The Sensor for Microsoft Defender for Containers release notes provides a detailed version history of sensor updates. Each version includes new features, improvements, and fixes to enhance functionality. Use this changelog to stay informed about the latest updates and plan your deployments accordingly.

For more information about deploying the sensor in Defender for Containers, see [Configure Microsoft Defender for Containers components](defender-for-containers-enable.md).

To see the version of the sensor run:

`kubectl get -n kube-system daemonsets/microsoft-defender-collector-ds -o jsonpath='{.metadata.labels.app\.kubernetes\.io/version}'`


## Defender for Containers – Sensor Support Policy

The support policy here applies to all Helm-based and multicloud installations. For scenarios where the sensor is deployed as part of AKS, please refer to: [Supported Kubernetes versions in Azure Kubernetes Service (AKS) - Azure Kubernetes Service | Microsoft Learn](/azure/aks/supported-kubernetes-versions?tabs=azure-cli)

|Version|Preview Date|GA Date|End of support|
| -------- | -------- | -------- | -------- |
|0.8| |Feb 2025|Feb 2027|
|0.9|July 2025|Apr 2026|Apr 2027|
|0.10|Feb 2026|Apr 2026|Apr 2027|
|0.11|Apr 2026|Jul  2026|Jul 2027|

Each stable (GA) version is supported for 12 months from its GA release date. After the 12-month window ends, the version is no longer supported. Customers should upgrade to the latest stable or Public release to maintain support and access new capabilities.

## Sensor versions available per release

### Sensor v0.10 (deployed by Helm or Arc for K8s in Preview mode)

**Sensor v0.10.3 — Preview**

- **Released:** March 2026
 
- **What's included:**
    - Added privileged security context for collectors on Nexus Baremetal
    - Security fix: sanitized secrets from storage client retry logs
    - Moved SELinux options to pod-level for improved collector compatibility
    - Updated antimalware collector
    - Security vulnerability fixes

**Sensor v0.10.2 – Preview**

- **Released:** February 2026

- **What's included:**

  - Defender for containers runtime anti-malware. Learn more about [anti-malware detection and blocking](anti-malware.md).
    
  - Binary drift blocking 
    
### Sensor v0.9 (deployed by Helm or Arc for K8s in Preview mode)

**Sensor v0.9.52— Preview**

- **Released:** March 2026
 
- **What's included:**
    - Added privileged security context for collectors on Nexus Baremetal
    - Security fix: sanitized secrets from storage client retry logs
    - Moved SELinux options to pod-level for improved collector compatibility
    - Security vulnerability fixes

**Sensor v0.9.51 – Preview**

- **Released:** March 2026

- **What's included:**

  - Improvements
    
    - Security and platform updates
        
      - Upgraded Go and related dependencies and libraries to address security vulnerabilities and improve runtime stability.
            
      - Fluent Bit updated to a newer version to improve log processing and security.
            
      - FIPS support enabled for the publisher and file-cleaner components for customers requiring FIPS-compliant operation.
            
    - Reduced load and resource usage
        
      - Reduced aggregation size and narrowed aggregated data types to lower memory and CPU usage.
            
      - Chart and publisher updates to reduce query load on the authentication service, improving overall reliability.
            
  - Fixes
    
    - Authentication stability and concurrency
        
      - Token provider now caches negative (false) responses from the auth service to avoid repeated failing calls.
            
      - Improved thread-safety in the token provider by adding read-locking around token map checks to prevent race conditions.
            
    - Miscellaneous fixes
        
      - Various configuration and path fixes to ensure reliable log collection and prevent duplicate data. 
            


**Sensor v0.9.50 – Preview**

- **Released:** February 2026

- **What's included:**

  - Performance Improvements 
    
**Sensor v0.9.49 – Preview**

- **Released:** December 2025
- **What's included:**

  - Bug fixes
    
  - Gating support for auto AKS
    
**Sensor v0.9.46 – Preview**

- **Released:** December 2025
- **What's included:**
    - Bug fixes and security enhancements
    - Convert log analytics keys in Defender helm chart to optional
    
**Sensor v0.9.44 – Preview**   
- **Released:** November 2025  
- **What's included:**
  - Bug fixes and security enhancements   
  - Added support for new Defender endpoints (requires outbound access to `*.cloud-defender.microsoft.com`).  
    Learn more in the [Defender for Containers setup guide](defender-for-containers-enable.md).

**Sensor v0.9.17 – Preview**  
- **Released:** June 2025  
- **What's included:**
  - **Helm-based deployment support**  
  Introduces a new method for deploying and managing the sensor using Helm.  
  See: [Install Defender for Containers sensor using Helm](deploy-helm.md).  
  - **DNS threat detections**  
  Adds DNS-based detection capabilities using threat intelligence feeds.  
  - Improved memory efficiency and reduced CPU consumption  
  - Bug fixes and security enhancements  
    
### Sensor v0.8 (relevant to all AKS supported versions and Arc for K8s)

**Sensor v0.8.49 — GA**

- **Released:** March 2026
 
- **What's included:**
    - Added privileged security context for collectors on Nexus Baremetal
    - Security fix: sanitized secrets from storage client retry logs
    - Security vulnerability fixes

**Sensor v0.8.48 – GA**

- **Released:** March 2026

- **What's included:**

  - Security
    
    - Dependency and image updates: Multiple components have updated binaries and container images to address known vulnerabilities.
        
    - Go runtime and component upgrades: The Go runtime and an internal IG component were upgraded to remediate security issues.
        
    - FIPS and image hardening for publisher components: Publisher and file-cleaner components now support FIPS configurations and use smaller, hardened base images; Fluent Bit was upgraded as part of this hardening.

**Sensor v0.8.47 – GA**

- **Released:** February 2026

- **What's included:**

  - Performance Improvements 
    
**Sensor v0.8.42 – GA**

- **Released:** December 2025
- **What's included:**

  - Security enhancements 

  - Gating support for auto AKS

**Sensor v0.8.40 – GA**

- **Released:** December 2025
- **What's included:**
   - Bug fixes and security enhancements
   - Improve latency for webhook calls in the API gating validation.

**Sensor v0.8.39 – GA**  
- **Released:** November 2025  
- **What's included:**
  - Bug fixes and security enhancements  
  - Gated deployment: Now globally available  
  - Added support for new Defender endpoints (requires outbound access to `*.cloud-defender.microsoft.com`).  
    Learn more about network requirements in the [Defender for Containers setup guide](defender-for-containers-enable.md).

**Sensor v0.8.30 – GA**  
- **Released:** August 2025  
- **What's included:**
  - Better memory efficiency and reduced CPU consumption  
  - Bug fixes and security enhancements  
    




