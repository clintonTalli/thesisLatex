%% CSUNmemo.cls
\newcommand{\CSUNmemoVersion}{0.3}
\newcommand{\CSUNmemoDate}{2004/07/25}
%%
%% NOTE: This text file uses Unix line feed conventions. When
%% reading this file on other platforms, you may have to use a text
%% editor that can handle lines terminated solely by the line feed
%% characters (0x0A).
%%
%%
%% This class file is intended to accomplish the goal of providing
%% students with a LaTeX class file suitable for preparing memorandum
%% documents in the format required by Prof. Wiegley.
%%
%% The latest version can be obtained at:
%% http://www.csun.edu/~jeffw/CourseAdministration/CSUNmemo.cls
%%
%% Contributors:
%% Jeff Wiegley (2004)
%%
%% Copyright (c) 2004 by Jeff Wiegley
%%
%% Current maintainer: Jeff Wiegley
%%
%%*******************************************************************
%% Legal Notice:
%% This code is offered as-is without any warranty either
%% expressed or implied; without even the implied warranty of
%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE!
%% User assumes all risk.
%% In no event shall CSUN or any contributor to this code
%% be liable for any damages or losses, including, but not limited
%% to, incidental, consequential, or any other damages, resulting
%% from the use or misuse of any information contained here.
%%
%% IT IS THE SOLE RESPONSIBILITY OF THE STUDENT TO SATISFY THE
%% THESIS GUIDELINE REQUIREMENTS.
%%
%% All comments are the opinions of their respective authors and
%% are not necessarily endorsed by CSUN.
%%
%% This code is distributed under the Perl Artistic License
%% ( http://language.perl.com/misc/Artistic.html )
%% and may be freely used, distributed and modified.
%% Retain the contribution notices and credits.
%%
%% Major changes to the user interface should be indicated by an
%% increase in the version numbers. If a version is a beta, it will
%% be indicated with a BETA suffix, i.e., 1.4BETA.
%% The changes should also be documented via source comments.
%%*******************************************************************
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Available preamble (prior to \begin{document}) commands:
%
% Note: This class file automatically generates the memorandum header
% using information provided by the following commnds when the
% \begin{document} environment is entered:
%
% Contents of the header matter are set with the following preamble
% commands
%
% \to
%     Arguments:
%       #1: The intended recipients
%         Default: None
%     Function:
%       Dictates the ``To:'' information in the header.
%     Example:
%       \to{A bunch of students}
%
% \from
%     Arguments:
%       #1: The author of the document
%         Default: None
%     Function:
%       Dictates the ``From:'' information in the header.
%     Example:
%       \from{An instructor}
%
% \subject
%     Arguments:
%       #1: The subject of the document
%         Default: None
%     Function:
%       Dictates the ``Subject:'' information in the header.
%     Example:
%       \subject{A memo document}
%
% \date
%     Arguments:
%       #1: The creation date of the document
%         Default: None
%     Function:
%       Dictates the ``Date:'' information in the header.
%     Example:
%       \date{09/27/2004}
%
% \header
%     Arguments:
%       #1: title of another header category line
%           (printed in bold under other titles such as Subject and Date)
%       #2: text to print next to the category item
%         Default: None
%     Function:
%       Can be used to specify additional header lines beyond what
%       \subject, \to, \from and \date.
%       \header{}{} lines are simply appended to the header in the
%       order they are specified. \header lines come after the
%       \subject, \to, \from and \date lines.
%       for arbitrary order simply use only \header commands
%       order of header lines
%     Example:
%       \header{Important}{Don't tell alice where the meeting is!}
%     Warning:
%       header lines are designed to be only one line long. ``\\"
%       will probably not due what you expect it to. This is major
%       shortcoming of this class
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% So here is a complete document example:
%
%\documentclass{CSUNmemo}
%
% 
% \to{CSU Northridge students}
% \from{Prof. Jeff Wiegley}
% \subject{Memorandum Format Specifications}
% \date{09/27/04}
% 
% \begin{document}
% 
% Now is the time for all good men to write decent memorandums.
% 
% \end{document}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Change History
%
% 9/27/04: Creation date
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{CSUNmemo}[2004/09/27 v1.0 CSU Northridge]

\typeout{-- CSUN Memorandum style}
\typeout{-- Author: Wiegley, Jeff}
\typeout{-- Version: \CSUNmemoVersion\space(\CSUNmemoDate)}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ExecuteOptions{final}

% process all the options given
\ProcessOptions\relax

% load up the article class which is what this style is based on
\LoadClass{article}

\usepackage[margin=0.75in,noheadfoot]{geometry}
%%\setlength{\headheight}{0.0in}     % results in 1.0inch
%%\setlength{\headsep}{0.0in}     % results in 1.0inch
%%\setlength{\topmargin}{-0.25in}     % results in 1.0inch
%%\setlength{\textheight}{9.5in}
%%
%%\setlength{\oddsidemargin}{-0.25in} % results in 1.5in
%%\setlength{\textwidth}{7.0in}
%%\setlength{\evensidemargin}{\oddsidemargin}

\setlength{\parskip}{6pt}
\setlength{\parindent}{0pt}

\pagestyle{plain}

\AtBeginDocument{\fontfamily{phv}\selectfont\makeheadermatter}

\renewcommand{\to}[1]{
  \ifx\undefined\@recipients
  \newcommand{\@recipients}{#1}
  \else
  \renewcommand{\@recipients}{#1}
  \fi
  \ifx\undefined\@headcontent\newcommand{\@headcontent}{}\else\relax\fi
}

\newcommand{\from}[1]{
  \ifx\undefined\myauthor
  \newcommand{\myauthor}{#1}
  \else
  \renewcommand{\myauthor}{#1}
  \fi
  \ifx\undefined\@headcontent\newcommand{\@headcontent}{}\else\relax\fi
}

\newcommand{\subject}[1]{
  \ifx\undefined\@subject
  \newcommand{\@subject}{#1}
  \else
  \renewcommand{\@subject}{#1}
  \fi
  \ifx\undefined\@headcontent\newcommand{\@headcontent}{}\else\relax\fi
}

\renewcommand{\date}[1]{
  \ifx\undefined\@mydate
  \newcommand{\@mydate}{#1}
  \else
  \renewcommand{\@mydate}{#1}
  \fi
  \ifx\undefined\@headcontent\newcommand{\@headcontent}{}\else\relax\fi
}

%Allocate tokenlist:
\newtoks\muTCM
\newtoks\muSTN
% Initialize
\muTCM={}
\muSTN={}

\newcommand{\appendtokens}[3]{
  #1=\expandafter\expandafter\expandafter
      {\expandafter\the\expandafter#1 \textbf{#2:} & #3 \\}
}

\newcommand{\header}[2]{
  \ifx\undefined\@headcontent\newcommand{\@headcontent}{}\else\relax\fi
  \appendtokens{\muTCM}{#1}{#2}
}  

\newcommand{\buildstandard}{
  \ifx\undefined\@recipients\relax\else
  \appendtokens{\muSTN}{To}{\@recipients}
  \fi
  \ifx\undefined\myauthor\relax\else
  \appendtokens{\muSTN}{From}{\myauthor}
  \fi
  \ifx\undefined\@subject\relax\else
  \appendtokens{\muSTN}{Subject}{\@subject}
  \fi
  \ifx\undefined\@mydate\relax\else
  \appendtokens{\muSTN}{Date}{\@mydate}
  \fi
}

\renewcommand{\maketitle}{}

\newcommand{\makeheadermatter}{
  \ifx\undefined\@headcontent
  \relax
  \else
  \buildstandard
      {
	\parindent=-6pt
	\large
	\begin{tabular}{ll}
	  \the\muSTN
	  \the\muTCM
	\end{tabular}\hrule
      }
      \fi
}

\renewcommand{\maketitle}{}

\renewenvironment{itemize}
{
  \begin{list}{$\bullet$}
    {
      \setlength{\itemsep}{0pt}
      \setlength{\parsep}{0pt}
      \setlength{\topsep}{0pt}
      \setlength{\partopsep}{0pt}
%      \setlength{\leftmargin}{2em}
%      \setlength{\labelwidth}{1.5em}
%      \setlength{\labelsep}{0.5em}
    }
}{
  \end{list}
}

\endinput

