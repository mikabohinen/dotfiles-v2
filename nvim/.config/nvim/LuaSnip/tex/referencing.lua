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

local eqref = s(
	{ trig = "eqref", snippetType = "autosnippet" },
	fmta(
		"\\cref{eq:<>}",
		{
			i(1),
		}
	)
)

return {
	eqref,
}
