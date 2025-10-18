# PT Letter

Letter document class for ptoledo-teaching collection.

## Features

- Professional letter format following Chilean formal letter standards
- Based on `article` class for maximum flexibility
- Inherits all features from `pt-commons`
- Parametrized sender and recipient information
- Centered text layout (5.50in width on letter paper)
- Optional signature image support
- Watermark support for drafts

## Installation

Copy `pt-letter.cls` to your TeX local directory:
```bash
cp pt-letter.cls /usr/local/texlive/texmf-local/tex/latex/pt-letter/
sudo mktexlsr
```

## Usage

### Method 1: Parametrized (Recommended)

Use predefined parameters for sender and recipient:

```latex
\documentclass[spanish]{pt-letter}

% Sender information
\ptsendername{Your Name}
\ptsenderaffiliation{Department\\University}
\ptsenderaddress{Address}
\ptsenderemail{email@example.com}
\ptsenderphone{+56 12 345 6789}

% Recipient information
\ptrecipientname{Recipient Name}
\ptrecipientaffiliation{Position\\Company}
\ptrecipientaddress{Address}

% Date and location
\ptletterlocation{City}
\ptletterdate{\today}

\begin{document}

\ptfromsender    % Generate sender block
\pttorecipient   % Generate recipient block
\ptdate          % Generate date

\opening{Dear Sir/Madam:}

% Letter content...

\closing{Your Name\\ID}

\end{document}
```

### Method 2: Manual (Flexible)

Manually specify content for each block:

```latex
\documentclass[spanish]{pt-letter}

\begin{document}

\fromsender{%
    Name\\
    Department\\
    Address
}

\torecipient{%
    Recipient Name\\
    Position\\
    Address
}

\letterdate{City, \today}

\opening{Dear Sir/Madam:}

% Letter content...

\closing{Name\\ID}
% Or with signature image:
% \closing[signature.png]{Name\\ID}

\end{document}
```

## Available Commands

### Parametrized Commands

**Sender parameters:**
- `\ptsendername{name}` - Sender's name (bold)
- `\ptsenderaffiliation{affiliation}` - Department/University
- `\ptsenderaddress{address}` - Full address
- `\ptsenderemail{email}` - Email address
- `\ptsenderphone{phone}` - Phone number

**Recipient parameters:**
- `\ptrecipientname{name}` - Recipient's name (bold)
- `\ptrecipientaffiliation{affiliation}` - Position/Company
- `\ptrecipientaddress{address}` - Full address

**Date parameters:**
- `\ptletterlocation{city}` - City name
- `\ptletterdate{date}` - Date (default: `\today`)

**Generator commands:**
- `\ptfromsender` - Generate sender block (top right)
- `\pttorecipient` - Generate recipient block (top left)
- `\ptdate` - Generate date block (top right)

### Manual Commands

- `\fromsender{content}` - Manual sender block (top right)
- `\torecipient{content}` - Manual recipient block (top left)
- `\letterdate{content}` - Manual date block (top right)

### Common Commands

- `\opening{text}` - Opening salutation
- `\closing[image]{text}` - Closing with optional signature image

## Class Options

- `spanish` (default) - Spanish language
- `english` - English language
- `portuguese` - Portuguese language
- `french` - French language
- `nominted` - Disable minted code highlighting

## Page Layout

- Paper: Letter (8.5" × 11")
- Text width: 5.50"
- Margins: 1.50" (left/right) - centered
- Text height: 9.00"
- Paragraph indent: 2.00em
- No page numbers (default)

## Examples

See `template/` directory for:
- `template.tex` - Manual method example
- `template-parametrized.tex` - Parametrized method example

## License

LaTeX Project Public License 1.3c or later

## Author

Pedro Toledo Correa
