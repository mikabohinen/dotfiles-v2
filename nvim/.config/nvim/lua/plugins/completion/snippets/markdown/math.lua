-- Abbreviations used in this article and the LuaSnip docs
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmta = require("luasnip.extras.fmt").fmta
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local helpers = require("luasnip-helper-funcs")
local get_visual = helpers.get_visual
local tex_utils = helpers.tex_utils

-- Auto expand m/ to inline math environment
local imath = s(
  { trig = "([^%a])mm", wordTrig = false, snippetType = "autosnippet", regTrig = true },
  fmta("<>$ <> $", {
    f(function(_, snip)
      return snip.captures[1]
    end),
    d(1, get_visual),
  })
)

local bmath = s(
  { trig = "([^%a])mb", wordTrig = false, snippetType = "autosnippet", regTrig = true },
  fmt("{} <BlockMath math='{}' />", {
    f(function(_, snip)
      return snip.captures[1]
    end),
    d(1, get_visual),
  })
)

-- Auto expand ee to e^{<>}
local eexp = s(
  { trig = "ee" },
  fmta("<>e^{<>}", {
    f(function(_, snip)
      return snip.captures[1]
    end),
    d(1, get_visual),
  })
)

local frac = s(
  { trig = "ff" },
  fmta("\\frac{<>}{<>}", {
    i(1),
    i(2),
  })
)

local integral = s(
  { trig = "int" },
  fmta("\\int_{<>}^{<>} <> \\, \\mathrm{d}<>", {
    i(1),
    i(2),
    d(3, get_visual),
    i(4),
  })
)

local indefinite_integral = s(
  { trig = "ind" },
  fmta("\\int <> \\, \\mathrm{d}<>", {
    d(1, get_visual),
    i(2),
  })
)

local finite_sum = s(
  { trig = "sumf" },
  fmta("\\sum_{<> = <>}^{<>} <>", {
    i(1, "n"),
    i(2, "0"),
    i(3, "N"),
    d(4, get_visual),
  })
)

local infinite_sum = s(
  { trig = "sumi" },
  fmta("\\sum_{<> = <>}^\\infty <>", {
    i(1, "n"),
    i(2, "0"),
    d(3, get_visual),
  })
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
  })
)

local m_choose_n = s(
  { trig = "mcn", snippetType = "autosnippet" },
  fmta("\\binom{<>}{<>}", {
    i(1),
    i(2),
  })
)

local left_right_paren = s(
  { trig = "lrp" },
  fmta("\\left( <> \\right)", {
    d(1, get_visual),
  })
)

local left_right_bracket = s(
  { trig = "lrb" },
  fmta("\\left[ <> \\right]", {
    d(1, get_visual),
  })
)

local left_right_brace = s(
  { trig = "lrc" },
  fmta("\\left\\{ <> \\right\\}", {
    d(1, get_visual),
  })
)

local left_right_angle = s(
  { trig = "lra" },
  fmta("\\left\\langle <> \\right\\rangle", {
    d(1, get_visual),
  })
)

local cali = s(
  { trig = "cl" },
  fmta("\\mathcal{<>}", {
    d(1, get_visual),
  })
)

local mathbb = s(
  { trig = "bb" },
  fmta("\\mathbb{<>}", {
    d(1, get_visual),
  })
)

local set = s(
  { trig = "set" },
  fmta("\\{ <> \\}", {
    d(1, get_visual),
  })
)

local R = s({ trig = "\\R", snippetType = "autosnippet" }, fmta("\\mathbb{R}", {}))

local Z = s({ trig = "\\Z", snippetType = "autosnippet" }, fmta("\\mathbb{Z}", {}))

local Q = s({ trig = "\\Q", snippetType = "autosnippet" }, fmta("\\mathbb{Q}", {}))

local C = s({ trig = "\\C", snippetType = "autosnippet" }, fmta("\\mathbb{C}", {}))

local N = s({ trig = "\\N", snippetType = "autosnippet" }, fmta("\\mathbb{N}", {}))

local P = s({ trig = "\\P", snippetType = "autosnippet" }, fmta("\\mathbb{P}", {}))

local F = s({ trig = "\\F", snippetType = "autosnippet" }, fmta("\\mathbb{F}", {}))

local H = s({ trig = "\\H", snippetType = "autosnippet" }, fmta("\\mathbb{H}", {}))

local O = s({ trig = "\\O", snippetType = "autosnippet" }, fmta("\\mathcal{O}", {}))

local partial = s(
  { trig = "prtl", snippetType = "autosnippet" },
  fmta("\\frac{\\partial <>}{\\partial <>}", {
    i(1),
    i(2),
  })
)

return {
  imath,
  bmath,
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
}
