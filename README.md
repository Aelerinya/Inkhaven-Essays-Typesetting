# Inkhaven-Essays-Typesetting

Typesetting utilities for printing the essays produced at Inkhaven

## Essays

### Meditations on Moloch

Scott Alexander's famous essay on multipolar traps and coordination problems, typeset for 24" × 36" poster display at Lighthaven venue.

**Build:**
```bash
cd moloch
typst compile meditations-on-moloch.typ
```

**Output:** `moloch/meditations-on-moloch.pdf`

**Specifications:**
- Size: 24" × 36" (landscape orientation)
- Font: Libertinus Serif (literary elegant style)
- Layout: 6-column for readability at distance
- Style: Warm cream paper color, classic typography, blue hyperlinks
- Includes: Ginsberg's "Moloch" poem excerpt, full essay text, author attribution

## Requirements

- [Typst](https://typst.app/) - Modern typesetting system
- [pandoc](https://pandoc.org/) - For HTML to markdown conversion (if re-fetching content)
- curl - For downloading essay content

## Installation

```bash
# Install Typst (choose one method)
# Via cargo:
cargo install --git https://github.com/typst/typst typst-cli

# Or download pre-built binaries:
# https://github.com/typst/typst/releases
```

## Usage

To regenerate the PDF:

```bash
cd Inkhaven-Essays-Typesetting/moloch
typst compile meditations-on-moloch.typ
```

To watch for changes and auto-recompile:

```bash
cd moloch
typst watch meditations-on-moloch.typ
```

## File Structure

- `moloch/` - Meditations on Moloch essay files
  - `meditations-on-moloch.typ` - Main Typst layout file with page setup and styling
  - `meditations-on-moloch-content.typ` - Essay content in Typst format (converted from markdown)
  - `meditations-on-moloch.pdf` - Generated PDF output
  - `moloch.html` - Original HTML source (for reference)
  - `meditations-on-moloch-cleaned.md` - Intermediate markdown (legacy)
