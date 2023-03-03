local luasnip = require("luasnip")
local cmp = require("cmp")

local opts = {
  completion = {
    completeopt = "menu,menuone,noselect,noinsert",
  },
  preselect = cmp.PreselectMode.None,
  mapping = {
    ["<CR>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.close()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("\t", true, true, true), "n", true)
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function()
      cmp.select_prev_item()
    end, { "i", "s" }),
    ["/"] = cmp.mapping(function(callback)
      if cmp.visible() then
        luasnip.expand_or_jump()
      else
        callback()
      end
    end, { "i", "s" }),
    ["jk"] = cmp.mapping(function()
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        cmp.select_next_item()
      end
    end, { "i", "s" }),
    ["kj"] = cmp.mapping(function()
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        cmp.select_next_item()
      end
    end, { "i", "s" }),
    ["<C-b>"] = cmp.mapping(function()
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        cmp.select_prev_item()
      end
    end, { "i", "s" }),
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
    { name = "emoji" },
  },
}

return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v1.x",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" }, -- Required
      { "williamboman/mason.nvim" }, -- Optional
      { "williamboman/mason-lspconfig.nvim" }, -- Optional

      -- Autocompletion
      { "hrsh7th/nvim-cmp" }, -- Required
      { "hrsh7th/cmp-nvim-lsp" }, -- Required
      { "hrsh7th/cmp-buffer" }, -- Optional
      { "hrsh7th/cmp-path" }, -- Optional
      { "saadparwaiz1/cmp_luasnip" }, -- Optional
      { "hrsh7th/cmp-nvim-lua" }, -- Optional

      -- Snippets
      { "L3MON4D3/LuaSnip" }, -- Required
      { "rafamadriz/friendly-snippets" }, -- Optional
    },
    config = function()
      cmp.setup(opts)
    end,
  },
}
