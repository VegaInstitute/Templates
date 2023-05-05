\LoadClass[openany, twoside, a5paper, 10pt]{extbook}
\usepackage[T2A]{fontenc}
\usepackage{kvoptions}
\usepackage[utf8]{inputenc}
\usepackage[english, russian]{babel}
\usepackage{graphicx}

% Text formatting
\usepackage{indentfirst}
\usepackage{setspace}
\usepackage{mdwlist}
\usepackage{float}
\usepackage{url}

\frenchspacing
\sloppy

% Font
\usepackage{paratype}

% Math
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsthm}
\usepackage{amscd}
\usepackage{bm}

% Pagestyle
\special{papersize=148mm,210mm}
\usepackage[%
    left=1.9cm,
    top=1.5cm,
    right=1.9cm,
    bottom=1.5cm,
    headsep=0.2cm,
    footskip=0.5cm,
    includehead,%
    includefoot]{geometry}
\textwidth 110mm
\textheight 170mm
\linespread{1.00}

\usepackage{fancyhdr}
\lhead{}
\rhead{}
\lfoot{}
\cfoot{\thepage}
\rfoot{}
\pagestyle{fancy}

% Language
\DeclareBoolOption{russian}
\DeclareBoolOption{english}

\newcommand{\textReferences}{Литература}
\newcommand{\textHeader}{Избранные вопросы \\ финансовой математики} 
\newcommand{\textSubheader}{Всероссийский семинар, приуроченный к 120-летию А.Н. Колмогорова}
\newcommand{\textTheorem}{Теорема}
\newcommand{\textLemma}{Лемма}
\newcommand{\textCorollary}{Следствие}
\newcommand{\textDefinition}{Определение}

\ProcessKeyvalOptions*
\ifabstract@english
	\renewcommand{\textHeader}       {Selected Issues \\ of Mathematical Finance}
	\renewcommand{\textSubheader}    {All-Russian seminar dedicated to the 120th anniversary of A.\,N. Kolmogorov}
    \renewcommand{\textReferences}   {Bibliography}
    \renewcommand{\textTheorem}      {Theorem}
    \renewcommand{\textLemma}        {Lemma}
    \renewcommand{\textCorollary}    {Corollary}
    \renewcommand{\textDefinition}   {Definition}
\fi

% Theorems 
\theoremstyle{plain}
\newtheorem{theorem}{\textTheorem}
\newtheorem{lemma}{\textLemma}
\newtheorem{corollary}{\textCorollary}
\newtheorem{definition}{\textDefinition}

% Logo files
\newcommand{\logoLeft}{Vega-logo.png}
\newcommand{\logoRight}{MSU-logo.png}

% Thesis view commands
\newcommand\Title[1]{	
    \par
    \begin{centering}
    	\vspace*{0.8cm}
        \smallskip
        {
            \large
            \textbf{\textsc{#1}}\nopagebreak \\
        }
    \end{centering}
    \nopagebreak
    \@afterheading 
    \smallskip
    \nopagebreak 
}

\newcommand\Author[1]{ 
	\begin{center}
	\par {\textit{\textbf{#1}}}
	\vspace{0.5ex}
    \end{center}
}

\newcommand\Header[1]{ 
	\renewcommand{\textHeader}{#1}
}

% References
\newcommand{\References}{
    \smallskip
    \nopagebreak
    \centerline{\textbf{\textReferences}}
    \nopagebreak
    \smallskip
    \@afterheading
}

% Environments
\newenvironment{references}
{\References\begingroup\renewcommand{\chapter}[2]{}\begin{thebibliography}{}}{\end{thebibliography}\endgroup}

\newenvironment{thesis}{\chead{
\noindent
\makebox[0pt][l]{%
  \begin{tabular}{@{}c@{}}
  \includegraphics[height=1cm]{\logoLeft}
  \end{tabular}%
}\hfill
\textbf{
\begin{tabular}{@{}c@{}}
  \textHeader
\end{tabular}}%
\hfill
\makebox[0pt][r]{%
  \begin{tabular}{@{}c@{}}
  \includegraphics[height=1cm]{\logoRight}
  \end{tabular}%
}\\
{\footnotesize \textSubheader}
}\begin{document}}{\stop}