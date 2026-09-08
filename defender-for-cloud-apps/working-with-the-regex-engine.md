---
title: Work with the regular expression engine in Defender for Cloud Apps
description: Use regular expressions in Microsoft Defender for Cloud Apps policies to match text patterns, understand syntax limitations, and refine content inspection conditions.
ms.date: 07/03/2026
ms.topic: how-to
ai-usage: ai-assisted
ms.custom: msecd-doc-authoring-1016
---
# Work with the regular expression engine in Defender for Cloud Apps

> [!IMPORTANT]
> File policies retire on January 6, 2027. To maintain file-based data protection, [migrate to Microsoft Purview DLP or auto-labeling policies](migrate-file-policies-to-purview.md).



Microsoft Defender for Cloud Apps supports regular expressions (RegEx) for pattern matching in content inspection and file policies. This article covers the supported RegEx syntax, known limitations, and provides examples to help you build effective expressions for your policies.

## Regular expressions in Defender for Cloud Apps

The Microsoft Defender for Cloud Apps content inspection policies use RegEx for pattern matching. Content inspection may be applied as part of file policies.

### Testing regular expressions

To test regular expressions, you can use the following websites:

- [RegexPal regular expression tester](https://www.regexpal.com/) - Make sure you select **Case insensitive**.

- [Regex101 regular expression tester](https://regex101.com/) - Provides detailed analysis of the RegEx.

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

<a name="example-expressions"></a>
### Regular expression examples

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
