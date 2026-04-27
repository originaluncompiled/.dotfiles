function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
	-- {
	--     "AlexvZyl/nordic.nvim",
	--     priority = 1000,
	--     config = function()
	--         vim.cmd([[ highlight EndOfBuffer guifg=#5c95c5 ]]) -- Changes the "~" on unwritten lines to be visible
	--         vim.api.nvim_set_hl(0, "LineNr", { fg = "#5c95c5" })
	--         vim.api.nvim_set_hl(0, "Visual", { bg = "#4c5062" })
	--         vim.api.nvim_set_hl(0, "StatusLine", { bg = "#191d24", fg = "#8e95a4" })
	--
	--         vim.cmd.colorscheme("nordic")
	--     end,
	-- },

	-- {
	--     "loctvl842/monokai-pro.nvim",
	--     priority = 1000,
	--     config = function()
	--         vim.cmd.colorscheme("monokai-pro")
	--     end,
	-- },

	-- {
	-- 	"sainnhe/sonokai",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.g.sonokai_style = "espresso"
	-- 		vim.g.sonokai_better_performancy = 1
	-- 		vim.cmd.colorscheme("sonokai")
	-- 	end,
	-- },

	{
		"sainnhe/gruvbox-material",
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_background = "medium"
			vim.g.gruvbox_material_material_foreground = "material"
			vim.g.gruvbox_material_better_performance = 1
			vim.cmd.colorscheme("gruvbox-material")
		end,
	},
}
