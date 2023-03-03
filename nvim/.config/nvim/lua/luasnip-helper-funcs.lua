local M = {}

-- Be sure to explicitly define these LuaSnip node abbreviations!
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmta = require("luasnip.extras.fmt").fmta
local r = require("luasnip.extras").rep

function M.get_visual(args, parent)
  if (#parent.snippet.env.SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
  else
    return sn(nil, i(1, ''))
  end
end

function M.get_input(prompt)
	return vim.api.nvim_call_function('input', {prompt})
end


-- Some LaTeX-specific conditional expansion functions (requires VimTeX)

M.tex_utils = {}
M.tex_utils.in_mathzone = function()  -- math context detection
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
M.tex_utils.in_text = function()
  return not M.tex_utils.in_mathzone()
end
M.tex_utils.in_comment = function()  -- comment detection
  return vim.fn['vimtex#syntax#in_comment']() == 1
end
M.tex_utils.in_env = function(name)  -- generic environment detection
    local is_inside = vim.fn['vimtex#env#is_inside'](name)
    return (is_inside[1] > 0 and is_inside[2] > 0)
end
-- A few concrete environments---adapt as needed
M.tex_utils.in_equation = function()  -- equation environment detection
    return M.tex_utils.in_env('equation')
end
M.tex_utils.in_itemize = function()  -- itemize environment detection
    return M.tex_utils.in_env('itemize')
end
M.tex_utils.in_tikz = function()  -- TikZ picture environment detection
    return M.tex_utils.in_env('tikzpicture')
end

return M
