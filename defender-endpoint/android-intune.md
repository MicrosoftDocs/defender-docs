---
title: Deploy Microsoft Defender for Endpoint on Android with Microsoft Intune
description: Describes how to deploy Microsoft Defender for Endpoint on Android with Microsoft Intune
ms.service: defender-endpoint
ms.author: deniseb
author: denisebmsft
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection:
- m365-security
- tier3
- mde-android
ms.custom: partner-contribution
ms.topic: conceptual
ms.subservice: android
search.appverid: met150
ms.date: 12/06/2024
---

# Deploy Microsoft Defender for Endpoint on Android with Microsoft Intune

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**
- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Microsoft Defender for Endpoint? [Sign up for a free trial.](https://signup.microsoft.com/create-account/signup?products=7f379fee-c4f9-4278-b0a1-e4c8c2fcdf7e&ru=https://aka.ms/MDEp2OpenTrial?ocid=docs-wdatp-exposedapis-abovefoldlink)

Learn how to deploy Defender for Endpoint on Android on Microsoft Intune Company Portal enrolled devices. For more information about Microsoft Intune device enrollment, see [Enroll your device](/mem/intune/user-help/enroll-device-android-company-portal).

> [!NOTE]
> **Defender for Endpoint on Android is now available on [Google Play](https://play.google.com/store/apps/details?id=com.microsoft.scmx)**
>
> You can connect to Google Play from Microsoft Intune to deploy Defender for Endpoint app across device administrator and Android Enterprise enrollment modes. Updates to the app are automatic via Google Play.

## Deploy on Device Administrator enrolled devices

Learn how to deploy Defender for Endpoint on Android by using the Microsoft Intune Company Portal for device administrator enrolled devices.

### Add as Android store app

1. In the [Microsoft Intune admin center](https://go.microsoft.com/fwlink/?linkid=2109431) , go to **Apps** \> **Android Apps** \> **Add** \> **Android store app**. Then choose **Select**.

   :::image type="content" source="media/mda-addandroidstoreapp.png" alt-text="The Add Android store application pane in the Microsoft Intune admin center portal"  lightbox="media/mda-addandroidstoreapp.png":::

2. On the **Add app** page, in the **App Information** section specify the following details:

   - **Name**
   - **Description**
   - **Publisher** as Microsoft.
   - **App store URL** as `https://play.google.com/store/apps/details?id=com.microsoft.scmx` (URL for the Defender for Endpoint app in the Google Play Store)

   Other fields are optional. Then select **Next**.

   :::image type="content" source="media/mda-addappinfo.png" alt-text=" The Add App page displaying the application's publisher and URL information in the Microsoft Intune admin center portal" lightbox="media/mda-addappinfo.png":::

3. In the **Assignments** section, go to the **Required** section and select **Add group.** You can then choose the user group (or groups) to receive the Defender for Endpoint on Android app. Choose **Select**, and then tap **Next**.

    The selected user group should consist of Intune enrolled users.
    
    :::image type="content" source="media/363bf30f7d69a94db578e8af0ddd044b.png" alt-text="Screenshot that shows the Add group pane in the Add App page in the Microsoft Intune admin center portal." lightbox="media/363bf30f7d69a94db578e8af0ddd044b.png":::

4. In the **Review+Create** section, verify that all the information entered is correct, and then select **Create**.

    In a few moments, the Defender for Endpoint app should be created, and a notification should appear in the upper right corner of the screen.

    :::image type="content" source="media/86cbe56f88bb6e93e9c63303397fc24f.png" alt-text="The application status pane in the Microsoft Intune admin center portal" lightbox="media/86cbe56f88bb6e93e9c63303397fc24f.png":::

5. In the app information page that is displayed, in the **Monitor** section, select **Device install status** to verify that the device installation completed successfully.

    :::image type="content" source="media/513cf5d59eaaef5d2b5bc122715b5844.png" alt-text="The Device install status page in the Microsoft Defender portal" lightbox="media/513cf5d59eaaef5d2b5bc122715b5844.png":::

### Complete onboarding and check status

1. After Defender for Endpoint on Android is installed on the device, you should see the app icon.

   :::image type="content" source="media/7cf9311ad676ec5142002a4d0c2323ca.jpg" alt-text="The Microsoft Defender ATP icon listed in the Search pane" lightbox="media/7cf9311ad676ec5142002a4d0c2323ca.jpg":::

2. Tap the Microsoft Defender for Endpoint app icon, and follow the on-screen instructions to complete onboarding. The details include end-user acceptance of Android permissions required by Defender for Endpoint on Android.

3. Upon successful onboarding, the device shows up in the list of devices in the [Microsoft Defender portal](https://security.microsoft.com).

    :::image type="content" source="media/9fe378a1dce0f143005c3aa53d8c4f51.png" alt-text="A device in the Microsoft Defender for Endpoint portal"  lightbox="media/9fe378a1dce0f143005c3aa53d8c4f51.png":::

## Deploy on Android Enterprise enrolled devices

Defender for Endpoint on Android supports Android Enterprise enrolled devices.

For more information on the enrollment options supported by Microsoft Intune, see [Enrollment Options](/mem/intune/enrollment/android-enroll).

**Currently, personally-owned devices with a work profile, corporate-owned devices with a work profile, and corporate-owned, fully managed user device enrollments are supported in Android Enterprise.**

## Add Microsoft Defender for Endpoint on Android as a Managed Google Play app

Follow the steps below to add Microsoft Defender for Endpoint app into your managed Google Play Store.

1. In [Microsoft Intune admin center](https://go.microsoft.com/fwlink/?linkid=2109431) , go to **Apps** \> **Android Apps** \> **Add** and select **Managed Google Play app**.

   :::image type="content" source="media/579ff59f31f599414cedf63051628b2e.png" alt-text="Screenshot that shows the application-adding pane in the Microsoft Intune admin center portal" lightbox="media/579ff59f31f599414cedf63051628b2e.png":::

2. On your managed Google Play page that loads, go to the search box and type `Microsoft Defender`. Your search should display the Microsoft Defender for Endpoint app in your Managed Google Play Store. Select the Microsoft Defender for Endpoint app from the list of search results.

   :::image type="content" source="media/0f79cb37900b57c3e2bb0effad1c19cb.png" alt-text="The Managed Google Play page in the Microsoft Intune admin center portal" lightbox="media/0f79cb37900b57c3e2bb0effad1c19cb.png":::

3. In the **App description** page, you should be able to see app details about the Defender for Endpoint app. Review the information on the page, and then select **Approve**.

   :::image type="content" source="media/07e6d4119f265037e3b80a20a73b856f.png" alt-text="The page of Managed Google Play in the Microsoft Intune admin center portal" lightbox="media/07e6d4119f265037e3b80a20a73b856f.png":::

4. When you're prompted to approve permissions for Defender for Endpoint obtains, review the information, and then select **Approve**.

   :::image type="content" source="media/206b3d954f06cc58b3466fb7a0bd9f74.png" alt-text="The permissions approval page in the Microsoft Defender portal" lightbox="media/206b3d954f06cc58b3466fb7a0bd9f74.png":::

5. On the **Approval settings** page, review your preference to handle new app permissions that Defender for Endpoint on Android might ask. Review the choices, and then select your preferred option. Then, select **Done**.

   By default, managed Google Play selects **Keep approved when app requests new permissions**.

   :::image type="content" source="media/ffecfdda1c4df14148f1526c22cc0236.png" alt-text=" The approval settings configuration completion page in the in the Microsoft Defender portal" lightbox="media/ffecfdda1c4df14148f1526c22cc0236.png":::

6. After the permissions handling selection is made, select **Sync** to sync Microsoft Defender for Endpoint to your apps list.

   :::image type="content" source="media/34e6b9a0dae125d085c84593140180ed.png" alt-text="The Sync pane in the Microsoft Defender portal" lightbox="media/34e6b9a0dae125d085c84593140180ed.png":::

   The sync completes in a few minutes.

   :::image type="content" source="media/9fc07ffc150171f169dc6e57fe6f1c74.png" alt-text="The application sync status pane in the Android apps page in the Microsoft Defender portal"  lightbox="media/9fc07ffc150171f169dc6e57fe6f1c74.png":::

7. Select the **Refresh** button in the Android apps screen. Microsoft Defender for Endpoint should be visible in the apps list.

   :::image type="content" source="media/fa4ac18a6333335db3775630b8e6b353.png" alt-text="The page displaying the synced application" lightbox="media/fa4ac18a6333335db3775630b8e6b353.png":::

8. Defender for Endpoint supports app configuration policies for managed devices using Microsoft Intune. This capability can be used to select different configurations for Defender for Endpoint.

   1. In the **Apps** page, go to **Policy** > **App configuration policies** > **Add** > **Managed devices**.

      :::image type="content" source="media/android-mem.png" alt-text="The App configuration policies pane in the Microsoft Intune admin center portal" lightbox="media/android-mem.png":::

   2. In the **Create app configuration policy** page, specify the following details:

      - Name: **Microsoft Defender for Endpoint**.
      - Choose **Android Enterprise** as platform.
      - Choose **Personally-owned Work Profile only** or **Fully Managed, Dedicated, and Corporate-owned work profile only** as Profile Type.
      - Select **Select App**, choose **Microsoft Defender**, select **OK** and then **Next**.

        :::image type="content" source="media/android-create-app.png" alt-text=" Screenshot of the Associated app details pane." lightbox="media/android-create-app.png":::

   3. Select **Permissions** \> **Add**. From the list, select the available app permissions \> **OK**.

   4. Select an option for each permission to grant with this policy:

      - **Prompt** - Prompts the user to accept or deny.
      - **Auto grant** - Automatically approves without notifying the user.
      - **Auto deny** - Automatically denies without notifying the user.

    5. Go to the **Configuration settings** section, and choose **Use configuration designer**.

       :::image type="content" alt-text="Image of android create app configuration policy." source="media/configurationformat.png" lightbox="media/configurationformat.png":::

    6. Select **Add** to view a list of supported configurations. Select the required configuration, and then select **Ok**.

       :::image type="content" alt-text="Image of selecting configuration policies for android." source="media/selectconfigurations.png" lightbox="media/selectconfigurations.png":::

    7. You should see all the selected configurations listed. You can change the configuration value as required and then select **Next**.

       :::image type="content" alt-text="Image of selected configuration policies." source="media/listedconfigurations.png" lightbox="media/listedconfigurations.png":::

    8. In the **Assignments** page, select the user group to which this app config policy would be assigned. Select **Select groups to include**, select a group, and then select **Next**. The group selected here is usually the same group to which you would assign Microsoft Defender for Endpoint Android app.

       :::image type="content" source="media/android-select-group.png" alt-text="The Selected groups pane" lightbox="media/android-select-group.png":::

    9. In the **Review + Create** page that comes up next, review all the information, and then select **Create**.

       The app configuration policy for Defender for Endpoint is now assigned to the selected user group.

9. Select **Microsoft Defender** app in the list \> **Properties** \> **Assignments** \> **Edit**.

    :::image type="content" source="media/mda-properties.png" alt-text="The Edit option on the Properties page" lightbox="media/mda-properties.png":::

10. Assign the app as a required app to a user group. It's automatically installed in the work profile during the next sync of the device via Company Portal app. Navigate to the **Required** section, select **Add group**, select the appropriate user group, and then choose **Select**.

    :::image type="content" source="media/ea06643280075f16265a596fb9a96042.png" alt-text="The Edit application page" lightbox="media/ea06643280075f16265a596fb9a96042.png":::

11. In the **Edit Application** page, review all the information that was specified earlier. Select **Review + Save**, and then select **Save** to commence assignment.

### Auto setup of always-on VPN

Defender for Endpoint supports device configuration policies for managed devices with Microsoft Intune. This capability enables you to use auto setup of always-on VPN on Android Enterprise enrolled devices, so the end user doesn't need to set up a VPN service while onboarding.

1. On **Devices**, select **Configuration Profiles** \> **Create Profile** \> **Platform** \> **Android Enterprise**. Select **Device restrictions** under one of the following, based on your device enrollment type:

   - **Fully Managed, Dedicated, and Corporate-Owned Work Profile**
   - **Personally owned Work Profile**

   Then, select **Create**.

   :::image type="content" source="media/1autosetupofvpn.png" alt-text="The Configuration profiles menu item in the Policy pane" lightbox="media/1autosetupofvpn.png":::

2. **Configuration Settings**. Provide a **Name** and a **Description** to uniquely identify the configuration profile.

   :::image type="content" source="media/2autosetupofvpn.png" alt-text="The devices configuration profile Name and Description fields in the Basics pane" lightbox="media/2autosetupofvpn.png":::

3. Select **Connectivity**, and then configure your VPN.

   1. Enable **Always-on VPN**. Set up a VPN client in the work profile to automatically connect and reconnect to the VPN whenever possible. Only one VPN client can be configured for always-on VPN on a given device, so be sure to have no more than one always-on VPN policy deployed to a single device.

   2. In the **VPN client** list, select **Custom**. In this case, the custom VPN is the Defender for Endpoint VPN, which provides Web Protection.

      > [!NOTE]
      > The Microsoft Defender for Endpoint app must be installed on user's device for automatic VPN setup to occur.

   3. Specify the **Package ID** of the Microsoft Defender for Endpoint app in Google Play store. For the [Microsoft Defender app URL](https://play.google.com/store/apps/details?id=com.microsoft.scmx), the package ID is `com.microsoft.scmx`.

   4. Set **Lockdown mode** to **Not configured (Default)**.

      :::image type="content" source="media/3autosetupofvpn.png" alt-text="The Connectivity pane under the Configuration settings tab" lightbox="media/3autosetupofvpn.png":::

4. **Assignment**. On the **Assignments** page, select the user group to which this app config policy would be assigned. Choose **Select groups** to include, select the applicable group, and then select **Next**. 

   The group to select is typically the same group to which you would assign Microsoft Defender for Endpoint Android app.

   :::image type="content" source="media/4autosetupofvpn.png" alt-text="Screenshot of the devices configuration profile Assignment pane in the Device restrictions." lightbox="media/4autosetupofvpn.png":::

5. In the **Review + Create** page that comes up next, review all the information and then select **Create**.
The device configuration profile is now assigned to the selected user group.

   :::image type="content" source="media/5autosetupofvpn.png" alt-text="A devices configuration profile 's provision for Review + create" lightbox="media/5autosetupofvpn.png":::

## Check status and complete onboarding

1. Confirm the installation status of Microsoft Defender for Endpoint on Android by tapping **Device Install Status**. Verify that the device is displayed here.

   :::image type="content" source="media/900c0197aa59f9b7abd762ab2b32e80c.png" alt-text="The device installation status pane" lightbox="media/900c0197aa59f9b7abd762ab2b32e80c.png":::

2. On the device, you can validate the onboarding status by going to the work profile. Confirm that Defender for Endpoint is available, and that you're enrolled using the **Personally owned devices with work profile**. If you're enrolled using a **Corporate-owned, fully managed user device**, you have a single profile on the device where you can confirm that Defender for Endpoint is available.

   :::image type="content" source="media/c2e647fc8fa31c4f2349c76f2497bc0e.png" alt-text="The application display pane" lightbox="media/c2e647fc8fa31c4f2349c76f2497bc0e.png":::

3. When the app is installed, open the app, and then accept the permissions. Onboarding should successfully complete.

   :::image type="content" source="media/MDE-new.png" alt-text="Th display of a Microsoft Defender for Endpoint application on a mobile device" lightbox="media/MDE-new.png":::

4. Verify onboarding status in the [Microsoft Defender portal](https://security.microsoft.com). Navigate to **Device inventory** page.

   :::image type="content" source="media/9fe378a1dce0f143005c3aa53d8c4f51.png" alt-text="The Microsoft Defender for Endpoint portal" lightbox="media/9fe378a1dce0f143005c3aa53d8c4f51.png":::

## Configure low-touch onboarding

> [!NOTE]
> Android low touch onboarding is now GA.

Administrators can configure Microsoft Defender for Endpoint in low-touch onboarding mode. In this scenario, administrators creates a deployment profile, and the user is required to provide a reduced set of permissions to complete onboarding. Android low-touch onboarding is disabled by default. Administrators can enable it through app configuration policies on Intune by following these steps:

1. Push the Microsoft Defender app to target user groups by following the steps in the section, [Add Microsoft Defender for Endpoint on Android as a Managed Google Play app](#add-microsoft-defender-for-endpoint-on-android-as-a-managed-google-play-app) (in this article).

2. Push a VPN profile to the user's device by following the instructions in the section, [Auto Setup of Always-on VPN](#auto-setup-of-always-on-vpn) (in this article).

3. In **Apps** > **Application configuration policies**, select **Managed Devices**.

4. Provide a name to uniquely identify the policy. 

   - For **Platform**, select `Android Enterprise`.
   - Select the required profile type.
   - For the targeted app, select `Microsoft Defender: Antivirus`.
   
   Then select **Next**.

5. Add runtime permissions. Select **Location access (fine)**, **POST_NOTIFICATIONS** and change the **Permission state** to `Auto grant`. (This permission isn't supported for Android 13 and later.)

6. Under **Configuration settings**, select `Use Configuration designer`, and then select **Add**.

7. Select **Low touch onboarding and User UPN**. For User UPN, change the value type to `Variable`, and set the configuration value to `User Principal Name`. Enable low-touch onboarding by changing its configuration value to `1`.

   After the policy is created, these value types show up as string values.
 
8. Assign the policy to the target user group.

9. Review and create the policy.

## Set up Microsoft Defender in personal profile on Android Enterprise in BYOD mode

### Set up Microsoft Defender in personal profile

Administrators can use the [Microsoft Intune admin center](https://intune.microsoft.com) to set up and configure Microsoft Defender support in personal profiles by following these steps:

1. Go to **Apps** > **App configuration policies**, and then select **Add**. Select **Managed Devices**.

   - Specify a name and description to uniquely identify the configuration policy. 
   - For **Platform**, select platform as **Android Enterprise**
   - For **Profile type**, select **Personally-owned work profile only**
   - For **Targeted app**, select **Microsoft Defender**.

2. On the settings page, in **Configuration settings format**, select **Use configuration designer**, and then select **Add**. From the list of configurations that are displayed, select **Microsoft Defender in Personal profile**.

3. The selected configuration is listed. Change the configuration value to `1` to enable Microsoft Defender support personal profiles. A notification appears to inform the administrator. Select **Next**.

4. Assign the configuration policy to a group of users. Review and create the policy.

Administrators also can set up privacy controls in the Microsoft Intune admin center to control what data is sent by the Microsoft Defender app to the Microsoft Defender portal. For more information, see [configure privacy controls](android-configure.md).

Organizations can communicate to their users to protect their personal profile by using the Microsoft Defender app on their enrolled BYOD devices. The Microsoft Defender app must be installed and active, using their work profile for Microsoft Defender to be enabled in personal profiles.

### Finish onboarding a device

1. Install the Microsoft Defender application in a personal profile with a personal Google Play store account.

2. Install the Company portal application on personal profile. No sign-in is required.

3. When a user launches the application, they see the sign-in screen. **Login using corporate account only**.

4. After signing in successfully, users see the following screens:

   - **EULA screen**: Presented only if the user hasn't consented already in their work profile.
   - **Notice screen**: Users must provide consent on this screen to move forward with onboarding the application. This is required only during the first run of the app.

5. Provide the required permissions to complete onboarding.

   > [!NOTE]
   > **Pre-requisites**:
   > 1. The Company portal needs to be enabled on personal profile.
   > 2. Microsoft Defender needs to be already installed and active in work profile.

## Related articles

- [Overview of Microsoft Defender for Endpoint on Android](microsoft-defender-endpoint-android.md)
- [Configure Microsoft Defender for Endpoint on Android features](android-configure.md)

[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
