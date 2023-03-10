return {
	{ "renerocksai/calendar-vim", event = "VeryLazy" },
	{ "folke/twilight.nvim", opts = {}, cmd = { "Twilight", "TwilightEnable", "TwilightDisable" } },
	{ "folke/zen-mode.nvim", opts = {}, cmd = { "ZenMode" } },
	{ "dhruvasagar/vim-table-mode", ft = { "markdown", "org", "norg", "mdx" } },
	{ "lukas-reineke/headlines.nvim", opts = {}, ft = { "markdown", "org", "norg" } },
	{
		"jbyuki/nabla.nvim",
    --stylua: ignore
    keys = { 
      { "<leader>nn", function() require("nabla").popup() end, desc = "Notation", },
    },
		config = function()
			require("nabla").enable_virt()
		end,
	},
}
