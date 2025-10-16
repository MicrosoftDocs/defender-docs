This tiny tool converts a single sheet from an Excel file (.xls or .xlsx) into a GitHub-flavored Markdown table and embeds it into a simple page template.

Usage:
- Place your source Excel file in the same directory or pass an absolute path.
- Run: python convert_xls_to_md.py input.xlsx output.md --sheet "Sheet1" --title "My Title" --template ../templates/page_template.md

The script requires Python 3.8+ and the `openpyxl` package for .xlsx files and `xlrd` for .xls files. Install with:

pip install openpyxl xlrd

The generated markdown will include a table converted from the first non-empty row as header and the remaining rows as data.
