# LaTeX Notes

These templates are made for notes and assignments.

## Usage

All documents should import `preamble.tex`.

### Optional

- `preamble.bib.tex`: Bibliography (powered by [BibLaTeX](https://ctan.org/pkg/biblatex))

    Commands:
      - `\citeinline`: equivalent to `\Citeauthor*{citation}, \citetitle*{citation}`

- `preamble.math.tex`: Math styling (powered by [amsmath](https://ctan.org/pkg/amsmath) and related
  packages)
- `pmmath-mod.sty`: Commands to write math (a subset of [Pascal Michaillat's `math.sty`](https://pascalmichaillat.org/e/),
  [source](https://github.com/pmichaillat/latex-math))

## Examples

- `notes.example.tex`: A sample notes document

  Make sure to replace the variable contents on lines 12-17 with your information.

  For best results, use a subdirectory named `lectures` (or something else) and reference each lecture,
  unit, or what have you with the `\input` command: `\input{lectures/lecture-01}`.

  This template has support for bibliographies.

  There is an optional `cover.pdf` import that is assumed to be present (line 35).

- `assignment.example.tex`: A sample assignment with math styling

  Make sure to replace the variable contents on lines 12-17, 18, 36, and 43 with your information.
  
  This template has support for math styling and includes a sample command definition (lines 26-28).
  
- `assignment.example.tex`: A sample assignment with math styling

  Make sure to replace the variable contents on lines 12-17, 21, 35, and 42 with your information.
  
  This template has support for extended math styling and includes a sample command definition.
