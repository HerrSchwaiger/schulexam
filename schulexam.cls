% ==========================================================
% schulexam.cls
% Eigene Exam-Klasse auf Basis von exam
% ==========================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{schulexam}[2026/01/21 Schul-Exam Klasse]

% ----------------------------------------------------------
% Basisklasse
% ----------------------------------------------------------
\LoadClassWithOptions{exam}

% ----------------------------------------------------------
% Package Includes
% ----------------------------------------------------------

% Encoding & Sprache
\RequirePackage[utf8]{inputenc}
\RequirePackage[ngerman]{babel}

% Grafik & Layout
\RequirePackage{graphicx}
\RequirePackage{geometry}
\RequirePackage[export]{adjustbox}

% Tabellen
\RequirePackage{tabularx}
\RequirePackage{multirow}

% TikZ / PGF
\RequirePackage{tikz}
\RequirePackage{pgf}

% Datum
\RequirePackage{datetime2}

% Schriftgröße
\RequirePackage[12pt]{extsizes}

% Code
\RequirePackage{listings}
\RequirePackage{xcolor}

% Sonstiges
\RequirePackage{needspace}

% Seitenlayout
\geometry{
  a4paper,
  top=2cm,
  bottom=3cm,
  left=2cm
}

% ----------------------------------------------------------
% Fester Grafikpfad (kein Kopieren der Bilder nötig!)
% ----------------------------------------------------------
% Erwartete Ordnerstruktur:
% texmf/tex/latex/schulexam/images/
\graphicspath{{images/}{./}}

% ----------------------------------------------------------
% Deutsche Begriffe für exam
% ----------------------------------------------------------

\pointpoints{Punkt}{Punkte}
\bonuspointpoints{Bonuspunkt}{Bonuspunkte}

\renewcommand{\solutiontitle}{%
  \noindent\textbf{Lösung:}\enspace
}

\chqword{Frage}
\chpgword{Seite}
\chpword{Punkte}
\chbpword{Bonus Punkte}
\chsword{Erreicht}
\chtword{Gesamt}
\hpword{Punkte:}
\hsword{Ergebnis:}
\hqword{Aufgabe:}
\htword{Summe:}

% ----------------------------------------------------------
% Punkte
% ----------------------------------------------------------
\pointsinrightmargin
\pointformat{[\underline{\hspace{0.5cm}}/\themarginpoints]}
\usehorizontalhalf

% ----------------------------------------------------------
% Footer mit festem Logo
% ----------------------------------------------------------
% Erwartet: images/schullogo.png

\footer
  {\includegraphics[width=2cm]{schullogo}}
  {\lehrkraft}
  {Seite \thepage\ von \numpages}

% ----------------------------------------------------------
% Header-Tabelle (erste Seite)
% ----------------------------------------------------------

\newcommand{\examheader}{%
\begin{tabularx}{\textwidth}{|X|p{3cm}|p{4cm}|p{3cm}|}
  \hline
  \multicolumn{3}{|c|}{%
    \rule{0pt}{20pt}%
    \centering\large\textbf{\examname{} im Fach \fach}
  } & Note: \\
  \hline
  Name: &
  Klasse: IT\jahrgangsstufe &
  Datum: &
  Punkte: \underline{\hspace{0.5cm}}/\numpoints \\
  \hline
\end{tabularx}

\vspace{1cm}
}

% ============================================================================
% \worksheetheader -- Kopf fuer Arbeitsblaetter (schulexam)
% ----------------------------------------------------------------------------
% Diesen Block in die schulexam.sty einfuegen.
%
% Nutzt dieselben Makros wie \examheader:
%   \examname        Titel des Arbeitsblatts
%   \fach            Fach
%   \lehrkraft       Kuerzel der Lehrkraft
%   \jahrgangsstufe  Jahrgangsstufe
%
% Verwendung im Dokument:
%   \worksheetheader                                  -> Standard
%   \worksheetheader[NexaBank OS 3.0 -- Meilenstein 1] -> mit Untertitel
%                                                        (z.B. Lernsituation/Station)
%   \worksheetheader*  bzw. \worksheetheader*[...]    -> ohne Name/Klasse/Datum-Zeile
%                                                        (z.B. fuer digitale Abgabe)
% ============================================================================

\makeatletter

% Innere Definition: #1 = Untertitel (ggf. leer), \ws@nameline = Schalter
\newif\ifws@nameline

\newcommand{\ws@header}[1]{%
  \noindent
  \begin{minipage}{\textwidth}
    % Kontextzeile
    {\footnotesize\scshape Arbeitsblatt\hfill
      \fach{} \(\cdot\) Jahrgangsstufe \jahrgangsstufe{} \(\cdot\) \lehrkraft\par}
    \vspace{3pt}
    % Titel
    {\LARGE\bfseries\examname\par}
    % Optionaler Untertitel (Lernsituation, Station, Meilenstein, ...)
    \if\relax\detokenize{#1}\relax\else
      \vspace{2pt}
      {\large\itshape #1\par}%
    \fi
    \vspace{5pt}
    \hrule height 1pt
    % Ausfuellzeile (entfaellt bei Sternform)
    \ifws@nameline
      \vspace{8pt}
      {\small
        Name: \makebox[0.34\textwidth]{\dotfill}\hfill
        Klasse: \makebox[0.14\textwidth]{\dotfill}\hfill
        Datum: \makebox[0.18\textwidth]{\dotfill}\par}
      \vspace{4pt}
      \hrule height 0.4pt
    \fi
  \end{minipage}
  \vspace{0.9cm}
}

% Aeussere Schnittstelle mit Stern- und optionalem Argument
\newcommand{\worksheetheader}{%
  \@ifstar
    {\ws@namelinefalse\ws@header@opt}%
    {\ws@namelinetrue\ws@header@opt}%
}
\newcommand{\ws@header@opt}[1][]{\ws@header{#1}}


% ----------------------------------------------------------
% Lösungen formatieren
% ----------------------------------------------------------
\SolutionEmphasis{\color{red}}
\CorrectChoiceEmphasis{\color{red}\bfseries}

% Zusätzlicher fillin Befehl der keine Linie erzeugt. Zum Beispiel für Tabellen
\newcommand\tablefillin[1]{%
  \leavevmode
  \ifprintanswers
    \color@begingroup\CorrectChoice@Emphasis #1\color@endgroup
  \else
    \phantom{#1}%
\fi
}

% ----------------------------------------------------------
% Viel-Erfolg-Befehl mit festem Bild
% ----------------------------------------------------------
% Erwartet: images/kleeblatt.png

\newcommand{\vielerfolg}{%
\vspace{2cm}

Viel Erfolg!\hspace{1em}
\includegraphics[width=2cm]{kleeblatt}
}


% ----------------------------------------------------------
% Java Code-Highlighting
% ----------------------------------------------------------
\lstset{
    language=Java,
    basicstyle=\ttfamily\small,
    keywordstyle=\color{blue}\bfseries,
    commentstyle=\color{gray},
    stringstyle=\color{black},
    numbers=left,
    numberstyle=\tiny\color{gray},
    stepnumber=1,
    numbersep=8pt,
    showstringspaces=false,
    breaklines=true,
    frame=single,
    tabsize=4
}

% listings – SQL-Stil
\lstdefinestyle{sql}{
  language=SQL,
  basicstyle=\ttfamily\small,
  keywordstyle=\bfseries,
  showstringspaces=false,
  breaklines=true,
  frame=none,
}

% ==========================================================
% Ende der Klasse
% ==========================================================
