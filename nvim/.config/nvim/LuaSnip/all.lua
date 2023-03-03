local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local c = ls.choice_node
local fmta = require("luasnip.extras.fmt").fmta
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local helpers = require("luasnip-helper-funcs")
local get_visual = helpers.get_visual

local snipinit = s(
  { trig = "snipinit" },
  fmta(
    [[
    local ls = require("luasnip")
    local s = ls.snippet
    local sn = ls.snippet_node
    local t = ls.text_node
    local i = ls.insert_node
    local f = ls.function_node
    local d = ls.dynamic_node
    local c = ls.choice_node
    local fmta = require("luasnip.extras.fmt").fmta
    local fmt = require("luasnip.extras.fmt").fmt
    local rep = require("luasnip.extras").rep

    local helpers = require("luasnip-helper-funcs")
    local get_visual = helpers.get_visual
  ]],
    {}
  )
)

return {
  snipinit,
}
