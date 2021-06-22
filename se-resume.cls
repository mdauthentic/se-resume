\ProvidesClass{se-resume}[2021/02/16 SE Resume Class]
\LoadClass[letterpaper,10pt]{article}
\RequirePackage[empty]{fullpage}
\RequirePackage{enumitem}
\RequirePackage{ifxetex}
\ifxetex{
  \RequirePackage{fontspec}
  \RequirePackage[xetex]{hyperref}
}
\else
  \RequirePackage[utf8]{inputenc}
  \RequirePackage[T1]{fontenc}
  \RequirePackage[pdftex]{hyperref}
\fi
\RequirePackage{fontawesome5}
\RequirePackage[sfdefault,light]{FiraSans}
\RequirePackage{anyfontsize}
\RequirePackage{xcolor}
\RequirePackage{tabularx}
\RequirePackage{tikz}
\RequirePackage[bibstyle=publist, backend=biber]{biblatex}
\addbibresource{ref.bib}
\RequirePackage{ragged2e}
% Needed to handle list environment
\RequirePackage{enumitem}

%-------------------------------------------------- SETTINGS HERE --------------------------------------------------
% Header settings
\newcommand*{\name}[1]{\def\@fullname{#1}}
\newcommand*{\subtitle}[1]{\def\@position{#1}}

\def\linkedinicon{\faLinkedin}
\newcommand*{\setlinkedin}[1]{\def\@linkedintext{#1}}
\def\linkedinlink{https://linkedin.com/in/\@linkedintext}

\def\phoneicon{\faPhone}
\newcommand*{\setphone}[1]{\def\@phone{#1}}
\def\phonetext{\@phone}

\def\addressicon{\faMap}
\newcommand*{\setaddress}[1]{\def\@address{#1}}
\def\addresstext{\@address}

\def\emailicon{\faEnvelope}
\newcommand*{\setemail}[1]{\def\@email{#1}}
\def\emaillink{mailto:\@email}
\def\emailtext{\@email}

\def\githubicon{\faGithub}
\newcommand*{\setgithub}[1]{\def\@github{#1}}
\def\githublink{https://github.com/\@github}
\def\githubtext{/\@github}

\def\websiteicon{\faGlobe}
\def\websitelink{https://github.com/mdauthentic}
\def\websitetext{muideenlawal.com}

\def\headertype{\doublecol} % \singlecol or \doublecol

% Misc settings
\def\entryspacing{1pt}

\def\bulletstyle{\faAngleRight}

% Define colours
\definecolor{primary}{HTML}{000000}
\definecolor{myprimary}{HTML}{010b13}
\definecolor{secondary}{HTML}{495fef}
\definecolor{color2}{RGB}{218,232,252}
\definecolor{accent}{HTML}{263238}
\definecolor{links}{HTML}{495fef}

%------------------------------------------------------------------------------------------------------------------- 

% Defines to make listing easier
\def\address{\addressicon\hspace{3pt}{\addresstext}}
\def\linkedin{\linkedinicon\hspace{3pt}\href{\linkedinlink}{\@linkedintext}}
\def\phone{\phoneicon\hspace{3pt}{\phonetext}}
\def\email{\emailicon\hspace{3pt}\href{\emaillink}{\emailtext}}
\def\github{\githubicon\hspace{3pt}\href{\githublink}{\githubtext}}
\def\website{\websiteicon\hspace{3pt}\href{\websitelink}{\websitetext}}

% Adjust margins
\addtolength{\oddsidemargin}{-0.55in}
\addtolength{\evensidemargin}{-0.55in}
\addtolength{\textwidth}{1.1in}
\addtolength{\topmargin}{-0.6in}
\addtolength{\textheight}{1.1in}

% Define the link colours
\hypersetup{
    colorlinks=true,
    urlcolor=links,
}

% Set the margin alignment 
\raggedbottom
\raggedright
\setlength{\tabcolsep}{0in}

% Tech tag color
\definecolor{darkGrey}{HTML}{989898}

% -------------------------
% Custom commands
% -------------------------

% Sections
\renewcommand{\section}[2]{\vspace{5pt}
  \colorbox{secondary}{\color{white}\raggedbottom\normalsize\textbf{{#1}{\hspace{7pt}\textsc{#2}}}}
}

% Double column header
\newcommand{\doublecol}[6]{
  \begin{tabularx}{\textwidth}{Xr}
    {
      \begin{tabular}[c]{l}
        \fontsize{25}{35}\selectfont{\color{primary}{{\textbf{\@fullname}}}} \\
        {\textit{\@position}}
      \end{tabular}
    } & {
      \begin{tabular}[c]{l@{\hspace{1.5em}}l}
        {\small#4} & {\small#1} \\
        {\small#5} & {\small#2} \\
        {\small#6} & {\small#3}
      \end{tabular}
    }
  \end{tabularx}
}
% Double column header with address
\newcommand{\doublecolopt}[6]{
  \begin{tabularx}{\textwidth}{Xr}
    {
      \begin{tabular}[c]{l}
        \fontsize{25}{35}\selectfont{\color{primary}{{\textbf{\@fullname}}}} \\
        {\textit{\@position}} % You could add a @position here
      \end{tabular}
    } & {
      \begin{tabular}[c]{l@{\hspace{1.5em}}l}
        \multicolumn{2}{l}{\address} \\
        {\small#4} & {\small#1} \\
        {\small#5} & {\small#2} \\
        {\small#6} & {\small#3}
      \end{tabular}
    }
  \end{tabularx}
}

% Single column header
\newcommand{\singlecol}[6]{
  \begin{tabularx}{\textwidth}{Xr}
    {
      \begin{tabular}[b]{l}
        \fontsize{25}{35}\selectfont{\color{primary}{{\textbf{\@fullname}}}} \\
        {\textit{\@position}} % You could add a @position here
      \end{tabular}
    } & {
      \begin{tabular}[c]{l}
        {\small#1} \\
        {\small#2} \\
        {\small#3} \\
        {\small#4} \\
        {\small#5} \\
        {\small#6}
      \end{tabular}
    }
  \end{tabularx}
}

% ---------------------------- Tech Tag ----------------------------
% Create a tag
\newcommand{\techtag}[1]{%
  \tikz[baseline]\node[anchor=base,draw=darkGrey!70,rounded corners=0.5ex,inner xsep=1ex,inner ysep =0.55ex,text height=1.3ex,text depth=.25ex]{#1};
}
% Usage in body: \tagline{<tag label>}
\newcommand{\tagline}[1]{\hspace{0.4cm}\footnotesize{\foreach \n in {#1}{\techtag{\n}}}\vspace{-10pt}}

% ---------------------------- Set item bullet style ----------------------------
\setlist[itemize]{label=\bulletstyle}
% Resume item
\renewcommand{\labelitemii}{\bulletstyle}
\newcommand{\entryitem}[1]{
  \item\small{
    {#1 \vspace{-2pt}}
  }
}

% ---------------------------- cvblock ----------------------------
% Usage:
% \begin{cvblock} <definitions> \end{cvblock}
\newenvironment{cvblock}{
  \begin{itemize}[leftmargin=2.5mm]
}{%
  \end{itemize}\vspace{\entryspacing}
}

% ---------------------------- simpleheader ----------------------------
% Usage:
%  \simpleheader{<Title>}
\newcommand{\simpleheader}[2]{
  \vspace{-5pt}\item[]
    \begin{tabularx}{0.97\textwidth}{X@{\hspace{60pt}}r}
      \textbf{\color{primary}#1} & {\firabook\color{accent}\small#2} \\
    \end{tabularx}\vspace{-3pt}
}

% ---------------------------- entryhead ----------------------------
% Usage:
%  \entryhead{<Company>}{<Date>}{<Position>}{<City, Country>}
\newcommand{\entryhead}[4]{
  \vspace{-5pt}\item[]
    \begin{tabularx}{0.97\textwidth}{X@{\hspace{60pt}}r}
      \textbf{\color{primary}#1} & {\firabook\color{accent}\small#2} \\
      \textit{\color{accent}\small#3} & \textit{\color{accent}\small#4} \\
    \end{tabularx}\vspace{-3pt}
}

% ---------------------------- itemdetailed ----------------------------
% Usage:
%  \itemdetailed{<Item>}{<Date/City/Country>}
\newcommand{\itemdetailed}[2]{
  \vspace{-1pt}\item[]
    \begin{tabularx}{0.97\textwidth}{X@{\hspace{60pt}}r}
      \bulletstyle \ \color{primary}#1 & {\firabook\color{accent}\small#2} \\
    \end{tabularx}\vspace{-6pt}
}

% ---------------------------- cventrylist ----------------------------
% Usage:
% \begin{cventrylist}
%   entryitem{<job description line1>}
% \end{cventrylist}
\newenvironment{cventrylist}{
  \vspace{-5pt}\item[]
  \begin{itemize}[leftmargin=4.5mm]
}{%
  \end{itemize}
}

% ---------------------------- cventrylist ----------------------------
% CV item with less padding. Suitable for 'Skills' section.
% Usage:
% \begin{cvitemstwo}
%   entryitem{<job description line1>}
% \end{cvitemstwo}
\newenvironment{cvitemstwo}{
  \vspace{-5pt}\item[]
  \begin{itemize}[leftmargin=2.5mm]
}{%
  \end{itemize}
}

% ---------------------------- Skills ----------------------------
\newcommand{\skillsentry}[2]{
  \item[]\small{
    \textbf{\color{primary}#1 }{ #2 \vspace{-6pt}}
  }
}