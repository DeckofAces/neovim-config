return {
	"kevinhwang91/nvim-ufo",
	config = function()
		vim.keymap.set("n", "zR", require("ufo").openAllFolds)
		vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
		require("ufo").setup({
			provider_selector = function()
				return { "treesitter", "indent" }
			end,
		})
	end,
	dependencies = { "kevinhwang91/promise-async" },
}
