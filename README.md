# TRACES Document Template

**Author:** Omar Kahol  
**Email:** omar.kahol@inria.fr

LaTeX document template for TRACES (TRAining the next generation iCE researcherS).

Follows the design guidelines of the consortium with professional formatting for reports, deliverables, and technical documentation.

Requires the packages [fancyhdr](https://www.ctan.org/pkg/fancyhdr), [titlesec](https://www.ctan.org/pkg/titlesec), [TikZ](https://www.ctan.org/pkg/pgf), and [hyperref](https://www.ctan.org/pkg/hyperref) to be installed in your LaTeX distribution.

## Demo

![Title Page Demo](demo-titlepage.png)

The template includes a comprehensive demonstration file (`main.tex`) illustrating:
- Professional title page with EU and TRACES branding
- Revision table for document version tracking
- Styled sections and subsections with TRACES blue color
- Mathematical equations with colored numbering
- Tables with alternating row colors
- Figures with colored captions
- Styled lists (itemize and enumerate)
- Bibliography and citation support
- Appendix sections
- Custom footer with EU funding acknowledgment on all pages

## Installation

### Manual Installation

1. Download or clone this repository
2. The template structure includes:
   - `main.tex` - Main document file with user-editable content
   - `config/config.tex` - Styling and package configuration
   - `config/title_page.tex` - Title page layout
   - `config/traces-logo.pdf` - TRACES project logo
   - `config/eu.png` - EU flag logo
   - `references.bib` - Bibliography database (BibTeX format)
   - `makefile` - Build automation

### Quick Start

Edit the document variables at the top of `main.tex`:

```latex
% --- Document Information (EDIT THESE) ---
\newcommand{\docTitle}{Title of the report}
\newcommand{\docSubtitle}{Subtitle of the report}
\newcommand{\docAuthor}{Name Surname}
\newcommand{\docInstitution}{Institution}
\newcommand{\docVersion}{1.0}
\newcommand{\docDate}{31/01/2026}
```

The project information (grant number, acronym, website, etc.) is configured in `config/config.tex`.

## Customization

### Document Variables

The template provides easy customization through variables defined in `main.tex`:

- `\docTitle` - Main document title
- `\docSubtitle` - Document subtitle (appears below title on title page)
- `\docAuthor` - Author name(s)
- `\docInstitution` - Institution or organization
- `\docVersion` - Document version number
- `\docDate` - Document date

### Adding Content

Simply add your content after the revision table in `main.tex`. The template supports:

- **Sections and subsections**: Standard LaTeX `\section{}` and `\subsection{}` commands
- **Equations**: Use `equation` environment for numbered equations
- **Tables**: Use `table` and `tabular` environments (see examples in template)
- **Figures**: Use `figure` environment with `\includegraphics`
- **Lists**: Both `itemize` and `enumerate` environments with TRACES styling
- **Citations**: Use `\cite{}` command (references defined in `references.bib`)

### Bibliography

Add your references to `references.bib` in BibTeX format, then cite them using:

```latex
\cite{reference_key}
```

The bibliography style is set to `plain` but can be changed in `main.tex`:

```latex
\bibliographystyle{plain}  % Change to alpha, abbrv, etc.
```

## Building Your Document

### Using make

If you have `make` installed, simply run:

```bash
make
```

This will:
1. Compile the document with XeLaTeX
2. Process bibliography with BibTeX
3. Generate the final PDF in the root directory

To clean auxiliary files:

```bash
make clean
```

### Manual Compilation

Using XeLaTeX with BibTeX:

```bash
xelatex main.tex
bibtex main
xelatex main.tex
xelatex main.tex  # Run twice more for proper references
```

Using latexmk (recommended):

```bash
latexmk -pdfxe main.tex
```

## Document Structure

```
main.tex                    # Main document with content
config/
  ├── config.tex           # Styling and package configuration
  ├── title_page.tex       # Title page layout
  ├── traces-logo.pdf      # TRACES logo
  └── eu.png               # EU flag logo
references.bib             # Bibliography database
makefile                   # Build automation
```

## Requirements

- LaTeX distribution (TeX Live 2020 or later, MiKTeX, etc.)
- XeLaTeX engine (for proper font and Unicode support)
- Required packages:
  - `fancyhdr` - Headers and footers
  - `lastpage` - Page numbering
  - `hyperref` - Hyperlinks and citations
  - `titlesec` - Section formatting
  - `caption` - Caption styling
  - `enumitem` - List customization
  - `amsmath` - Mathematical equations
  - `tikz` - Graphics and decorations
  - `colortbl` - Table row coloring
  - `tabularx` - Flexible tables
  - `geometry` - Page layout
  - `xcolor` - Color definitions

## Features

- **Professional title page** with TRACES and EU branding
- **Revision tracking table** for document version management
- **Consistent styling** across all document elements
- **TRACES blue color scheme** for headings, captions, and accents
- **EU funding footer** automatically included on all pages
- **Bibliography support** with colored citations
- **Appendix sections** with proper formatting
- **Easy customization** through document variables
- **Automated build system** with makefile

## License

This template is designed for the TRACES consortium and follows their visual identity guidelines.

## Acknowledgments

This project has received funding from the European Union's Horizon Europe research and innovation programme under the Marie Skłodowska-Curie grant agreement No 101072551 (TRACES).
