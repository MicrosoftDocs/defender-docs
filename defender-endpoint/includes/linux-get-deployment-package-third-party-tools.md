---
author: paulinbar
ms.author: painbar
ms.date: 03/30/2026
ms.topic: include
ms.service: defender-endpoint
---

1. Sign in to the [Microsoft Defender portal](https://security.microsoft.com/) then navigate to **System** > **Settings** > **Endpoints** > **Device management** > **Onboarding**.

1. In the first drop-down menu, select **Linux Server** as the operating system. In the second drop-down menu, select **Your preferred Linux configuration management tool** as the deployment method.

1. Select **Download onboarding package** and save the file as `WindowsDefenderATPOnboardingPackage.zip`.
   
1. Extract the contents of the archive using the following command:

   ```
   unzip WindowsDefenderATPOnboardingPackage.zip
   ```
   
   The expected output is:
   
   ```
   Archive:  WindowsDefenderATPOnboardingPackage.zip
   inflating: mdatp_onboard.json
   ```