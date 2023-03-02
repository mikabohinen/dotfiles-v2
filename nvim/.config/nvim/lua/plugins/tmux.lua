return {
  "aserowy/tmux.nvim",
  config = function()
    require("tmux").setup {
      default_mappings = true,
    }
  end,
}
