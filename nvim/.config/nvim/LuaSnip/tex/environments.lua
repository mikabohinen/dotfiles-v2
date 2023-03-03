local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmta = require("luasnip.extras.fmt").fmta
local r = require("luasnip.extras").rep

local helpers = require("luasnip-helper-funcs")
local get_visual = helpers.get_visual
local tex_utils = helpers.tex_utils
local line_beginning = require("luasnip.extras.expand_conditions").line_beginning

-- Auto expand eq* to equation* environment but only at the beginning of a line
local eqstar = s(
	{ trig = "eq*", snippetType = "autosnippet" },
	fmta(
		"\\begin{equation*}\n\t<> \n\\end{equation*}",
		{
			d(1, get_visual),
		}
	),
	{ condition = line_beginning }
)

local eq = s(
	{ trig = "eql", snippetType = "autosnippet" },
	fmta([[
		\begin{equation}
			\label{eq:<>}
			<>
		\end{equation}
		]],
		{
			i(1),
			d(2, get_visual),
		}
	),
	{ condition = line_beginning }
)

local sec = s(
	{ trig = "^sec", snippetType = "autosnippet", regTrig = true},
	fmta([[
		\section{<>}
		]],
		{
			i(1),
		}
	),
	{ condition = line_beginning }
)

local subsec = s(
	{ trig = "^sub", snippetType = "autosnippet", regTrig = true },
	fmta([[
		\subsection{<>}
		]],
		{
			i(1),
		}
	),
	{ condition = line_beginning }
)

local begin = s(
	{ trig = "^begin", snippetType = "autosnippet", regTrig = true },
	fmta([[
		\begin{<>}
			<>
		\end{<>}
		<>
		]],
		{
			i(1),
			d(2, get_visual),
			r(1),
			i(0),
		}
	),
	{ condition = line_beginning }
)

local definition = s(
	{ trig = "def" },
	fmta([[
		\begin{definition}[<>]
			\label{def:<>}
			<>
		\end{definition}
		]],
		{
			i(1),
			i(2),
			d(3, get_visual),
		}
	),
	{ condition = line_beginning }
)

local example = s(
	{ trig = "ex" },
	fmta([[
		\begin{example}[<>]
			<>
		\end{example}
		]],
		{
			i(1),
			d(2, get_visual),
		}
	),
	{ condition = line_beginning }
)

local align_star = s(
	{ trig = "al*", snippetType = "autosnippet" },
	fmta(
		"\\begin{align*}\n\t<> \n\\end{align*}",
		{
			d(1, get_visual),
		}
	)
)

local theorem = s(
	{ trig = "^thm", snippetType = "autosnippet", regTrig = true },
	fmta([[
		\begin{theorem}[<>]
			\label{thm:<>}
			<>
		\end{theorem}
		]],
		{
			i(1),
			r(1),
			d(2, get_visual),
		}
	),
	{ condition = line_beginning }
)

local proof = s(
	{ trig = "^prf", snippetType = "autosnippet", regTrig = true},
	fmta([[
		\begin{proof}
			<>
		\end{proof}
		]],
		{
			d(1, get_visual),
		}
	),
	{ condition = line_beginning }
)

local enumerate = s(
	{ trig = "enumi", snippetType = "autosnippet"},
	fmta([[
		\begin{enumerate}[label=(<>)]
			\item <>
		\end{enumerate}
		]],
		{
			i(1),
			d(2, get_visual),
		}
	)
)

local exercise = s(
	{ trig = "exer"},
	fmta([[
		\begin{exercise}[<>]
			<>
		\end{exercise}
		]],
		{
			i(1),
			d(2, get_visual),
		}
	)
)

local proposition = s(
	{ trig = "prop"},
	fmta([[
		\begin{proposition}[<>]
			\label{prop:<>}
			<>
		\end{proposition}
		]],
		{
			i(1),
			i(2),
			d(3, get_visual),
		}
	)
)

local python = s(
	{ trig = "py" },
	fmta([[
		\begin{minted}{python}
			<>
		\end{minted}
		]],
		{
			d(1, get_visual),
		}
	)
)

local input_code = s(
	{ trig = "inp" },
	fmta([[
		\inputminted{<>}{<>}
		]],
		{
			i(1, "language"),
			i(2, "file"),
		}
	)
)

local algorithm = s(
    { trig = "alg" },
    fmta([[
        \begin{algorithm}
            \caption{<>}
            \label{alg:<>}
            \begin{algorithmic}
                \REQUIRE <>
                \ENSURE <>

                \STATE <>
            \end{algorithmic}
        \end{algorithm}
        ]],
        {
            i(1),
            i(2),
            i(3),
            i(4),
            d(5, get_visual),
        }
    )
)

local incpdf = s(
    { trig = "incpdf", autotrigger = true },
    fmta(
    [[
        \includepdf[pages={<>}]{<>}
    ]],
    {
        i(1, "pages"),
        i(2, "file"),
    }
    )
)

return {
	eqstar,
	eq,
	sec,
	subsec,
	begin,
	definition,
	example,
	align_star,
	theorem,
	proposition,
	proof,
	enumerate,
	exercise,
	python,
	input_code,
    algorithm,
    incpdf,
}

