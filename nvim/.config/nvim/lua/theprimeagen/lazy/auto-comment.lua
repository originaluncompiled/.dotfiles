return {
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup({
			-- Only use single-line comments
			mappings = { basic = true, extra = false, extended = false },
			opleader = { line = "<C-/>" }, -- maybe C-_
			toggler = { line = "<C-/>" },
		})
	end,
}
