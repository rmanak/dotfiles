\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{homework}[2016/01/15 Homework Class]

\LoadClass{report}

\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{commath}
\RequirePackage[inline]{enumitem}
\RequirePackage{parskip}
\RequirePackage[T1]{fontenc}
\RequirePackage{fancyhdr}
\RequirePackage{titling}
\RequirePackage{xspace}
\RequirePackage{changepage}
\RequirePackage{wasysym}
\RequirePackage{mathtools}
\RequirePackage{algpseudocode}

\RequirePackage{amsthm}
% this fixes the lack of space above theorem environments because of the use
% of parskip
\begingroup
    \makeatletter
    \@for\theoremstyle:=definition,remark,plain\do{%
        \expandafter\g@addto@macro\csname th@\theoremstyle\endcsname{%
            \addtolength\thm@preskip\parskip
            }%
        }
\endgroup

\RequirePackage{xparse}

\newif\if@oneperpage\@oneperpagefalse
\DeclareOption{oneperpage}{
  \@oneperpagetrue
}
\newif\if@palatino\@palatinofalse
\DeclareOption{palatino}{
    \@palatinotrue
}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

\if@palatino
    \RequirePackage[sc]{mathpazo}
\fi

% NEVER split at binary and relational operators
% essentially, don't split math
\relpenalty=10000
\binoppenalty=10000

\newcommand{\cdotfill}{%
    \leavevmode
    \xleaders\hbox to1em{\hfill$\cdot$\hfill}\hfill\kern0pt
}

\newcommand{\mrulefill}{%
    \leavevmode%
    \leaders\hrule height 0.7ex depth \dimexpr0.4pt-0.7ex\hfill\kern0pt
}

\newcommand{\CurrentQuestion}{1}

\newcommand{\question}[1]{%
  \renewcommand{\CurrentQuestion}{#1}
  \bigskip
  \bigskip
  \if@oneperpage
      \pagebreak[4]
  \fi
  \noindent\textsc{\large \bfseries Question #1}% \mrulefill
  \nopagebreak
  \par
  \medskip
  \@afterindentfalse\@afterheading
}

\NewDocumentEnvironment{subquestion}{sO{\CurrentQuestion}m}{%
    \list{}{%
        \topsep\z@
        \listparindent\parindent
        \parsep\parskip
        \leftmargin=1cm
    }%
    \item[{\bfseries \IfBooleanTF#1{}{#2}#3}]
}{
    \endlist
}

% make the syntax by \begin{baz*} rather than \begin{baz}*
\ExplSyntaxOn
\cs_new:cpn {subquestion*} {\subquestion*}
\cs_new_eq:cN {endsubquestion*} \endsubquestion
\ExplSyntaxOff

\newcommand{\solution}{%
  \par
  \smallskip
  \noindent{\bfseries Solution}
  \nopagebreak
  \par
  \smallskip
  \@afterindentfalse\@afterheading
}

\newcommand{\done}{%
}

\def\HomeworkHTitle{\@title}
\def\HomeworkHAuthor{\@author}
\def\HomeworkHDate{\@date}

\newcommand{\htitle}[1]{%
    \def\HomeworkHTitle{#1}
}
\newcommand{\hauthor}[1]{%
    \def\HomeworkHAuthor{#1}
}
\newcommand{\hdate}[1]{%
    \def\HomeworkHDate{#1}
}

\pagestyle{fancy}
\fancyhf{}
\lhead{\HomeworkHTitle}
\chead{\HomeworkHAuthor}
\rhead{\HomeworkHDate}
\cfoot{\thepage}

% helpful commands
\newcommand{\ZnZ}[1][n]{\ensuremath{\mathbb{Z}/#1\mathbb{Z}}}
\newcommand{\Z}{\ensuremath{\mathbb{Z}}}
\newcommand{\Q}{\ensuremath{\mathbb{Q}}}

\newcommand{\contradiction}{\ensuremath{\text{\enspace\lightning}}}
\newcommand{\suchthat}{\;\ifnum\currentgrouptype=16 \middle\fi|\;}
\newcommand{\inverse}{\ensuremath{^{-1}}}
\newcommand{\Ideal}[1]{\ensuremath{\langle #1 \rangle}}
\newcommand{\injectionto}{\ensuremath{\hookrightarrow}}
\newcommand{\normalin}{\ensuremath{\triangleleft}}

\newtheorem*{claim}{Claim}
\newtheorem*{theorem}{Theorem}
\newtheorem*{corollary}{Corollary}

\DeclareMathOperator{\Ima}{im}
\DeclareMathOperator{\Gal}{Gal}
\DeclareMathOperator{\Aut}{Aut}
\DeclareMathOperator{\Inn}{Inn}
\DeclareMathOperator{\ord}{ord}
\DeclarePairedDelimiter{\SpanFences}{\{}{\}}
\newcommand{\Span}{\operatorname{Span}\SpanFences}

\DeclarePairedDelimiter{\floor}{\lfloor}{\rfloor}
\DeclarePairedDelimiter{\ceil}{\lceil}{\rceil}

\algnewcommand\algorithmicforeach{\textbf{for each}}
\algdef{S}[FOR]{ForEach}[1]{\algorithmicforeach\ #1\ \algorithmicdo}
\DeclareMathOperator{\OPT}{OPT}
