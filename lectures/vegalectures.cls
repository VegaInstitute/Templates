%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Developers:
%   - Artemy Sazonov (July 2022 - now)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vegalectures}[2022/08/16 Vega Lecture Notes Class]
\LoadClass[a4paper]{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Options: > russian: pass if document is in Russian to change the language of pre-defined text
%          > figures: pass if you want to use the list of figures
%          > tables:  pass if you want to use the list of tables
%          > 
%          > 
%          > 
%          > 
%          > 
%          > 
%          > 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Packages and Options
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{cmap}
\RequirePackage[T1,T2A]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{kvoptions}

\RequirePackage{xcolor}
\RequirePackage{tikz}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}

\RequirePackage{booktabs}
\RequirePackage{bbm}
\RequirePackage{hyperref}

\RequirePackage{amsmath,amssymb}
\RequirePackage{mathtext}
\RequirePackage{amsthm}

\RequirePackage[backend=biber,style=alphabetic,sorting=ynt]{biblatex}
\RequirePackage{csquotes}


% Bool options
\DeclareBoolOption{russian}
\DeclareBoolOption{figures}
\DeclareBoolOption{tables}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Headers and Footers
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setlength{\headheight}{14pt}
\rhead{\includegraphics[width=0.08\linewidth]{vega_logo_smaller.png}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Colors, Fonts, and General Settings
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{paratype}

\definecolor{color1bg}{HTML}{2C3389}
\definecolor{color2bg}{HTML}{EFA69D}
\definecolor{color3bg}{HTML}{B16D95}

\definecolor{colormainblue}{HTML}{2B3189}

\newcommand{\headlinecolor}{\normalcolor}

\hypersetup
{
	colorlinks=true,
	linkcolor=blue,
	filecolor=magenta,      
	urlcolor=cyan,
	citecolor=black
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Language-dependent commands
% Default:   English
% Available: English, Russian
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProcessKeyvalOptions*
\ifvegalectures@russian
    \RequirePackage[russian]{babel}
    \renewcommand{\epsilon}{\varepsilon}
    \renewcommand{\phi}{\varphi}

\else
    \RequirePackage[english]{babel}
\fi

\newcommand{\textDocumentType}   {Lecture Notes}

\newcommand{\textTableofcontents}{Table of Contents}
\newcommand{\textListoffigures}  {List of Figures}
\newcommand{\textListoftables}   {List of Tables}
\newcommand{\textIntroduction}   {Introduction}
\newcommand{\textConclusion}     {Conclusion}
\newcommand{\textReferences}     {Bibliography}

\newcommand{\textDefinition}     {Definition}
\newcommand{\textTheorem}        {Theorem}
\newcommand{\textLemma}          {Lemma}
\newcommand{\textCorollary}      {Corollary}
\newcommand{\textExample}        {Example}
\newcommand{\textProposition}    {Proposition}



\ProcessKeyvalOptions*
\ifvegalectures@russian
    \renewcommand{\textDocumentType}   {Конспект лекций}

    \renewcommand{\textTableofcontents}{Содержание}
    \renewcommand{\textListoffigures}  {Список иллюстраций}
    \renewcommand{\textListoftables}   {Список таблиц}
    \renewcommand{\textIntroduction}   {Введение}
    \renewcommand{\textConclusion}     {Заключение}
    \renewcommand{\textReferences}     {Список литературы}

    \renewcommand{\textDefinition}     {Определение}
    \renewcommand{\textTheorem}        {Теорема}
    \renewcommand{\textLemma}          {Лемма}
    \renewcommand{\textCorollary}      {Следствие}
    \renewcommand{\textExample}        {Пример}
    \renewcommand{\textProposition}    {Предложение}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Title page etc
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\let\TOC\tableofcontents
\let\LOT\listoftables
\let\LOF\listoffigures
\renewcommand{\tableofcontents}{\pagestyle{empty}\newpage\TOC\newpage \pagestyle{fancy}\pagenumbering{arabic}\setcounter{page}{3}}
\renewcommand{\listoffigures}  {\newpage\addcontentsline{toc}{section}{\textListoffigures}\LOF}
\renewcommand{\listoftables}   {\newpage\addcontentsline{toc}{section}{\textListoftables}\LOT}

\renewcommand{\maketitle}
{
    \pagestyle{empty}
    \begin{titlepage}
        

        \newgeometry{left=2cm,right=3.125cm,bottom=1cm}
        \begin{tikzpicture}[remember picture,overlay]
            \node [fill, rectangle, top color=color1bg,  bottom color=color2bg, anchor=north, minimum width=\paperwidth, minimum height=\paperheight,shading angle=30] (box) at (current page.north){};
            \node [anchor=north east] at (current page.north east){\includegraphics[width=6.25cm]{vega_letter_white.pdf}};
        \end{tikzpicture}

        {
            \color{white}
            \vspace{4.75cm}
            \begin{large}
                \noindent\textDocumentType
            \end{large}
            \vspace{0.25cm}

            \begin{LARGE}
                \noindent{\textbf{\@title}}
            \end{LARGE}

            \noindent\hrulefill

            \vspace{0.25cm}

            \begin{Large}
            \noindent{\@author}
            \end{Large}
        }
        
        \restoregeometry

    \end{titlepage}

    %\ProcessKeyvalOptions*
    %\ifvegalectures@figures
    %    \listoffigures
    %\fi
    %\ProcessKeyvalOptions*
    %\ifvegalectures@tables
    %    \listoftables
    %\fi   
}


\newcommand{\introduction}{\newpage\addcontentsline{toc}{section}{\textIntroduction}\section*{\textIntroduction}}
\newcommand{\conclusion}  {\newpage\addcontentsline{toc}{section}{\textConclusion}\section*{\textConclusion}}
\newcommand{\references}  {\newpage\addcontentsline{toc}{section}{\textReferences}\printbibliography}

\newtheorem{definition}{\textDefinition}
\newtheorem{theorem}{\textTheorem}
\newtheorem{corollary}{\textCorollary}[theorem]
\newtheorem{lemma}[theorem]{\textLemma}
\newtheorem{example}{\textExample}
\newtheorem{proposition}{\textProposition}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Maths commands
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareMathOperator*{\sgn}{sgn}
\DeclareMathOperator*{\var}{var}   
\DeclareMathOperator*{\cov}{cov}
\DeclareMathOperator*{\law}{Law}

\newcommand{\1}{\mathbbm{1}} 
\newcommand{\R}{\mathbb{R}}
\newcommand{\N}{\mathbb{N}}
\renewcommand{\P}{\mathbb{P}}
\newcommand{\E}{\mathbb{E}}

\newcommand{\independent}{\perp\!\!\!\!\perp}


\newcommand\cA{{\cal A}}
\newcommand\cE{{\cal E}}
\newcommand\cC{{\cal C}}
\newcommand\cF{{\cal F}}
\newcommand\cG{{\cal G}}
\newcommand\cK{{\cal K}}
\newcommand\cL{{\cal L}}
\newcommand\cB{{\cal B}}
\newcommand\cN{{\cal N}}
\newcommand\cM{{\cal M}}
\newcommand\cX{{\cal X}}
\newcommand\cD{{\cal D}}
\newcommand\cR{{\cal R}}
\newcommand\cP{{\cal P}}
\newcommand\cQ{{\cal Q}}
\newcommand\cS{{\cal S}}
\newcommand\cT{{\cal T}}
\newcommand\cV{{\cal V}}
\newcommand\cZ{{\cal Z}}