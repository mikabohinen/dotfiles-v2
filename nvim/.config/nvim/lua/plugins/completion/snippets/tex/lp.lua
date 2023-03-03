local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local helpers = require("luasnip-helper-funcs")
local get_visual = helpers.get_visual
local tex_utils = helpers.tex_utils

local lp = s({ trig = "\\lp", snippetType = "autosnippet" },
	fmta("\\lp{<>}{<>}{<>}{<>}{<>}",
	{
		i(1, "min/max"),
		i(2, "constraints"),
		i(3, "obj coef name (c)"),
		i(4, "obj coef val (e.g. -5)"),
		i(5, "variables (x1, x2, ...)")
	}))

return {
	lp,
}
