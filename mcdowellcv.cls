%% The MIT License (MIT)
%%
%% Copyright (c) 2015 Daniil Belyakov
%%
%% Permission is hereby granted, free of charge, to any person obtaining a copy
%% of this software and associated documentation files (the "Software"), to deal
%% in the Software without restriction, including without limitation the rights
%% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
%% copies of the Software, and to permit persons to whom the Software is
%% furnished to do so, subject to the following conditions:
%%
%% The above copyright notice and this permission notice shall be included in all
%% copies or substantial portions of the Software.
%%
%% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
%% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
%% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
%% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
%% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
%% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
%% SOFTWARE.

\ProvidesClass{mcdowellcv}[2022/03/18 v1.2.0 McDowell CV class]

\newcommand{\maintextwidth}{0.8\textwidth}
\newcommand{\margintextwidth}{0.19\textwidth}

% Set up the fonts according to options
\def\mainfontsize{11pt}
\def\mainfontface{Times New Roman}

\DeclareOption{calibri}{%
  \def\mainfontface{Calibri}
}

% Set up papersize according to options, default to US letter
\def\papersize{letterpaper}
%Set up bool for adjusting vspacing later
\newif\ifpapersize

\DeclareOption{a4paper}{%
  \def\papersize{a4paper}
  \papersizetrue
}

\DeclareOption{letterpaper}{%
  \def\papersize{letterpaper}
  \papersizefalse
}
\ProcessOptions\relax

% Set font size and paper type
\LoadClass[\papersize,\mainfontsize]{article}

% Set document margins
\usepackage[left=0.6in,top=0.6in,right=0.6in,bottom=0.4in]{geometry}

% Set font face
\usepackage{fontspec}
\setmainfont[SmallCapsFeatures={Renderer=Basic},
Ligatures={TeX, NoCommon, NoDiscretionary}]{\mainfontface}

% Remove paragraph indentation
\usepackage[parfill]{parskip}

% Required for boldface (\bf and \bfseries) tabular columns
\usepackage{array}

% Required for ifthenelse statements
\usepackage{etoolbox}

\usepackage{xparse}

% For mathematical symbols
\usepackage{amsmath}
\usepackage{csquotes}

% Suppress page numbers
\pagestyle{empty}

