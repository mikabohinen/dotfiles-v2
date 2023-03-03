-- Abbreviations used in this article and the LuaSnip docs
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local c = ls.choice_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local helpers = require("luasnip-helper-funcs")
local get_visual = helpers.get_visual
local tex_utils = helpers.tex_utils

-- Auto expand m/ to inline math environment
local imath = s(
  { trig = "([^%a])mm", wordTrig = false, snippetType = "autosnippet", regTrig = true },
  fmta("<>\\( <> \\)", {
    f(function(_, snip)
      return snip.captures[1]
    end),
    d(1, get_visual),
  })
)

-- Auto expand ee to e^{<>}
local eexp = s(
  { trig = "ee", snippetType = "autosnippet" },
  fmta("<>e^{<>}", {
    f(function(_, snip)
      return snip.captures[1]
    end),
    d(1, get_visual),
  }),
  { condition = tex_utils.in_mathzone }
)

local frac = s(
  { trig = "ff", snippetType = "autosnippet" },
  fmta("\\frac{<>}{<>}", {
    i(1),
    i(2),
  }),
  { condition = tex_utils.in_mathzone } -- `condition` option passed in the snippet `opts` table
)

local integral = s(
  { trig = "int", snippetType = "autosnippet" },
  fmta("\\int_{<>}^{<>} <> \\, \\mathrm{d}<>", {
    i(1),
    i(2),
    d(3, get_visual),
    i(4),
  }),
  { condition = tex_utils.in_mathzone }
)

local indefinite_integral = s(
  { trig = "ind", snippetType = "autosnippet" },
  fmta("\\int <> \\, \\mathrm{d}<>", {
    d(1, get_visual),
    i(2),
  }),
  { condition = tex_utils.in_mathzone }
)

local finite_sum = s(
  { trig = "sumf", snippetType = "autosnippet" },
  fmta("\\sum_{<> = <>}^{<>} <>", {
    i(1, "n"),
    i(2, "0"),
    i(3, "N"),
    d(4, get_visual),
  }),
  { condition = tex_utils.in_mathzone }
)

local infinite_sum = s(
  { trig = "sumi", snippetType = "autosnippet" },
  fmta("\\sum_{<> = <>}^\\infty <>", {
    i(1, "n"),
    i(2, "0"),
    d(3, get_visual),
  }),
  { condition = tex_utils.in_mathzone }
)

local index = s(
  { trig = "([\\.%d]*%a)(%d)", snippetType = "autosnippet", regTrig = true },
  fmta("<>_{<><>}", {
    f(function(_, snip)
      return snip.captures[1]
    end),
    f(function(_, snip)
      return snip.captures[2]
    end),
    i(1),
  }),
  { condition = tex_utils.in_mathzone }
)

local m_choose_n = s(
  { trig = "mcn", snippetType = "autosnippet" },
  fmta("\\binom{<>}{<>}", {
    i(1),
    i(2),
  }),
  { condition = tex_utils.in_mathzone }
)

local left_right_paren = s(
  { trig = "lrp", snippetType = "autosnippet" },
  fmta("\\left( <> \\right)", {
    d(1, get_visual),
  }),
  { condition = tex_utils.in_mathzone }
)

local left_right_bracket = s(
  { trig = "lrb", snippetType = "autosnippet" },
  fmta("\\left[ <> \\right]", {
    d(1, get_visual),
  }),
  { condition = tex_utils.in_mathzone }
)

local left_right_brace = s(
  { trig = "lrc", snippetType = "autosnippet" },
  fmta("\\left\\{ <> \\right\\}", {
    d(1, get_visual),
  }),
  { condition = tex_utils.in_mathzone }
)

local left_right_angle = s(
  { trig = "lra", snippetType = "autosnippet" },
  fmta("\\left\\langle <> \\right\\rangle", {
    d(1, get_visual),
  }),
  { condition = tex_utils.in_mathzone }
)

local cali = s(
  { trig = "cl", snippetType = "autosnippet" },
  fmta("\\mathcal{<>}", {
    d(1, get_visual),
  }),
  { condition = tex_utils.in_mathzone }
)

