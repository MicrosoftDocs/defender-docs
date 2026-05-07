# Copilot Instructions for Microsoft Learn

These instructions define a unified style and process standard for authoring and maintaining learn.microsoft.com documentation with GitHub Copilot or other AI assistance.

## Learn-wide Instructions

Below are instructions that apply to all Microsoft Learn documentation authored with AI assistance. Learn product team will update this periodically as needed. Each repository SHOULD NOT update this to avoid being overwritten, but update the repository-specific instructions below as needed.

### AI Usage & Disclosure
All Markdown content created or substantially modified with AI assistance must include an `ai-usage` front matter entry:
- `ai-usage: ai-generated` – AI produced the initial draft with minimal human authorship
- `ai-usage: ai-assisted` – Human-directed, reviewed, and edited with AI support
- Omit only for purely human-authored legacy content

If missing, **add it**. However, do not add or update the ai-usage tag if the changes proposed are confined solely to:
- Links (link text and/or URLs)
- Single words or short phrases, such as entries in table cells
- Less than 5% of the article's word count

### Writing Style

Follow [Microsoft Writing Style Guide](https://learn.microsoft.com/style-guide/welcome/) with these specifics:

#### Voice and Tone

- Active voice, second person addressing reader directly
- Conversational tone with contractions
- Present tense for instructions/descriptions
- Imperative mood for instructions ("Call the method" not "You should call the method")
- Use "might" instead of "may" for possibility
- Avoid "we"/"our" referring to documentation authors

#### Structure and Format

- Sentence case headings (no gerunds in titles)
- Be concise, break up long sentences
- Oxford comma in lists
- Number all ordered list items as "1." (not sequential numbering like "1.", "2.", "3.", etc.)
- Complete sentences with proper punctuation in all list items
- Avoid "etc." or "and so on" - provide complete lists or use "for example"
- No consecutive headings without content between them

#### Formatting Conventions

- **Bold** for UI elements
- `Code style` for file names, folders, custom types, non-localizable text
- Raw URLs in angle brackets
- Use relative links for files in this repo
- Remove `https://learn.microsoft.com/en-us` from learn.microsoft.com links

## Repository-Specific Instructions

Below are instructions specific to this repository. These may be updated by repository maintainers as needed.

<!--- Add additional repository level instructions below. Do NOT update this line or above. --->

### Writing Style (Repository-Specific)

- Never use phrases like "This article covers," "This article describes," or "This page explains" in article introductions. Lead with the action or topic directly.
- Never use the word "across" (use alternatives like "in," "on," "throughout," or "for").

### Authoritative security content

The `security-for-ai` folder contains the authoritative security content for this repository. All content elsewhere in the repo must align with the guidance, terminology, and recommendations in `security-for-ai`. When you notice inconsistencies or conflicts between other content and `security-for-ai`:

1. Open a GitHub issue describing the misalignment and assign it to @guywi-ms.
1. If working in a PR, leave a review comment @-mentioning @guywi-ms about the inconsistency.

### Pull Requests

When creating pull requests for this repository, always target the upstream repo:

```
gh pr create --repo MicrosoftDocs/defender-docs-pr --base main --head AbbyMSFT:<branch-name>
```

Do not create PRs on the fork (`AbbyMSFT/defender-docs-pr`) targeting the fork's own `main`.
