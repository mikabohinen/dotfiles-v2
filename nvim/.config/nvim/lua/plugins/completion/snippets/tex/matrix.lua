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
local get_input = helpers.get_input
local tex_utils = helpers.tex_utils
local line_beginning = require("luasnip.extras.expand_conditions").line_beginning

-- local matrix = s(
-- 	{ trig = "mat(%d)(%d)(%a)", snippetType = "autosnippet", regTrig = true },
-- 	fmta(
-- 	[[
-- 		\begin{<>matrix}
-- 			<>
-- 		\end{<>matrix}
-- 	]],
-- 	{
-- 	f(function(_, snip) return snip.captures[3] end),
-- 	f(
-- 		function(_, snip)
-- 			local m = tonumber(snip.captures[1])
-- 			local n = tonumber(snip.captures[2])

-- 			-- Initialize matrix
-- 			local matrix = {}

-- 			-- Get values for each row
-- 			for i = 1, m do
-- 				matrix[i] = {}
-- 				for j = 1, n do
-- 					matrix[i][j] = get_input("(row " .. i .. ", column " .. j .. "): ")
-- 				end
-- 			end

-- 			-- Convert matrix to string
-- 			local result = [[]]
-- 			for i = 1, m do
-- 				for j = 1, n do
-- 					result = result .. matrix[i][j]
-- 					if j ~= n then
-- 						result = result .. " & "
-- 					end
-- 				end
-- 				if i ~= m then
-- 					result = result .. " \\\\"
-- 				end
-- 				result = result .. " "
-- 			end

-- 			return result
-- 		end),
-- 	f(function (_, snip) return snip.captures[3] end)
-- 	}
-- 	),
-- 	{ condition = tex_utils.in_mathzone })

function CreateMatrix(rows, cols)
  local matrix = {}
  for i = 1, rows do
    local row = {}
	table.insert(row, get_input("row " .. i .. ": "))
	if i ~= rows then
		table.insert(matrix, table.concat(row) .. " \\\\ ")
	else
		table.insert(matrix, table.concat(row))
	end
  end
  return matrix
end

function Matrix(rows, cols)
  return table.concat(CreateMatrix(rows, cols))
end

local matrix = s(
	{ trig = "mat(%d)(%d)(%a)", snippetType = "autosnippet", regTrig = true },
	fmta(
	[[
		\begin{<>matrix}
			<>
		\end{<>matrix}
	]],
	{
	f(function(_, snip) return snip.captures[3] end),
	f(
		function(_, snip)
			local m = tonumber(snip.captures[1])
			local n = tonumber(snip.captures[2])

			return Matrix(m, n)
		end
	),
	f(function (_, snip) return snip.captures[3] end)
	}
	),
	{ condition = tex_utils.in_mathzone }
)

return {
	matrix,
}
