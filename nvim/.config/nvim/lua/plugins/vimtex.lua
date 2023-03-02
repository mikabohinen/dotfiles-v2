return {
  "lervag/vimtex",
  config = function()
    vim.g.tex_flavor = "latex"
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_view_options = {
      "--synctex=1",
      "--shell=zsh",
      "--shell-escape",
    }
  end,
}
