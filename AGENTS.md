# AGENTS.md

This file provides detailed guidance for AI coding assistants when working with code in this repository.

## Project Overview

This is a personal resume repository using LaTeX with the "Twenty Seconds Resume/CV" template. The resume is built using Nix for reproducible development environment and outputs a PDF (`resume.pdf`).

## Development Environment

The project uses Nix flakes for dependency management. Enter the development shell with:

```bash
nix develop
```

The dev shell provides:
- `texlive.combined.scheme-full` - Full LaTeX distribution for building the resume
- `simple-http-server` - For serving the PDF locally
- `nil` - Nix language server

## Building the Resume

Build the PDF from the LaTeX source:

```bash
pdflatex resume.tex
```

This generates `resume.pdf` from `resume.tex`. The build process creates intermediate files (`.aux`, `.log`, etc.) which are gitignored.

## File Structure

- `resume.tex` - Main resume content using the twentysecondcv document class
- `twentysecondcv.cls` - Custom LaTeX class defining the two-column resume layout with sidebar
- `headshot.jpg` - Profile picture referenced in the resume
- `resume.pdf` - Generated output (committed to repo)
- `flake.nix` - Nix flake defining the development environment

## Template Customization

The twentysecondcv class provides these custom commands in `resume.tex`:

- `\cvname{name}` - Your name
- `\cvjobtitle{title}` - Job title/career
- `\cvaddress{address}` - Location
- `\cvnumberphone{phone}` - Phone number
- `\cvsite{website}` - Personal website
- `\cvmail{email}` - Email address
- `\cvdate{text}` - LinkedIn or other date/info field
- `\profilepic{file}` - Profile picture
- `\aboutme{text}` - About me section in sidebar
- `\skills{text}` - Skills section (first page sidebar)
- `\otherskills{text}` - Additional skills (second page sidebar)

Content sections use these environments:

- `\begin{twenty}...\end{twenty}` - For experience with dates, titles, locations, and descriptions
  - `\twentyitem{dates}{title}{location}{description}`
- `\begin{twentyshort}...\end{twentyshort}` - For awards/certifications without detailed descriptions
  - `\twentyitemshort{dates}{title/description}`

The template creates a two-page layout with:
- Page 1: Profile sidebar with photo, skills, and main content
- Page 2: Secondary sidebar with additional skills and continued content

## Common Workflow

1. Edit content in `resume.tex`
2. Build with `pdflatex resume.tex`
3. Review `resume.pdf`
4. Clean build artifacts if needed (they're gitignored)
5. Commit both source and PDF to git
