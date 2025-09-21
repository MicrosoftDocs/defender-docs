---
title: Close false positive - Alerts API
description: This article describes the bulk close an alert as false positive request in the Defender for Cloud Apps Alerts API.
ms.date: 01/29/2023
ms.topic: reference
---
# Close false positive - Alerts API



Run the POST request to close multiple alerts matching the specified filters as false positive (an alert on a non-malicious activity).

## HTTP request

```rest
POST /api/v1/alerts/close_false_positive/
```

## Request BODY parameters

| Parameter | Description |
| --- | --- |
| filters | Filter objects with all the search filters for the request, see [alert filters](api-alerts.md#filters) for more details |
| comment | A comment about why the alerts are dismissed |
| reasonId | The reason for closing the alerts as false positive. Providing a reason helps improve the accuracy of the detection over time. Possible values include:<br /><br />**0**: Not of interest<br />**1**: Too many similar alerts<br />**3**: Alert is not accurate<br />**4**: Other |
| sendFeedback | A boolean value indicating that feedback about this alert is provided. Default value: false |
| feedbackText | The text of the feedback |
| allowContact | A boolean value indicating that consent to contact the user is provided. Default value: false |
| contactEmail | The email address of the user |

## Example

### Request

Here is an example of the request.

```rest
curl -XPOST -H "Authorization:Token <your_token_key>" -H "Content-Type: application/json" "https://<tenant_id>.<tenant_region>.portal.cloudappsecurity.com/api/v1/alerts/close_false_positive/" -d '{
  "filters": {
    "id": {
      "eq": [
        "55af7415f8a0a7a29eef2e1f",
        "55af741cf8a0a7a29eef2e20",
        "5f8d70bfc1ffb25b0a541c7d"
      ]
    }
  },
  "comment": "Irrelevant",
  "reasonId": 0,
  "sendFeedback": true,
  "feedbackText": "Feedback text",
  "allowContact": true,
  "contactEmail": " user@contoso.com"
}'
```

### Response

Response if alert was properly closed

```json
{
    "closed_false_positive": 1
}
```

Response if alert not found

```json
{
    "closed_false_positive": 0,
    "alertsNotFound": [
        "5f843e9cfe3f6d80fe58a962"
    ]
}
```

[!INCLUDE [Open support ticket](includes/support.md)]
