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

local component = s(
  { trig = "---", snippetType = "autosnippet" },
  fmta(
    [[
  ---
  <>
  ---
]],
    {
      i(1),
    }
  )
)

-- snippet which automatically closes any open tags
local tags = s(
  { trig = "<([%w-]+)([^/>]*)>", snippetType = "autosnippet", regTrig = true },
  fmt(
    [[
      <{}{}>
        {}
      </{}>
    ]],
    {
      f(function(_, snip)
        return snip.captures[1]
      end),
      f(function(_, snip)
        return snip.captures[2]
      end),
      i(1),
      f(function(_, snip)
        return snip.captures[1]
      end),
    }
  )
)

return {
  component,
  tags,
}
