---
title: Working with the RegEx engine
description: This article provides instructions for using RegEx for pattern matching in Defender for Cloud Apps policies.
ms.date: 01/29/2023
ms.topic: how-to
---
# Working with the RegEx engine



This article provides instructions for using RegEx for pattern matching in Defender for Cloud Apps policies.

## Regular expressions in Defender for Cloud Apps

The Microsoft Defender for Cloud Apps content inspection policies use RegEx for pattern matching. Content inspection may be applied as part of file policies.

### Testing regular expressions

To test regular expressions, you can use the following websites:

- [https://regexpal.com/](https://www.regexpal.com/) - Make sure you select **Case insensitive**.

- [https://regex101.com/](https://regex101.com/) - Provides detailed analysis of the RegEx.

### Limitations of regular expressions in Defender for Cloud Apps

The following limitations are imposed on custom regular expressions:

- The search is always case-insensitive

- Allowed quantifiers: {n,m} where n, m < 10

- All groups must be non-capturing, for example: (?:xxx)

    Instead of (group) use (?:group)

- Disallowed quantifiers: *, +, {n,}

    Instead of * use {0,9}

    Instead of + use {1,9}

- Disallowed back-references: \\<number\> or \k\<name>

### Example expressions

The following table gives you example expressions and if they would match or not.

|              Regular expression              |                     Data                     |      Matches      |
|---------------------------------------------------------------|---------------------------------------------------------------|------------------------------------|
|            `Colou?r (?:black&#124;blue&#124;white)`             |   Color black<br /><br /> Color white<br /><br /> Color red   | Yes<br /><br /> Yes<br /><br /> No |
|           `[a-z0-9]{1,9}@[a-z0-9]{1,9}\\.[a-z]{2,}`           | Some1@abc.com<br /><br /> user@host.org<br /><br /> @bad.com  | Yes<br /><br /> Yes<br /><br /> No |
| `20\d{2}-(?:0[1-9]|1[0-2])-(?:[0-2][0-9]|30|31)`              |   2015-12-31<br /><br /> 2015-01-09<br /><br /> 1999-12-31    | Yes<br /><br /> Yes<br /><br /> No |
|                       `d.n't\s{0,10}c.r.`                      | Don't     care<br /><br /> D!n'tcor0<br /><br /> Doesn't care | Yes<br /><br /> Yes<br /><br /> No |

## Next steps

> [!div class="nextstepaction"]
> [Best practices for protecting your organization](best-practices.md)

[!INCLUDE [Open support ticket](includes/support.md)]
