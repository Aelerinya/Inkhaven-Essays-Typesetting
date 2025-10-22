# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This repository typesets essays for printing as posters for display at Inkhaven/Lighthaven venues. Each essay is compiled using Typst to create large-format PDFs.

## Build Commands

To compile a poster:
```bash
cd <essay-folder>
typst compile <essay-name>.typ
```

To auto-recompile on changes:
```bash
typst watch <essay-name>.typ
```

Examples:
```bash
cd moloch
typst compile meditations-on-moloch.typ

cd learning-by-writing
typst compile learning-by-writing.typ
```

## Architecture

### Two-File Pattern

Each essay follows a consistent structure:

1. **Layout file** (`<name>.typ`) - Page setup, fonts, styling, header
   - Defines page dimensions (e.g., 18" × 24", 24" × 36")
   - Sets font, text size, line spacing, paragraph spacing
   - Configures multi-column layout
   - Styles headings, links, emphasis
   - Creates header with title/author/date
   - Includes the content file

2. **Content file** (`<name>-content.typ`) - Essay text in Typst format
   - Pure content without layout concerns
   - Converted from markdown or HTML
   - Uses Typst markup: `*bold*`, `_italic_`, `#link()`, `#footnote[]`

This separation allows adjusting layout without touching content, and vice versa.

### Font Requirements

Different essays use different fonts:

- **ETBembo** - Used by "Learning By Writing" and Sequences highlights
  - Install from: https://github.com/edwardtufte/et-book

- **Libertinus Serif** - Used by "Meditations on Moloch"
  - Usually pre-installed or available via system package manager

Typst will show warnings if fonts are missing but will compile with fallback fonts.

## Critical Constraints: Single-Page Posters

**Most posters must fit on exactly one page.** This is the primary design constraint.

When content doesn't fit:

1. **Check page count**: `pdfinfo <file>.pdf | grep Pages`

2. **Adjust in this order**:
   - Reduce text size (e.g., 13pt → 12.8pt)
   - Reduce paragraph spacing (e.g., 0.72em → 0.7em)
   - Reduce line leading (e.g., 0.65em → 0.6em)
   - Reduce margins (e.g., 1in → 0.75in)
   - Reduce header sizes/spacing
   - Increase column count (more columns = denser layout)
   - As last resort: trim non-essential content

3. **Balance typography**: Changes are often in increments of 0.1-0.2pt to maintain readability while fitting content

### Spacing Parameters to Adjust

In layout files, look for these key values:

```typst
#set page(margin: (x: 0.75in, y: 0.75in))  // Page margins
#set text(size: 12.8pt)                     // Body text size
#set par(leading: 0.65em, spacing: 0.72em) // Line/paragraph spacing
#columns(3, gutter: 1.2em)                 // Column count and gap
```

Header spacing:
```typst
#block(below: 0.45em)[Title]     // Space after title
#v(0.9em)                        // Space before content starts
```

## Markdown to Typst Conversion

When creating content files from markdown:

- `**bold**` → `*bold*`
- `*italic*` → `_italic_`
- `## Heading` → `== Heading`
- `[text](url)` → `#link("url")[text]`
- `[^1]` footnote → `#footnote[text]`
- Markdown tables → `#table(columns: ..., [cell], [cell], ...)`

## Poster Specifications

Current essays:

- **Meditations on Moloch**: 24" × 36" landscape, 6 columns, Libertinus Serif
- **Learning By Writing**: 18" × 24" portrait, 3 columns, ETBembo

When creating new posters, consider:
- Viewing distance (larger posters need larger text)
- Content length (more columns for longer essays)
- Visual style preference (font choice, colors, spacing)
