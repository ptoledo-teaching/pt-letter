%%
%% pt-letter.cls
%% Letter document class for ptoledo-teaching
%%
%% Author: Pedro Toledo Correa
%% Repo: https://github.com/ptoledo-teaching/pt-commons
%% License: LaTeX Project Public License 1.3c or later
%% Created: 2021-07-01
%% Updated: 2025-10-18
%% Version: v0.1
%%
%% -----------------------------------------------------------------
%% This work may be distributed and/or modified under
%% the conditions of the LaTeX Project Public License,
%% version 1.3c or later. The latest version is available at:
%%     https://www.latex-project.org/lppl.txt
%% -----------------------------------------------------------------
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{pt-letter}[2025/10/18 v0.1 PT Letter Class]
\makeatletter

% Class handling %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Declare language options for pt-commons
\DeclareOption{spanish}{\PassOptionsToPackage{\CurrentOption}{pt-commons}}
\DeclareOption{english}{\PassOptionsToPackage{\CurrentOption}{pt-commons}}
\DeclareOption{portuguese}{\PassOptionsToPackage{\CurrentOption}{pt-commons}}
\DeclareOption{french}{\PassOptionsToPackage{\CurrentOption}{pt-commons}}
\DeclareOption{nominted}{\PassOptionsToPackage{\CurrentOption}{pt-commons}}
% Pass all other options to base article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
% Default options
\PassOptionsToClass{letterpaper,12pt}{article}
\ProcessOptions\relax
% Load base class
\LoadClass{article}
% Load pt-commons package
\RequirePackage{pt-commons}

% Page and text formatting %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Custom geometry for letter format (similar to example letter)
% Letter paper: 8.5in x 11in
% Text width: 5.50in, centered horizontally
% Left margin: (8.5 - 5.50) / 2 = 1.50in
\geometry{
    left=84pt,
    right=84pt,
    top=84pt,
    bottom=84pt,
    includefoot
}

% Show fancy page style
\pagestyle{fancy}

% Letter structure commands %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Control flags for automatic generation
\newif\ifpt@autosender\pt@autosendertrue
\newif\ifpt@autorecipient\pt@autorecipienttrue
\newif\ifpt@autodate\pt@autodatetrue

% Commands to disable automatic generation
\newcommand{\ptsendernone}{\pt@autosenderfalse}
\newcommand{\ptrecipientnone}{\pt@autorecipientfalse}
\newcommand{\ptdatenone}{\pt@autodatefalse}

