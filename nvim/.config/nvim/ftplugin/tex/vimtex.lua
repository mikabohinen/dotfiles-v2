vim.cmd([[
  let g:vimtex_view_method = 'zathura'
  let g:vimtex_compiler_method = 'latexmk'
]])

vim.cmd([[
  augroup vimtex
	autocmd!
	autocmd BufEnter *.tex setlocal foldmethod=expr foldexpr=nvim_treesitter#foldexpr()
  augroup END
]])

vim.api.nvim_command("TSDisable highlight")
