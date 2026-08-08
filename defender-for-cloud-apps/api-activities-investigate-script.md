---
title: Investigate activities using the API 
description: Use the Activities API in Defender for Cloud Apps to scan and retrieve large volumes of user activity data across connected cloud apps.
ms.date: 07/03/2026
ms.topic: how-to
ms.reviewer: Naama-Goldbart
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
---
# Investigate activities using the API



You can use the Activities APIs to investigate the activities performed by your users across connected cloud apps.

The activities API mode is optimized for scanning and retrieval of large quantities of data (over 5,000 activities). The API scan queries the activity data repeatedly until all the results have been scanned.

> [!NOTE]
> For large quantities of activities and large scale deployments, we recommended that you use the [SIEM agent](siem.md) for activity scanning.

<a name="to-use-the-activity-scan-script"></a>
## Use the activity scan script

To scan activity data, send a POST request to the activities endpoint with scan mode enabled:

1. Run the query on your data.
1. If there are more records than could be listed in a single scan, the response includes `nextQueryFilters`. Use `nextQueryFilters` as the filter parameter in each subsequent query until all matching activity records have been returned.

## Request body parameters

The request body supports the following parameters:

- "filters": Filter objects with all the search filters for the request, see [Activity filters](activity-filters-queries.md) for more information. To avoid having your requests be throttled, make sure to include a limitation on your query, for example, query the last day's activities, or filter for a particular app.
- "isScan": Boolean. Enables the scanning mode.
- "sortDirection": The sorting direction. Possible values are `asc` and `desc`.
- "sortField": Fields used to sort activities. Possible values are:
  - `date` - The date when then the activity occurred (this is the default).
  - `created` - The [timestamp](api-introduction.md#timestamps) when the activity was saved.
- "limit": Integer. In scan mode, between 500 and 5000 (defaults to 500). Controls the number of iterations used for scanning all the data.

## Response parameters

The response includes the following parameters:

- "data": the returned data. Will contain up to "limit" number of records each iteration. If there are more records to be pulled (hasNext=true), the last few records are dropped to ensure that all data is listed only once.
- "hasNext": Boolean. Denotes whether another iteration on the data is needed.
- "nextQueryFilters": If another iteration is needed, it contains the consecutive JSON query to be run. Use this as the "filters" parameter in the next request. If the "hasNext" parameter is set to False, this parameter will be missing since you've iterated over all of the data.

The following Python example gets all the activities from the past day from Exchange Online. The script sends the prepared filters to the Activities API in scan mode and iterates through paginated responses using `nextQueryFilters` until all matching activity records are retrieved.

``` python
import requests
import json
ACTIVITIES_URL = 'https://<your_tenant>.<tenant_region>.portal.cloudappsecurity.com/api/v1/activities/'

your_token = '<your_token>'
headers = {
'Authorization': 'Token {}'.format(your_token),
}

filters = {
  # optionally, edit to match your filters
  'date': {'gte_ndays': 1},
  'service': {'eq': [20893]}
}
request_data = {
  'filters': filters,
  'isScan': True
}

records = []
has_next = True
while has_next:
    content = json.loads(requests.post(ACTIVITIES_URL, json=request_data, headers=headers).content)
    response_data = content.get('data', [])
    records += response_data
    print('Got {} more records'.format(len(response_data)))
    has_next = content.get('hasNext', False)
    request_data['filters'] = content.get('nextQueryFilters')

print('Got {} records in total'.format(len(records)))
```

<a name="next-steps"></a>
## Related content

- [Best practices for protecting your organization](best-practices.md)
- [Contact Defender XDR support](/defender-xdr/contact-defender-support)
