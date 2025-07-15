# McDowell CV
McDowell CV is a LuaLaTeX class for building neat and space-efficient CVs using the design originally proposed by Gayle L. McDowell at http://www.careercup.com/resume.

The class is based on `article` class.

## Novelties in this fork
- Add skills or keywords to each CV entry. The right 17% of the page can be reserved for these (optional) keywords.
- `CVItemize` environment together with `CVItem` command allow smoother itemization with keywords per item.
- Make URLs clickable and indicate them with small arrow.
- Still compatible with original McDowell CV class, i.e. the usage without keywords.

## Examples
- A minimal usage example is provided [here](./Examples/minimal_example.tex).
<img src="https://github.com/ToniKoe/mcdowell-cv-skillset/blob/master/Examples/minimal_example.png" width="240px"/>

- An example CV with keywords is provided [here](./Examples/CV_Template_Keywords.tex).
<img src="https://github.com/ToniKoe/mcdowell-cv-skillset/blob/master/Examples/CV_Template_Keywords.png" width="240px"/>

- An example CV without keywords is provided [here](./Examples/CV_Template_noKeywords.tex).
<img src="https://github.com/ToniKoe/mcdowell-cv-skillset/blob/master/Examples/CV_Template_noKeywords.png" width="240px"/>

## Use Cases
- A great tool making it easy to build CVs: https://latexresu.me/.

## Class Options
- `calibri` - sets calibri as the main font. Otherwise the default font is Times New Roman since version 1.1.0.
- `a4paper` - set DIN A4 as paper format. Default is U.S. letter paper.

## Commands
The class features the following commands:
- `\name{name}` - defines the applicant's name to be printed by `\printheader`.
- `\address{address}` - defines the applicant's address to be printed by `\printheader`.
- `\contacts{contacts}` - defines the applicant's contacts to be printed by `\printheader`.
- `\makecvheader` - prints the CV header consisting of the name (see the `\name` command), address (see the `\address` command) and contacts (see the `\contacts` command).
- `\link{URL}{display text}` - displays `display text`$^↗$ while it references `URL`.
-  `\cvitem{bullet point content}[right][keywords]` - prints `bullet point content` in left 81% and `right` to right 17% of page. `right` is printed in normal text size and font, `keywords` are printed in small and italic. Should be in `cvitemize` environment; if only within `cvsection` environment need to adjust vertical spacing by `\vspace{8pt}` before first `\cvitem`.
 
## Environments
- `\begin{cvsection}{sectionname}` - prints a section with a header consisting of the name in bold small caps and a page-wide horizontal line below.
- `\begin{cvsubsection}[linesnum]{left}{center}{right}{content}` - prints a subsection with header in bold consisting of the `left`, `center` and `right` titles across page-width. Does not provide margin for keywords. 
`left` is mandatory, `center` and `right` are optional. The optional `linesnum` argument defines the amount of lines in the header. The argument only affects the vertical spacing between the environment header and content thus eliminating the effect of *tabu* package vertical spacing bug.
- `\begin{cvkeywordsubsection}[linesnum]{left}{center}{right}{content}{keywords}` - prints a subsection with header in bold consisting of the `left`, `center` and `right` titles across page-width. Prints `keywords` in small, italic to right 17% of the page. The content of the section is printed to the left 81% of the page.
`left` is mandatory, `center`, `right` and `keywords` are optional. `linesum` see above.
- `\begin{cvitemize}{left}{center}{right}` - prints section with header in bold consisting of the `left`, `center` and `right` titles. In contrast to `cvsubsection` it does not trigger keyword split of section. 

## Build Instructions
- Make sure [`lualatex`](https://www.luatex.org/download.html) is installed on your machine and is available in the terminal or a command line client of your choice.
- In the terminal or a command line client of your choice, go to the folder containing `CV_Template.tex` and `mcdowellcv.cls`, and run the following command: `lualatex McDowell_CV_Template.tex`.
