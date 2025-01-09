---
title: Troubleshooting SIEM integration 
description: This article provides a list of possible issues when connecting your SIEM to Defender for Cloud Apps and provides resolutions for each.
ms.date: 01/29/2023
ms.topic: conceptual
---

# Troubleshooting SIEM integration



This article provides a list of possible issues when connecting your SIEM to Defender for Cloud Apps and provides possible resolutions.

## Recover missing activity events in Defender for Cloud Apps SIEM Agent

Before you proceed, check that your [Defender for Cloud Apps license](https://aka.ms/M365EnterprisePlans) supports the SIEM integration you're trying to configure.

If you received a system alert regarding an issue with activity delivery through the SIEM agent, follow the steps below to recover the activity events in the timeframe of the issue. These steps will guide you through setting up a new Recovery SIEM agent that will run in parallel and resend the activity events to your SIEM.

> [!NOTE]
> The recovery process will resend all activity events in the timeframe described in the system alert. If your SIEM already contains activity events from this timeframe, you will experience duplicated events after this recovery.

### Step 1 – Configure a new SIEM Agent in parallel to your existing agent

1. In the Microsoft Defender Portal, select **Settings**. Then choose **Cloud Apps**.
1. Under **System**, select **SIEM Agent**. Then select [add a new SIEM agent](siem.md), and use the wizard to configure the connection details to your SIEM. For example, you can create a new SIEM agent with the following configuration:
    - **Protocol**: TCP
    - **Remote host**: Any device where you can listen to a port. For example, a simple solution would be to use the same device as the agent and set the remote host IP address to 127.0.0.1
    - **Port**: Any port you can listen to on the remote host device

    > [!NOTE]
    > This agent should run in parallel to the existing one, so network configuration might not be identical.

1. In the wizard, configure the Data Types to include **only Activities** and apply the same activity filter that was used in your original SIEM agent (if it exists).
1. Save the settings.
1. Run the new agent using the generated token.

### Step 2 – Validate the successful data delivery to your SIEM

Use the following steps to validate your configuration:

1. Connect to your SIEM and check that new data is received from the new SIEM agent that you configured.

> [!NOTE]
> The agent will only send activities in the timeframe of the issue on which you were alerted.

1. If data is not received by your SIEM, then on the new SIEM agent device, try listening to the port that you configured to forward activities to see if data is being sent from the agent to the SIEM. For example, run `netcat -l <port>` where `<port>` is the previously configured port number.

> [!NOTE]
> If you are using `ncat`, make sure you specify the ipv4 flag `-4`.

1. If data is being sent by the agent but not received by your SIEM, check the SIEM agent log. If you can see "connection refused" messages, make sure that your SIEM agent is configured to use TLS 1.2 or newer.

### Step 3 – Remove the Recovery SIEM agent

1. The recovery SIEM agent will automatically stop sending data and be disabled once it reaches the end date.
1. Validate in your SIEM that no new data is sent by the recovery SIEM agent.
1. Stop the execution of the agent on your device.
1. In the portal, go to the SIEM Agent page and remove the recovery SIEM agent.
1. Make sure your original SIEM Agent is still running properly.

## General troubleshooting

Make sure the status of the SIEM agent in the Microsoft Defender for Cloud Apps portal isn't **Connection error** or **Disconnected** and there are no agent notifications. The status shows as **Connection error** if the connection is down for more than two hours. The status changes to **Disconnected** if the connection is down for over 12 hours.

If you see one of the following errors in the cmd prompt while running the agent, use the following steps to remediate the problem:

|Error|Description|Resolution|
|----|----|----|
|General error during bootstrap|Unexpected error during agent bootstrap.|Contact support.|
|Too many critical errors|Too many critical errors occurred while connecting the console. Shutting down.|Contact support.|
|Invalid token|The token provided isn't valid.|Make sure you copied the right token. You can use the process above to regenerate the token.|
|Invalid proxy address|The proxy address provided isn't valid.|Make sure you entered the right proxy and port.|

After creating the agent, check the SIEM agent page in the Defender for Cloud Apps portal. If you see one of the following **Agent notifications**, use the following steps to remediate the problem:

|Error|Description|Resolution|
|----|----|----|
|**Internal error**|Something unknown went wrong with your SIEM agent.|Contact support.|
|**Data server send error**|You can get this error if you're working with a Syslog server over TCP. The SIEM agent can't connect to your Syslog server.  If you get this error, the agent will stop pulling new activities until it's fixed. Make sure to follow the remediation steps until the error stops appearing.|1. Make sure you properly defined your Syslog server: In the Defender for Cloud Apps UI, edit your SIEM agent as described above. Make sure you wrote the name of the server properly and set the right port. </br>2. Check connectivity to your Syslog server: Make sure your firewall isn't blocking communication.|
|**Data server connection error**| You can get this error if you're working with a Syslog server over TCP. The SIEM agent can't connect to your Syslog server.  If you get this error, the agent will stop pulling new activities until it's fixed. Make sure to follow the remediation steps until the error stops appearing.|1. Make sure you properly defined your Syslog server: In the Defender for Cloud Apps UI, edit your SIEM agent as described above. Make sure you wrote the name of the server properly and set the right port. </br>2. Check connectivity to your Syslog server: Make sure your firewall isn't blocking communication.|
|**SIEM agent error**|The SIEM agent has been disconnected for more than X hours|Make sure that you didn't change the SIEM configuration in the Defender for Cloud Apps portal. Otherwise, this error could indicate connectivity issues between Defender for Cloud Apps and the computer on which you're running the SIEM agent.|
|**SIEM agent notification error**|SIEM agent notification forward errors were received from a SIEM agent.|This error indicates that you've received errors about the connection between the SIEM agent and your SIEM server. Make sure there isn't a firewall blocking your SIEM server or the computer on which you're running the SIEM agent. Also, check that the IP address of the SIEM server wasn't changed. If you've installed Java Runtime Engine (JRE) update 291 or higher, follow the instructions in [Issue with new versions of Java](#issue-with-new-versions-of-java).|

## Issue with new versions of Java

Newer versions of Java can cause problems with the SIEM agent. If you've installed Java Runtime Engine (JRE) update 291 or higher, follow these steps:

1. In an elevated PowerShell prompt, switch to the Java install bin folder.

    ```powershell
    cd "C:\Program Files (x86)\Java\jre1.8.0_291\bin"
    ```

1. Download each of the following Azure TLS Issuing CA certificates.
    
    ```powershell
        Invoke-WebRequest -Uri "https://www.microsoft.com/pkiops/certs/Microsoft%20Azure%20TLS%20Issuing%20CA%2001%20-%20xsign.crt" -OutFile "$env:temp\azuretls01.crt"
        Invoke-WebRequest -Uri "https://www.microsoft.com/pkiops/certs/Microsoft%20Azure%20TLS%20Issuing%20CA%2002%20-%20xsign.crt" -OutFile "$env:temp\azuretls02.crt"
        Invoke-WebRequest -Uri "https://www.microsoft.com/pkiops/certs/Microsoft%20Azure%20TLS%20Issuing%20CA%2005%20-%20xsign.crt" -OutFile "$env:temp\azuretls05.crt"
        Invoke-WebRequest -Uri "https://www.microsoft.com/pkiops/certs/Microsoft%20Azure%20TLS%20Issuing%20CA%2006%20-%20xsign.crt" -OutFile "$env:temp\azuretls06.crt"
        Invoke-WebRequest -Uri "https://www.microsoft.com/pkiops/certs/Microsoft%20Azure%20RSA%20TLS%20Issuing%20CA%2003%20-%20xsign.crt" -OutFile "$env:temp\azuretls03.crt"
        Invoke-WebRequest -Uri "https://www.microsoft.com/pkiops/certs/Microsoft%20Azure%20RSA%20TLS%20Issuing%20CA%2004%20-%20xsign.crt" -OutFile "$env:temp\azuretls04.crt"
        Invoke-WebRequest -Uri "https://www.microsoft.com/pkiops/certs/Microsoft%20Azure%20RSA%20TLS%20Issuing%20CA%2007%20-%20xsign.crt" -OutFile "$env:temp\azuretls07.crt"
        Invoke-WebRequest -Uri "https://www.microsoft.com/pkiops/certs/Microsoft%20Azure%20RSA%20TLS%20Issuing%20CA%2008%20-%20xsign.crt" -OutFile "$env:temp\azuretls08.crt"
    ```


    ```bash
        cd /tmp
        wget https://www.microsoft.com/pkiops/certs/Microsoft%20Azure%20TLS%20Issuing%20CA%2001%20-%20xsign.crt -O azuretls01.crt
        wget https://www.microsoft.com/pkiops/certs/Microsoft%20Azure%20TLS%20Issuing%20CA%2002%20-%20xsign.crt -O azuretls02.crt
        wget https://www.microsoft.com/pkiops/certs/Microsoft%20Azure%20TLS%20Issuing%20CA%2005%20-%20xsign.crt -O azuretls05.crt
        wget https://www.microsoft.com/pkiops/certs/Microsoft%20Azure%20TLS%20Issuing%20CA%2006%20-%20xsign.crt -O azuretls06.crt
        wget https://www.microsoft.com/pkiops/certs/Microsoft%20Azure%20RSA%20TLS%20Issuing%20CA%2003%20-%20xsign.crt -O azuretls03.crt
        wget https://www.microsoft.com/pkiops/certs/Microsoft%20Azure%20RSA%20TLS%20Issuing%20CA%2004%20-%20xsign.crt -O azuretls04.crt
        wget https://www.microsoft.com/pkiops/certs/Microsoft%20Azure%20RSA%20TLS%20Issuing%20CA%2007%20-%20xsign.crt -O azuretls07.crt
        wget https://www.microsoft.com/pkiops/certs/Microsoft%20Azure%20RSA%20TLS%20Issuing%20CA%2008%20-%20xsign.crt -O azuretls08.crt
    ```

1. Import each CA certificate CRT file to the Java keystore, using the default keystore password *changeit*.

    
    ```powershell
        keytool -importcert -file "$env:temp\azuretls01.crt" -keystore ..\lib\security\cacerts -alias azuretls01crt -storepass changeit
        keytool -importcert -file "$env:temp\azuretls02.crt" -keystore ..\lib\security\cacerts -alias azuretls02crt -storepass changeit
        keytool -importcert -file "$env:temp\azuretls05.crt" -keystore ..\lib\security\cacerts -alias azuretls05crt -storepass changeit
        keytool -importcert -file "$env:temp\azuretls06.crt" -keystore ..\lib\security\cacerts -alias azuretls06crt -storepass changeit
        keytool -importcert -file "$env:temp\azuretls03.crt" -keystore ..\lib\security\cacerts -alias azuretls03crt -storepass changeit
        keytool -importcert -file "$env:temp\azuretls04.crt" -keystore ..\lib\security\cacerts -alias azuretls04crt -storepass changeit
        keytool -importcert -file "$env:temp\azuretls07.crt" -keystore ..\lib\security\cacerts -alias azuretls07crt -storepass changeit
        keytool -importcert -file "$env:temp\azuretls08.crt" -keystore ..\lib\security\cacerts -alias azuretls08crt -storepass changeit
    ```


    ```bash
        keytool -importcert -file "\tmp\azuretls01.crt" -keystore ..\lib\security\cacerts -alias azuretls01crt -storepass changeit
        keytool -importcert -file "\tmp\azuretls02.crt" -keystore ..\lib\security\cacerts -alias azuretls02crt -storepass changeit
        keytool -importcert -file "\tmp\azuretls05.crt" -keystore ..\lib\security\cacerts -alias azuretls05crt -storepass changeit
        keytool -importcert -file "\tmp\azuretls06.crt" -keystore ..\lib\security\cacerts -alias azuretls06crt -storepass changeit
        keytool -importcert -file "\tmp\azuretls03.crt" -keystore ..\lib\security\cacerts -alias azuretls03crt -storepass changeit
        keytool -importcert -file "\tmp\azuretls04.crt" -keystore ..\lib\security\cacerts -alias azuretls04crt -storepass changeit
        keytool -importcert -file "\tmp\azuretls07.crt" -keystore ..\lib\security\cacerts -alias azuretls07crt -storepass changeit
        keytool -importcert -file "\tmp\azuretls08.crt" -keystore ..\lib\security\cacerts -alias azuretls08crt -storepass changeit
    ```

1. To verify, view the Java keystore for Azure TLS issuing CA certificate aliases listed above.

    ```
        keytool -list -keystore ..\lib\security\cacerts
    ```

1. Start the SIEM agent and review the new trace log file to confirm a successful connection.

## Next steps

> [!div class="nextstepaction"]
> [Best practices for protecting your organization](best-practices.md)

[!INCLUDE [Open support ticket](includes/support.md)]

