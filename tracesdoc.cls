% tracesdoc.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tracesdoc}[2026/01/19 v1.0 TRACES document class]

\LoadClass[11pt]{article}

% ========================================
% Abstract Storage - capture content from abstract environment
% ========================================
\RequirePackage{environ}
\newtoks\@abstracttoks
\RenewEnviron{abstract}{%
  \global\@abstracttoks=\expandafter{\BODY}%
}

% ========================================
% Revision Table Management
% ========================================
\newtoks\@revisiontoks
\newcommand{\addrevision}[5]{%
  \edef\temp{\the\@revisiontoks #1 & #2 & #3 & #4 & #5 \noexpand\\\noexpand\hline}%
  \global\@revisiontoks=\expandafter{\temp}%
  \gdef\deliverableVersion{#1}% Auto-update version from latest revision entry
}

% --- Engine detection (avoid inputenc/fontenc warnings under XeLaTeX/LuaLaTeX) ---
\RequirePackage{iftex}

% --- Packages ---
\ifPDFTeX
  \RequirePackage[utf8]{inputenc}
  \RequirePackage[T1]{fontenc}
\fi

\RequirePackage[english]{babel}

% Sans-serif font similar to Arial/Calibri
\ifPDFTeX
  \RequirePackage{helvet}
  \renewcommand{\familydefault}{\sfdefault}
\else
  \RequirePackage{fontspec}
  \defaultfontfeatures{Ligatures=TeX}
  \IfFontExistsTF{Helvetica Neue}{%
    \setmainfont{Helvetica Neue}
    \setsansfont{Helvetica Neue}
  }{%
    \IfFontExistsTF{Helvetica}{%
      \setmainfont{Helvetica}
      \setsansfont{Helvetica}
    }{%
      \IfFontExistsTF{Arial}{%
        \setmainfont{Arial}
        \setsansfont{Arial}
      }{%
        \setmainfont{Latin Modern Sans}
        \setsansfont{Latin Modern Sans}
      }%
    }%
  }%
  \renewcommand{\familydefault}{\sfdefault}
\fi

% Use the document sans-serif family for title page elements.
% Keep styling local to the title page using standard LaTeX font switches.

\RequirePackage{geometry}
\geometry{
  a4paper,
  top=3cm, % Extra space for header with logo
  bottom=2.5cm,
  left=2.5cm,
  right=2.5cm,
  headheight=39pt, % Space for header with larger logo
  headsep=10pt
}

% Ensure enough space for the footer content
\setlength{\footskip}{33pt}

\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{colortbl}
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage} % For "Page X of Y"
\RequirePackage{titlesec}
\RequirePackage{caption}
\RequirePackage{enumitem}
\RequirePackage{amsmath}
\RequirePackage{tikz}

% Hyperref should be loaded late
\RequirePackage{hyperref}

% --- Internal helpers ---
\newcommand{\TRACESLogoPath}{assets}
\newcommand{\TRACESsetLogoPath}[1]{\renewcommand{\TRACESLogoPath}{#1}}

% --- Colors ---
% (Black-only theme: no custom colors)

% --- Project Variables (defaults: standard TRACES values) ---
\newcommand{\grantNumber}{101072551}
\newcommand{\projectAcronym}{TRACES}
\newcommand{\projectFullTitle}{TRAining the next generation of iCE researcherS}
\newcommand{\projectWebsite}{https://traces-project.eu/}
\newcommand{\projectStartDate}{01 December 2022}

% --- Document Variables (user-settable) ---
\newcommand{\deliverableNumber}{X}
\newcommand{\deliverableTitle}{Deliverable title}
\newcommand{\disseminationLevel}{PU -- Public}
\newcommand{\deliverableVersion}{0.1}
\newcommand{\workPackageNumber}{WPX}
\newcommand{\workPackageLeader}{Partner}
\newcommand{\contractualDeliveryDate}{DD Month YYYY}
\newcommand{\actualDeliveryDate}{DD Month YYYY}
\newcommand{\partnerResponsible}{Partner}
\newcommand{\deliverableAuthors}{Author 1, Author 2}

% --- Key-value setup ---
\pgfkeys{/traces/.is family, /traces,
  deliverableNumber/.code = \renewcommand{\deliverableNumber}{#1},
  deliverableTitle/.code  = \renewcommand{\deliverableTitle}{#1},
  % Dissemination Levels (Horizon Europe)
  disseminationLevel/.is choice,
  disseminationLevel/PU/.code = \renewcommand{\disseminationLevel}{PU -- Public},
  disseminationLevel/SEN/.code = \renewcommand{\disseminationLevel}{SEN -- Sensitive},
  % Fallback/Legacy options if needed (can be extended)
  disseminationLevel/CO/.code = \renewcommand{\disseminationLevel}{CO -- Confidential},
  %
  % Work Packages and Leaders
  workPackageNumber/.is choice,
  workPackageNumber/WP1/.code = {
      \renewcommand{\workPackageNumber}{WP1}
      \renewcommand{\workPackageLeader}{TUDA}
  },
  workPackageNumber/WP2/.code = {
      \renewcommand{\workPackageNumber}{WP2}
      \renewcommand{\workPackageLeader}{ONERA}
  },
  workPackageNumber/WP3/.code = {
      \renewcommand{\workPackageNumber}{WP3}
      \renewcommand{\workPackageLeader}{POLIMI}
  },
  workPackageNumber/WP4/.code = {
      \renewcommand{\workPackageNumber}{WP4}
      \renewcommand{\workPackageLeader}{TUDA}
  },
  workPackageNumber/WP5/.code = {
      \renewcommand{\workPackageNumber}{WP5}
      \renewcommand{\workPackageLeader}{TUBS}
  },
  workPackageNumber/.unknown/.code = {
      \renewcommand{\workPackageNumber}{#1}
      \renewcommand{\workPackageLeader}{Unknown} 
  },
  workPackageLeader/.code  = \renewcommand{\workPackageLeader}{#1}, % Manual override allowed
  contractualDeliveryDate/.code = \renewcommand{\contractualDeliveryDate}{#1},
  actualDeliveryDate/.code      = \renewcommand{\actualDeliveryDate}{#1},
  partnerResponsible/.code      = \renewcommand{\partnerResponsible}{#1},
  deliverableAuthors/.code      = \renewcommand{\deliverableAuthors}{#1},
  grantNumber/.code      = \renewcommand{\grantNumber}{#1},
  projectAcronym/.code   = \renewcommand{\projectAcronym}{#1},
  projectFullTitle/.code = \renewcommand{\projectFullTitle}{#1},
  projectWebsite/.code   = \renewcommand{\projectWebsite}{#1},
  projectStartDate/.code = \renewcommand{\projectStartDate}{#1},
  logoPath/.code         = \TRACESsetLogoPath{#1}
}
\newcommand{\TRACESsetup}[1]{\pgfkeys{/traces,#1}}

% --- Deliverable info table (page 2 helper) ---
\newcommand{\TRACESdeliverableinfotable}{%
  \begingroup
  \renewcommand{\arraystretch}{1.4}
  \setlength{\tabcolsep}{6pt}
  \noindent
  \begin{tabularx}{\textwidth}{|>{\columncolor[gray]{0.9}\raggedright\arraybackslash\bfseries}p{0.38\textwidth}|>{\raggedright\arraybackslash}X|}
    \hline
    Grant agreement no. & \grantNumber \\
    \hline
    Project Acronym & \projectAcronym \\
    \hline
    Project full title & \projectFullTitle \\
    \hline
    Project web site & \projectWebsite \\
    \hline
    Start of the Project & \projectStartDate \\
    \hline
    Deliverable number & D\deliverableNumber \\
    \hline
    Deliverable title & \deliverableTitle \\
    \hline
    Dissemination level & \disseminationLevel \\
    \hline
    Version & \deliverableVersion \\
    \hline
    Work package number & \workPackageNumber \\
    \hline
    Work package leader & \workPackageLeader \\
    \hline
    Partner responsible for Deliverable & \partnerResponsible \\
    \hline
  \end{tabularx}
  \par
  \endgroup
}

% --- Header and Footer Configuration ---
% Default page style (for pages 2+)
\pagestyle{fancy}
\fancyhf{} % Clear all headers and footers
\renewcommand{\headrulewidth}{0pt} % Remove header line
\renewcommand{\footrulewidth}{0pt} % No footer line

% Header for regular pages
\fancyhead[L]{%
  \includegraphics[height=1.2cm]{\TRACESLogoPath/traces_logo.png}%
}
\fancyhead[C]{%
  \textbf{GA \grantNumber}%
}
\fancyhead[R]{%
  \textbf{Deliverable \deliverableNumber}%
}

% Footer: page number on the right
\fancyfoot[R]{%
  Page \thepage\ of \pageref{LastPage}%
}

% Plain style for title page only (page 1)
\fancypagestyle{plain}{%
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0.4pt}
  \fancyfoot[L]{%
    \scriptsize
    \begin{minipage}[b]{0.08\textwidth}
      \includegraphics[height=1cm]{\TRACESLogoPath/eu.png}
    \end{minipage}%
    \hspace{0.2cm}
    \begin{minipage}[b]{0.12\textwidth}
      \includegraphics[height=1cm]{\TRACESLogoPath/traces_logo.png}
    \end{minipage}%
    \hspace{0.5cm}
    \begin{minipage}[b]{0.62\textwidth}
      This project has received funding from the European Union's Horizon Europe research and innovation programme under the Marie Sk\l{}odowska-Curie grant agreement No \grantNumber\ (\projectAcronym)
    \end{minipage}
  }
  \fancyfoot[R]{%
    \footnotesize
    \begin{minipage}[b]{0.1\textwidth}
      \raggedleft
      Page \thepage\ of \pageref{LastPage}
    \end{minipage}
  }
}

% --- Section Styling ---
\titleformat{\section}
{\normalfont\Large}
{\thesection.}{1em}{}

\titleformat{\subsection}
{\normalfont\large}
{\thesubsection.}{1em}{}

% --- Table of Contents Styling ---
% Make TOC more compact with dots for all levels
\renewcommand{\@pnumwidth}{1.55em}
\renewcommand{\@tocrmarg}{2.55em}
\renewcommand{\l@section}{\@dottedtocline{1}{0em}{2.3em}}
\renewcommand{\l@subsection}{\@dottedtocline{2}{2.3em}{3.2em}}
\renewcommand{\l@subsubsection}{\@dottedtocline{3}{5.5em}{4.1em}}


% --- Hyperlink Setup ---
\hypersetup{
  colorlinks=true,
  linkcolor=black,
  filecolor=black,
  urlcolor=black,
  citecolor=black
}

% --- Caption Styling ---
\captionsetup{
  labelfont={},
  textfont={}
}

% --- List Styling ---
% Keep defaults (black-only)

% --- Title page (TRACES layout) ---
\newcommand{\TRACESmaketitle}{%
  \begin{titlepage}
    \thispagestyle{empty}
    \centering

    % Use the document sans-serif family; sizes/weights are local here.
    {\sffamily\mdseries\fontsize{10}{12}\selectfont

    % --- TRACES Logo ---
    \includegraphics[width=\textwidth]{\TRACESLogoPath/traces_logo.png}

    \vspace{0.2cm}

    {\sffamily\bfseries\fontsize{14}{16}\selectfont \projectFullTitle}

    \vspace{1cm}

    {\sffamily\mdseries\fontsize{12}{14}\selectfont
      Horizon Europe Marie Sk\l{}odowska-Curie\par\vspace{\baselineskip}
      MSCA Doctoral Networks 2021\par\vspace{\baselineskip}
      GA N.\ \grantNumber\par
    }

    \vspace{3cm}

    % --- Deliverable Info ---
    {\sffamily\mdseries\fontsize{22}{26}\selectfont Deliverable D\deliverableNumber \par}

    \vspace{0.5cm}

    {\sffamily\mdseries\fontsize{22}{26}\selectfont \deliverableTitle \par}

    \vspace{1.2cm}

    % --- Deliverable meta block ---
    \begin{center}
      Contractual delivery date:\\
      \contractualDeliveryDate\par\vspace{0.8\baselineskip}

      Actual delivery date:\\
      \actualDeliveryDate\par\vspace{0.8\baselineskip}

      Partner responsible for the Deliverable: \partnerResponsible\par\vspace{0.8\baselineskip}

      Authors:\\
      \deliverableAuthors
    \end{center}

    \vfill

    % --- Title-page footer: EU logo only, anchored to bottom ---
    \begin{tikzpicture}[remember picture,overlay]
      \node[anchor=south,yshift=0pt] at (current page.south)
        {\includegraphics[height=2cm]{\TRACESLogoPath/eu.png}};
    \end{tikzpicture}

    }% end title-page font scope

  \end{titlepage}
  \setcounter{page}{2}% Start page numbering from 2 after title page

  % Page 2: Deliverable information table
  \thispagestyle{fancy}
  \vspace*{0.5cm}
  \TRACESdeliverableinfotable

  \vspace{1.5cm}
  \setlength{\parindent}{0pt}
  Funded by the European Union. Views and opinions expressed are however those of the author(s) only and do not necessarily reflect those of the European Union or European Research Executive Agency (REA). Neither the European Union nor the granting authority can be held responsible for them.

  % Revision Table
  \clearpage
  \section*{Revision Table}
  \begin{table}[h]
    \centering
    \renewcommand{\arraystretch}{1.3}
    \begin{tabularx}{\textwidth}{|l|l|X|X|X|}
      \hline
      \textbf{Version} & \textbf{Date} & \textbf{Modified Page/Section} & \textbf{Author} & \textbf{Comments} \\\hline
      \the\@revisiontoks
    \end{tabularx}
  \end{table}

  \vspace{1cm}

  % Executive Summary (uses abstract environment)
  \section*{Executive Summary}
  \addcontentsline{toc}{section}{Executive Summary}
  \par\noindent\the\@abstracttoks

  % Table of Contents on new page
  \clearpage
  \renewcommand{\contentsname}{Table of Contents}
  \tableofcontents
  \clearpage
}
