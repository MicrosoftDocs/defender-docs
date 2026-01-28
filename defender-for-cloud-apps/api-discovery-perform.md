---
title: Perform file upload - cloud discovery API
description: This article describes the perform file upload request in the Defender for Cloud Apps cloud discovery API.
ms.date: 01/29/2023
ms.topic: reference
---
# Perform file upload - cloud discovery API



Upload the file contents by performing an HTTP PUT request. You will be required to use the URL returned by the [Initiate file upload](api-discovery-initiate.md) request.

> [!NOTE]
>
> - You can upload individual files of up to 5 GB. If you need to upload larger files, break the cloud discovery data into multiple chunks.
> - If you do not know which environment you are running, check the [Initiate file upload](api-discovery-initiate.md) request, which returns this information.

## HTTP request

```rest
PUT https://<initiate_file_upload_response_url>
```

> [!NOTE]
>
> For Azure:
>
> - If your file is under 64 MB, add the header "x-ms-blob-type: BlockBlob" to your request.
> - If your file size is greater than 64MB, upload it in chunks. the easiest way to do this is using the [Azure SDK](https://azure.microsoft.com/downloads/).

## Example

### Request

Here is an example of the request for Azure.

```rest
curl --request PUT --upload-file <file_to_upload_full_path> -H "x-ms-blob-type: BlockBlob" "https://<initiate_file_upload_response_url>"
```

Here is an example of the request for Azure Java SDK.

```java
File fileReference = new File("file.name");
// Create a blob using the URI that contains the shared access signature.
CloudBlockBlob sasBlob = new CloudBlockBlob(uri);

// Upload the file to the blob.
sasBlob.upload(new FileInputStream(fileReference), fileReference.length());
```

[!INCLUDE [Open support ticket](includes/support.md)]
