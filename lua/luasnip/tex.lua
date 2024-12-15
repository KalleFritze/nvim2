local generate_matrix = function(args, snip)
	local rows = tonumber(snip.captures[2])
	local cols = tonumber(snip.captures[3])
	local nodes = {}
	local ins_indx = 1
	for j = 1, rows do
		table.insert(nodes, r(ins_indx, tostring(j) .. "x1", i(1)))
		ins_indx = ins_indx + 1
		for k = 2, cols do
			table.insert(nodes, t(" & "))
			table.insert(nodes, r(ins_indx, tostring(j) .. "x" .. tostring(k), i(1)))
			ins_indx = ins_indx + 1
		end
		table.insert(nodes, t({ "\\\\", "" }))
	end
	-- fix last node.
	nodes[#nodes] = t("\\\\")
	return sn(nil, nodes)
end

return {
	--beginning of new article document
	s(
		{
			trig = "article",
			snippetType = "snippet",
			desc = "creates link",
		},
		fmta(
			[[
			\documentclass[12pt, letterpaper]{article}
			\usepackage{hyperref}
			\usepackage[utf8]{inputenc}
			\usepackage{amsfonts}
			\usepackage{amsmath}
			\usepackage{lwarp-titlesec}
			\usepackage{graphicx}
			\graphicspath{\media\Aaron\USBStick}
			\hypersetup{
			    colorlinks=true,
			    linkcolor=blue,
			    filecolor=magenta,      
			    urlcolor=cyan,
			    pdftitle={Overleaf Example},
			    pdfpagemode=FullScreen,
			    }

			\title{<>
			\author{Aaron Tsamaltoupis}


			\begin{document}
			\maketitle
			\tableofcontents
			\newpage
			<>

			\end{document}
			]],
			{ i(1), i(2) }
		)
	),
	--add word to index
	s(
		{
			trig = "in",
			snippetType = "snippet",
			desc = "adds word to index",
		},
		fmta(
			[[
		\index{<>}
		]],
			{ i(1) }
		)
	),
	--add graphic
	s(
		{
			trig = "graphic",
			snippetType = "snippet",
			desc = "adds graphic",
		},
		fmta(
			[[
			\begin{center}
		\includegraphics[width = 8cm]{graphics/<>}
		\end{center}
		]],
			{ i(1) }
		)
	),
	s({ trig = ";i", snippetType = "autosnippet", desc = "index", wordTrig = false }, { t("\\item") }),
	--greek letters:
	--absatz
	s({ trig = ";;", snippetType = "autosnippet", desc = "alpha", wordTrig = false }, { t("\\\\") }),
	--alpha
	s({ trig = ";al", snippetType = "autosnippet", desc = "alpha", wordTrig = false }, { t("\\alpha") }),
	--epsilon
	s({ trig = ";ep", snippetType = "autosnippet", desc = "epsilon", wordTrig = false }, { t("\\epsilon") }),
	--vareepsilon
	s({ trig = ";vep", snippetType = "autosnippet", desc = "vareepsilon", wordTrig = false }, { t("\\varepsilon") }),
	--neg
	s({ trig = "neg", snippetType = "snippet", desc = "negate", wordTrig = false }, { t("\\neg ") }),
	--beta
	s({ trig = ";bet", snippetType = "autosnippet", desc = "beta", wordTrig = false }, { t("\\beta") }),
	--rightarrow
	s({ trig = "right", snippetType = "snippet", desc = "rightarrow", wordTrig = false }, { t("\\rightarrow ") }),
	--leftarrow
	s({ trig = "left", snippetType = "snippet", desc = "leftarrow", wordTrig = false }, { t("\\leftarrow ") }),
	--leftrightarrow
	s({ trig = "lr", snippetType = "snippet", desc = "leftrightarrow", wordTrig = false }, { t("\\leftrightarrow ") }),
	--and
	s({ trig = "and", snippetType = "snippet", desc = "and", wordTrig = false }, { t("\\land ") }),
	--or
	s({ trig = "or", snippetType = "snippet", desc = "or", wordTrig = false }, { t("\\lor ") }),
	--lambda
	s({ trig = ";la", snippetType = "autosnippet", desc = "lambda", wordTrig = false }, { t("\\lambda") }),
	--Delta
	s({ trig = ";De", snippetType = "autosnippet", desc = "Delta", wordTrig = false }, { t("\\Delta") }),

	s({ trig = ";de", snippetType = "autosnippet", desc = "delta", wordTrig = false }, { t("\\delta") }),

	--tabelle neue linie
	s({ trig = ";hl", snippetType = "autosnippet", desc = "hline", wordTrig = false }, { t("\\hline") }),
	--general
	--set
	s(
		{
			trig = "set",
			snippetType = "snippet",
			desc = "set",
			wordTrig = false,
		},
		fmta(
			[[
		\{<>\}
		]],
			{ i(1) }
		)
	),
	--overline
	s(
		{
			trig = "ol",
			snippetType = "snippet",
			desc = "overline",
			wordTrig = false,
		},
		fmta(
			[[
		\overline{<>}
		]],
			{ i(1) }
		)
	),
	--brackets:
	--curled brackets
	s(
		{
			trig = "{",
			snippetType = "autosnippet",
			desc = "curled brackets",
			wordTrig = false,
		},
		fmta(
			[[
		{<>}
		]],
			{ i(1) }
		)
	),
	--brackets
	s(
		{
			trig = "(",
			snippetType = "autosnippet",
			desc = "brackets",
			wordTrig = false,
		},
		fmta(
			[[
		(<>)
		]],
			{ i(1) }
		)
	),
	--creating links
	s(
		{
			trig = "ref",
			snippetType = "snippet",
			desc = "creates link",
		},
		fmta(
			[[
		\hyperref[sec:<>]{<>}
		]],
			{ i(1), rep(1) }
		)
	),

	--$mathe environment
	s(
		{
			trig = "$",
			snippetType = "autosnippet",
			desc = "$$",
			wordTrig = false,
		},
		fmta(
			[[
		$<>$
		]],
			{ i(1) }
		)
	),
	-- underscore
	s(
		{
			trig = "_",
			snippetType = "autosnippet",
			desc = "_{}",
			wordTrig = false,
		},
		fmta(
			[[
		_{<>}
		]],
			{ i(1) }
		)
	),
	s(
		{
			trig = "^",
			snippetType = "autosnippet",
			desc = "^{}",
			wordTrig = false,
		},
		fmta(
			[[
		^{<>}
		]],
			{ i(1) }
		)
	),
	--italics
	s(
		{
			trig = "it",
			snippetType = "snippet",
			desc = "italics",
			wordTrig = false,
		},
		fmta(
			[[
		\textit{<>}	
		]],
			{ i(1) }
		)
	),
	--bold
	s(
		{
			trig = "bf",
			snippetType = "snippet",
			desc = "bold",
			wordTrig = false,
		},
		fmta(
			[[
		\textbf{<>}	
		]],
			{ i(1) }
		)
	),
	--sc
	s(
		{
			trig = "sc",
			snippetType = "snippet",
			desc = "bold",
			wordTrig = false,
		},
		fmta(
			[[
		\textsc{<>}	
		]],
			{ i(1) }
		)
	),

	--new environment
	s(
		{ trig = "beg", snippetType = "autosnippet", dscr = "begins a new environment" },
		fmta(
			[[
		\begin{<>}
			<>
		\end{<>}
		]],
			{ i(1), i(2), rep(1) }
		)
	),
	--new math environment

	s(
		{ trig = "mathbeg", snippetType = "autosnippet", dscr = "begins  a new math environment" },
		fmta(
			[[
		\begin{math}
			<>
		\end{math}
		]],
			{ i(1) }
		)
	),
	s(
		{ trig = "[[", snippetType = "autosnippet", dscr = "bgins  a new math environment" },
		fmta(
			[[
		\[	
			<>
		\]
		]],
			{ i(1) }
		)
	),
	s(
		{ trig = "textbeg", snippetType = "autosnippet", dscr = "begins  a new text environment" },
		fmta(
			[[
		\begin{verbatim}
			<>
		\end{verbatim}
		]],
			{ i(1) }
		)
	),
	--new section
	s(
		{ trig = "sec", snippetType = "snippet", dscr = "begins a new section" },
		fmta(
			[[
		\newpage
		\section{<>}
		\label{sec:<>}
		<>
		]],
			{ i(1), rep(1), i(2) }
		)
	),
	s(
		{ trig = "ssec", snippetType = "snippet", dscr = "begins a new subsection" },
		fmta(
			[[
		\subsection{<>}
		\label{sec:<>}
		<>
		]],
			{ i(1), rep(1), i(2) }
		)
	),
	s(
		{ trig = "sssec", snippetType = "snippet", dscr = "begins a new subsubsection" },
		fmta(
			[[
		\subsubsection{<>}
		\label{sec:<>}
		<>
		]],
			{ i(1), rep(1), i(2) }
		)
	),

	--operations
	s(
		{
			trig = "frac",
			snippetType = "autosnippet",
			desc = "fraction",
			wordTrig = false,
		},
		fmta(
			[[
		\frac{<>}{<>}	
		]],
			{ i(1), i(2) }
		)
	),

	--square root
	s(
		{
			trig = "sqrt",
			snippetType = "autosnippet",
			desc = "sqare root",
			wordTrig = false,
		},
		fmta(
			[[
		\sqrt{<>}
		]],
			{ i(1) }
		)
	),
	s({ trig = "dot", snippetType = "autosnippet", desc = "multiply", wordTrig = false }, { t("\\cdot ") }),
}
