-- Abbreviations used in this article and the LuaSnip docs
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

local bra = s({ trig = "bra", snippetType = "autosnippet" },
	fmta("\\langle <> |",
	{
		d(1, get_visual),
	}),
	{ condition = tex_utils.in_mathzone })

local ket = s({ trig = "ket", snippetType = "autosnippet" },
	fmta("| <> \\rangle",
	{
		d(1, get_visual),
	}),
	{ condition = tex_utils.in_mathzone })

local braket = s({ trig = "braket", snippetType = "autosnippet" },
	fmta("\\langle <> | <> | <> \\rangle",
	{
		i(1, "bra"),
		i(2, "operator"),
		i(3, "ket"),
	}),
	{ condition = tex_utils.in_mathzone })


return {
	bra,
	ket,
	braket,
}
