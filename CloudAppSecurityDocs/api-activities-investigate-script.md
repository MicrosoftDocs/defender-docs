---
title: Investigate activities using the API 
description: This article provides information on how to use the API to investigate user activity in Defender for Cloud Apps.
ms.date: 01/29/2023
ms.topic: how-to
---
# Investigate activities using the API



You can use the Activities APIs to investigate the activities performed by your users across connected cloud apps.

The activities API mode is optimized for scanning and retrieval of large quantities of data (over 5,000 activities). The API scan queries the activity data repeatedly until all the results have been scanned.

> [!NOTE]
> For large quantities of activities and large scale deployments, we recommended that you use the [SIEM agent](siem.md) for activity scanning.

## To use the activity scan script

1. Run the query on your data.
1. If there are more records than could be listed in a single scan, you will get a return command with `nextQueryFilters` that you should run. You will get this command each time you scan until the query has returned all the results.

## Request body parameters

- "filters": Filter objects with all the search filters for the request, see [Activity filters](activity-filters-queries.md) for more information. To avoid having your requests be throttled, make sure to include a limitation on your query, for example, query the last day's activities, or filter for a particular app.
- "isScan": Boolean. Enables the scanning mode.
- "sortDirection": The sorting direction. Possible values are `asc` and `desc`.
- "sortField": Fields used to sort activities. Possible values are:
  - `date` - The date when then the activity occurred (this is the default).
  - `created` - The [timestamp](api-introduction.md#timestamps) when the activity was saved.
- "limit": Integer. In scan mode, between 500 and 5000 (defaults to 500). Controls the number of iterations used for scanning all the data.

## Response parameters

- "data": the returned data. Will contain up to "limit" number of records each iteration. If there are more records to be pulled (hasNext=true), the last few records will be dropped to ensure that all data is listed only once.
- "hasNext": Boolean. Denotes whether another iteration on the data is needed.
- "nextQueryFilters": If another iteration is needed, it contains the consecutive JSON query to be run. Use this as the "filters" parameter in the next request. Note that if the "hasNext" parameter is set to False, this parameter will be missing since you've iterated over all of the data.

The following Python example gets all the activities from the past day from Exchange Online.

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

## Next steps

> [!div class="nextstepaction"]
> [Best practices for protecting your organization](best-practices.md)

[!INCLUDE [Open support ticket](includes/support.md)]
