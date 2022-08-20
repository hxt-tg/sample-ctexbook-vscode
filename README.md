# sample-ctexbook-vscode

Sample project for building ctexbook in vscode automatically with its configuration.

## Features

- Working with VSCode LaTeX Workshop extension
- Separation of chapters editing
- Fast standalone TikZ figure compilation
- Isolated configuration of tikz figure style preambles

## Dependences

- TeXLive 2020+ (with `ctexbook` documentclass)
- VSCode
- VSCode Extension: LaTeX Workshop (`v8.26.0+`)
- CygWin on Windows (for bash environment)
- GNU Make
- latexmk

## Usage

- **Building `main.pdf`**: Simply run command `make` in bash or press `Ctrl+Alt+B `o file `main.tex` in VSCode editor
- **Building standalone TikZ figure**: `make` specific figure PDF, eg `make chap01/figures/sample1.pdf` Or press `Ctrl+Alt+B `on tikz source in VSCode editor, then press `Ctrl+Alt+V` to preview PDF
- **Clean working directory** (but keep all PDF files): `make clean`
- **Clean all output files** (keep source only): `make clean-all`
