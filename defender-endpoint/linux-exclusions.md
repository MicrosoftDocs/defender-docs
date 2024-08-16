---
title: Configure and validate exclusions for Microsoft Defender for Endpoint on Linux
description: Provide and validate exclusions for Microsoft Defender for Endpoint on Linux. Exclusions can be set for files, folders, and processes.
ms.service: defender-endpoint
ms.author: dansimp
author: dansimp
ms.reviewer: gopkr, ardeshmukh
ms.localizationpriority: medium
manager: deniseb
audience: ITPro
ms.collection: 
- m365-security
- tier3
- mde-linux
ms.topic: conceptual
ms.subservice: linux
search.appverid: met150
ms.date: 07/31/2024
---

# Configure and validate exclusions for Microsoft Defender for Endpoint on Linux

[!INCLUDE [Microsoft Defender XDR rebranding](../includes/microsoft-defender.md)]

**Applies to:**

- [Microsoft Defender for Endpoint Plan 1](microsoft-defender-endpoint.md)
- [Microsoft Defender for Endpoint Plan 2](microsoft-defender-endpoint.md)
- [Microsoft Defender XDR](/defender-xdr)

> Want to experience Defender for Endpoint? [Sign up for a free trial.](https://signup.microsoft.com/create-account/signup?products=7f379fee-c4f9-4278-b0a1-e4c8c2fcdf7e&ru=https://aka.ms/MDEp2OpenTrial?ocid=docs-wdatp-investigateip-abovefoldlink)

This article provides information on how to define antivirus and global exclusions for Microsoft Defender for Endpoint. Antivirus exclusions apply to on-demand scans, real-time protection (RTP), and behavior monitoring (BM). Global exclusions apply to real-time protection (RTP), behavior monitoring (BM), and endpoint detection and response (EDR), thus stopping all the associated antivirus detections, EDR alerts, and visibility for the excluded item.

> [!IMPORTANT]
> The antivirus exclusions described in this article apply to only antivirus capabilities and not endpoint detection and response (EDR). Files that you exclude using the antivirus exclusions described in this article can still trigger EDR alerts and other detections. Whereas the global exclusions described in this section apply to antivirus as well as endpoint detection and response capabilities thus stopping all associated AV protection, EDR alerts and detection. Global exclusions are available from Defender for Endpoint version `101.23092.0012` or later till Insider Slow Ring.  For EDR exclusions, [contact support](/microsoft-365/admin/get-help-support).

You can exclude certain files, folders, processes, and process-opened files from Defender for Endpoint on Linux.

Exclusions can be useful to avoid incorrect detections on files or software that are unique or customized to your organization. Global exclusions are useful for mitigating performance issues caused by Defender for Endpoint on Linux.

> [!WARNING]
> Defining exclusions lowers the protection offered by Defender for Endpoint on Linux. You should always evaluate the risks that are associated with implementing exclusions, and you should only exclude files that you are confident are not malicious.

## Supported exclusion scopes

As described in an earlier section, we support two exclusion scopes: antivirus (`epp`) and global (`global`) exclusions.

Antivirus exclusions can be used to exclude trusted files and processes from real-time protection while still having EDR visibility. Global exclusions are applied at sensor level and to mute the events that match exclusion conditions very early in the flow, before any processing is done, thus stopping all EDR alerts and antivirus detections.

> [!NOTE]
> Global (`global`) is a new exclusion scope that we are introducing in addition to antivirus (`epp`) exclusion scopes that are already supported by Microsoft.

| Exclusion Category | Exclusion Scope | Description |
| --- | --- | --- |
| Antivirus Exclusion  | Antivirus engine <br/>*(scope: epp)*  | Excludes content from antivirus (AV) scans and on-demand scans.| 
| Global Exclusion  | Antivirus and endpoint detections and response engine <br/>*(scope: global)*  | Excludes events from real time protection and EDR visibility. Doesn't apply to on-demand scans by default. |

## Supported exclusion types

The following table shows the exclusion types supported by Defender for Endpoint on Linux.

Exclusion|Definition|Examples
---|---|---
File extension|All files with the extension, anywhere on the device (not available for global exclusions) |`.test`
File|A specific file identified by the full path|`/var/log/test.log`<br/>`/var/log/*.log`<br/>`/var/log/install.?.log`
Folder|All files under the specified folder (recursively)|`/var/log/`<br/>`/var/*/`
Process|A specific process (specified either by the full path or file name) and all files opened by it|`/bin/cat`<br/>`cat`<br/>`c?t`

> [!IMPORTANT]
> The paths used must be hard links, not symbolic links, in order to be successfully excluded. You can check if a path is a symbolic link by running `file <path-name>`.

File, folder, and process exclusions support the following wildcards:

> [!NOTE]
> File path needs to be present before adding or removing file exclusions with scope as global.
> Wildcards are not supported while configuring global exclusions.

Wildcard|Description|Examples|
---|---|---
\*|Matches any number of any characters including none <br/> *(note if this wildcard isn't used at the end of the path then it substitutes only one folder)* | `/var/*/tmp` includes any file in `/var/abc/tmp` and its subdirectories, and `/var/def/tmp` and its subdirectories. It doesn't include `/var/abc/log` or `/var/def/log` <p> <p> `/var/*/` only includes any files in its subdirectories such as `/var/abc/`, but not files directly inside `/var`. 
?|Matches any single character|`file?.log` includes `file1.log` and `file2.log`, but not`file123.log`

> [!NOTE]
For antivirus exclusions, when using the * wildcard at the end of the path, it will match all files and subdirectories under the parent of the wildcard.

## How to configure the list of exclusions

### Using the management console

To configure exclusions from Puppet, Ansible, or another management console, please refer to the following sample `mdatp_managed.json`.
```JSON
{
   "exclusionSettings":{
     "exclusions":[
        {
           "$type":"excludedPath",
           "isDirectory":true,
           "path":"/home/*/git<EXAMPLE DO NOT USE>",
           "scopes": [
              "epp"
           ]
        },
        {
           "$type":"excludedPath",
           "isDirectory":true,
           "path":"/run<EXAMPLE DO NOT USE>",
           "scopes": [
              "global"
           ]
        },
        {
           "$type":"excludedPath",
           "isDirectory":false,
           "path":"/var/log/system.log<EXAMPLE DO NOT USE><EXCLUDED IN ALL SCENARIOS>",
           "scopes": [
              "epp", "global"
           ]
        },
        {
           "$type":"excludedFileExtension",
           "extension":".pdf<EXAMPLE DO NOT USE>",
           "scopes": [
              "epp"
           ]
        },
        {
           "$type":"excludedFileName",
           "name":"/bin/cat<EXAMPLE DO NOT USE><NO SCOPE PROVIDED - GLOBAL CONSIDERED>"
        }
     ],
     "mergePolicy":"admin_only"
   }
}
```

For more information, see [Set preferences for Defender for Endpoint on Linux](linux-preferences.md).

### Using the command line

Run the following command to see the available switches for managing exclusions:

> [!NOTE]
> `--scope` is an optional flag with accepted value as `epp` or `global`. It provides the same scope used while adding the exclusion to remove the same exclusion. In the command line approach, if the scope isn’t mentioned, the scope value is set as `epp`.
> Exclusions added through CLI before the introduction of `--scope` flag remain unaffected and their scope is considered `epp`.

```bash
mdatp exclusion
```

> [!TIP]
> When configuring exclusions with wildcards, enclose the parameter in double-quotes to prevent globbing.

Examples:

- Add an exclusion for a file extension *(Extension exclusion isn't supported for global exclusion scope)* : 

    ```bash
    mdatp exclusion extension add --name .txt
    ```

    ```console
    Extension exclusion configured successfully
    ```
    
    ```bash
    mdatp exclusion extension remove --name .txt
    ```

    ```Output
    Extension exclusion removed successfully
    ```

- Add/Remove an exclusion for a file *(File path should already be present in case of adding or removing exclusion with global scope)* :

    ```bash
    mdatp exclusion file add --path /var/log/dummy.log --scope epp
    ```

    ```console
    File exclusion configured successfully
    ```

    ```bash
    mdatp exclusion file remove --path /var/log/dummy.log --scope epp
    ```
    
    ```console
    File exclusion removed successfully"
    ```
    
     ```bash
    mdatp exclusion file add --path /var/log/dummy.log --scope global
    ```

    ```console
    File exclusion configured successfully
    ```

    ```bash
    mdatp exclusion file remove --path /var/log/dummy.log --scope global
    ```

    ```console
    File exclusion removed successfully"
    ```
- Add/Remove an exclusion for a folder:

    ```bash
    mdatp exclusion folder add --path /var/log/ --scope epp
    ```

    ```console
    Folder exclusion configured successfully
    ```
    
    ```bash
    mdatp exclusion folder remove --path /var/log/ --scope epp
    ```

    ```console
    Folder exclusion removed successfully
    ```

  ```bash
    mdatp exclusion folder add --path /var/log/ --scope global
    ```

    ```console
    Folder exclusion configured successfully
    ```

    ```bash
    mdatp exclusion folder remove --path /var/log/ --scope global
    ```

    ```console
    Folder exclusion removed successfully
    ```

- Add an exclusion for a second folder:

    ```bash
    mdatp exclusion folder add --path /var/log/ --scope epp
    mdatp exclusion folder add --path /other/folder  --scope global
    ```

    ```console
    Folder exclusion configured successfully
    ```

- Add an exclusion for a folder with a wildcard in it:
    
    > [!NOTE]
    > Wildcards are not supported while configuring global exclusions.  

    ```bash
    mdatp exclusion folder add --path "/var/*/tmp"
    ```

    > [!NOTE]
    > This will only exclude paths under */var/\*/tmp/*, but not folders which are siblings of *tmp*; for example, */var/this-subfolder/tmp*, but not */var/this-subfolder/log*.

    ```bash
    mdatp exclusion folder add --path "/var/" --scope epp
    ```
    OR
    ```bash
    mdatp exclusion folder add --path "/var/*/" --scope epp
    ```

    > [!NOTE]
    > This will exclude all paths whose parent is */var/*; for example, */var/this-subfolder/and-this-subfolder-as-well*.

    ```console
    Folder exclusion configured successfully
    ```

- Add an exclusion for a process:

    ```bash
    mdatp exclusion process add --name /usr/bin/cat --scope global 
    ```

    ```console
    Process exclusion configured successfully
    ```

    ```bash
    mdatp exclusion process remove --name /usr/bin/cat  --scope global
    ```

    ```Output
    Process exclusion removed successfully
    ```

   ```bash
    mdatp exclusion process add --name /usr/bin/cat --scope epp 
    ```

    ```console
    Process exclusion configured successfully
    ```


    ```bash
    mdatp exclusion process remove --name /usr/bin/cat  --scope epp
    ```

    ```Output
    Process exclusion removed successfully
    ```

- Add an exclusion for a second process:

    ```bash
    mdatp exclusion process add --name cat --scope epp
    mdatp exclusion process add --name dog --scope global
    ```

    ```console
    Process exclusion configured successfully
    ```

## Validate exclusions lists with the EICAR test file

You can validate that your exclusion lists are working by using `curl` to download a test file.

In the following Bash snippet, replace `test.txt` with a file that conforms to your exclusion rules. For example, if you have excluded the `.testing` extension, replace `test.txt` with `test.testing`. If you're testing a path, ensure that you run the command within that path.

```bash
curl -o test.txt https://secure.eicar.org/eicar.com.txt
```

If Defender for Endpoint on Linux reports malware, then the rule isn't working. If there's no report of malware, and the downloaded file exists, then the exclusion is working. You can open the file to confirm that the contents are the same as what is described on the [EICAR test file website](https://www.eicar.org/download-anti-malware-testfile/).

If you don't have Internet access, you can create your own EICAR test file. Write the EICAR string to a new text file with the following Bash command:

```bash
echo 'X5O!P%@AP[4\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H*' > test.txt
```

You can also copy the string into a blank text file and attempt to save it with the file name or in the folder you're attempting to exclude.

## Allow threats

In addition to excluding certain content from being scanned, you can also configure the product not to detect some classes of threats (identified by the threat name). You should exercise caution when using this functionality, as it can leave your device unprotected.

To add a threat name to the allowed list, execute the following command:

```bash
mdatp threat allowed add --name [threat-name]
```

The threat name associated with a detection on your device can be obtained using the following command:

```bash
mdatp threat list
```

For example, to add `EICAR-Test-File (not a virus)` (the threat name associated with the EICAR detection) to the allowed list, execute the following command:

```bash
mdatp threat allowed add --name "EICAR-Test-File (not a virus)"
```
[!INCLUDE [Microsoft Defender for Endpoint Tech Community](../includes/defender-mde-techcommunity.md)]
