local ls = require('luasnip')
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local doc = s({ trig = "lec!", snippetType="autosnippet" },
	fmta([[
	\documentclass[english,course]{lecture}
    \usepackage{import}
    \usepackage{xifthen}
    \usepackage{pdfpages}
    \usepackage{transparent}
	\usepackage{tikz-cd}
	\usepackage{listings}
	\usepackage{enumitem}
	\usepackage{fancyref}
    \usepackage{subfiles}
    \usepackage{algorithm}
    \usepackage{algorithmic}
	%\usepackage{minted}

	\title{<>}
	\subtitle{}
	\shorttitle{}
	\ccode{<>}
	\subject{}
	\speaker{}
	\spemail{}
	\author{<>}
	\email{}
	\flag{}
	\season{}
	\date{}{}{}
	\dateend{}{}{}
	\conference{}
	\place{}
	\attn{<>}
	\morelink{}

	\begin{document}
	<>
	\end{document}
	]],
	{
		i(1, "Title"),
		i(2, "MAT1001"),
		i(3, "Mika"),
		i(4, "This is a lecture note"),
		i(5)
	}))

local exercises = s({trig = "ex!", snippetType="autosnippet"},
fmta([[
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Define Article %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	\documentclass{article}
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Using Packages %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	\usepackage{geometry}
	\usepackage{graphicx}
	\usepackage{amssymb}
	\usepackage{amsmath}
	\usepackage{amsthm}
	\usepackage{empheq}
	\usepackage{mdframed}
	\usepackage{booktabs}
	\usepackage{lipsum}
	\usepackage{graphicx}
	\usepackage{color}
	\usepackage{psfrag}
	\usepackage{pgfplots}
	\usepackage{bm}
	\usepackage{algorithm2e}
	\usepackage{enumitem}
	\usepackage{cleveref}
	\usepackage{listings}
	<>\usepackage{minted}
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Define Commands %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	\newcommand{\R}{\mathbb{R}}
	\newcommand{\N}{\mathbb{N}}
	\newcommand{\E}{\mathbb{E}}
	\newcommand{\V}{\mathbb{V}}
	\newcommand{\C}{\mathbb{C}}

	\newcommand{\norm}[1]{\left\lVert#1\right\rVert}
	\newcommand{\abs}[1]{\left\lvert#1\right\rvert}
	\newcommand{\inner}[2]{\left\langle#1,#2\right\rangle}
	\newcommand{\innerp}[2]{\left\langle#1,#2\right\rangle_{L^2(\Omega)}} % inner product in L^2
	\newcommand{\innerpH}[2]{\left\langle#1,#2\right\rangle_{H^1(\Omega)}} % inner product in H^1

	\newcommand{\grad}{\nabla}
	\newcommand{\curl}{\nabla\times}
	\newcommand{\rot}{\nabla\cdot}
	\newcommand{\lap}{\Delta}

	\newcommand{\dx}{\mathrm{d}x}
	\newcommand{\dy}{\mathrm{d}y}
	\newcommand{\dz}{\mathrm{d}z}
	\newcommand{\dt}{\mathrm{d}t}
	\newcommand{\ds}{\mathrm{d}s}
	\newcommand{\dS}{\mathrm{d}S}
	\newcommand{\dV}{\mathrm{d}V}
	\newcommand{\dA}{\mathrm{d}A}
	\newcommand{\dOmega}{\mathrm{d}\Omega}
	\newcommand{\dtheta}{\mathrm{d}\theta}
	\newcommand{\dphi}{\mathrm{d}\phi}
	\newcommand{\dpsi}{\mathrm{d}\psi}
	\newcommand{\dalpha}{\mathrm{d}\alpha}
	\newcommand{\dbeta}{\mathrm{d}\beta}
	\newcommand{\dgamma}{\mathrm{d}\gamma}


	%%%%%%%%%%%%%%%%%%%%%%%%%% Page Setting %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	\geometry{a4paper}

	%%%%%%%%%%%%%%%%%%%%%%%%%% Define some useful colors %%%%%%%%%%%%%%%%%%%%%%%%%%
	\definecolor{ocre}{RGB}{243,102,25}
	\definecolor{mygray}{RGB}{243,243,244}
	\definecolor{deepGreen}{RGB}{26,111,0}
	\definecolor{shallowGreen}{RGB}{235,255,255}
	\definecolor{deepBlue}{RGB}{61,124,222}
	\definecolor{shallowBlue}{RGB}{235,249,255}
	\definecolor{deepRed}{RGB}{255,0,0}
	\definecolor{shallowRed}{RGB}{255,235,235}
	\definecolor{deepOrange}{RGB}{255,128,0}
	\definecolor{shallowOrange}{RGB}{255,235,235}
	\definecolor{deepPurple}{RGB}{128,0,255}
	\definecolor{shallowPurple}{RGB}{235,235,255}
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	%%%%%%%%%%%%%%%%%%%%%%%%%% Define an orangebox command %%%%%%%%%%%%%%%%%%%%%%%%
	\newcommand\orangebox[1]{\fcolorbox{ocre}{mygray}{\hspace{1em}#1\hspace{1em}}}
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	%%%%%%%%%%%%%%%%%%%%%%%%%%%% English Environments %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	\newtheoremstyle{mytheoremstyle}{3pt}{3pt}{\normalfont}{0cm}{\rmfamily\bfseries}{}{1em}{{\color{black}\thmname{#1}~\thmnumber{#2}}\thmnote{\,--\,#3}}
	\newtheoremstyle{myproblemstyle}{3pt}{3pt}{\normalfont}{0cm}{\rmfamily\bfseries}{}{1em}{{\color{black}\thmname{#1}~\thmnumber{#2}}\thmnote{\,--\,#3}}
	\theoremstyle{mytheoremstyle}
	\newmdtheoremenv[linewidth=1pt,backgroundcolor=shallowGreen,linecolor=deepGreen,leftmargin=0pt,innerleftmargin=20pt,innerrightmargin=20pt,]{theorem}{Theorem}[section]
	\theoremstyle{mytheoremstyle}
	\newmdtheoremenv[linewidth=1pt,backgroundcolor=shallowRed,linecolor=deepRed,leftmargin=0pt,innerleftmargin=20pt,innerrightmargin=20pt,]{example}{Example}[section]
	\theoremstyle{mytheoremstyle}
	\newmdtheoremenv[linewidth=1pt,backgroundcolor=shallowPurple,linecolor=deepPurple,leftmargin=0pt,innerleftmargin=20pt,innerrightmargin=20pt,]{proposition}{Proposition}[section]
	\theoremstyle{mytheoremstyle}
	\newmdtheoremenv[linewidth=1pt,backgroundcolor=shallowOrange,linecolor=deepOrange,leftmargin=0pt,innerleftmargin=20pt,innerrightmargin=20pt,]{lemma}{Lemma}[section]
	\theoremstyle{mytheoremstyle}
	\newmdtheoremenv[linewidth=1pt,backgroundcolor=shallowBlue,linecolor=deepBlue,leftmargin=0pt,innerleftmargin=20pt,innerrightmargin=20pt,]{definition}{Definition}[section]
	\theoremstyle{myproblemstyle}
	\newmdtheoremenv[linecolor=black,leftmargin=0pt,innerleftmargin=10pt,innerrightmargin=10pt,]{problem}{Problem}[section]

	\newcounter{exercise}[section]
	\newenvironment{exercise}[1][]{%
	\refstepcounter{exercise}%
	\noindent\textbf{Exercise #1}\par\nobreak%
	\ignorespaces
	}{%
	\par\medskip
	}
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Plotting Settings %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	\usepgfplotslibrary{colorbrewer}
	\pgfplotsset{width=8cm,compat=1.9}
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Code listing config %%%%%%%%%%%%%%%%%%%%%%%%%%%
	\definecolor{codegreen}{rgb}{0,0.6,0}
	\definecolor{codegray}{rgb}{0.5,0.5,0.5}
	\definecolor{codepurple}{rgb}{0.58,0,0.82}
	\definecolor{backcolour}{rgb}{0.95,0.95,0.92}

	\lstdefinestyle{mystyle}{
		backgroundcolor=\color{backcolour},   
		commentstyle=\color{codegreen},
		keywordstyle=\color{magenta},
		numberstyle=\tiny\color{codegray},
		stringstyle=\color{codepurple},
		basicstyle=\ttfamily\footnotesize,
		breakatwhitespace=false,         
		breaklines=true,                 
		captionpos=b,                    
		keepspaces=true,                 
		numbers=left,                    
		numbersep=5pt,                  
		showspaces=false,                
		showstringspaces=false,
		showtabs=false,                  
		tabsize=2
	}

	\lstset{style=mystyle}

	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Title & Author %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	\title{<>}
	\author{<>}
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
	\begin{document}
	\maketitle

	<>

	\end{document}
]],
{
	i(1, "%"),
	i(2),
	i(3),
	i(4),
}))


return {
	doc,
	exercises,
}
