%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Developers:
%   - Artemy Sazonov (May 2023 - now)
%	- Dmitrii Sotnikov (May 2023 - now)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vegalectures}[2023/05/08 Vega Article Class]
\LoadClass[a4paper]{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Options: > russian: pass if document is in Russian to change the language of pre-defined text
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
\usepackage[bottom=4cm]{geometry}\RequirePackage{fancyhdr}
\RequirePackage{graphicx}

\RequirePackage{booktabs}
\RequirePackage{bbm}
\RequirePackage{hyperref}

\RequirePackage{amsmath,amssymb}
\RequirePackage{mathtext}
\RequirePackage{amsthm}

\RequirePackage[backend=biber,style=alphabetic,sorting=ynt]{biblatex}
\RequirePackage{csquotes}

\RequirePackage{authblk}


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
\chead{\begin{large} \@title \end{large}}
\rhead{\includegraphics[width=0.12\linewidth]{vega_logo_smaller.png}}
\lhead{}
\lfoot{}
\cfoot{\thepage}
\rfoot{}
\pagestyle{fancy}

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
\ifvegaarticle@russian
    \RequirePackage[russian]{babel}
    \renewcommand{\epsilon}{\varepsilon}
    \renewcommand{\phi}{\varphi}

\else
    \RequirePackage[english]{babel}
\fi

\newcommand{\textSRG}            {Student Research Group}
\newcommand{\textSupervisors}    {Supervisors}

\newcommand{\textTableofcontents}{Table of Contents}
\newcommand{\textListoffigures}  {List of Figures}
\newcommand{\textListoftables}   {List of Tables}
\newcommand{\textIntroduction}   {Introduction}
\newcommand{\textConclusion}     {Conclusion}
\newcommand{\textReferences}     {References}


\newcommand{\textDefinition}     {Definition}
\newcommand{\textTheorem}        {Theorem}
\newcommand{\textLemma}          {Lemma}
\newcommand{\textCorollary}      {Corollary}
\newcommand{\textExample}        {Example}
\newcommand{\textProposition}    {Proposition}

\newcommand{\textKeywords}       {Keywords}
\newcommand{\textJEL}            {JEL Classification}
\newcommand{\textMSC}            {MSC Classification}

\ProcessKeyvalOptions*
\ifvegaarticle@russian
    \renewcommand{\textSRG}            {Студенческая научная группа}
    \renewcommand{\textSupervisors}    {Руководители}  

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
    
    \renewcommand{\textKeywords}       {Ключевые слова}
	\renewcommand{\textJEL}            {JEL коды}
	\renewcommand{\textMSC}            {MSC коды}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Title page etc
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\let\TOC\tableofcontents
\let\LOT\listoftables
\let\LOF\listoffigures
\renewcommand{\tableofcontents}{\TOC}
\renewcommand{\listoffigures}  {\addcontentsline{toc}{section}{\textListoffigures}\LOF}
\renewcommand{\listoftables}   {\addcontentsline{toc}{section}{\textListoftables}\LOT}

\DeclareRobustCommand\SRG[1]{\gdef\@SRG_name{#1}}
\DeclareRobustCommand\supervisors[1]{\gdef\@supervisors{#1}}

\DeclareRobustCommand\jel[1]{\gdef\@jel{#1}}
\DeclareRobustCommand\msc[1]{\gdef\@msc{#1}}
\DeclareRobustCommand\keywords[1]{\gdef\@keywords{#1}}


\renewcommand{\maketitle}
{
    \vspace*{-3.6cm}
    \begin{minipage}[t][3cm][s]{21cm}
        \begin{tikzpicture}[remember picture,overlay]
            \node [fill, rectangle, top color=color1bg,  bottom color=color2bg, anchor=north, minimum width=\paperwidth, minimum height=3cm,shading angle=20] (box) at (current page.north){};
            \node [anchor=north east] at (current page.north east){\includegraphics[width=2.5cm]{vega_letter_white.pdf}};
        \end{tikzpicture}    
        \color{white}        
    
    	\vspace{-0.3cm}
    	    
 		\hspace*{-2.5cm}\noindent\begin{Large}\ifdefined\@SRG\textSRG\fi\end{Large}
		
		\vspace*{0.2cm}		
		
        \hspace*{-2.5cm}\noindent\begin{Large}\ifdefined\@SRG\@SRG_name\fi\end{Large}

        \vspace*{0.4cm}
        \begin{large} 
            %\vspace*{0.5cm}
            
            \hspace*{-2.5cm}\noindent\ifdefined\@supervisors \textSupervisors: \@supervisors\fi
        \end{large}
        \vspace*{0.5cm}
    \end{minipage}
    

    \begin{center}
        \begin{Large}
            {\textbf{\@title}}
        \end{Large}
    
        \noindent\hrulefill
    
        \vspace{0.5cm}
    
        \begin{large}
        {\@author}
        \end{large}

        \vspace*{0.5cm}
        
        \@date
        \vspace*{1.cm}

    \end{center}
}

%\let\oldabstract\abstract
%\renewcommand{\abstract}[1]{
%	\oldabstract{#1}
%}
\renewcommand{\endabstract}{

	\ifdefined\@keywords
		\vspace{0.3cm}
    	\noindent
    	\textbf{\textKeywords:} \@keywords
    \fi
    
	\ifdefined\@jel 
	    \vspace{0.3cm}
    	\noindent
    	\textbf{\textJEL:} \@jel
	\fi
    
    \ifdefined\@msc 
    	\vspace{0.3cm}
    	\noindent
    	\textbf{\textMSC:} \@msc
    \fi
    
}

\newcommand{\introduction}{\addcontentsline{toc}{section}{\textIntroduction}\section*{\textIntroduction}}
\newcommand{\conclusion}  {\addcontentsline{toc}{section}{\textConclusion}\section*{\textConclusion}}
\newcommand{\references}  {\addcontentsline{toc}{section}{\textReferences}\printbibliography}

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