% Sender parameters
\newcommand{\ptsendername}[1]{\def\pt@sendername{#1}}
\newcommand{\ptsenderaffiliation}[1]{\def\pt@senderaffiliation{#1}}
\newcommand{\ptsenderaddress}[1]{\def\pt@senderaddress{#1}}
\newcommand{\ptsenderemail}[1]{\def\pt@senderemail{#1}}
\newcommand{\ptsenderphone}[1]{\def\pt@senderphone{#1}}

% Recipient parameters
\newcommand{\ptrecipientname}[1]{\def\pt@recipientname{#1}}
\newcommand{\ptrecipientaffiliation}[1]{\def\pt@recipientaffiliation{#1}}
\newcommand{\ptrecipientaddress}[1]{\def\pt@recipientaddress{#1}}
\newcommand{\ptrecipientemail}[1]{\def\pt@recipientemail{#1}}
\newcommand{\ptrecipientphone}[1]{\def\pt@recipientphone{#1}}

% Date and location
\newcommand{\ptletterlocation}[1]{\def\pt@letterlocation{#1}}
\newcommand{\ptletterdate}[1]{\def\pt@letterdate{#1}}

% Sender information (top right) - parametrized version
\newcommand{\ptfromsender}{%
    \begin{flushright}
        \ifdefined\pt@sendername
            \textbf{\pt@sendername}\\
        \fi
        \ifdefined\pt@senderaffiliation
            \pt@senderaffiliation\\
        \fi
        \ifdefined\pt@senderaddress
            \pt@senderaddress
        \fi
        \ifdefined\pt@senderemail
            \ifdefined\pt@senderaddress\\\fi
            \pt@senderemail
        \fi
        \ifdefined\pt@senderphone
            \ifdefined\pt@senderemail\\\else\ifdefined\pt@senderaddress\\\fi\fi
            \pt@senderphone
        \fi
    \end{flushright}
    \vspace{0.5em}
}

% Recipient information (top left) - parametrized version
\newcommand{\pttorecipient}{%
    \begin{flushleft}
        \ifdefined\pt@recipientname
            \textbf{\pt@recipientname}\\
        \fi
        \ifdefined\pt@recipientaffiliation
            \pt@recipientaffiliation\\
        \fi
        \ifdefined\pt@recipientaddress
            \pt@recipientaddress
        \fi
        \ifdefined\pt@recipientemail
            \ifdefined\pt@recipientaddress\\\fi
            \pt@recipientemail
        \fi
        \ifdefined\pt@recipientphone
            \ifdefined\pt@recipientemail\\\else\ifdefined\pt@recipientaddress\\\fi\fi
            \pt@recipientphone
        \fi
    \end{flushleft}
    \vspace{0.5em}
}

% Date (top right) - parametrized version
\newcommand{\ptdate}{%
    \begin{flushright}
        \ifdefined\pt@letterlocation
            \pt@letterlocation, %
        \fi
        \ifdefined\pt@letterdate
            \pt@letterdate
        \else
            \today
        \fi
    \end{flushright}
    \vspace{1em}
}

% Legacy commands (manual version) - kept for backward compatibility
% Sender information (top right)
\newcommand{\fromsender}[1]{%
    \begin{flushright}
        \textbf{#1}
    \end{flushright}
    \vspace{0.5em}
}

% Recipient information (top left)
\newcommand{\torecipient}[1]{%
    \begin{flushleft}
        \textbf{#1}
    \end{flushleft}
    \vspace{0.5em}
}

% Date (top right)
\newcommand{\letterdate}[1]{%
    \begin{flushright}
        #1
    \end{flushright}
    \vspace{1em}
}

% Opening salutation
\newcommand{\opening}[1]{%
    \noindent #1\\[.25em]
    \par
}

% Closing signature with optional image
% Closing signature with optional image (legacy/manual)
\newcommand{\closing}[2][]{%
    \vfill
    \begin{flushright}
        \ifx&#1&\else
            \includegraphics[width=8cm]{#1}\\[-2em]
        \fi
        #2
    \end{flushright}
}

% Sender signature parameter (path to image file)
\newcommand{\ptsendersignature}[1]{\def\pt@sendersignature{#1}}

% Control flag for automatic closing generation
\newif\ifpt@autoclosing\pt@autoclosingtrue
% Command to disable automatic closing
\newcommand{\ptsignaturenone}{\pt@autoclosingfalse}

% Internal automatic closing command used by AtEndDocument
\newcommand{\pt@autoclosing}{%
    % Only generate if not disabled
    \ifpt@autoclosing
        \vfill
        \par\noindent
        \vspace{1.5em}
        \begin{flushright}
            % Signature image if provided (will overlap with the line below)
            \ifdefined\pt@sendersignature
                \makebox[0.33\textwidth][c]{%
                    \includegraphics[width=0.333\paperwidth]{\pt@sendersignature}%
                }%
                \\[-1.0cm]%
            \fi
            \hspace*{1cm}\noindent\rule{0.33\textwidth}{0.1pt}\par
            \vspace{0.3em}
            % Close with sender name and affiliation if defined
            \ifdefined\pt@sendername
                \textbf{\pt@sendername}\\
            \fi
            \ifdefined\pt@senderaffiliation
                \pt@senderaffiliation
            \fi
        \end{flushright}
    \fi
}

% Watermark %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\setupwatermark}[1]{% 
    \newlength{\@watermarkheight}
    \newlength{\@watermarklen}
    \newlength{\@watermarktargetlen}
    \newlength{\@watermarkwidth}
    \newlength{\@watermarkfinal}
    \begingroup
    % Calculate the watermark size
    \fontsize{5cm}{6cm}\selectfont
    \settowidth{\@watermarkwidth}{#1}%
    \settoheight{\@watermarkheight}{#1}%
    % Choose the smaller dimension between watermark width and height
    \ifdim\@watermarkwidth>\@watermarkheight
        \global\setlength{\@watermarklen}{\@watermarkwidth}%
    \else
        \global\setlength{\@watermarklen}{\@watermarkheight}%
    \fi
    \endgroup
    % Calculate the watermark target size
    \ifdim\paperwidth<\paperheight
        \setlength{\@watermarktargetlen}{1.2\paperwidth}%
    \else
        \setlength{\@watermarktargetlen}{1.2\paperheight}%
    \fi
    \setlength{\@watermarkfinal}{\dimexpr 4cm * \@watermarktargetlen / \@watermarklen \relax}
    % Set watermark properties
    \SetWatermarkText{#1}%
    \SetWatermarkFontSize{\@watermarkfinal}%
    \SetWatermarkAngle{45}%
    \SetWatermarkColor{ptred!21}
    \SetWatermarkHorCenter{0.5\paperwidth}
}

% Hooks %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\AfterEndPreamble{
    \ifdefined\pt@watermark
        \DraftwatermarkOptions{stamp=true}
        \SetWatermarkText{\pt@watermark
            \ifdefined\pt@version
                \ - v\pt@version
                \ifdefined\pt@build
                    \ifdefstring{\pt@build}{auto}{.\buildcount}{.\pt@build}
                \fi
            \else
                \ifdefined\pt@build
                    \ifdefstring{\pt@build}{auto}{\ - B\buildcount}{\ - B\pt@build}
                \fi
            \fi
        }
    \fi
}

% Automatic generation of letter components at document start
\AtBeginDocument{%
    % Generate sender block if not disabled
    \ifpt@autosender
        \ptfromsender
    \fi
    % Generate recipient block if not disabled
    \ifpt@autorecipient
        \pttorecipient
    \fi
    % Generate date block if not disabled
    \ifpt@autodate
        \ptdate
    \fi
}

% Insert automatic closing at the end of the document unless disabled
\AtEndDocument{%
    % Only insert if closing is enabled
    \ifpt@autoclosing
        % Ensure vertical space to push signature toward the bottom
        \vspace{1em}
        \par
        \pt@autoclosing
    \fi
}

\makeatother
\endinput