% Links
\usepackage[hidelinks]{hyperref}
% to add small arrow after hyperrefs
\newfontfamily\symbolfont{DejaVu Sans}
\newcommand{\linkarrow}{\small $^{\text{\symbolfont↗}}$}
\newcommand{\link}[2]{\href{#1}{#2\linkarrow}}


% Highlighting Keywords
% underline
\usepackage[normalem]{ulem}
\newcommand{\highlight}[1]{\uline{#1}}
% slightly larger
% \newcommand{\highlight}[1]{{\fontsize{11.5pt}{15.6pt}\selectfont #1}}
% \newcommand{\highlight}[1]{\textbf{#1}}

\usepackage{csquotes}

% Flexible tables
\usepackage{tabu}

% For custom margins
\usepackage{changepage}

% To customize lists
\usepackage{enumitem}
% Remove left margin from lists, suppress vertical item separation and set top
% separation to a negative value to suppress a single parskip before lists
\setlist{leftmargin=*, noitemsep, topsep=-1\parskip}

% For adjusting spacing based on the platform used
\usepackage{ifthen}
\usepackage{ifplatform}

% For spcaed small caps
\usepackage{microtype}

% for multicolumn in skill section
\usepackage{multicol}


\DeclareMicrotypeSet*{smallcapsi} {
  encoding = {OT1,T1,T2A,LY1,OT4,QX,T5,TS1,EU1,EU2},
  shape = {sc*,si,scit}
}

%--------------------------------------------------------------------------------
%                                   Constants                                   -
%--------------------------------------------------------------------------------

\ifthenelse{\equal{\platformname}{\notwindowsname}}{
  \def\namespaceskip{0.575em}
  \def\afterheaderspace{1.1pt}
  \def\beforesectionheaderspace{5pt}
  \def\sectionheadermargin{6pt}
  \def\beforesectionheaderhrulespace{2.85pt}
  \def\sectionheaderhrlueheight{0.518pt}
  \def\aftersectionheaderspace{-5.8pt}
  
  \ifpapersize
    \def\aftersinglelinesubsectionheaderspace{-5.75pt}
  \else
    \def\aftersinglelinesubsectionheaderspace{-20.25pt}
  \fi
  
  \def\afterdoublelinesubsectionheaderspace{-11.75pt}
  \def\aftermultilinesubsectionheaderspace{-7.75pt}
  \def\afteremptysubsectionheaderspace{1.25pt}
  \def\subsectionmargin{9pt}
  \def\aftersubsectionspace{2.1pt}
}{
  \def\namespaceskip{0.4em}
  \def\afterheaderspace{3pt}
  \def\beforesectionheaderspace{4.75pt}
  \def\sectionheadermargin{6pt}
  \def\beforesectionheaderhrulespace{3pt}
  \def\sectionheaderhrlueheight{0.5pt}
  \def\aftersectionheaderspace{-4pt}
  
  \ifpapersize
    \def\aftersinglelinesubsectionheaderspace{-4pt}
  \else
    \def\aftersinglelinesubsectionheaderspace{-18.5pt}
  \fi

  \def\afterdoublelinesubsectionheaderspace{-10pt}
  \def\aftermultilinesubsectionheaderspace{-6pt}
  \def\afteremptysubsectionheaderspace{3pt}
  \def\subsectionmargin{9pt}
  \def\aftersubsectionspace{4pt}
}

%--------------------------------------------------------------------------------
%                            Header Setup and Printing                          -
%--------------------------------------------------------------------------------

% Address
\makeatletter

\newcommand\address[1]{\def\@address{#1}}
\address{}

\newcommand{\city}[1]{\def\@city{#1}}
\city{}

\newcommand{\country}[1]{\def\@country{#1}}
\country{}

\newcommand{\personallinks}[1]{\def\@personallinks{#1}}
\personallinks{}

\if\relax\detokenize{\address}\relax
  \newcommand\printaddress{
      \small{\@address}
    }
    \newcommand{\city}{ }
\else
  \newcommand\printaddress{
      \small{\@city, \@country \linebreak \@personallinks}
    }
\fi



\makeatother

% Name
\makeatletter

\newcommand\name[1]{\def\@name{#1}}
\name{}

\newcommand\printname{
  \typeout {kokoko}
  \typeout \spaceskip
  \spaceskip \namespaceskip \relax
  \textbf{\LARGE\textls[110]{\textsc{\@name}}}
}

\makeatother

% Contacts
\makeatletter

\newcommand\contacts[1]{\def\@contacts{#1}}
\contacts{}

\newcommand\printcontacts{
  \small{\@contacts}
}

\makeatother

\makeatletter
\newcommand\makeheader{
  \begin{center}
    \begin{tabu} to 1\textwidth { X[l,m] X[2,c,m] X[r,m] }
      \printaddress & \printname & \printcontacts \\
    \end{tabu}
  \end{center}
  \vspace*{\afterheaderspace}
}
\makeatother

%--------------------------------------------------------------------------------
%                            Sections and Subsections                           -
%--------------------------------------------------------------------------------

% Print a section header
\makeatletter
\newenvironment{cvsection}[1]{
  \vspace*{\beforesectionheaderspace}
  % Set text margins to equal \tabcolsep (6pt by default)
  \begin{adjustwidth}{\sectionheadermargin}{\sectionheadermargin}
        \textsc{\textbf{#1}}
  \end{adjustwidth}
  \vspace*{\beforesectionheaderhrulespace}
  \hrule height \sectionheaderhrlueheight
  \vspace*{\aftersectionheaderspace}
}{}
\makeatother

% Print a subsection
\makeatletter
% Define toggles checking if titles were defined
\newtoggle{lefttitledefined}
\newtoggle{centertitledefined}
\newtoggle{righttitledefined}

% subsection without keywords
\newenvironment{cvsubsection}[4][1]{
  \notblank{#2}{\toggletrue{lefttitledefined}}{}
  \notblank{#3}{\toggletrue{centertitledefined}}{}
  \notblank{#4}{\toggletrue{righttitledefined}}{}
  \ifboolexpr{togl {lefttitledefined} or togl {centertitledefined} or togl {righttitledefined}}{
    \begin{tabu} to 1\textwidth { X[l,p] X[c,p] X[r,p] }
      \textbf{#2} & \textbf{#3} & \textbf{#4} \\
    \end{tabu}
    % Add space according to the specidied number of lines
    \ifnumcomp{#1}{=}{1}{\vspace*{\aftersinglelinesubsectionheaderspace}}{
      \ifnumcomp{#1}{=}{2}{\vspace*{\afterdoublelinesubsectionheaderspace}}{
        \vspace*{\aftermultilinesubsectionheaderspace}
      }
    }
  }{
    \vspace*{\afteremptysubsectionheaderspace}
  }
  \togglefalse{lefttitledefined}
  \togglefalse{centertitledefined}
  \togglefalse{righttitledefined}
  \begin{adjustwidth}{\subsectionmargin}{\subsectionmargin}
}
{
  \end{adjustwidth}
  \vspace*{\aftersubsectionspace}
}

% subsection with keywords
\newcommand{\cvsubsectionkeywords}{} % variable that will hold the 5th argument

\newenvironment{cvkeywordsubsection}[5][1]{%
  \def\cvsubsectionkeywords{#5} % store the keywords
  \notblank{#2}{\toggletrue{lefttitledefined}}{}%
  \notblank{#3}{\toggletrue{centertitledefined}}{}%
  \notblank{#4}{\toggletrue{righttitledefined}}{}%
  \ifboolexpr{togl {lefttitledefined} or togl {centertitledefined} or togl {righttitledefined}}{%
    \begin{tabu} to 1\textwidth { X[l,p] X[c,p] X[r,p] }
      \textbf{#2} & \textbf{#3} & \textbf{#4} \\
    \end{tabu}
    \ifnumcomp{#1}{=}{1}{\vspace*{\aftersinglelinesubsectionheaderspace}}{%
      \ifnumcomp{#1}{=}{2}{\vspace*{\afterdoublelinesubsectionheaderspace}}{%
        \vspace*{\aftermultilinesubsectionheaderspace}}}%
  }{%
    \vspace*{\afteremptysubsectionheaderspace}%
  }%
  \togglefalse{lefttitledefined}%
  \togglefalse{centertitledefined}%
  \togglefalse{righttitledefined}%
  \begin{adjustwidth}{\subsectionmargin}{\subsectionmargin}
    \noindent
    \begin{minipage}[t]{\maintextwidth}%
}{%
    \end{minipage}%
    \hfill
    \hspace*{-0.6em} % slightly move to the left to align with ruler
    \begin{minipage}[t]{\margintextwidth}
      \raggedleft
      {\small\textit{\cvsubsectionkeywords}
      }%
    \end{minipage}
  \end{adjustwidth}
  \vspace*{\aftersubsectionspace}
}

% itemize: subsection without keyword margin split
\newenvironment{cvitemize}[3]{% left, center, right all bold
  \begin{tabu} to \textwidth { X[l,p] X[c,p] X[r,p] }
    \textbf{#1} & \textbf{#2} & \textbf{#3} 
  \end{tabu}
  \vspace*{\aftersubsectionspace} % spacing after header
}{}

% item: add keywords to each bulletpoint
\NewDocumentCommand{\cvitem}{ m o o}{% content, remark, keywords
    \vspace{-8pt} % adjust vertical position
    \begin{adjustwidth}{\subsectionmargin}{\subsectionmargin}
    \noindent
    \begin{minipage}[t]{\maintextwidth}
    \setlength{\itemsep}{0pt}
    \setlength{\parskip}{0pt}
    \setlength{\topsep}{0pt}
    \begin{itemize}
        \item #1
    \end{itemize}
    \end{minipage}%
    \hfill
    \hspace*{-0.6em} % alignment tweak
    \begin{minipage}[t]{\margintextwidth}
      \raggedleft
      % if second argument (remark) not empty: print it
      \if\relax\detokenize{#2}\relax\else\ #2\fi
      % if 2 & 3 both non empty: print line break
      \if\relax\detokenize{#2}\relax\else%
            \if\relax\detokenize{#3}\relax\else \\\vspace{3pt} \fi%
      \fi%
      % print 3. argument (keywords) if not empty
      \if\relax\detokenize{#3}\relax\else\ {\small \textit{#3}}\fi%
      
    \end{minipage}
  \end{adjustwidth}
  \vspace*{\aftersubsectionspace}
}

\newcommand{\addSignature}{%
    \vspace*{\fill}      % Push following content to page bottom
    \begin{flushleft}
    \begin{tabular}{p{5cm} p{4.8cm} p{7cm}}
        \@city, \today & & \\
        \hrulefill & &  \hrulefill \\
        Place, Date & & \@name \\
        && \\
        && \\
        &&
    \end{tabular}
    \end{flushleft}
}

%\AtEndDocument{%

%    \vfill
%    \begin{flushleft}
%    \begin{tabular}{p{5cm} p{4.8cm} p{7cm}}
%    \@city, \today & & \\
%     \hrulefill & &  \hrulefill \\
%     Place, Date & & \@name\\
%     && \\
%     && \\
%     &&
%    \end{tabular}
%    \end{flushleft}
%}
\makeatother
