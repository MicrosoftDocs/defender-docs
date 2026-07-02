---
title: Live response command examples
description: Learn to run basic or advanced live response commands for Microsoft Defender for Endpoint, and see examples on how they're used.
ms.service: defender-endpoint
ms.author: chrisda
author: chrisda
ms.localizationpriority: medium
ms.collection: 
- m365-security
- tier3
- mde-edr
ms.topic: reference
ms.subservice: edr
ms.date: 01/24/2025
appliesto:
  - Microsoft Defender for Endpoint Plan 2

---
# Live response command examples


Learn about common commands used in live response and see examples on how they're typically used.

Depending on the role you have, you can run basic or advanced live response commands. For more information on basic and advanced commands, see [Investigate entities on devices using live response](live-response.md).

## `analyze`

```console
# Analyze the file malware.txt
analyze file c:\Users\user\Desktop\malware.txt
```

```console
# Analyze the process by PID
analyze process 1234
```

## `connections`

```console
# List active connections in json format using parameter name
connections -output json
```

```console
# List active connections in json format without parameter name
connections json
```

## `dir`

```console
# List files and sub-folders in the current folder (by default it will show relative paths [-relative_path])
dir
```

```console
# List files and sub-folders in the current folder, with their full path
dir -full_path
```

```console
# List files and sub-folders in a specific folder
dir C:\Users\user\Desktop\
```

```console
# List files and subfolders in the current folder in json format
dir -output json
```

## `fileinfo`

```console
# Display information about a file
fileinfo C:\Windows\notepad.exe
```

## `findfile`

```console
# Find file by name
findfile test.txt
```

## `get`

```console
# Download a file from a machine
get c:\Users\user\Desktop\work.txt
```

```console
# Download a file from a machine, automatically run prerequisite commands
get c:\Users\user\Desktop\work.txt -auto
```

> [!NOTE]
>
> The following file types *can't* be downloaded using this command from within Live Response:
>
> - [Reparse point files](/windows-hardware/drivers/ifs/reparse-points)
> - [Sparse files](/windows-server/administration/windows-commands/fsutil-sparse)
> - Empty files
> - Virtual files, or files that aren't fully present locally
>
> [PowerShell](/powershell/scripting/overview) supports these file types.
>
> Use PowerShell as an alternative, if you have problems using this command from within Live Response.

## `library`

```console
# List files in the library
library
```

```console
# Delete a file from the library
library delete script.ps1
```

## `processes`

```console
# Show all processes
processes
```

```console
# Get process by pid
processes 123
```

```console
# Get process by pid with argument name
processes -pid 123
```

```console
# Get process by name
processes -name notepad.exe
```

## `putfile`

```console
# Upload file from library
putfile get-process-by-name.ps1
```

```console
# Upload file from library, overwrite file if it exists
putfile get-process-by-name.ps1 -overwrite
```

```console
# Upload file from library, keep it on the machine after a restart
putfile get-process-by-name.ps1 -keep
```

## `registry`

```console
# Show information about the values in a registry key
registry HKEY_CURRENT_USER\Console
```

```console
# Show information about a specific registry value (the double backslash \\ indicates a registry value versus key)
registry HKEY_CURRENT_USER\Console\\ScreenBufferSize
```


## `remediate`

```console
# Remediate file in specific path
remediate file c:\Users\user\Desktop\malware.exe
```

```console
# Remediate process with specific PID
remediate process 7960
```

```console
# See list of all remediated entities
remediate list
```

> [!NOTE]
> Currently, `HKEY_USERS` reg hive isn't supported for `remediate`. This is a known issue, and we're looking into it. 

## `run`

```console
# Run PowerShell script from the library without arguments
run script.ps1
```

```console
# Run PowerShell script from the library with arguments
run get-process-by-name.ps1 -parameters "-processName Registry"
```

> [!NOTE]
>
> For long running commands such as '**run**' or '**getfile**', you might want to use the '**&**' symbol at the end of the command to perform that action in the background.
> If you use the '**g**' symbol, you can continue investigating the machine and return to the background command when done using '**fg**' [basic command](live-response.md#basic-commands).
>
> When passing parameters to a live response script, don't include the following forbidden characters: **';'**, **'&'**, **'|'**, **'!'**, and **'$'**.

## `scheduledtask`

```console
# Get all scheduled tasks
scheduledtasks
```

```console
# Get specific scheduled task by location and name
scheduledtasks Microsoft\Windows\Subscription\LicenseAcquisition
```

```console
# Get specific scheduled task by location and name with spacing
scheduledtasks "Microsoft\Configuration Manager\Configuration Manager Health Evaluation"
```

## `undo`

```console
# Restore remediated registry
undo registry HKEY_CURRENT_USER\Console\ScreenBufferSize
```

```console
# Restore remediated scheduledtask
undo scheduledtask Microsoft\Windows\Subscription\LicenseAcquisition
```

```console
# Restore remediated file
undo file c:\Users\user\Desktop\malware.exe
```


