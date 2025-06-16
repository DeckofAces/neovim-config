return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"SmiteshP/nvim-navic",
	},
	config = function()
		local navic = require("nvim-navic")
		local on_attach = function(client, bufnr)
			if client.server_capabilities.documentSymbolProvider then
				navic.attach(client, bufnr)
			end
		end

		require("lualine").setup({
			options = {
				theme = "dracula",
			},
			sections = {
				lualine_c = {
					{
						"filename",
						path = 1,
					},
					{
						navic.get_location,
						cond = navic.is_available,
					},
				},
			},
		})
	end,
}