local mathbb = s(
  { trig = "bb", snippetType = "autosnippet" },
  fmta("\\mathbb{<>}", {
    d(1, get_visual),
  }),
  { condition = tex_utils.in_mathzone }
)

local leq = s({ trig = "lq", snippetType = "autosnippet" }, fmta("\\leq", {}), { condition = tex_utils.in_mathzone })

local geq = s({ trig = "gq", snippetType = "autosnippet" }, fmta("\\geq", {}), { condition = tex_utils.in_mathzone })

local norm = s(
  { trig = "norm", snippetType = "autosnippet" },
  fmta("\\norm{<>}", {
    d(1, get_visual),
  }),
  { condition = tex_utils.in_mathzone }
)

local abs = s(
  { trig = "abs", snippetType = "autosnippet" },
  fmta("\\abs{<>}", {
    d(1, get_visual),
  }),
  { condition = tex_utils.in_mathzone }
)

local innerproduct = s(
  { trig = "ip", snippetType = "autosnippet" },
  fmta("\\inner{<>}{<>}", {
    i(1),
    i(2),
  }),
  { condition = tex_utils.in_mathzone }
)

local much_larger = s(
  { trig = ">>", snippetType = "autosnippet" },
  fmta("\\gg", {}),
  { condition = tex_utils.in_mathzone }
)

local much_smaller = s(
  { trig = "<<", snippetType = "autosnippet" },
  fmta("\\ll", {}),
  { condition = tex_utils.in_mathzone }
)

local set = s(
  { trig = "set", snippetType = "autosnippet" },
  fmta("\\left\\{ <> \\right\\}", {
    d(1, get_visual),
  }),
  { condition = tex_utils.in_mathzone }
)

local R = s(
  { trig = "\\R", snippetType = "autosnippet" },
  fmta("\\mathbb{R}", {}),
  { condition = tex_utils.in_mathzone }
)

local Z = s(
  { trig = "\\Z", snippetType = "autosnippet" },
  fmta("\\mathbb{Z}", {}),
  { condition = tex_utils.in_mathzone }
)

local Q = s(
  { trig = "\\Q", snippetType = "autosnippet" },
  fmta("\\mathbb{Q}", {}),
  { condition = tex_utils.in_mathzone }
)

local C = s(
  { trig = "\\C", snippetType = "autosnippet" },
  fmta("\\mathbb{C}", {}),
  { condition = tex_utils.in_mathzone }
)

local N = s(
  { trig = "\\N", snippetType = "autosnippet" },
  fmta("\\mathbb{N}", {}),
  { condition = tex_utils.in_mathzone }
)

local P = s(
  { trig = "\\P", snippetType = "autosnippet" },
  fmta("\\mathbb{P}", {}),
  { condition = tex_utils.in_mathzone }
)

local F = s(
  { trig = "\\F", snippetType = "autosnippet" },
  fmta("\\mathbb{F}", {}),
  { condition = tex_utils.in_mathzone }
)

local H = s(
  { trig = "\\H", snippetType = "autosnippet" },
  fmta("\\mathbb{H}", {}),
  { condition = tex_utils.in_mathzone }
)

local O = s(
  { trig = "\\O", snippetType = "autosnippet" },
  fmta("\\mathcal{O}", {}),
  { condition = tex_utils.in_mathzone }
)

local partial = s(
  { trig = "prtl", snippetType = "autosnippet" },
  fmta("\\frac{\\partial <>}{\\partial <>}", {
    i(1),
    i(2),
  }),
  { condition = tex_utils.in_mathzone }
)

local sqrt = s(
  { trig = "sqrt", snippetType = "autosnippet" },
  fmta("\\sqrt{<>}", {
    d(1, get_visual),
  }),
  { condition = tex_utils.in_mathzone }
)

return {
  imath,
  eexp,
  frac,
  integral,
  indefinite_integral,
  finite_sum,
  infinite_sum,
  index,
  m_choose_n,
  left_right_paren,
  left_right_bracket,
  left_right_brace,
  left_right_angle,
  cali,
  mathbb,
  leq,
  geq,
  norm,
  abs,
  innerproduct,
  much_larger,
  much_smaller,
  set,
  R,
  Z,
  Q,
  C,
  N,
  P,
  F,
  H,
  partial,
  sqrt,
}
